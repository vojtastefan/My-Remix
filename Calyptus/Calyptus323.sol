// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

//https://twitter.com/calyptus_web3/status/1771039149916569947
//This contract adjusts the 'deliveries' variable by 8 bits to incorporate status storage. 

//Does this adjustment introduce an overflow risk? 🔍
contract DeliveryTracker {
    enum Status {
    ORDERED,
    SHIPPED,
    DELIVERED}

    mapping(uint256 => uint256) private deliveries; // key is item ID

    // Encode timestamp and status
    function updateDelivery(uint256 itemId, Status status) public {
        deliveries[itemId] = (block.timestamp << 8) | uint256(status) ;
    }    

    // Decode to get timestamp and status
    function getDeliveryDetails(uint256 itemId) public view returns (uint256 timestamp, Status status){
        timestamp = deliveries[itemId] >> 8;
        status = Status(deliveries[itemId] & 255);
    }
}