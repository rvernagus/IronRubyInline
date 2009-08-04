require "../lib/iron_ruby_inline"
require "System.ServiceModel, Version=3.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
require "System.ServiceModel.Web, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"

%Q{
using System;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.ServiceModel.Web;
 
[ServiceContract]
public interface IService
{
    [OperationContract]
    [WebGet]
    string EchoWithGet(string s);
  
    [OperationContract]
    [WebInvoke]
    string EchoWithPost(string s);
}
 
[ServiceBehavior(InstanceContextMode = InstanceContextMode.Single)]
public class SingletonService { }
}.compile(:references => [
  "#{ENV['ProgramFiles']}\\Reference Assemblies\\Microsoft\\Framework\\v3.0\\System.ServiceModel.dll",
  "#{ENV['ProgramFiles']}\\Reference Assemblies\\Microsoft\\Framework\\v3.5\\System.ServiceModel.Web.dll"
])
 
class RService < SingletonService
  include IService
  include System
  include System::ServiceModel
  include System::ServiceModel::Description
  include System::ServiceModel::Web
  
  def echo_with_get(s)
    "GET you said #{s}"
  end
  
  def echo_with_post(s)
    "POST you said #{s}"
  end
  
  def open(uri)
    uri = Uri.new(uri)
    host = WebServiceHost.new(RService.new, uri)
    m = host.description.behaviors.method(:find).of(ServiceDebugBehavior)
    debug_behavior = m.call
    debug_behavior.http_help_page_enabled = false
    host.add_service_endpoint(IService.to_clr_type, WebHttpBinding.new, "")
    host.open
    puts "Service is running"
  end
  
  def self.open(uri)
    host = new
    host.open(uri)
    host
  end
end
 
RService.open("http://localhost:8000")
puts "Press enter to exit..."
gets