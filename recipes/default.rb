#
# Cookbook Name:: tomcat-multi
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe "ark"



# tomcat_multi "exemple1" do
# 	tomcat_user "tomcat1"
# 	tomcat_group "tomcats"
# 	tomcat_installpath "/myprojects/"
# 	tomcat_version "7.0.61"
# 	tomcat_url "http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz"
# 	jdk_installpath "/myprojects/"
# 	jdk_version "7u79"
# 	#jdk_url "https://operations.ebusiness.schneider-electric.com/binaryrepo/jdks/jdk-7u79-linux-x64.tar.gz"
# 	jdk_url "https://www.reucon.com/cdn/java/jdk-7u79-linux-x64.tar.gz"
# 	ldap_users false
# 	port 8080
# 	shutdown_port 8005
# 	ajp_port 8009
#     ajpredir_port 8443
# end


# tomcat_multi "min" do
# 	tomcat_version "7.0.62"
# 	tomcat_url "http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz"
# 	jdk_version "7u79"
# 	#jdk_url "https://operations.ebusiness.schneider-electric.com/binaryrepo/jdks/jdk-7u79-linux-x64.tar.gz"
# 	jdk_url "https://www.reucon.com/cdn/java/jdk-7u79-linux-x64.tar.gz"
# 	port 9090
# 	shutdown_port 9006
# 	ajp_port 9009
#     ajpredir_port 9443
# end


