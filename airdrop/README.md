# ERC20 Token Airdrop Smart Contract

A secure and efficient ERC20 token airdrop implementation using Merkle proofs for whitelisting. This smart contract enables token distribution to whitelisted addresses with built-in security features and gas optimization.

## 🌟 Features

- **Merkle Proof Verification**

  - Secure whitelisting mechanism
  - Gas-efficient verification
  - Prevents double-claiming

- **Token Management**

  - ERC20 token integration
  - Maximum airdrop amount limit
  - Balance checking
  - Secure token transfers

- **Access Control**
  - Owner-only functions
  - Whitelist management
  - Emergency withdrawal capability

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
- OpenZeppelin Contracts
  - ERC20 Interface
  - MerkleProof
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
  cd smart-contract-hardhat/airdrop
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

## 💻 Smart Contract Structure

### Main Contract: `Airdrop.sol`

The contract implements the following key components:

- **State Variables**

  - ERC20 token interface
  - Maximum airdrop amount (1000 tokens)
  - Merkle root for whitelist verification
  - Claim tracking mapping

- **Events**

  - `AirdropClaimed`: Emitted when tokens are claimed
  - `WithdrawSuccessful`: Emitted when owner withdraws tokens
  - `MerkleRootUpdated`: Emitted when whitelist is updated

- **Custom Errors**
  - `NOT_DISPENSING_AIRDROP_AGAIN`: Insufficient token balance
  - `AMOUNT_TOO_HIGH`: Exceeds maximum airdrop amount
  - `AIRDROP_ALREADY_CLAIMED`: Double-claiming attempt
  - `INVALID_PROOF`: Invalid Merkle proof
  - `INSUFFICIENT_BALANCE`: No tokens to withdraw
  - `TRANSFER_FAILED`: Token transfer failed

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

## 📝 Contract Functions

### Airdrop Management

- `claim`: Claim airdrop tokens with Merkle proof
- `setMerkleRoot`: Update whitelist Merkle root (owner only)
- `withdraw`: Emergency token withdrawal (owner only)

## 🔒 Security Features

- Merkle proof verification
- Maximum amount limit
- Double-claim prevention
- Owner-only functions
- Balance checks
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
