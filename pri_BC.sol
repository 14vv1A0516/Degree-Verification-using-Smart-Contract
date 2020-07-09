pragma solidity >=0.4.0 <0.6.0 ;
pragma experimental ABIEncoderV2;

contract pri_BC
{
    struct cert
    {
       string Uni_ID ;
       bytes32 hash_for_pub_BC ;
    }
    
    
    uint counter = 0; 
    mapping (bytes32 => cert) public store_crt ;
    
    function store_cert_hash( string memory Uni_ID, string memory Stu_ID, string memory hash_of_pri_key_of_Stu, string memory Cert_ID, string memory   time_cert_created) public
    {          // To store Hash in pri_BC
    
        bytes32 key = keccak256(abi.encodePacked(Uni_ID, Stu_ID, hash_of_pri_key_of_Stu ));
        bytes32 hash_for_Public_BC = keccak256(abi.encodePacked( Uni_ID, Cert_ID, Stu_ID, time_cert_created ));
        store_crt[key] = cert( Uni_ID, hash_for_Public_BC ) ;
        counter = counter + 1; 
    }
    
    function retrieve_Uni_ID_hash( string memory Uni_ID, string memory Stu_ID, string memory hash_of_pri_key_of_Stu ) view public returns(string memory,bytes32 )
    {          // to get Uni_ID and Hash from pri_BC. TB gives this verifier
    
        bytes32 key = keccak256(abi.encodePacked(Uni_ID, Stu_ID, hash_of_pri_key_of_Stu ));
        return (store_crt[key].Uni_ID, store_crt[key].hash_for_pub_BC ) ;
    }
        
}        
