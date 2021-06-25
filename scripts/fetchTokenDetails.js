const hre = require("hardhat");

async function main() {
    const nftContract = await hre.ethers.getContractFactory("PolyNFT");
    const CONTRACT_ADDRESS = "0xa5600d559404e90119a4E981A59D6cCa50d3c72A";
    const contractInstance = nftContract.attach(CONTRACT_ADDRESS);

    const owner = await contractInstance.ownerOf(1);
    console.log("Owner of the token: ", owner);
    
    const uri = await contractInstance.tokenURI(1);
    console.log("URI of the token: ", uri);

}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
})