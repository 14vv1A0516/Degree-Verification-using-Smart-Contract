pragma solidity >=0.4.0 <0.6.0 ;
pragma experimental ABIEncoderV2 ;

contract pub_BC
{
  
    mapping (bytes32 => bytes32) public store_crt ;
    uint public counter = 0; 

    function store_cert_hash(bytes32 hash,  string memory hash_of_pri_key_of_Stu, string memory degree ) public //string memory Uni_ID, string memory Stu_ID, string memory hash_of_pri_key_of_Stu, string memory degree, string memory Cert_ID, string memory   time_cert_created) public
    {   // To store Hash in pub_BC by University
    
        bytes32 key = hash; // keccak256(abi.encodePacked( Uni_ID, Cert_ID, Stu_ID, time_cert_created ));
        bytes32 hash_to_verify = keccak256(abi.encodePacked( keccak256(abi.encodePacked(degree)), keccak256(abi.encodePacked(hash_of_pri_key_of_Stu)) ));
        store_crt[key] = hash_to_verify ;
        counter = counter + 1; 
    }
    
    function get_hash_for_verifier(bytes32 hash) view public returns(bytes32)
    {   // Verifier gets hash of degree to check with hash he computed on digital degree
        return store_crt[hash];    
    }
    
    function verification(bytes32 actual_hash_from_BC, string memory hash_of_pri_key_of_Stu, string memory digital_degree) view public returns(bool )
    {   // verification process with both hashes
        
          bytes32 hash_for_verify = keccak256(abi.encodePacked( keccak256(abi.encodePacked(digital_degree)), keccak256(abi.encodePacked(hash_of_pri_key_of_Stu)) ));
          if(actual_hash_from_BC == hash_for_verify)
            return true;
          else
            return false;
    }
    
    
}    
