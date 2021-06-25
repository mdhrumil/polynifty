const { expect } = require("chai");

describe("PolyNFT", function() {
  it("Should deploy the contract, mint a token, and resolve to the right URI", async function() {
    const NFT = await ethers.getContractFactory("PolyNFT");
    const contractInstance = await NFT.deploy();
    
    const URI = "ipfs://QmWJBNeQAm9Rh4YaW8GFRnSgwa4dN889VKm9poc2DQPBkv";

    await contractInstance.deployed();
    await contractInstance.mint("0x1DdF625C01bBDf22bdD5CAb7f25D0db14F450CC4", URI);
    expect(await contractInstance.tokenURI(1)).to.equal(URI);
  });
});
