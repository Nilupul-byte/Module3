import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { Contract } from "ethers";

const deployForgingLogic: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  const basicContractAddress = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512";

  console.log("🚀 Deploying ForgingLogic contract...");

  const deployment = await deploy("ForgingLogic", {
    from: deployer,
    args: [basicContractAddress],
    log: true,
    autoMine: true,
  });

  console.log("✅ ForgingLogic deployed at:", deployment.address);

  // Get the deployed contract to interact with it
  const forgingLogic = await hre.ethers.getContract<Contract>("ForgingLogic", deployer);
  console.log("🔗 Contract initialized with Basic contract at:", basicContractAddress);
};

deployForgingLogic.tags = ["ForgingLogic"];
export default deployForgingLogic;
