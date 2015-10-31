<#if (remoteClass.extends??) && (remoteClass.extends.type.name?ends_with("OpenCVFilter"))>
${remoteClass.name}OpenCVImpl.hpp
/* Autogenerated with kurento-module-creator */

#ifndef __${camelToUnderscore(remoteClass.name)}_OPENCV_IMPL_HPP__
#define __${camelToUnderscore(remoteClass.name)}_OPENCV_IMPL_HPP__

#include <OpenCVProcess.hpp>
#include "${remoteClass.name}.hpp"
#include <EventHandler.hpp>

<#list module.code.implementation["cppNamespace"]?split("::") as namespace>
namespace ${namespace}
{
</#list>

class ${remoteClass.name}OpenCVImpl : public virtual OpenCVProcess
{

public:

  ${remoteClass.name}OpenCVImpl ();

  virtual ~${remoteClass.name}OpenCVImpl () {};

  virtual void process (cv::Mat &mat);
  <#macro methodHeader method>
  ${getCppObjectType(method.return,false)} ${method.name} (<#rt>
      <#lt><#list method.params as param>${getCppObjectType(param.type)}${param.name}<#if param_has_next>, </#if></#list>);
  </#macro>
  <#list remoteClass.methods as method><#rt>
    <#if method_index = 0 >

    </#if>
    <#list method.expandIfOpsParams() as expandedMethod ><#rt>
      <#lt><@methodHeader expandedMethod />
    </#list>
    <#lt><@methodHeader method />
  </#list>
  <#list remoteClass.properties as property>

  virtual ${getCppObjectType (property.type, false)} get${property.name?cap_first} ();
  <#if !property.final && !property.readOnly>
  virtual void set${property.name?cap_first} (${getCppObjectType (property.type, true)}${property.name});
  </#if>
</#list>
 <#list remoteClass.events as event>
  <#if event_index = 0 >
  </#if>
  sigc::signal<void, ${event.name}> signal${event.name};
 </#list>

};

<#list module.code.implementation["cppNamespace"]?split("::")?reverse as namespace>
} /* ${namespace} */
</#list>

#endif /*  __${camelToUnderscore(remoteClass.name)}_OPENCV_IMPL_HPP__ */
</#if>