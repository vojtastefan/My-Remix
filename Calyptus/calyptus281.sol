// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title Musical Chairs Game Contract
/// @notice Implements musical chairs where participants try to be the last one to "sit down" before time runs out.
contract MusicalChairs {
    mapping(address => string) public participants;
    uint private gameEndTime;
    address private lastParticipant;
    uint private participantCount;

    /// @dev Custom error for attempting to sit down after time is up.
    error TimeUp();

    /// @dev Custom error for attempting to sit down more than once.
    error AlreadySatDown();

    /// @dev Custom error for trying to get the winner before the game is over.
    error GameNotOver();

    /// @dev Custom error for trying to pass empty Id.
    error InvalidUserId();

    /// @notice Emitted when a participant successfully sits down.
    /// @param participant The address of the participant who sat down.
    /// @param userId The user ID of the participant.
    event SatDown(address indexed participant, string userId);


    /// @notice Initializes the contract with a game duration of 2 days.
    constructor() {
        gameEndTime = block.timestamp + 2 days;
    }

    /// @notice Allows a participant to try and sit down in the game.
    /// @dev Participant can sit down only once and before the game ends.
    /// @param userId The user ID of the participant.
    function tryToSit(string memory userId) public {
        if (block.timestamp >= gameEndTime) {
            revert TimeUp();
        }

        if (bytes(userId).length == 0) {
            revert InvalidUserId();
        }

        if (bytes(participants[msg.sender]).length != 0) {
            revert AlreadySatDown();
        }

        participants[msg.sender] = userId;
        lastParticipant = msg.sender;
        participantCount++;

        emit SatDown(msg.sender, userId);
    }

    /// @notice Returns the winner of the game.
    /// @dev Can only be called once the game has ended.
    /// @return The address of the last participant who sat down.
    function getWinner() public view returns (address) {
        if (!(block.timestamp >= gameEndTime)) {
            revert GameNotOver();
        }
        return lastParticipant;
    }

    /// @notice Returns the total number of participants in the game.
    /// @return The total number of participants.
    function getTotalParticipants() public view returns (uint) {
        return participantCount;
    }
}