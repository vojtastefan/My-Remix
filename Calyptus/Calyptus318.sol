// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;
//https://twitter.com/calyptus_web3/status/1768502436774256840

//Here's a smart contract managing a digital asset registry on the blockchain. The assets are recorded with ownership details.
//What could possibly go wrong? 🤔

contract AssetRegistry {
    struct Asset {
    string name;
    uint256 value;
    bool isRegistered;}

    address public owner;
    mapping (uint256 => Asset) private assets; // A mapping of asset IDs to Assets
    uint256 private totalAssetsRegistered;

    error Unauthorized();

    constructor(){
        owner = msg. sender;
    }

    modifier onlyOwner(){
        if (msg.sender != owner) {
        revert Unauthorized();}
        _;
    }

    // Function to register a new asset
    function registerAsset(uint256 _assetId, string calldata _name, uint256 _value) external onlyOwner {
        require(!assets[_assetId].isRegistered, "Asset already registered.");
        assets[_assetId] = Asset({name: _name, value: _value, isRegistered: true});
        totalAssetsRegistered++;
    }    

    // Vulnerable view function restricted by onlyOwner
    function getAssetValue(uint256 _assetId) external view onlyOwner returns (uint256) {
        require(assets[_assetId].isRegistered, "Asset not registered.");
        return assets[_assetId].value;
    }    

    // Another vulnerable view function
    function getTotalAssetsRegistered() external view onlyOwner returns (uint256) {
        return totalAssetsRegistered;
    }
}
