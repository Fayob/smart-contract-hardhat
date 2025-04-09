# Event Management Smart Contract

A decentralized event management system built on the Ethereum blockchain. This project enables event creation, ticket management, and attendance verification using NFTs as digital tickets.

## 🌟 Features

- **Event Management**

  - Create free and paid events
  - Set event details (title, description, dates)
  - Manage guest capacity
  - Track registration status
  - Verify attendance

- **Ticket System**

  - NFT-based digital tickets
  - Custom ticket metadata
  - Unique ticket generation
  - Visual ticket representation
  - Ticket ownership tracking

- **Registration System**
  - Event registration
  - Capacity management
  - Payment handling for paid events
  - Duplicate registration prevention
  - Registration deadline enforcement

## 🛠️ Technical Stack

- Solidity ^0.8.28
- Hardhat
- TypeScript
- OpenZeppelin Contracts
  - ERC721URIStorage
  - Ownable
  - Base64

## 📋 Prerequisites

- Node.js (v14 or later)
- npm or yarn
- Hardhat
- MetaMask or similar Web3 wallet

## 🚀 Installation

1. Clone the repository:

```bash
  git clone git@github.com:Fayob/smart-contract-hardhat.git
  cd smart-contract-hardhat/event_creation
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

### Main Contract: `Event.sol`

The contract implements the following key components:

- **State Variables**

  - Event counter
  - Event details mapping
  - Registration tracking mapping

- **Structs**

  - `EventDetails`: Event information including title, dates, capacity, and organizer

- **Enums**

  - `EventType`: Defines event types (free/paid)

- **Events**
  - `EventCreated`: Emitted when new event is created
  - `EventTicketCreated`: Emitted when event tickets are created
  - `EventRegistered`: Emitted when user registers for event
  - `AttendanceVerified`: Emitted when attendance is verified

### Ticket Contract: `Ticket.sol`

- **Features**
  - ERC721 NFT implementation
  - Custom metadata generation
  - SVG-based ticket visualization
  - Owner-only minting

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

### Event Management

- `createEvent`: Create new event
- `createEventTicket`: Create NFT tickets for event
- `registerForEvent`: Register for an event
- `verifyAttendance`: Verify event attendance

### Ticket Management

- `mintNFT`: Mint digital ticket
- `getTokenId`: Get current token ID

## 🔒 Security Features

- Owner-only ticket creation
- Registration validation
- Date validation
- Capacity management
- Duplicate registration prevention
- Payment verification for paid events

## 📚 Usage Examples

### Creating an Event

```javascript
await eventContract.createEvent(
  "Web3 Conference",
  "Annual blockchain conference",
  Math.floor(Date.now() / 1000) + 86400, // 24 hours from now
  Math.floor(Date.now() / 1000) + 172800, // 48 hours from now
  1, // paid event
  100 // expected guest count
);
```

### Creating Event Tickets

```javascript
await eventContract.createEventTicket(
  eventId,
  "Web3 Conference Ticket",
  "W3CT"
);
```

### Registering for an Event

```javascript
await eventContract.registerForEvent(eventId, {
  value: ethers.utils.parseEther("0.1"), // for paid events
});
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

This smart contract is for educational purposes only. While it has been tested, it should not be used in production without proper auditing and security measures.

## 🙏 Acknowledgments

- Hardhat Team
- OpenZeppelin
- Ethereum Community
- Web3Bridge
