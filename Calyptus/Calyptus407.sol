//https://x.com/CalyptusCareers/status/1807987611790622893

//What will calling callTransfer() function result into? 🥷

contract Test {
    function currentBalance() internal pure returns (uint256) {
        return 50;
    }

    function transfer(address recipient, uint256 amount) external pure returns (bool){
        // Mock transfer function
        return true;
    }

    function callTransfer(address recipient) public view returns (string memory) {
        try this.transfer( recipient, currentBalance() - 100) returns (bool success) {
            return "Transfer succeeded";
        } catch {
            return "Caught an error";
        }
    }
}