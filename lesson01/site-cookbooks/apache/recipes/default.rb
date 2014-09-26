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

# httpdサービスの起動設定
service 'httpd' do
  action [ :start,  :enable ]
end

