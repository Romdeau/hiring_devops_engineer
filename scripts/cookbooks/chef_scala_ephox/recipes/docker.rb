#
# Cookbook Name:: chef_scala_ephox
# Recipe:: docker
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#copy the java application to local storage - if vagrants linked storage is missing the vm will still operate
execute "copy java application" do
 command "mkdir -p /opt/application /opt/docker && cp /vagrant/application/#{node['chef_scala_ephox']['app_name']} /opt/application/#{node['chef_scala_ephox']['app_name']}"
 action :run
end

#install docker
execute "install docker" do
  command "wget -qO- https://get.docker.com/ | sh"
  action :run
end

# copy the Dockerfile
template "Dockerfile" do
  path "/opt/docker/Dockerfile"
  source "Dockerfile.erb"
end

#build the image from the dockerfile
docker_image 'docker-java-jar' do
  tag 'latest'
  source '/opt/docker'
  action :build_if_missing
end

# attempt to recreate the container as per the below command
# docker run --name ephox -v /opt/application/:/application -p 8009:8009 -d -h docker-java-jar docker-java-jar
docker_container 'docker-java-jar' do
  image 'docker-java-jar:latest'
  container_name 'ephox'
  detach true
  volumes '/opt/application/:/application'
  port '8009:8009'
  hostname 'docker-java-jar'
  action :run
end
