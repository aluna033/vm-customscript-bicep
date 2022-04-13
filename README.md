# Sample Bicep File for Windows VM Creation with Utilities Installed

## Overview

The following sample creates a Windows Server 2019 virtual machine with the following tools and roles installed:

* Roles:
  * Micrsoft IIS Web Server
* Software and Tools:
  * Microsoft Edge
  * AzCopy v10
  * Microsoft Visual Studio Code
  * Java Language Support VSCode Extension
  * Visual Studio Code PowerShell Extension
  * SQL Server Management Studio

1. Login to Azure and select the target subscription.
&nbsp;

    ```bash
    az login

    az account set --subscription "Your Subscription Name"
    ```

2. To deploy the bicep file run the following  command:
&nbsp;

    ```bash
     az deployment group create --resource-group exampleRG --template-file main.bicep
    ```

    **Note:** Change exampleRG to the resource group that you would like to deploy the virtual machines to.

    Upon running the bicep file you will be prompted you for the following variables (a parameter file can be leveraged instead):
&nbsp;
    * VM Name
    * VM administrator username
    * VM administrator password
    * Virtual Network Name (vNetName)
    * Virtual Network Subnet (SubnetName)
    * Virtuan Network Resource Group (vNet Resource Group Name)
