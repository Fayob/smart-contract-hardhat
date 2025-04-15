# Ethereum Mainnet Forking Project

A comprehensive project demonstrating Ethereum mainnet forking capabilities using Hardhat. This project enables interaction with existing mainnet contracts, particularly focusing on Uniswap V2 protocol interactions, in a local development environment.

## 🌟 Features

- **Mainnet Forking**

  - Fork Ethereum mainnet state
  - Interact with existing contracts
  - Simulate mainnet transactions
  - Test with real contract states

- **Uniswap V2 Integration**

  - Token swaps (ETH ↔ Tokens)
  - Liquidity provision
  - Liquidity removal
  - Price impact simulation

- **Token Operations**
  - ERC20 token interactions
  - Balance checking
  - Allowance management
  - Token approvals

## 🛠️ Technical Stack

- Solidity ^0.8.9
- Hardhat
- TypeScript
- Ethers.js
- Alchemy/Infura (for mainnet access)

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet
- Alchemy/Infura API key

## 🚀 Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd mainnet-forking
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
ALCHEMY_API_KEY=your_alchemy_api_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

## 💻 Project Structure

### Contracts

- `IUniswap.sol`: Uniswap V2 interface
- `IERC20.sol`: ERC20 token interface

### Scripts

- `swapExactETHForTokens.ts`: Swap ETH for tokens
- `swapExactTokensForTokens.ts`: Swap tokens for tokens
- `swapTokensForExactETH.ts`: Swap tokens for exact ETH amount
- `addliquidity.ts`: Add liquidity to Uniswap pools
- `removeLiquidity.ts`: Remove liquidity from Uniswap pools

## 🔧 Development

1. Configure mainnet forking in `hardhat.config.ts`:

```typescript
networks: {
  hardhat: {
    forking: {
      url: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      blockNumber: 12345678 // Optional: fork from specific block
    }
  }
}
```

2. Run scripts on forked mainnet:

```bash
npx hardhat run scripts/swapExactETHForTokens.ts --network hardhat
```

## 📝 Available Operations

### Token Swaps

- ETH → Tokens
- Tokens → ETH
- Tokens → Tokens

### Liquidity Operations

- Add liquidity to pools
- Remove liquidity from pools
- Calculate optimal amounts

## 🔒 Security Features

- Safe token approvals
- Slippage protection
- Deadline enforcement
- Balance checks
- Allowance verification

## 📚 Usage Examples

### Swapping ETH for Tokens

```typescript
const uniswap = await ethers.getContractAt("IUniswap", UNISWAP_ROUTER);
const path = [WETH_ADDRESS, TOKEN_ADDRESS];

await uniswap.swapExactETHForTokens(
  minAmountOut,
  path,
  recipientAddress,
  deadline,
  { value: ethers.utils.parseEther("1.0") }
);
```

### Adding Liquidity

```typescript
await uniswap.addLiquidity(
  tokenA,
  tokenB,
  amountADesired,
  amountBDesired,
  amountAMin,
  amountBMin,
  recipientAddress,
  deadline
);
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
- Uniswap Protocol
- Ethereum Community
- Web3Bridge
