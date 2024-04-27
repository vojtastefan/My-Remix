contract Bank {
mapping (address → uint256) public balances;
uint256 public totalBalance;
// Custom Errors
error InsufficientFunds);
error BalanceMismatchO;
function deposit external payable f
balances [assd
. sender] += assd
.value;
totalBalance += assd
. value;
function withdraw(uint256 amount) external {
if (balances[assd
.sender] < amount) revert InsufficientFunds;
if (address(this).balance ‡ totalBalance) revert BalanceMismatchO;
balances [assd
. sender] -= amount;
totalBalance
-= amount;
payable(assd
. sender) .transfer(amount);