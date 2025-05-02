# Piggy Bank Token Interaction Smart Contract

A collaborative savings smart contract built on the Ethereum blockchain that integrates ERC20 token functionality and NFT rewards. This project allows users to save tokens towards a target amount, with NFT rewards for contributors and time-locked withdrawals.

## 🌟 Features

- **Token-Based Savings**

  - ERC20 token integration
  - Target amount setting
  - Time-based withdrawal period
  - Individual contribution tracking

- **NFT Rewards System**

  - Automatic NFT minting for contributors
  - Unique token IDs
  - Safe minting implementation
  - ERC721 standard compliance

- **Contribution Management**
  - Real-time contribution tracking
  - Minimum contribution validation
  - Contributor count tracking
  - Event emission for contributions

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
- Ethers.js
- OpenZeppelin Contracts

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/piggy_bank_token_interaction
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

- `PiggyBank.sol`: Main contract implementing token-based savings and NFT rewards
- `Token.sol`: ERC20 token contract for savings
- `NFT.sol`: ERC721 contract for contributor rewards

### Key Components

#### PiggyBank Contract

- Token integration
- Contribution tracking
- Time-based withdrawal system
- NFT reward distribution
- Event emission

#### Token Contract

- ERC20 implementation
- Initial supply minting
- Standard token functionality

#### NFT Contract

- ERC721 implementation
- Automatic minting
- Token ID management

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

## 🔒 Security Features

- Manager-only withdrawal access
- Time-locked withdrawals
- Target amount verification
- Token transfer validation
- Address validation
- Event emission for tracking
- Safe minting implementation

## 📚 Usage Examples

### Contributing Tokens

```typescript
const piggyBank = await ethers.getContractAt("PiggyBank", contractAddress);
await token.approve(piggyBankAddress, amount);
await piggyBank.save(amount);
```

### Withdrawing Tokens (Manager Only)

```typescript
const piggyBank = await ethers.getContractAt("PiggyBank", contractAddress);
await piggyBank.withdrawal(amount);
```

### Checking Balance

```typescript
const piggyBank = await ethers.getContractAt("PiggyBank", contractAddress);
const balance = await piggyBank.getBalance();
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

- OpenZeppelin Team
- Hardhat Team
- Ethereum Community
- Web3Bridge
