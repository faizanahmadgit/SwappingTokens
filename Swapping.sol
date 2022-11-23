// SPDX-License-Identifier: MIT

import "./TigerCoin.sol";

contract Swapper is TigerCoin  {
    uint currentSwapPrice;
    IERC20 wolf ;
    IERC20 ape; 

 constructor( IERC20 _token1,IERC20 _token2){
     wolf = _token1;
     ape  = _token2;
     currentSwapPrice = 1;

 }
    function swap(IERC20 token_, uint amount)external payable {
    require(token_.balanceOf(msg.sender)>= amount,"Amount Exceeds Balance");
        //Approve from FrontEnd
        token_.transferFrom(msg.sender,address(this), amount);
        TigerCoin.mint(msg.sender,amount/currentSwapPrice);

    }
    function unswap(IERC20 token_,address to, uint amount) external{
        require(to == msg.sender, "user Not Applicable");
          TigerCoin.burn(to, amount); 
         token_.transfer( to, amount * currentSwapPrice);

    }

    //To get the current swap price
    function getSwapPrice() public view returns(uint){
        return currentSwapPrice;
    }

    //To change the swap price
    function setSwapPrice(uint newPrice_) public {
        currentSwapPrice = newPrice_;
    }
}