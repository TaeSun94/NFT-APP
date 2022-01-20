/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 require('dotenv').config();
 require("@nomiclabs/hardhat-ethers");
 const { API_URL, PRIVATE_KEY } = process.env;
 module.exports = {
    solidity: "0.8.0",
    defaultNetwork: "ropsten",
    networks: {
       hardhat: {},
       ropsten: {
          url: API_URL,
          accounts: [`0x${PRIVATE_KEY}`]
       }
       /*
       다른 네트워크 추가
       네트워크이름: {
            url: 'DApp api url',
            accouns: ['Contract owner account's Private Key']
       }
       */
    },
 }