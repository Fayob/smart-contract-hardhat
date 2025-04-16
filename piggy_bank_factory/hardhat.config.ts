import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require('dotenv').config();

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_SEPOLIA_API_URL,
      accounts: [`${process.env.SEPOLIA_ACCOUNT_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: {  
      sepolia: process.env.ETHERSCAN_API_KEY!
    }
  }
};

export default config;
