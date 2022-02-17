// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "./SafeMath.sol";

contract MultiToken is ERC1155, Ownable, ERC1155Supply {
    using SafeMath for uint256;

    //Divide for FT & NFT
    uint256 public divideNum = 100000000;
    
    //Metadata uri storage
    mapping (uint256 => string) public _uri;
    //FT Token Name
    mapping (uint256 => string) public tokenNames;
    //For Air Drop NFT Token
    mapping (uint256 => mapping (address => uint256)) public claims;
    //MerkleTree rootHash for whitelist
    bytes32[] public merkleTreeRoot;
    string public baseURI = "ipfs://";
    event Mint(address account, string tokenURI);

    constructor() ERC1155("") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function setFTName (uint256 id, string memory name)
        internal
        onlyOwner
        returns(string memory)
    {
        tokenNames[id] = name;
        return name;
    }

    function createFT(string memory uri_, uint256 id, uint256 amount, bytes memory data, string memory name)
        public
        onlyOwner
    {
        require(id <= divideNum, "Full FT List! Can't create new Token");
        _uri[id] = uri_;
        tokenNames[id] = name;
        _mint(msg.sender, id, amount.mul(10**18),data);
        emit URI(uri_, id);
    }

    function createBatchFT(uint256 tokenSize, string[] memory name, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        uint[] memory ids = new uint[](amounts.length);
        for(uint i = 0; i < name.length; i++){
            ids[i] = tokenSize;
            tokenNames[tokenSize++] = name[i];
        }
        _mintBatch(msg.sender, ids, amounts, data);
    }

    function mintNFT(string memory uri_, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _uri[id] = uri_;
        _mint(msg.sender, id, amount, data);
        emit URI(uri_, id);
        emit Mint(msg.sender, uri_);
    }

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}