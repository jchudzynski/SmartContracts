// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BetterDollar is ERC20
{       
    constructor() ERC20("BetterDollar", "BUSD") {                
        uint256 initialSupply = 21000000*10**18;
        _mint(msg.sender, initialSupply);
    }
}
