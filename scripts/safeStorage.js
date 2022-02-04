require("dotenv").config()
const API_URL = process.env.API_URL
const PUBLIC_KEY = process.env.PUBLIC_KEY
const PRIVATE_KEY = process.env.PRIVATE_KEY

const { createAlchemyWeb3 } = require("@alch/alchemy-web3")
const web3 = createAlchemyWeb3(API_URL)

const contract = require("../artifacts/contracts/SafeStorage.sol/SafeStorage.json")
//배포한 컨트렉트 주소
const contractAddress = "0x0369E77eD3E15420FC76617a1839812C81df9a44"
const myContract = new web3.eth.Contract(contract.abi, contractAddress)
const erc20 = new web3.eth.Contract(require("../artifacts/contracts/MyToken.sol/MyToken.json"),"0xc41B5E5f8EBa25c77B38aaf01AcC62eE7d4E5F30");
async function setAccount() {
  const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, "latest") //get latest nonce
  //the transaction
  const tx = {
    from: PUBLIC_KEY,
    to: contractAddress,
    nonce: nonce,
    gas: 500000,
    data: myContract.methods.getAccount(PUBLIC_KEY).encodeABI(),
  }

  const signPromise = web3.eth.accounts.signTransaction(tx, PRIVATE_KEY)
    .then((signedTx) => {
      web3.eth.sendSignedTransaction(
        signedTx.rawTransaction,
        function (err, hash,res) {
          if (!err) {
            console.log(
              "The hash of your transaction is: ",
              hash,
              "\nCheck Alchemy's Mempool to view the status of your transaction!",
              res
            )
          } else {
            console.log(
              "Something went wrong when submitting your transaction:",
              err
            )
          }
        }
      )
    })
    .catch((err) => {
      console.log(" Promise failed:", err)
    })
}
//mintNFT 함수에 인자값으로 IPFS에 등록한 데이터 주소 입력
setAccount()
