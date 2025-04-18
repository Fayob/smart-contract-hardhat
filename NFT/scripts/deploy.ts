import { ethers } from "hardhat";

async function main() {
  const contract = await ethers.getContractFactory("MyNFT")

  const baseTokenURI = "https://salmon-casual-limpet-705.mypinata.cloud/ipfs/bafybeifzkzipd4wyvpp4oynyb7vqto2bfyjk2cql77eadq2z7dfsex2yqe/"

  const amount = ethers.parseEther("10")

  const deployedContract = await contract.deploy("Fav NFT", "FNFT", baseTokenURI, amount, 50)

  console.log("Deployed contract address => ", deployedContract.target)
}

main().then(() => {
  process.exit(0)
}).then((err) => {
  console.error(err)
  process.exit(1)
})