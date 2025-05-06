# School Management System Smart Contract

A decentralized school management system built on the Ethereum blockchain using Solidity and Hardhat. This smart contract enables the management of school staff, students, courses, and fee payments in a transparent and secure manner.

## 🌟 Features

- **Staff Management**

  - Register new staff members
  - Remove staff members
  - Track staff specialization areas

- **Student Management**

  - Register new students
  - Remove students
  - Track student information (name, age, gender, course of study)

- **Course Management**

  - Create new courses
  - Register students for courses
  - Track course registrations

- **Fee Management**

  - Set school fees
  - Process fee payments
  - Track payment status

- **Score Management**
  - Upload student scores
  - View individual course scores
  - Score verification system

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
- OpenZeppelin (for security best practices)

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/school_management_system
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

### Main Contract: `SchoolManagementSystem.sol`

The contract implements the following key components:

- **State Variables**

  - Principal address
  - School name
  - Course count
  - School fee
  - Staff mapping
  - Student mapping
  - Course mapping

- **Structs**

  - `StaffInfo`: Staff member details
  - `StudentInfo`: Student information
  - `Course`: Course details

- **Modifiers**
  - `onlyPrincipal`: Restricts access to principal only
  - `eitherPrincipalOrStaff`: Allows access to principal and staff
  - `onlyStudent`: Restricts access to registered students

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

### Staff Management

- `registerStaff`: Register new staff members
- `removeStaff`: Remove existing staff members

### Student Management

- `registerStudent`: Register new students
- `removeStudent`: Remove existing students

### Course Management

- `createCourse`: Create new courses
- `registerCourse`: Register students for courses

### Fee Management

- `setSchoolFee`: Set school fee amount
- `paySchoolFee`: Process student fee payments

### Score Management

- `uploadScores`: Upload student course scores
- `checkScores`: View individual course scores

## 🔒 Security Features

- Access control modifiers
- Input validation
- State management
- Event emission for tracking
- Secure payment handling


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