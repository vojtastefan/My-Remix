// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1792854656688718284

/*Calling view functions doesn’t cost gas ⛽️

Does this mean that calling payFeeAndReveal1() 
and payFeeAndReveal2() will cost the same amount of gas?
*/

contract DeepThought {
    uint256 answer = 42;

    function ultimateQuestion() public view returns (uint256) {
        return answer;
    }
    // gas	27086 gas
    // transaction cost	23553 gas 
    // execution cost	2489 gas 



    function payFeeAndReveal1() public payable returns (uint256) {
        if (msg.value < 1) revert("pay computation cost");
        return ultimateQuestion();
    }
        
    function payFeeAndReveal2() public payable returns (uint256) {
        if (msg.value < 1) revert("pay computation cost");
        return 42;
    }
    // gas	24607 gas
    // transaction cost	21397 gas 
    // execution cost	333 gas 
}
