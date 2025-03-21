import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  // Replace this with the address of your deployed Basic ERC1155 contract
  const basicTokenContractAddress = "0x057ef64E23666F000b34aE31332854aCBd1c8544";

  // Deploy the ForgingLogic contract
  await deploy("ForgingLogic", {
    from: deployer,
    args: [basicTokenContractAddress], // Pass the Basic ERC1155 contract address to the constructor
    log: true,
  });
};

export default func;
