// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Inflation is ERC20
{    
    uint256 denominator = 100;
    uint256 numerator = 15;
    address owner;

    constructor(string memory name, string memory symbol) ERC20(name,symbol) {
        uint256 initialSupply = 21000000*10**18;
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    function mintReward(uint256 reward, address recipient) internal {
         _mint(recipient, reward);
    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override{
        uint256 reward = value / denominator * numerator;
        mintReward(reward,owner);
        super._beforeTokenTransfer(from, to, value);
    }
}