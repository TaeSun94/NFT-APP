async function main() {
    //ContractFactory는 새로운 스마트 컨트랙트 배포에 사용
    const myToken = await ethers.getContractFactory("MyToken")
    
    // Start deployment, returning a promise that resolves to a contract object
    const token = await myToken.deploy()
    await token.deployed()
    console.log("Contract deployed to address:", token.address)
  }
    
  main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
    