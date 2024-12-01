// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1854792033338102041

/* Our smart contract is tracking snacks in the “highly secure” Corporate Snack Vault. 
Here, employees (obviously innocent) “reserve” snacks that mysteriously disappear within minutes. 

When management finds out, they try to delete all records of snack activity to avoid accountability. 
Will they be able to do this?
*/
contract SnackScandal {
    struct SnackVault {
        uint256 snackLevel; // the number of snacks currently in the vault (supposedly)
        mapping (uint256 => address) snackHistory; // who took which snack, according to vault logs
    }

    SnackVault public vaultData;

    function snackTime() external {
        vaultData.snackLevel = 5; // freshly stocked vault, 5 delicious snacks ready
        vaultData.snackHistory[1] = msg.sender;  // employee #1 "claims" a snack
    }

    function eraseTheEvidence() external {
        delete vaultData; // attempt to clear the snack records to avoid HR
    }
}
