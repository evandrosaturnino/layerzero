// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

import { PreCrimePeer } from "../../contracts/oapp-precrime/interfaces/IPreCrime.sol";
import { IOAppPreCrimeSimulator } from "../../contracts/oapp-precrime/interfaces/IOAppPreCrimeSimulator.sol";
import { PreCrime } from "../../contracts/oapp-precrime/PreCrime.sol";
import { InboundPacket } from "../../contracts/oapp-precrime/libs/Packet.sol";

import { PreCrimeV2SimulatorMock } from "./PreCrimeV2SimulatorMock.sol";

contract PreCrimeV2Mock is PreCrime {
    uint32[] public eids;
    bytes[] public results;

    constructor(
        address _endpoint,
        address _simulator,
        address _owner
    ) PreCrime(_endpoint, _simulator) Ownable(_owner) {}

    function buildSimulationResult() external view override returns (bytes memory) {
        return abi.encode(PreCrimeV2SimulatorMock(simulator).count());
    }

    function _getPreCrimePeers(
        InboundPacket[] memory _packets
    ) internal view override returns (PreCrimePeer[] memory peers) {
        for (uint256 i = 0; i < _packets.length; i++) {
            InboundPacket memory packet = _packets[i];
            if (IOAppPreCrimeSimulator(simulator).isPeer(packet.origin.srcEid, packet.origin.sender)) {
                return preCrimePeers;
            }
        }
        return (new PreCrimePeer[](0));
    }

    function _preCrime(InboundPacket[] memory, uint32[] memory _eids, bytes[] memory _results) internal override {
        eids = _eids;
        results = _results;
    }
}
