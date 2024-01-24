

 import CryptoPoops from 0x06
 import NonFungibleToken from 0x05

pub fun main(address: Address): [UInt64] {
  
  let recipientsCollection = getAccount(address).getCapability(/public/Collection)
                                  .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                                   ?? panic("This account does not have a Collection")
  
  return recipientsCollection.getIDs()
}
