// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IOAppMapper {
    function lzMap(bytes calldata _request, bytes calldata _response) external view returns (bytes memory);
}
