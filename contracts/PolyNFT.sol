// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title PolyNFT is a contract that allows minting and trading ERC721 NFT tokens.
 *
 */
contract PolyNFT is ERC721, Ownable {
    
    using SafeMath for uint256;


    uint256 private _currentTokenIdentifier = 0;
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("PolyNFT", "PNFT") { }


    /**
     * @dev returns the next _currentTokenIdentifier
     * @return uint256 representing the next token identifier
     */
    function _fetchNextTokenIdentifier() private view returns (uint256) {
        return _currentTokenIdentifier.add(1);
    }


    /**
     * @dev Increment the _currentTokenIdentifier by 1 
     */
     function _incrementCurrentTokenIdentifier() private {
         _currentTokenIdentifier++;
    }


    /**
     * @dev returns the uri entry in the mapping given a tokenId
     * @return string representing uri of an NFT token
     */
    function _getTokenURI(uint256 _tokenId) public view returns(string memory) {
        return _tokenURIs[_tokenId];
    }


    /**
     * @dev sets the uri entry in the mapping for an NFT token given a tokenId
     */
    function _setTokenURI(uint256 _tokenId, string memory _uri) public {
        _tokenURIs[_tokenId] = _uri;
    }


    /**
     * @dev mints an NFT token to the creator: _to
     */
    function mintToken(address _to, string memory _uri) public onlyOwner{
        uint256 _nextTokenId = _fetchNextTokenIdentifier();
        _mint(_to, _nextTokenId);
        _setTokenURI(_nextTokenId, _uri);
        _incrementCurrentTokenIdentifier();
    }


}