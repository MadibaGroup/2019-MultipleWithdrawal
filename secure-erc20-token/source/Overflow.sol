pragma solidity ^0.5.10;

import './SafeMath.sol';

/**
  * Integer overflow demonstration
*/
contract overflowDemo { 

    uint256 public a = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    uint256 public b = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 public c;

    constructor() public {
        c = 0x3;
    }
    
    function a_plus_b() public{
        c = a + b;
    }
}


contract overflowDemoSafe { 
    using SafeMath for uint256;

    uint256 public a = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    uint256 public b = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 public c;

    constructor() public {
        c = 0x3;
    }
    
    function a_plus_b() public{
        c = a.add(b);
    }
} 


/**
  * UnderFlow exploit demonstration
*/
contract underflowDemo { 
    using SafeMath for uint256;

    uint256 public a = 0x0000000000000000000000000000000000000000000000000000000000000000;  // 64 hex values => 64 x 4 = 256 bits
    uint256 public b = 0x0000000000000000000000000000000000000000000000000000000000000001;
    uint256 public c;

    constructor() public {
        c = 0x3;
    }
    
    function a_minus_b_default() public{
        c = a - b;
    }
    
    function a_minus_b_safe() public{
        c = a.sub(b);
    }
}

contract multiplyDemo{
    uint256 public a = 0x8000000000000000000000000000000000000000000000000000000000000000;
    uint256 public b = 0x2;
    uint256 public c;

    constructor() public {
        c = 0x3;
    }
    
    function a_multiply_b() public returns (bool){
        c = a * b;
        return (c == 0) ? true : false;
    }    
}


contract multiplyDemoSafe{
    using SafeMath for uint256;
    
    uint256 public a = 0x8000000000000000000000000000000000000000000000000000000000000000;
    uint256 public b = 0x2;
    uint256 public c;

    constructor() public {
        c = 0x3;
    }
    
    function a_multiply_b() public returns (bool){
        c = a.mul(b);
        return (c == 0) ? true : false;
    }    
}

contract test{
    uint256 public a = 7000000000000000000000000000;
    uint256 public b = 0x8000000000000000000000000000000000000000000000000000000000000000;
    uint256 public c;
    
    constructor() public{
        c = b /a;
    }
    
}
