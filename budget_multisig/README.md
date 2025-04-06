# Budget Multi-Signature Wallet

A secure multi-signature wallet implementation for budget management on the Ethereum blockchain. This smart contract enables collaborative budget approval and fund release through a board of 20 members, ensuring transparent and democratic financial decision-making.

## 🌟 Features

- **Multi-Signature Management**

  - 20 board member requirement
  - Individual signature tracking
  - Budget approval counting
  - Automatic fund release upon full approval

- **Budget Control**

  - Monthly budget proposals
  - Budget amount validation
  - Fund release status tracking
  - Budget status monitoring

- **Access Control**
  - Owner-only budget proposals
  - Board member-only approvals
  - One-time signature per member
  - Automatic fund release mechanism

## 🛠️ Technical Stack

- Solidity ^0.8.20
- Hardhat
- TypeScript
- OpenZeppelin Contracts (for security best practices)

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/budget_multisig
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

### Main Contract: `BudgetMultiSig.sol`

The contract implements the following key components:

- **State Variables**

  - Owner address
  - Current month counter
  - Budget amount
  - Funds release status
  - Board member mapping
  - Total board members count

- **Structs**

  - `Budget`: Budget details including amount, approvals, and signature tracking

- **Events**

  - `BudgetProposed`: Emitted when new budget is proposed
  - `BudgetApproved`: Emitted when board member approves budget
  - `FundsReleased`: Emitted when funds are released

- **Custom Errors**
  - `ONLY_OWNER_HAS_ACCESS`: Unauthorized owner access
  - `ONLY_BOARD_MEMBERS_HAS_ACCESS`: Unauthorized board member access
  - `EXACT_20_BOARD_MEMBERS_REQUIRED`: Incorrect board member count
  - `BUDGET_MUST_BE_GREATER_THAN_ZERO`: Invalid budget amount
  - `FUNDS_ALREADY_RELEASED`: Funds already released
  - `NO_BUDGET_PROPOSED`: No budget currently proposed
  - `ALREADY_SIGNED`: Member already signed
  - `NO_BUDGET_AVAILABLE`: No budget available for release

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

### Budget Management

- `proposeBudget`: Propose new budget (owner only)
- `signBudget`: Sign budget proposal (board members only)
- `getBudgetStatus`: View current budget status

## 🔒 Security Features

- Multi-signature requirement
- Role-based access control
- One-time signature per member
- Budget amount validation
- Fund release status tracking
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
- Web3Bridge
- Ethereum Community
