import CryptoPoops from 0x06
import NonFungibleToken from 0x05


transaction() {
  prepare(signer: AuthAccount) {
    // Store a `CryptoPoops.Collection` in our account storage.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/Collection)
    
    // NOTE: We expose `&CryptoPoops.Collection{CryptoPoops.CollectionPublic}`, which 
    // only contains `deposit` and `getIDs`.
     // Link the CryptoPoops CollectionPublic interface separately
    signer.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic,CryptoPoops.CollectionPublic}>(/public/Collection, target: /storage/Collection)
    }
    
  execute{
  log("<<<< COLLECTION IS CREATED >>>>")
}
}
