// async function main() {
//   //ContractFactory는 새로운 스마트 컨트랙트 배포에 사용
//   const MsgNFT = await ethers.getContractFactory("msgToken")
  
//   // Start deployment, returning a promise that resolves to a contract object
//   const myNFT = await MsgNFT.deploy()
//   await myNFT.deployed()
//   console.log("Contract deployed to address:", myNFT.address)
// }
  
// main()
// .then(() => process.exit(0))
// .catch((error) => {
//   console.error(error)
//   process.exit(1)
// })
async function main() {
  //ContractFactory는 새로운 스마트 컨트랙트 배포에 사용
  const Safe = await ethers.getContractFactory("Test")
  
  // Start deployment, returning a promise that resolves to a contract object
  const storage = await Safe.deploy()
  await storage.deployed()
  console.log("Contract deployed to address:", storage.address)
}
  
main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error)
  process.exit(1)
})