#include "Parse.h"
#include <fstream>
#include <sstream>
#include <iostream>
#include <unordered_map>
#include <vector>
#include <functional>

void procInp(const std::string &fPath, std::unordered_map<int, StateInfo> &gNds, std::vector<Trans> &edg) {
    std::ifstream tFile(fPath);
    if (!tFile.is_open()) {
        std::cerr << "File cant be opened " << fPath << std::endl;
        exit(EXIT_FAILURE);
    }    
    std::unordered_map<std::string, std::function<void(std::istringstream&)>> cmdHnd;
    cmdHnd["transition"] = [&](std::istringstream &dStrm) {
        int orig, dest;
        char tranSym;
        dStrm >> orig >> tranSym >> dest;
        edg.push_back({orig, tranSym, dest});
    };   
    cmdHnd["state"] = [&](std::istringstream &dStrm) {
        int sID;
        std::string prop;
        dStrm >> sID;
        while (dStrm >> prop) {
            if (prop == "start") gNds[sID].passStart = true;
            else if (prop == "accept") gNds[sID].passAccept = true;
        }
    };
    std::string lnCont, cmdTyp;
    while (std::getline(tFile, lnCont)) {
        std::istringstream dStrm(lnCont);
        if (!(dStrm >> cmdTyp)) 
            continue;
        if (cmdHnd.count(cmdTyp)) cmdHnd[cmdTyp](dStrm);
    }
    
    tFile.close();
}
