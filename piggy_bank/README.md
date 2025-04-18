# Piggy Bank Smart Contract

A collaborative savings smart contract built on the Ethereum blockchain that allows multiple contributors to save towards a target amount, with withdrawals only possible after reaching the target and a specified date.

## 🌟 Features

- **Collaborative Savings**

  - Multiple contributor support
  - Individual contribution tracking
  - Target amount setting
  - Time-based withdrawal period

- **Contribution Management**

  - Real-time contribution tracking
  - Minimum contribution validation
  - Contributor count tracking
  - Event emission for contributions

- **Withdrawal System**
  - Target amount verification
  - Time-locked withdrawals
  - Manager-only withdrawal access
  - Event emission for withdrawals

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
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
  cd smart-contract-hardhat/piggy_bank
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

- `PiggyBank.sol`: Main contract implementing the collaborative piggy bank functionality

### Key Components

#### PiggyBank Contract

- Target amount management
- Contributor tracking
- Time-based withdrawal system
- Manager access control
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

### PiggyBank Contract

```solidity
function save() external payable
function withdrawal() external onlyManager
function getBalance() external view returns(uint256)
```

## 🔒 Security Features

- Manager-only withdrawal access
- Time-locked withdrawals
- Target amount verification
- Minimum contribution validation
- Address validation
- Event emission for tracking

## 📚 Usage Examples

### Contributing to the Piggy Bank

```typescript
const piggyBank = await ethers.getContractAt("PiggyBank", contractAddress);
await piggyBank.save({ value: ethers.utils.parseEther("0.1") });
```

### Withdrawing Funds (Manager Only)

```typescript
const piggyBank = await ethers.getContractAt("PiggyBank", contractAddress);
await piggyBank.withdrawal();
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

- Hardhat Team
- Ethereum Community
- Web3Bridge
