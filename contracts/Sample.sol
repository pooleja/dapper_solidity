// Compiler version
pragma solidity ^0.4.18;

// Importing a library with functions
import "./SampleLib.sol";

// Contract definition
contract Sample {
		// State variables
    uint count = 0;
    address creator;

		// Mapping of addresses to boolean
    mapping(address => bool) public updaters;

		// Event for watchers of a contract
    event Doubled(address indexed _from, uint256 indexed _newCount, uint256 _time);

		// Constructor called when contract is deployed
    constructor() public {
			  // Initialize vars
        count = 1;
        creator = msg.sender;
    }

		// Public function that anyone can call via transaction
    function increase() public {
			  // Double the count
        count = SampleLib.double(count);

				// Update the mapping
        updaters[msg.sender] = true;

				// Emit event
        emit Doubled(msg.sender, count, block.timestamp);
    }

		// Function modifier
    modifier onlyCreator() { 
			  // Check any validations
        require(
            msg.sender == creator,
            "Only creator can call this."
        );

				// Call the original function logic
        _;
    }

		// Public function that is only allowed to be called by creator
    function reset() public onlyCreator {
        count = 0;
    }

		// View only function - does not require a transaction
    function didModify(address addressToCheck) public view returns (bool) {
        return updaters[addressToCheck];
    }

		// Allow money to be sent to this contract... but you're not getting it out.
    function() public payable { }
}
