
import CryptoPoops from 0x06
import NonFungibleToken from 0x05





transaction(recipient: Address, name: String, favouriteFood: String, luckyNumber: Int) {

  prepare(signer: AuthAccount) {
    // Get a reference to the `Minter`
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
                    ?? panic("This signer is not the one who deployed the contract.")

    // Get a reference to the `recipient`s public Collection
    let recipientsCollection = getAccount(recipient).getCapability(/public/Collection)
                                  .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()?? panic("The recipient does not have a Collection.")

    // mint the NFT using the reference to the `Minter` and pass in the metadata
    let nft <- minter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber)

    // deposit the NFT in the recipient's Collection
    recipientsCollection.deposit(token: <- nft)
  }
  execute{
  log("<<<<CREATED NFT ADDED TO COLLECTION>>>>")
    }
}
