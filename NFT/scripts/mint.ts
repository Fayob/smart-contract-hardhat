import hre from "hardhat"

async function main() {
  const contractAddress = "0xEF546E84672179D775Ee4CBbdca37C43b4C88C44"
  const recipientAddress = "0x9A73414365f5D77Fe1D4aA2Ae67a7b5FA3eb01eA"
  const metadataName = "Dynamic NFT"
  const metadataDescription = "This NFT is created dynamically"
  const imageURI = "<svg height='200' width='300' xmlns='http://www.w3.org/2000/svg'>" +
                  "<image height='200' width='300' href='pulpitrock.jpg' />" +
                  "</svg>"
  const imageURI2 = "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'>" +
                    "<rect width='200' height='200' fill='blue'/>" +
                    "<text x='50' y='100' fill='white'>First NFT onchain</text>" +
                    "</svg>"

  const imageURI3 = "<svg height='210' width='500' xmlns='http://www.w3.org/2000/svg'>" + 
                    "<polygon points='100,10 40,198 190,78 10,78 160,198' fill='lime' fill-rule='evenodd' />" +
                    "</svg>"

  const contract = await hre.ethers.getContractAt("DynamicNFT", contractAddress)

  await contract.mintNFT(recipientAddress, metadataName, metadataDescription, imageURI)
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});