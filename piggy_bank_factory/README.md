# Piggy Bank Factory Smart Contract

A factory contract that enables the creation of multiple piggy bank contracts with customizable parameters. This project implements the factory pattern to create and manage multiple piggy bank instances, each with its own purpose, duration, and token support.

## 🌟 Features

- **Factory Pattern Implementation**

  - CREATE2 deployment for deterministic addresses
  - Customizable piggy bank parameters
  - Multiple token support
  - Contract tracking and management

- **Contract Management**

  - Contract creation tracking
  - User-specific contract lists
  - Contract information storage
  - Event emission for deployments

- **Token Management**
  - ERC20 token support
  - Token withdrawal functionality
  - Balance checking
  - Security checks

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
  cd smart-contract-hardhat/piggy_bank_factory
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

- `factory/PiggyBankFactory.sol`: Main factory contract
- `template/PiggyBank.sol`: Piggy bank template contract
- `interface/IERC20.sol`: ERC20 token interface
- `Lock.sol`: Sample contract for demonstration

### Key Components

#### PiggyBankFactory Contract

- CREATE2 deployment
- Contract tracking
- Token management
- User-specific contract lists
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

### PiggyBankFactory Contract

```solidity
function createPiggyBank(
    address[] memory _tokens,
    uint256 _duration,
    string memory _purpose,
    uint _salt
) external
function withdraw(address _token) external
function getByteCode(...) public view returns(bytes memory)
function getAddress(bytes memory bytecode, uint _salt) external view returns(address)
```

## 🔒 Security Features

- Owner-only withdrawal access
- CREATE2 deployment security
- Token transfer validation
- Address validation
- Event emission for tracking
- Custom error handling

## 📚 Usage Examples

### Creating a New Piggy Bank

```typescript
const factory = await ethers.getContractAt("PiggyBankFactory", factoryAddress);
await factory.createPiggyBank(
  tokenAddresses,
  duration,
  "Savings for Vacation",
  salt
);
```

### Withdrawing Tokens (Owner Only)

```typescript
const factory = await ethers.getContractAt("PiggyBankFactory", factoryAddress);
await factory.withdraw(tokenAddress);
```

### Getting Contract Information

```typescript
const factory = await ethers.getContractAt("PiggyBankFactory", factoryAddress);
const userContracts = await factory.getUserContractCount(userAddress);
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

Deployed Factory Contract => 0x672097c40C75a02C89C3319e157fEED51546fb64