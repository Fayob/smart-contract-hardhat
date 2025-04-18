# NFT Smart Contract Project

A comprehensive NFT (Non-Fungible Token) project built on the Ethereum blockchain, featuring both a dynamic NFT implementation and a standard NFT contract with minting capabilities.

## 🌟 Features

- **Dynamic NFT Contract**

  - On-chain metadata generation
  - Base64 encoded metadata
  - SVG image support
  - Owner-only minting

- **Standard NFT Contract**
  - Configurable minting price
  - Maximum supply limit
  - Withdrawal functionality
  - Base URI support
  - Event emission

## 🛠️ Technical Stack

- Solidity ^0.8.20
- Hardhat
- TypeScript
- OpenZeppelin Contracts
- Ethers.js

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/NFT
```

2. Install dependencies:

```bash
npm install
# or
yarn install
```

3. Create a `.env` file in the root directory:

```env
  PRIVATE_KEY=your_private_key
  ETHERSCAN_API_KEY=your_etherscan_api_key
```

## 💻 Project Structure

### Contracts

- `DynamicNFT.sol`: Dynamic NFT implementation with on-chain metadata

### Key Components

#### DynamicNFT Contract

- On-chain metadata generation
- Base64 encoding support
- SVG image integration
- Owner-controlled minting

#### Assignment Contract (MyNFT)

- Configurable minting price
- Maximum supply limit
- Withdrawal functionality
- Base URI support
- Event emission

## 🔧 Development

1. Compile contracts:

```bash
npx hardhat compile
```

2. Run tests:

```bash
npx hardhat test
```

3. Deploy to network:

```bash
  npx hardhat run scripts/deploy.ts --network <network-name>
```

## 📝 Contract Functions

### DynamicNFT Contract

```solidity
function mintNFT(
    address recipient,
    string memory metadataName,
    string memory desc,
    string memory imageURI
) external onlyOwner returns(uint256)
```

### Assignment Contract (MyNFT)

```solidity
function mint() external payable
function setMintPrice(uint256 _mintPrice) external onlyOwner
function withdraw() external onlyOwner
function totalSupply() external view returns (uint256)
```

## 🔒 Security Features

- OpenZeppelin's Ownable implementation
- Safe minting checks
- Withdrawal security
- Supply limit enforcement
- Price validation

## 📚 Usage Examples

### Minting a Dynamic NFT

```typescript
const dynamicNFT = await ethers.getContractAt("DynamicNFT", contractAddress);
await dynamicNFT.mintNFT(
  recipientAddress,
  "My Dynamic NFT",
  "Description",
  "SVG Image URI"
);
```

### Minting a Standard NFT

```typescript
const myNFT = await ethers.getContractAt("MyNFT", contractAddress);
await myNFT.mint({ value: ethers.utils.parseEther("0.1") });
```

## 🧪 Testing

The project includes comprehensive tests for all major functionalities. Run the test suite:

```bash
npx hardhat test
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ⚠️ Disclaimer

This project is for educational purposes only. While it has been tested, it should not be used in production without proper auditing and security measures.

## 🙏 Acknowledgments

- Web3Bridge
- OpenZeppelin Team
- Hardhat Team
- Ethereum Community
