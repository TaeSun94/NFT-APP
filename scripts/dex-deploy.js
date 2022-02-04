async function main() {
    //ContractFactory는 새로운 스마트 컨트랙트 배포에 사용
    const Dex = await ethers.getContractFactory("DEX")
    
    // Start deployment, returning a promise that resolves to a contract object
    const dex = await Dex.deploy()
    await dex.deployed()
    console.log("Contract deployed to address:", dex.address)
  }
    
  main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })