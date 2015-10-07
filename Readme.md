# Devops exersize

### Implementation details

This vagrant setup should be run on vagrant 1.7.4, there is an issue with earlier versions using the chef provisioner where after any reboot the vm will fail to provision with an error about missing chef files. (https://github.com/mitchellh/vagrant/commit/300b9c910954bf0e6beed0888e121473639ef2c8)

This implementation is running on openjdk, if you need features specific to either the oracle/ibm implementations modify the `override[:java][:openjdk_packages]` property in `scripts/cookbooks/chef_scala_ephox/attributes/default.rb`
The 3 supplied routes all respond as expected.

There are also a number of other properties relating to the setup of this VM in that same file (`scripts/cookbooks/chef_scala_ephox/attributes/default.rb`) that can be modified to suit.

Setup time will be ~5 minutes provided you already have the Ubuntu 14.04 x64 image locally, however the majority of this time is downloading (mainly aptitude updating and chef and java downloading) so YMMV.

## Instructions

This repository contains a binary for a simple web app written using scala.

You need to do the following:

1. Fork this repository.

2. Install vagrant if you do not already have it available: https://www.vagrantup.com/

3. Using a provisioning system of your choice do the following: This
is where you show us what you can do: Please note to use the provided
Vagrantfile as the base file, and dont create a new one

    1. Secure the machine using industry best practice security. Port 8009
    is required for the application server to be accessible. Assume
    that this server will be a publically accessible server that runs
    inside a cloud provider. SSH should be properly secured.
    2. Set the hostname of the machine to something creative.
    3. Run the application in the application directory automatically
       on machine boot.

4. Requests to the following apis will give results when run on the
local network.
    1. http://hostname:8009/ => Working!
    2. http://hostname:8009/latest/meta-data/public-ipv4 => IP address of
    the machine
    3. http://hostname:8009/latest/meta-data/public-hostname => hostname of
    the machine


5. All provisioning scripts should be placed into the scripts
   directory

6. Issue a pull request when you are done, so we can look at the solution.
