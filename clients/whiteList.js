var whiteListSet = new Set();

export function addWhiteList(address){
    whiteListSet.add(address);
}

export function deleteWhiteList(address){
    whiteListSet.delete(address);
}

export function getWhiteList(){
    return whiteListSet;
}