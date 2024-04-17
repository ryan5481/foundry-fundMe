
// SPDX-License-Identifier

pragma solidity ^0.8.16;

import { Script } from "forge-std/Script.sol";
import { FundMe } from "../src/FundMe.sol";

import { HelperConfig } from "../test/HelperConfig.s.sol";


contract DeployFundMe is Script {
     
    function run() external returns (FundMe) {
        //Anything before startBroadcast is not real tx
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();

        FundMe fundMe = new FundMe(ethUsdPriceFeed);

        vm.stopBroadcast();

        return fundMe;
    }

}