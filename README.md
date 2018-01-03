![Energotron](logo.png "Energotron")

* _Standart_        : ERC20
* _Name_            : Energotron
* _Ticket_          : ETN
* _Decimals_        : 18
* _Emission_        : Mintable
* _Token events_    : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Social links
### Facebook - 
### Twitter - 
### Reddit - 
### Telegram - 
### Medium - 
### Instagram - 

## Smart-contracts description

Contract mint bounty, advisors and founders tokens after each stage finished. 
Crowdsale contracts have special function to retrieve transferred in errors tokens.

### Contracts contains
1. _Token_ 
2. _PreTGE_
3. _TGE_

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. 

After crowdsale contract manager must call finishMinting. 

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 EHT) to corresponding crowdsale contract.
Recommended GAS: 200 000 , GAS PRICE - 30 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Main network configuration

* _Founders tokens_            : 7% 
* _Founders tokens wallet_     : 
* _Bounty tokens_              : 1% 
* _Bounty tokens wallet_       : 

#### Links
* _Token_ - 
* _PreTGE_ - 
* _TGE_ - 

#### Pre Token General Event
* _Price_                      : 10000 ETN per 1 ETH
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 13400000 ETN
* _Start_                      : Thu, 15 Feb 2018 13:00:00 GMT
* _Period_                     : 30 days
* _Contract manager_           : 
* _Direct mint agent_          : 
* _ETH Wallet_                 : 

#### Token General Event
* _Base price_                 : 8000 ETN per 1 ETH
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 603 000 000 ETN
* _Start_                      : Fri, 20 Apr 2018 13:00:00 GMT
* _Contract manager_           : 
* _Direct mint agent_          : 
* _ETH Wallet_                 : 

_Milestones_
1. 5 days                     : discount 15%
2. 5 days                     : discount 10%
3. 5 days                     : discount 5%
4. 15 days                    : no discount

## Ropsten network configuration

* _Founders tokens_            : 7%
* _Founders tokens wallet_     : 0xf8b4Da46E85e43c47EBbF73ac8C6746fE3d3f111
* _Bounty tokens_              : 1%
* _Bounty tokens wallet_       : 0xDa67155b22973bE05Bcd28c07107b2E17314A1e2

#### Pre Token General Event
* _Price_                      : 10000 ETN per 1 ETH
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 13400000 ETN
* _Start_                      : Thu, 15 Feb 2018 13:00:00 GMT
* _Period_                     : 30 days
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _ETH Wallet_                 : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

#### Token General Event
* _Base price_                 : 8000 ETN per 1 ETH
* _Minimal insvested limit_    : 0.1 ETH
* _Hardcap_                    : 603 000 000 ETN
* _Start_                      : Fri, 20 Apr 2018 13:00:00 GMT
* _Contract manager_           : 0x55dd7A6353FC004B4F6Da9855F9403B35f4530B1
* _ETH Wallet_                 : 0xf62158b03Edbdb92a12c64E4D8873195AC71aF6A

_Milestones_
1. 5 days                      : discount 15%
2. 5 days                      : discount 10%
3. 5 days                      : discount 5%
4. 15 days                     : no discount

#### Links
* _Token_    - https://ropsten.etherscan.io/address/0xecaa27644082bc2b43a2ddede24052db18cfd74e
* _PreTGE_   - https://ropsten.etherscan.io/address/0x7b7dd50784d46e18ef1bf172330acfec6fb16cd8
* _TGE_      - https://ropsten.etherscan.io/address/0xd3b6dba383c8c4cfd7da924885284a9155532e1d
* _Callback_ - https://ropsten.etherscan.io/address/0x104c039c429db418512ae7c313f80ae4c1948ab7

### Test audit (PreTGE)

#### Purchasers
* 0.1 Ether => 1000 tokens, no referrer, gas = 118750
https://ropsten.etherscan.io/tx/0xda550b64f35aef58ae440e98093f9124cda6ed156b556ddbab1bf18a7c34eb59
* 0.1 Ether => 1000 tokens + 50 tokens to referrer, gas = 103128
https://ropsten.etherscan.io/tx/0x16d8b3b84efdd6b023de50d98da4caf508998bc8eab417406744745eaaf932c0
* 0.1 Ether => 1000 tokens, no referrer, gas = 58750
https://ropsten.etherscan.io/tx/0x98d5c4a437ce621f50e5f2a79640c96535c42c75af935ff0b72162c9431743fa
* Rejected purchase after the end of the PreTGE, gas = 22432
https://ropsten.etherscan.io/tx/0x4c49cdbac95400136ce8fffcab01f76f65529a8fe67e29af768b0857b91a64c6

#### Service operations
* setStart, gas = 27800
https://ropsten.etherscan.io/tx/0xca84ef4faf8ccbbe88f15773747d8b87bbc9af0be73f3eef19ad34f56668c732
* setHardcap, gas = 27584
https://ropsten.etherscan.io/tx/0x5afcc18f228fd20476e89101cd3e2e02da9a871f117d4b452c5fc4751db79e08
* finish, gas = 30351
https://ropsten.etherscan.io/tx/0xdbb44d284573815f3e09944edbdad8c70bf5d45ad1885c94a91c5c7f9b1aaf22

### Test audit (TGE)

#### Purchasers
* 0.1 Ether => 941.176470588235294117 tokens + 47.058823529411764705 tokens to referrer, discount = 15%, gas = 120009
https://ropsten.etherscan.io/tx/0x2f8c9e1dee8e9d7f8040ce6ca9622164c16938bcb04c066a8dba3ebe5f14e2ea
* 0.1 Ether => 888.888888888888888888 tokens, no referrer, discount = 10%, gas = 61119
https://ropsten.etherscan.io/tx/0xb30e1148fda477588413baa6f844baea5c77e1c2f30d04f8f2e6975294ad7c03
* Rejected purchase after the end of the TGE, gas = 22433
https://ropsten.etherscan.io/tx/0xeb6c8df9fe10763e5dfe89ea402ec92c49e48689a69f2a8a4487615e12c4d060
#### Service operations
* setStart, gas = 28086
https://ropsten.etherscan.io/tx/0x3feedee3e7992c656fab03d009f4977399b7a0e6fbe111ad266bc42190ef813d
* setHardcap, gas = 28126
https://ropsten.etherscan.io/tx/0x05c7ee7a3f7716cbf98b3d956d6037918036463addcc2c5fd4d4c9d8c12a9198
* finish, gas = 111772
https://ropsten.etherscan.io/tx/0x4776bcfec47584d0192ffcd295c448ceee658e57154c344bdd73d5bf7b87b728

### Test audit (Token)

#### Purchasers
* transfer, gas = 39049
https://ropsten.etherscan.io/tx/0x838e393c5eb9b755785c85c5e6a591bfa204ac2e080976f8a2e6918a726ffc15
* transfer to contract through callback function, gas = 58756
https://ropsten.etherscan.io/tx/0xd01172620fd2aa0e8cfa262689215adfd353cc088668654e42cbc874a8663fd9

#### Service operations
* registerCallback
https://ropsten.etherscan.io/tx/0x96293f521ad964141d52c21be8fca44d8f8e75bd7bdcec0b473cf582f8715a53
