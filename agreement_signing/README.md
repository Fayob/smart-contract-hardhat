# Smart Contract Agreement Signing System

A decentralized agreement signing and payment system built on the Ethereum blockchain. This smart contract enables secure creation, signing, and completion of agreements with integrated payment processing using ERC20 tokens.

## 🌟 Features

- **Agreement Management**

  - Create new agreements
  - Sign agreements digitally
  - Track agreement status
  - Deadline management
  - Agreement locking mechanism

- **Payment Processing**

  - ERC20 token integration
  - Secure payment handling
  - Price verification
  - Balance checking
  - Automatic fund transfer

- **Access Control**
  - Role-based access (Buyer/Seller)
  - Agreement ownership verification
  - Deadline enforcement
  - Agreement state management

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
- OpenZeppelin Contracts
  - ERC20 Interface
  - Ownable

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
git clone git@github.com:Fayob/smart-contract-hardhat.git
cd smart-contract-hardhat/agreement_signing
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
ALCHEMY_API_KEY=your_alchemy_api_key
TOKEN_ADDRESS=your_token_contract_address
```

## 🔧 Development

1. Compile the contracts:

```bash
npx hardhat compile
```

2. Run tests:

```bash
npx hardhat test
```

3. Deploy to local network:

```bash
npx hardhat node
npx hardhat run scripts/deploy.ts --network localhost
```

4. Deploy to testnet:

```bash
npx hardhat run scripts/deploy.ts --network <network-name>
```

## 🔒 Security Features

- Role-based access control
- Deadline enforcement
- Agreement state verification
- Payment amount validation
- Balance checking
- Transfer success verification
- Custom errors for gas optimization

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

This smart contract is for educational purposes only. While it has been tested, it should not be used in production without proper auditing and security measures.

## 🙏 Acknowledgments

- Hardhat Team
- OpenZeppelin
- Ethereum Community
- Web3Bridge
