// SPDX-LICENSE-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import { NativeOFTAdapter } from "../../contracts/oft-evm/NativeOFTAdapter.sol";
import { NativeOFTAdapterMock } from "../mocks/NativeOFTAdapterMock.sol";

// @title NativeOFTAdapterMockCodec
// @notice Codec to convert NativeOFTAdapter to NativeOFTAdapterMock in a consistent, readable manner.
// @dev For testing purposes only.
library NativeOFTAdapterMockCodec {
    function asNativeOFTAdapterMock(NativeOFTAdapter _oft) internal pure returns (NativeOFTAdapterMock) {
        return NativeOFTAdapterMock(address(_oft));
    }
}
