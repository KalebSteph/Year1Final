// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

contract AdminManager is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    struct AdminInfo {
        string name;
        string email;
    }

    mapping(address => AdminInfo) public adminDetails;

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender); // deployer has full control
        _grantRole(ADMIN_ROLE, msg.sender);         // deployer is also an admin
    }

    // Only an ADMIN can add new admins
    function addAdmin(address newAdmin, string memory name, string memory email) external onlyRole(ADMIN_ROLE) {
        _grantRole(ADMIN_ROLE, newAdmin);
        adminDetails[newAdmin] = AdminInfo(name, email);
    }

    // Optional: get all info about an admin
    function getAdminInfo(address admin) external view returns (string memory name, string memory email) {
        AdminInfo memory info = adminDetails[admin];
        return (info.name, info.email);
    }

    // Optional: remove admin
    function removeAdmin(address admin) external onlyRole(ADMIN_ROLE) {
        _revokeRole(ADMIN_ROLE, admin);
        delete adminDetails[admin];
    }
}
