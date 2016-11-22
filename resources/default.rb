actions :install
default_action :install
attribute :tomcat_user, :kind_of => String, :required => false
attribute :tomcat_group, :kind_of => String, :required => false
attribute :tomcat_installpath, :kind_of => String, :required => false
attribute :tomcat_version, :kind_of => String, :required => true
attribute :tomcat_url, :kind_of => String, :required => true

attribute :jdk_installpath, :kind_of => String, :required => false
attribute :jdk_version, :kind_of => String, :required => true
attribute :jdk_url, :kind_of => String, :required => true
attribute :ldap_users, :kind_of => [TrueClass, FalseClass], :required => false


attribute :port, :kind_of => Integer , :required => true
attribute :shutdown_port, :kind_of => Integer , :required => true
attribute :ajp_port, :kind_of => Integer, :required => true
attribute :ajpredir_port, :kind_of => Integer , :required => true

attribute :max_threads, :kind_of => Integer, :required => false 
attribute :min_spare_threads, :kind_of => Integer, :required => false 
attribute :ssl_enabled, :kind_of => [TrueClass, FalseClass], :required => false 
attribute :ssl_port, :kind_of => Integer, :required => false 
attribute :keystore_file, :kind_of => String, :required => false
attribute :keystore_pass, :kind_of => String, :required => false
attribute :keystore_type, :kind_of => String, :required => false
attribute :lockout_realm_enabled, :kind_of => [TrueClass, FalseClass], :required => false 
attribute :lockout_realm_classname, :kind_of => String, :required => false 
attribute :lockout_realm_resourcename, :kind_of => String, :required => false 
attribute :lockout_realm_datasourcename, :kind_of => String, :required => false
attribute :lockout_realm_usertable, :kind_of => String, :required => false
attribute :lockout_realm_usernamecol, :kind_of => String, :required => false
attribute :lockout_realm_usercredcol, :kind_of => String, :required => false
attribute :lockout_realm_userroletable, :kind_of => String, :required => false
attribute :lockout_realm_roleNameCol, :kind_of => String, :required => false
attribute :lockout_realm_localdatasource, :kind_of => String, :required => false
attribute :lockout_realm_digest, :kind_of => String, :required => false
attribute :cluster_class, :kind_of => String, :required => false
attribute :farm_deploy_enabled, :kind_of => [TrueClass, FalseClass], :required => false
attribute :farm_deploy_classname, :kind_of => String, :required => false
attribute :farm_deploy_tempdir, :kind_of => String, :required => false
attribute :farm_deploy_deploydir, :kind_of => String, :required => false
attribute :farm_deploy_watchdir, :kind_of => String, :required => false
attribute :farm_deploy_watchenabled, :kind_of => String, :required => false
attribute :SSO_enabled, :kind_of => [TrueClass, FalseClass], :required => false



attribute :cookbook_serverxml, :kind_of => String, :required => false
attribute :source_serverxml, :kind_of => String, :required => false


attribute :cookbook_init, :kind_of => String, :required => false
attribute :source_init, :kind_of => String, :required => false


attribute :cookbook_env, :kind_of => String, :required => false
attribute :source_env, :kind_of => String, :required => false
attribute :java_opts, :kind_of => String, :required => false
attribute :catalina_opts, :kind_of => String, :required => false