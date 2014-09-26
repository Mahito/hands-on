#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# httpdパッケージのインストール
package 'httpd' do
  action :install
end

# /var/www/htmlディレクトリの作成
directory '/var/www/html' do
  action    :create
  owner     'root'
  group     'root'
  mode      '0755'
  recursive true
end

# /var/www/html/index.htmlの配置
cookbook_file '/var/www/html/index.html' do
  action :create
  source 'index.html'
  owner  'root'
  group  'root'
  mode   '0755'
end

# /etc/httpd/conf/httpd.confの配置
cookbook_file '/etc/httpd/conf/httpd.conf' do
  action :create
  source 'httpd.conf'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :restart, "service[httpd]"
end


# httpdサービスの起動設定
service 'httpd' do
  action [ :start,  :enable ]
  supports [ restart: true ]
end

