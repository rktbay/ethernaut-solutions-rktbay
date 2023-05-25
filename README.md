# ethernaut-solutions-rktbay
My documentation and resources on how I solved the challenges in OpenZeppelin Ethernaut

resources used: 
-Google Bard
-ChatGPT
-Google
-Ethers Stack exchange
-Dev.to ethernaut cheat sheet (will check stuff here as a last resort, I will exhaust my time and other resources before 


1. Fallback

solution: use the fallback receive() function to become the owner

2. Fallout
simply call Fal1Out function. Typo trick making you think Fal1out is the constructor due to the comments

3. Coin Flip
You need to understand how **hashes**, **block hashes**, **merkle trees**, and it takes 12 seconds before a next block is made.
You can't exactly predict the next block hash, compute it if
`coinFlip = blockValue / FACTOR == 1 ? true : false`
but you can "cheat" by creating your own coinflip, let it guess if its true/false
`    bool side = coinFlip == 1 ? true : false;`
then call the flip function of the Ethernaut CoinFlip
`bool isRight = ICoinFlip(_coinFlipAddr).flip(side);`

Basically:
* Use solidity or hardhat - deploy **CoinFlipGuess.sol** on testnet mumbai/goerli/arbitrum goerli/ op goerli
* Compile and deploy CoinFlipGuess.sol and get a new instance of the Ethernaut CoinFlip.sol
* Fire the flip() function of coinflip guess along with the instance address of Ethernaut CoinFlip.sol
* Execute the flip() function 10times
* Double check that consecutiveWins is indeed == 10 `await contract.getConsecutiveWins()`
* Submit instance
* Done

4. Telephone
Understand the difference of **tx.origin** and **msg.sender**
* Use solidity or hardhat - deploy **CoinFlipGuess.sol** on testnet mumbai/goerli/arbitrum goerli/ op goerli
* Why? so a deployed contract will be *msg.sender* 
* *tx.origin* will be the same address you are using on Ethernaut and the deployer of the contract (Deployer must be the owner to clear the level)
* Submit instance once owner == player address
