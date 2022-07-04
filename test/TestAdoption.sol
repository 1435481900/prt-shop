// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption {

  Adoption adoption=Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);
    uint expected=8;

    Assert.equal(returnedId,expected,"Adoption");
  }

  function testGetAdopterAddressByPetid() public{
    address expected = address(this);
    address adpoter = adoption.adopters(8);


    Assert.equal(adpoter,expected,"Owner of Pet Id 8 should be recoded.");
  }
  function testGetAdopterAddresspetIdInArray() public{
    address expected =address(this);

    address[16] memory adopters =adoption.getAdopters();
      Assert.equal(adopters[8],expected,"Owner of Pet Id 8 should be recoded.");
  }

}
