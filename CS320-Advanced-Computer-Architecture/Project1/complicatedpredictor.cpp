#include "functions.h"

int gsharePred(const vector<pair<unsigned, bool>>& traceData, int histBits) {
    vector<int> predTable(4096, 0);
    int count = 0;
    int globalHist = 1;  
    int histMask = (1 << histBits) - 1; 

    for (const auto& branch : traceData) {
        unsigned pcBits = branch.first % 4096;  
        unsigned idx = (pcBits ^ (globalHist & histMask)) % 4096;  
        int counter = predTable[idx]; 
        bool pred = counter >= 2;  

        if (pred == branch.second) {
            count++;  
        }
        if (branch.second) {
            if (counter < 3) predTable[idx]++;  
        } else {
            if (counter > 0) predTable[idx]--;  
        }
        globalHist = ((globalHist << 1) | branch.second) & histMask;
    }
    return count; 
}

int tPredictor(const vector<pair<unsigned, bool>>& trace) {
    vector<int> gshare(4096, 0);
    vector<int> bimodal(4096, 6);
    vector<int> selector(4096, 3);
    
    int count = 0;
    int gHist = 0;
    const int hLen = 12;
    const int hMask = (1 << hLen) - 1;

    for (const auto& br : trace) {
        unsigned pc = br.first;
        bool outcome = br.second;

        unsigned bIndex = pc % 4096;
        int bState = bimodal[bIndex];
        bool bPredict = (bState <= 3);

        unsigned pcLSB = pc % 4096;
        unsigned gIndex = (pcLSB ^ (gHist & hMask)) % 4096;
        int gState = gshare[gIndex];
        bool gPredict = gState >= 2;

        int sState = selector[bIndex];
        bool finalPredict = (sState <= 1) ? gPredict : bPredict;

        if (finalPredict == outcome) {
            count++;
        }
        if (gPredict != bPredict) {
            if (gPredict == outcome) {
                if (sState > 0) selector[bIndex]--;
            } else if (bPredict == outcome) {
                if (sState < 3) selector[bIndex]++;
            }
        }
        if (outcome) {
            if (gState < 3) gshare[gIndex]++;
        } else {
            if (gState > 0) gshare[gIndex]--;
        }
        if (outcome) {
            if (bState == 2) bimodal[bIndex] = 1;
            else if (bState == 3) 
            	bimodal[bIndex] = 2;
            else if (bState == 4) 
            	bimodal[bIndex] = 3;
            else if (bState == 5) 
            	bimodal[bIndex] = 4;
            else if (bState == 6) 
            	bimodal[bIndex] = 5;
        } else {
            if (bState == 1) 
            	bimodal[bIndex] = 2;
            else if (bState == 2) 
            	bimodal[bIndex] = 4;
            else if (bState == 3) 
            	bimodal[bIndex] = 4;
            else if (bState == 4) 
            	bimodal[bIndex] = 5;
            else if (bState == 5) 
            	bimodal[bIndex] = 6;
        }
        gHist = ((gHist << 1) | outcome) & hMask;
    }
    return count;
}


