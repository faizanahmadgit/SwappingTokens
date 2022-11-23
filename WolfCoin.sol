// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WolfCoin is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("WolfCoin", "WOLF") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        super._transfer(owner, to, amount);
        return true;
    }
}