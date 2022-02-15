import { MerkleTree } from 'merkletreejs';
import keccak256 from 'keccak256';

let wl = [
    "0x9EfBDc0bE3b154EC193fE402640D2343e1EC4980",
    "0x4c7bc00CB8665D9541b328616e3796CDC361f9e5",
    "0xf7251d57dCDab9CAE54fB3c8ab5E804e407bE697",
    "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
];

// let wl = [
//     "0x9EfBDc0bE3b154EC193fE402640D2343e1EC4980",
//     "0x4c7bc00CB8665D9541b328616e3796CDC361f9e5",
//     "0x9EfBDc0bE3b154EC193fE402640D2343e1EC4980",
//     "0x4c7bc00CB8665D9541b328616e3796CDC361f9e5"
// ];

// const leaf = wl.map(addr => keccak256(addr));
// const merkleTree = new MerkleTree(leaf, keccak256, {sortPairs: true});
// const rootHash = merkleTree.getRoot();
// console.log("WL\n", merkleTree.toString());

// const proof = merkleTree.getProof(leaf[1]);
// console.log(merkleTree.verify(proof, leaf[1],rootHash));

export default class Merkle{
    constructor(whiteListSet){
        this.leafNodes = whiteListSet.map(addr => keccak256(addr));
        this.merkleTree = new MerkleTree(leafNodes, keccak256, {sortPairs: true});
        this.rootHash = merkleTree.getRoot();
    }
    
    getLeafNodes(){
        return this.leafNodes;
    }

    getProof(leaf){
        return this.merkleTree.getProof(leaf);
    }

    setAirDrop(){

    }
}

export function makeMerkleTree(whiteListSet){
    const leafNodes = whiteListSet.map( addr => keccak256(addr));
    return new MerkleTree(leafNodes, keccak256, {sortPairs: true});
}
