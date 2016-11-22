action :install do
	tomcat_user = new_resource.tomcat_user || new_resource.name 
    tomcat_group = new_resource.tomcat_group || new_resource.name
    tomcat_installpath = new_resource.tomcat_installpath || "/opt/tomcat"
	tomcat_linkpath = ::File.join(tomcat_installpath, "tomcat_#{new_resource.name}")
	tomcat_version = new_resource.tomcat_version
	tomcat_url = new_resource.tomcat_url
	#tomcat_checksum = new_resource.tomcat_checksum
	
	jdk_installpath = new_resource.jdk_installpath || "/opt/jdk"
	#jdk_linkpath = new_resource.jdk_linkpath
	jdk_linkpath =  ::File.join(tomcat_linkpath,"jdk")
	jdk_version = new_resource.jdk_version
	jdk_url = new_resource.jdk_url

	ldap_users = new_resource.ldap_users || false



	### server.conf template
	# - mandatory
    port =  new_resource.port
	shutdown_port = new_resource.shutdown_port
	ajp_port = new_resource.ajp_port
	ajpredir_port = new_resource.ajpredir_port

	# - optional
	max_threads = new_resource.max_threads || 100
	min_spare_threads = new_resource.min_spare_threads || 10
	ssl_enabled = new_resource.ssl_enabled || false 
	ssl_port = new_resource.ssl_port || ''
	keystore_file = new_resource.keystore_file || ''
	keystore_pass = new_resource.keystore_pass || ''
	keystore_type = new_resource.keystore_type || ''
	lockout_realm_enabled = new_resource.lockout_realm_enabled || true
	lockout_realm_classname, = new_resource.lockout_realm_classname || "org.apache.catalina.realm.UserDatabaseRealm"
	lockout_realm_resourcename = new_resource.lockout_realm_resourcename || "UserDatabase"
	lockout_realm_datasourcename = new_resource.lockout_realm_datasourcename || ""
	lockout_realm_usertable = new_resource.lockout_realm_usertable || ""
	lockout_realm_usernamecol = new_resource.lockout_realm_usernamecol || ""
	lockout_realm_usercredcol = new_resource.lockout_realm_usercredcol || ""
	lockout_realm_userroletable = new_resource.lockout_realm_userroletable || ""
	lockout_realm_roleNameCol = new_resource.lockout_realm_roleNameCol || ""
	lockout_realm_localdatasource = new_resource.lockout_realm_localdatasource || ""
	lockout_realm_digest = new_resource.lockout_realm_digest || ""
	cluster_class = new_resource.cluster_class || ""
	farm_deploy_enabled = new_resource.farm_deploy_enabled || false
	farm_deploy_classname = new_resource.farm_deploy_classname || ""
	farm_deploy_tempdir = new_resource.farm_deploy_tempdir || ""
	farm_deploy_deploydir = new_resource.farm_deploy_deploydir || ""
	farm_deploy_watchdir = new_resource.farm_deploy_watchdir || ""
	farm_deploy_watchenabled = new_resource.farm_deploy_watchenabled || ""
	SSO_enabled = new_resource.SSO_enabled || false
	cookbook_serverxml = new_resource.cookbook_serverxml || "tomcat-multi"
	source_serverxml = new_resource.source_serverxml || "server.conf.erb"
	cookbook_init = new_resource.cookbook_init || "tomcat-multi"
    source_init = new_resource.source_init || "tomcat.init.erb"

    cookbook_env = new_resource.cookbook_env || "tomcat-multi"
    source_env = new_resource.source_env || "setenv.sh.erb"
	java_opts = new_resource.java_opts || "-d64 -server -Djava.awt.headless=true"
	catalina_opts = new_resource.catalina_opts || ""

	 
	# TODO don't create if LDAP
	if ! ldap_users
	then
		group tomcat_group
		 user tomcat_user do
	         gid tomcat_group
		end
	end


	ark new_resource.name do
		url tomcat_url
	#	checksum tomcat_checksum
		version tomcat_version
		prefix_root tomcat_installpath 
		home_dir tomcat_linkpath
		owner tomcat_user
		group tomcat_group
	end

 	ark "#{new_resource.name}_jdk" do
 	  url jdk_url
 	 # checksum jdk_checksum 
 	  version jdk_version
	  prefix_root jdk_installpath
 	  home_dir jdk_linkpath
 	  owner tomcat_user
	  group tomcat_group
 	end

	template new_resource.name do
	 path "/etc/init.d/#{new_resource.name}"
	 cookbook cookbook_init
	 source source_init
	 owner "root"
	 group "root"
	 mode "0774"
	 variables( 
		 :tomcat_linkpath => tomcat_linkpath, 
		 :tomcat_user => tomcat_user
	 )
	end
	service new_resource.name do
		supports :restart => true, :reload => true, :status => true
	end

	template "#{new_resource.name}_conf" do
	 path "#{tomcat_linkpath}/conf/server.xml"
	 cookbook cookbook_serverxml
	 source source_serverxml
	 owner new_resource.tomcat_user
	 group new_resource.tomcat_group
	 variables( 
		:tomcat_linkpath => tomcat_linkpath, 
		:tomcat_user => tomcat_user,
		:port  => port,
		:shutdown_port => shutdown_port,
		:ajp_port => ajp_port,
		:ajpredir_port => ajpredir_port,
		:max_threads => max_threads,
		:min_spare_threads => min_spare_threads ,
		:ssl_enabled => ssl_enabled,
		:ssl_port => ssl_port,
		:keystore_file => keystore_file ,
		:keystore_pass => keystore_pass ,
		:keystore_type => keystore_type ,
		:lockout_realm_enabled => lockout_realm_enabled,
		:lockout_realm_classname => lockout_realm_classname ,
		:lockout_realm_resourcename => lockout_realm_resourcename ,
		:lockout_realm_datasourcename => lockout_realm_datasourcename ,
		:lockout_realm_usertable => lockout_realm_usertable ,
		:lockout_realm_usernamecol => lockout_realm_usernamecol,
		:lockout_realm_usercredcol => lockout_realm_usercredcol ,
		:lockout_realm_userroletable => lockout_realm_userroletable,
		:lockout_realm_roleNameCol => lockout_realm_roleNameCol ,
		:lockout_realm_localdatasource => lockout_realm_localdatasource ,
		:lockout_realm_digest => lockout_realm_digest ,
		:cluster_class => cluster_class ,
		:farm_deploy_enabled => farm_deploy_enabled ,
		:farm_deploy_classname => farm_deploy_classname ,
		:farm_deploy_tempdir => farm_deploy_tempdir,
		:farm_deploy_deploydir => farm_deploy_deploydir ,
		:farm_deploy_watchdir => farm_deploy_watchdir ,
		:farm_deploy_watchenabled => farm_deploy_watchenabled ,
		:SSO_enabled => SSO_enabled 
	 )
	end


	template "#{new_resource.name}_env" do
		path "#{tomcat_linkpath}//bin/setenv.sh"
		cookbook cookbook_env
	 	source source_env
	 	owner new_resource.tomcat_user
	    group new_resource.tomcat_group
	    variables( 
	    	:java_home => jdk_linkpath ,
	    	:tomcat_home => tomcat_linkpath,
	    	:java_opts => java_opts,
	    	:catalina_opts => catalina_opts
	    )
	end 



	new_resource.updated_by_last_action(true)
end