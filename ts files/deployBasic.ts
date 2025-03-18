import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { Contract } from "ethers";

/**
 * Deploys the "Basic" contract using the deployer account
 * with a predefined URI for metadata.
 *
 * @param hre HardhatRuntimeEnvironment object.
 */
const deployBasic: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  const metadataURI = "https://example.com/metadata.json"; // Replace with your actual metadata URI

  const deployment = await deploy("Basic", {
    from: deployer,
    args: [metadataURI], // Constructor argument for ERC1155 base URI
    log: true,
    autoMine: true,
  });

  // Get the deployed contract
  const basicContract: Contract = await hre.ethers.getContractAt("Basic", deployment.address);
  console.log("✅ Basic contract deployed at:", basicContract.address);
};

export default deployBasic;

deployBasic.tags = ["Basic"];
