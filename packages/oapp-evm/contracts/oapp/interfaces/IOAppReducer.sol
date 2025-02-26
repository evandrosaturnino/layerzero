// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IOAppReducer {
    function lzReduce(bytes calldata _cmd, bytes[] calldata _responses) external view returns (bytes memory);
}
