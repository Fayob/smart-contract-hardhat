# ERC20 Token Implementation from Scratch

A complete implementation of the ERC20 token standard from scratch, built on the Ethereum blockchain. This project demonstrates the core functionality of ERC20 tokens with additional features like minting and burning capabilities.

## 🌟 Features

- **Core ERC20 Functions**

  - Transfer tokens between addresses
  - Approve token spending
  - Transfer tokens on behalf of others
  - Check token balances
  - View token allowances

- **Additional Features**

  - Token minting (owner only)
  - Token burning
  - Custom decimal places
  - Total supply tracking
  - Event emission for all operations

- **Security Features**
  - Owner-only minting
  - Balance checks
  - Allowance verification
  - Zero address validation
  - Value validation

## 🛠️ Technical Stack

- Solidity ^0.8.26
- Hardhat
- TypeScript
- Custom implementation (no OpenZeppelin dependencies)

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/erc20_from_scratch
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
```

## 💻 Smart Contract Structure

### Main Contract: `ERC20.sol`

The contract implements the following key components:

- **State Variables**

  - Token name and symbol
  - Total supply
  - Decimal places
  - Owner address
  - Balance mapping
  - Allowance mapping

- **Events**

  - `Transfer`: Emitted on token transfers
  - `Approval`: Emitted on allowance updates
  - `Mint`: Emitted on token minting
  - `Burnt`: Emitted on token burning

- **Custom Errors**
  - `INVALID_ADDRESS`: Zero address provided
  - `INSUFFICIENT_BALANCE`: Insufficient token balance
  - `INSUFFICIENT_ALLOWANCE`: Insufficient allowance
  - `VALUE_MUST_BE_GREATER_THAN_ZERO`: Invalid token amount
  - `ONLY_OWNER_IS_AUTHORIZE`: Unauthorized owner access

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

### Core ERC20 Functions

- `transfer`: Transfer tokens to another address
- `approve`: Approve token spending
- `transferFrom`: Transfer tokens on behalf of another address
- `balanceOf`: Check token balance
- `allowance`: Check token allowance
- `totalSupply`: Get total token supply
- `name`: Get token name
- `symbol`: Get token symbol
- `decimal`: Get token decimals

### Additional Functions

- `mint`: Create new tokens (owner only)
- `burn`: Burn existing tokens

## 🔒 Security Features

- Owner-only minting
- Balance validation
- Allowance verification
- Zero address checks
- Value validation
- Custom error handling for gas optimization

## 📚 Usage Examples

### Deploying Token

```javascript
const token = await ERC20.deploy(
  "My Token",
  "MTK",
  18,
  ethers.utils.parseEther("1000000")
);
```

### Transferring Tokens

```javascript
await token.transfer(recipientAddress, ethers.parseEther("100"));
```

### Approving Token Spending

```javascript
await token.approve(spenderAddress, ethers.parseEther("50"));
```

### Minting New Tokens

```javascript
await token.mint(ethers.parseEther("1000"));
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
- Ethereum Community
- Web3Bridge
