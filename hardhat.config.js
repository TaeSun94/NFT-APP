/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 require('dotenv').config();
 require("@nomiclabs/hardhat-ethers");
 require("@nomiclabs/hardhat-etherscan");
 const { API_URL, PRIVATE_KEY, ETHERSCAN_API_KEY } = process.env;
 module.exports = {
    solidity: "0.8.2",
    defaultNetwork: "ropsten",
    networks: {
      rinkeby: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      },
         /*
         다른 네트워크 추가
         네트워크이름: {
            url: 'DApp api url',
            accouns: ['Contract owner account's Private Key']
         }
         */
   },
   etherscan:{
      apiKey: ETHERSCAN_API_KEY,
      // apiKey: {
      //    rinkeby: "UWT93ZDS2D4F23IJ92K9ZRTCX66CYB5MKB",
      // }
   },
 }