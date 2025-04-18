import {ethers} from "hardhat"

async function main() {
  // const tokenAddresses = [
  //   "0xdAC17F958D2ee523a2206206994597C13D831ec7", 
  //   "0x6B175474E89094C44Da98b954EedeAC495271d0F"
  // ]
  // const tokenOwner = "0x9A73414365f5D77Fe1D4aA2Ae67a7b5FA3eb01eA"
  // const devAddr = "0x672097c40C75a02C89C3319e157fEED51546fb64"
  // const contract = await ethers.getContractFactory("PiggyBank")
  // const contractTx = await contract.deploy(tokenAddresses, 300, "test", tokenOwner, devAddr)
  // contractTx.waitForDeployment()
  // console.log("Factory Contract deployment Address => ", contractTx.target);

  const factoryContract = await ethers.getContractFactory("PiggyBankFactory")
  const tx = await factoryContract.deploy()
  tx.waitForDeployment()
  console.log("Factory Contract deployment Address => ", tx.target);
  
}

main().then(() => process.exit(0)).catch((err) => {
  console.error(err)
  process.exit(1)
})