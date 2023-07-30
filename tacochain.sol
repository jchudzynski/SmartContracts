// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 public constant BURN_RATE = 10; // 0.1% represented as 10 (10/10000)

    constructor() ERC20("My Token", "MTK") {
        uint256 initialSupply = 69420000 * (10 ** decimals());
        _mint(msg.sender, initialSupply);
    }

    function burn(uint256 amount) public {
        uint256 senderBalance = balanceOf(msg.sender);
        require(amount > 0, "Amount should be greater than zero");
        require(senderBalance >= amount, "Not enough balance");

        uint256 burnAmount = (amount * BURN_RATE) / 10000;

        _burn(msg.sender, burnAmount);
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override {
        uint256 burnAmount = (amount * BURN_RATE) / 10000;
        uint256 transferAmount = amount - burnAmount;

        super._transfer(sender, recipient, transferAmount);

        if (burnAmount > 0) {
            _burn(sender, burnAmount);
        }
    }
}
