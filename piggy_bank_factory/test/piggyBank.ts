import {ethers} from "hardhat"
import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";

describe("Piggy Bank", () => {
  async function deployPiggyBank() {
    const [account1] = await ethers.getSigners()

    const tokenAddresses = ["0xb1B83B96402978F212af2415b1BffAad0D2aF1bb", "0xdAC17F958D2ee523a2206206994597C13D831ec7", "0x6B175474E89094C44Da98b954EedeAC495271d0F"]
    const tokenOwner = "token owner's address"
    const owner = "owner's address"

    const pgContract = await ethers.getContractFactory("PiggyBank")
    const pgContractFactory = await ethers.getContractFactory("PiggyBankFactory")
    const deployedFactory = await pgContractFactory.deploy();

    const deployedPG = await pgContract.deploy(tokenAddresses, 300, "car", owner, deployedFactory.target)

    return { deployedPG, owner, tokenOwner, tokenAddresses, deployedFactory, pgContract, account1}
  }

  describe("Deployment", () => {
    it("should set developer's address successfully", async () => {
      const {deployedPG, deployedFactory} = await loadFixture(deployPiggyBank);
      const devAddr = await deployedPG.getDevAddress()

      expect(devAddr).to.equal(deployedFactory);
    })

    it("should revert EOA address is passed as token address", async () => {
      const {owner, tokenOwner, pgContract, account1} = await loadFixture(deployPiggyBank);

      await expect(pgContract.deploy([account1.address], 300, "test", owner, tokenOwner)).to.reverted
        // .to.revertedWithCustomError(pgContract, "REQUIRED_CONTRACT_ADDRESS()")
    })
  })

  describe("Deposit", () => {
    it("should deposit an amount", async () => {
      const {deployedPG, tokenAddresses, tokenOwner} = await loadFixture(deployPiggyBank);
      const tokenOwnerRunner = await ethers.getSigner(tokenOwner)
      const amount = 50

      await deployedPG.connect(tokenOwnerRunner).deposit(tokenAddresses[0], amount)
      expect(await deployedPG.balance).to.equal(amount)
    })
  })
})

