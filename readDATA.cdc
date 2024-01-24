 import CryptoPoops from 0x06
import NonFungibleToken from 0x05

pub fun main(account: Address, id: UInt64): &CryptoPoops.NFT {
  let publicReference = getAccount(account).getCapability(/public/Collection)
                                     .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
                                   ?? panic("This account does not have a Collection")
    let id=id
    return publicReference.borrowAuthNFT(id:id)
}
