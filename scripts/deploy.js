async function main() {
    //ContractFactory는 새로운 스마트 컨트랙트 배포에 사용
    const MyNFT = await ethers.getContractFactory("MyNFT")
  
    // Start deployment, returning a promise that resolves to a contract object
    const myNFT = await MyNFT.deploy()
    await myNFT.deployed()
    console.log("Contract deployed to address:", myNFT.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  