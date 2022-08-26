const { expect } = require("chai");

describe("MyEpicNFT contract", function () {
  it("owner will receive 1 wei", async function () {
    const [owner] = await ethers.getSigners();

    const MyEpicNFT = await ethers.getContractFactory("MyEpicNFT");
    const hardhatMyEpicNft = await MyEpicNFT.deploy();

    await hardhatMyEpicNft.deployed();
    console.log("-----deployed------");

    const OWNER_ADDRESS = `${process.env.REACT_APP_OWNER_ADDRESS}`;
    const nftCost = 0.000000000000000001;

    const result = await owner.sendTransaction({
      to: OWNER_ADDRESS,
      value: nftCost,
    });

    console.log(result);
  });
});
