import {
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre from "hardhat";

describe("Dynamic NFT", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployDynamicNFT() {
    const [owner, account1] = await hre.ethers.getSigners();
    const dynamicNFT = await hre.ethers.getContractFactory("DynamicNFT");

    const deployedDNFTContract = await dynamicNFT.deploy("testNFT", "TNFT");

    return {deployedDNFTContract, owner, account1}
  }

  describe("Deployment", function () {
    it("should deploy the contract ", async () => {
      const {deployedDNFTContract} = await loadFixture(deployDynamicNFT)
      
      expect(await deployedDNFTContract.getTokenId()).to.equal(0)
    })
  })

  describe("Mint NFT", () => {
    it("should mint an nft and increase the token id", async () => {
      const {deployedDNFTContract, account1} = await loadFixture(deployDynamicNFT)
      const metadataName = "new test NFT"
      const metadataDescription = "Test for new minted nft"
      const imageURI = "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'>" +
            "<rect width='200' height='200' fill='blue'/>" +
            "<text x='50' y='100' fill='white'>First NFT onchain</text>" +
            "</svg>"
      await deployedDNFTContract.mintNFT(account1, metadataName, metadataDescription, imageURI);
      const tokenId = await deployedDNFTContract.getTokenId();
      
      expect(tokenId).to.be.equal(1);
    })

    it("should test if the address of the minted nft is the same as the recipient address", async () => {
      const {deployedDNFTContract, account1} = await loadFixture(deployDynamicNFT)
      const metadataName = "new test NFT"
      const metadataDescription = "Test for new minted nft"
      const imageURI = "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'>" +
            "<rect width='200' height='200' fill='blue'/>" +
            "<text x='50' y='100' fill='white'>First NFT onchain</text>" +
            "</svg>"
      await deployedDNFTContract.mintNFT(account1, metadataName, metadataDescription, imageURI);
      
      expect(await deployedDNFTContract.ownerOf(1)).to.be.equal(account1.address);
    })
  })
});
