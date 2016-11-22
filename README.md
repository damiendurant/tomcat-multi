# tomcat-multi

This recipe provide a LWRP to deploy tomcat instance on a server. 
As a lot a parameters are manageable throught this LWRP, multiple instance of tomcat could be deployed on the same server.


# Usage 

Here is the minimal information that need to be provided to the provider : 
```ruby
tomcat_multi "instanceName" do
	tomcat_version "7.0.62"
	tomcat_url "http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz"
	jdk_version "7u79"
	jdk_url "https://operations.ebusiness.schneider-electric.com/binaryrepo/jdks/jdk-7u79-linux-x64.tar.gz"
	port 9090
	shutdown_port 9006
	ajp_port 9009
    ajpredir_port 9443
end
```


## List of Parameters available : 

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Mandatory/Fac.</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>tomcat_version</tt></td>
    <td>String</td>
    <td>version of tomcat to be installed</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>tomcat_url</tt></td>
    <td>String</td>
    <td>URL for download the tomcat package</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>jdk_version</tt></td>
    <td>String</td>
    <td>version of JDK to be installed</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>jdk_url</tt></td>
    <td>String</td>
    <td>URL for download the JDK package</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>port</tt></td>
    <td>Integer</td>
    <td>port on which tomcat instance will listen</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>shutdown_port</tt></td>
    <td>Integer</td>
    <td>shutdow port for the tomcat instance</td>
    <td><b>Mandatory</b></td>
    <td><tt>true</tt></td>
  </tr>
    <tr>
    <td><tt>ajp_port</tt></td>
    <td>Integer</td>
    <td>AJP port for the tomcat instance</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>ajpredir_port</tt></td>
    <td>Integer</td>
    <td>AJP redirection port for the tomcat instance</td>
    <td><b>Mandatory</b></td>
    <td><tt>N/A</tt></td>
  </tr>
    <tr>
    <td><tt>tomcat_installpath</tt></td>
    <td>String</td>
    <td>path for tomcat installation. A link tomcat_<ressourcename> will be created under this path</td>
    <td>Fac</td>
    <td><tt>/opt/tomcat</tt></td>
  </tr>
    <tr>
    <td><tt>jdk_installpath</tt></td>
    <td>String</td>
    <td>path for jdk installation.</td>
    <td>Fac</td>
    <td><tt>/opt/jdk</tt></td>
  </tr>
    <tr>
    <td><tt>ldap_users</tt></td>
    <td>Boolean</td>
    <td>define is users should be created or fetch from ldap.</td>
    <td>Fac</td>
    <td><tt>false</tt>(user are created)</td>
  </tr>
    <tr>
    <td><tt>tomcat_user</tt></td>
    <td>String</td>
    <td>user for the tomcat instance</td>
    <td>Fac</td>
    <td><tt>same as the instance name</tt></td>
  </tr>
    <tr>
    <td><tt>tomcat_group</tt></td>
    <td>String</td>
    <td>group for the tomcat instance</td>
    <td>Fac</td>
    <td><tt>same as the instance name</tt></td>
  </tr>
    <tr>
    <td><tt>cookbook_serverxml</tt></td>
    <td>String</td>
    <td>cookbook where to find the serverxml template</td>
    <td>Facn</td>
    <td><tt>tomcat-multi</tt></td>
  </tr>
    <tr>
    <td><tt>source_serverxml</tt></td>
    <td>String</td>
    <td>filename to use as server.conf template</td>
    <td>Fac</td>
    <td><tt>server.conf.erb</tt></td>
  </tr>
    <tr>
    <td><tt>max_threads</tt></td>
    <td>Integer</td>
    <td>max threads on tomcat threadpool</td>
    <td>Fac</td>
    <td><tt>100</tt></td>
  </tr>
    <tr>
    <td><tt>min_spare_threads</tt></td>
    <td>Integer</td>
    <td>min spare threads on tomcat threadpool</td>
    <td>Fac</td>
    <td><tt>10</tt></td>
  </tr>
    <tr>
    <td><tt>ssl_enabled</tt></td>
    <td>Boolean</td>
    <td>enable SSL connector. must also set ssl_port</td>
    <td>Fac</td>
    <td><tt>false</tt></td>
  </tr>
    <tr>
    <td><tt>ssl_port</tt></td>
    <td>Integer</td>
    <td>the port to listen on for SSL connections</td>
    <td>Fac</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>keystore_file</tt></td>
    <td>String</td>
    <td>absolute path to the SSL Keystore file</td>
    <td>Fac</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>keystore_pass</tt></td>
    <td>String</td>
    <td>SSL Keystore file password</td>
    <td>Fac</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>keystore_type</tt></td>
    <td>String</td>
    <td>SSL Keystore file type (e.g. 'JKS')</td>
    <td>Fac</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_enabled</tt></td>
    <td>Boolean</td>
    <td>Enable default LockoutRealm and configures a realm inside it (see below).</td>
    <td>Fac</td>
    <td><tt>true</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_classname</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm className</td>
    <td>Fac</td>
    <td><tt>org.apache.catalina.realm.UserDatabaseRealm</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_resourcename</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm resourceName (if it has one)</td>
    <td>Fac</td>
    <td><tt>UserDatabase</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_datasourcename</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm datasourceName (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_usertable</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm userTable (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_usernamecol</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm userNameCol (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_usercredcol</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm userCredCol (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_userroletable</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm userRoleTable (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_roleNameCol</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm roleNameCol (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_localdatasource</tt></td>
    <td>String</td>
    <td> Realm inside of LockoutRealm localDatasource (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>lockout_realm_digest</tt></td>
    <td>String</td>
    <td>Realm inside of LockoutRealm digest (if it has one)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>cluster_class</tt></td>
    <td>String</td>
    <td>Cluster class (must be set for Farm Deployment to work. See below)</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_enabled</tt></td>
    <td>Boolean</td>
    <td>Enables Farm Deployment (must set properties below as well)</td>
    <td>whether to include bacon</td>
    <td><tt>false</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_classname</tt></td>
    <td>String</td>
    <td>Deployer className</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_tempdir</tt></td>
    <td>String</td>
    <td>Deployer tempDir</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_deploydir</tt></td>
    <td>String</td>
    <td>Deployer deployDir</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_watchdir</tt></td>
    <td>String</td>
    <td>Deployer watchDir</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>farm_deploy_watchenabled</tt></td>
    <td>String</td>
    <td>Deployer watchEnabled</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
    <tr>
    <td><tt>SSO_enabled</tt></td>
    <td>Boolean</td>
    <td>Enable default SingleSignOn Valve</td>
    <td>whether to include bacon</td>
    <td><tt>false</tt></td>
  </tr>
    <tr>
    <td><tt>cookbook_init</tt></td>
    <td>String</td>
    <td>cookbook to fetch tomcat init template</td>
    <td>whether to include bacon</td>
    <td><tt>tomcat-multi</tt></td>
  </tr>
    <tr>
    <td><tt>source_init</tt></td>
    <td>String</td>
    <td>filename to use as init script template</td>
    <td>whether to include bacon</td>
    <td><tt>tomcat.init.erb</tt></td>
  </tr>
    <tr>
    <td><tt>cookbook_env</tt></td>
    <td>String</td>
    <td>cookbook to fetch tomcat setenv template</td>
    <td>whether to include bacon</td>
    <td><tt>tomcat-multi</tt></td>
  </tr>
    <tr>
    <td><tt>source_env</tt></td>
    <td>String</td>
    <td>filename to use as setenv.sh template</td>
    <td>whether to include bacon</td>
    <td><tt>setenv.sh.erb</tt></td>
  </tr>
    <tr>
    <td><tt>java_opts</tt></td>
    <td>String</td>
    <td>options to java startup.</td>
    <td>whether to include bacon</td>
    <td><tt>-d64 -server -Djava.awt.headless=true</tt></td>
  </tr>
    <tr>
    <td><tt>catalina_opts</tt></td>
    <td>String</td>
    <td>CATALINA_OPTS configuration</td>
    <td>whether to include bacon</td>
    <td><tt>''</tt></td>
  </tr>
</table>

# Todo : 
Add Logrotate on logs files ?