# NFT-APP
following Ethereum org tutorial

## 1. install
`npm install`
in root directory make .env file
```
//.env
API_URL="DApp api_url or Alchemy"
PRIVATE_KEY="Metamask Private Key"
PUBLIC_KEY = "Metamask Public Key"
```

## 2. execute
`npx hardhat --network '네트워크 이름' run scripts/deploy.js` 실행으로 contract 폴더에서 작성한 컨트랙트 배포

`node scripts/mint-nft.js`로 minting 함수 호출하여 NFT 생성