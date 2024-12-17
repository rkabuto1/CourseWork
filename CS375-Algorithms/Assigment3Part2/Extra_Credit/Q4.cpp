#include <iostream>
#include <vector>

using namespace std;
typedef vector<vector<int>> matrix;

matrix HelperSub(const matrix &x, const matrix &y, int i, int j, int d) {
    if (i == d) 
        return matrix(d, vector<int>(d));    
    matrix z(d, vector<int>(d));   
    if (j == d) {
        z = HelperSub(x, y, i + 1, 0, d);
    } else {
        z = HelperSub(x, y, i, j + 1, d);
    }   
    z[i][j] = x[i][j] - y[i][j];   
    return z;
}

matrix HelperAdd(const matrix &x, const matrix &y, int i, int j, int d) {
    if (i == d) 
        return matrix(d, vector<int>(d));   
    matrix z(d, vector<int>(d));   
    if (j == d) {
        z = HelperAdd(x, y, i + 1, 0, d);
    } else {
        z = HelperAdd(x, y, i, j + 1, d);
    }    
    z[i][j] = x[i][j] + y[i][j];    
    return z;
}

void HelperDisplay(const matrix &m, int i, int j, int d) {
    if (i == d) 
    	return;

    if (j == d) {
        cout << endl;
        HelperDisplay(m, i + 1, 0, d);
    } else {
        cout << m[i][j] << " ";
        HelperDisplay(m, i, j + 1, d);
    }
}

void display(const matrix &m, int d) {
    HelperDisplay(m, 0, 0, d);
}

matrix sub(const matrix &x, const matrix &y, int d) {
    return HelperSub(x, y, 0, 0, d);
}

matrix add(const matrix &x, const matrix &y, int d) {
    return HelperAdd(x, y, 0, 0, d);
}

matrix StrassenAlg(const matrix &x, const matrix &y, int d) {
     if (d == 1) {
    	return {{x[0][0] * y[0][0]}};
     }


    int h = d / 2;
    matrix x11(h, vector<int>(h)), x12(h, vector<int>(h)),
        x21(h, vector<int>(h)), x22(h, vector<int>(h)),
        y11(h, vector<int>(h)), y12(h, vector<int>(h)),
        y21(h, vector<int>(h)), y22(h, vector<int>(h));

    for (int i = 0; i < h; i++) {
        for (int j = 0; j < h; j++) {
            x11[i][j] = x[i][j];
            x12[i][j] = x[i][j + h];
            x21[i][j] = x[i + h][j];
            x22[i][j] = x[i + h][j + h];

            y11[i][j] = y[i][j];
            y12[i][j] = y[i][j + h];
            y21[i][j] = y[i + h][j];
            y22[i][j] = y[i + h][j + h];
        }
    }

    matrix p1 = StrassenAlg(add(x11, x22, h), add(y11, y22, h), h);
    matrix p2 = StrassenAlg(add(x21, x22, h), y11, h);
    matrix p3 = StrassenAlg(x11, sub(y12, y22, h), h);
    matrix p4 = StrassenAlg(x22, sub(y21, y11, h), h);
    matrix p5 = StrassenAlg(add(x11, x12, h), y22, h);
    matrix p6 = StrassenAlg(sub(x21, x11, h), add(y11, y12, h), h);
    matrix p7 = StrassenAlg(sub(x12, x22, h), add(y21, y22, h), h);

    matrix z11 = add(sub(add(p1, p4, h), p5, h), p7, h);
    matrix z12 = add(p3, p5, h);
    matrix z21 = add(p2, p4, h);
    matrix z22 = add(sub(add(p1, p3, h), p2, h), p6, h);

    matrix z(d, vector<int>(d));
    for (int i = 0; i < h; i++) {
        for (int j = 0; j < h; j++) {
            z[i][j] = z11[i][j];
            z[i][j + h] = z12[i][j];
            z[i + h][j] = z21[i][j];
            z[i + h][j + h] = z22[i][j];
        }
    }

    return z;
}



int main() {
    int d = 4;
    matrix x = {{1, 2, 3, 4},
                {1, 2, 3, 4},
                {1, 2, 3, 4},
                {1, 2, 3, 4}};

   matrix y = {{1, 2, 3, 4},
               {1, 2, 3, 4},
               {1, 2, 3, 4},
               {1, 2, 3, 4}};

   matrix output = StrassenAlg(x, y, d);

   cout << "Result:" << endl;
   display(output, d);

   return 0;
}

