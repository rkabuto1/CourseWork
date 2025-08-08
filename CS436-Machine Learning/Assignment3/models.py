import torch.nn as nn
import torch.nn.functional as F
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Pseudo Code
# 1. Define a custom CNN class for a convolutional neural network
# 2. Use a loop to dynamically build multiple layers with predefined configurations
# 3. Add a layer for spatial downsampling
# 4. Use a loop to dynamically build multiple Linear layers
# 5. Construct a CNN forward method:
# 6.    - Pass input through each convolutional layer followed by ReLU and MaxPooling
# 7.    - Flatten the output tensor
# 8.    - Pass through each fully connected layer, applying ReLU on all but the last layer
# 9.    - Output final logits
# 10. Define a custom MultiLayerPerception class for a fully connected neural network
# 11.   - Use a loop to build a stack of Linear layers using predefined layer sizes
# 12. Consturct a MLP forward method
# 13.   - Flatten the input
# 14.   - Pass input through each layer, applying ReLU on all but the last layer
# 15.   - Output final logits again
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
class ConvoNurelNetwork(nn.Module):
    def __init__(self):
        super(ConvoNurelNetwork, self).__init__()
        self.conv_layers = nn.ModuleList()
        conv_config = [(3, 6, 5), (6, 16, 5)]

        for in_channels, out_channels, kernel_size in conv_config:
            self.conv_layers.append(nn.Conv2d(in_channels, out_channels, kernel_size))

        self.pool = nn.MaxPool2d(2, 2)

        self.fcs = nn.ModuleList()
        fc_config = [(16 * 5 * 5, 120), (120, 84), (84, 10)]

        for in_features, out_features in fc_config:
            self.fcs.append(nn.Linear(in_features, out_features))

    def forward(self, x):
        for layer in self.conv_layers:
            x = F.relu(layer(x))
            x = self.pool(x)
        x = x.view(x.size(0), -1)
        for i, layer in enumerate(self.fcs):
            x = layer(x) if i == len(self.fcs) - 1 else F.relu(layer(x))
        return x

class MultiLayerPerception(nn.Module):
    def __init__(self):
        super(MultiLayerPerception, self).__init__()
        self.layers = nn.ModuleList()
        layer_dims = [3 * 32 * 32, 512, 256, 128, 10]

        for i in range(len(layer_dims) - 1):
            self.layers.append(nn.Linear(layer_dims[i], layer_dims[i + 1]))

    def forward(self, x):
        x = x.view(x.size(0), -1)
        for i, layer in enumerate(self.layers):
            x = layer(x) if i == len(self.layers) - 1 else F.relu(layer(x))
        return x
