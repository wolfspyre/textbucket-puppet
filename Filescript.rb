#File script
#!/usr/bin/ruby
def wrapquotes(inputstring)
  if inputstring =~ /\$/
    if inputstring =~ /^\$([A-Za-z0-9_:]*|\{[A-Za-z0-9_:]*\})$/
      inputstring
    else
      "\"#{inputstring}\""
    end
  else
    "\'#{inputstring}\'"
  end
end
def maskfix(inputstring)
  if inputstring =~/^\d?\d\d\d$/
    if inputstring.length == 3
      newstring = "0#{inputstring}"
      newstring
    else
      inputstring
    end
  else
    inputstring = "invalidmaskprovided"
    inputstring
  end
end
namevar       = wrapquotes "M#Namevar=[optional] Pretty name#"
path          = wrapquotes "M#Path=Required: Location of file#" 
datasource    = wrapquotes "M#Datasource=[optional] content, source, or target#"
data          = wrapquotes "M#Data=Required: value for Datasource attribute#"
sourceselect  = wrapquotes "M#Sourceselect=[optional] [source only] all,first#"
fileensure    = wrapquotes  "M#Ensure=[optional] absent,directory,file,link, or present#"
backup        = wrapquotes "M#Backup=[optional]#"
checksum      = wrapquotes "M#Checksum=[optional] md5,md5lite,mtime,ctime,none#"
mask          = wrapquotes maskfix "M#Mode=[optional] mode numerical value#"
group         = wrapquotes "M#Group=[optional] Group name or gid#"
owner         = wrapquotes "M#Owner=[optional] User name or uid#"
ignore        = wrapquotes "M#Ignore=[optional]#"
links         = wrapquotes "M#Links=[optional] Follow or manage#"
purge         = wrapquotes "M#Purge=[optional] True or False#"
recurse       = wrapquotes "M#Recurse=[optional] True, false, inf, or remote#"
recurselimit  = wrapquotes "M#Recurse Limit=[optional]  /^[0-9]+$/#"
replace       = wrapquotes "M#Replace=[optional]  true, yes, false, or no#"
selinuxignoredefaults = wrapquotes "M#SELinux Ignore Defaults=[optional] True, False#"
selrange      = wrapquotes "M#SELinux Range=[optional]#"
selrole       = wrapquotes "M#SELinux Role=[optional]#"
seltype       = wrapquotes "M#SELinux Type=[optional]#"
seluser       = wrapquotes "M#SELinux User=[optional]#"
metaalias     = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit     = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore    = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck     = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel  = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop      = wrapquotes "M#Meta-noop=[optional metaparameter]#"
metanotify    = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metarequire   = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule  = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage     = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metasubscribe = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metatag       = wrapquotes "M#Meta-tag=[optional metaparameter]#"


if "M#Namevar#" == "[optional] Pretty name" then
   puts "file { "+path+":"
else
  puts "file { "+namevar+":"
  puts "  path           => "+path+","
end

case "M#Ensure#"
  when /^absent$/i
    puts "  ensure         => 'absent',"
  when /^directory$/i
    puts "  ensure         => 'directory',"
  when /^file$/i
    puts "  ensure         => 'file',"
  when /^link$/i
    puts "  ensure         => 'link',"
  when /^present$/i
    puts "  ensure         => 'present',"
end

case "M#Datasource#"
  when /^content$/i
    puts "  content        => "+data+","
  when /^source$/i
    puts "  source         => "+data+","
    case "M#Sourceselect#"
      when /^all$/i
        puts "  sourceselect   => 'all',"
      when /^first$/i
        puts "  sourceselect   => 'first',"
    end
  when /^target$/i
    puts "  target          => "+data+","
end

if "M#Checksum#" =~ /\A(?:md5|md5lite|mtime|ctime|none)\z/
    puts "  checksum       => "+checksum+","
end

unless "M#Backup#" == "[optional]" then
  puts "  backup         => "+backup+","
end

unless "M#Mode#" == "[optional] mode numerical value"
  puts "  mode           => "+mask+","
end

unless "M#Group#" =="[optional] Group name or gid"
  puts "  group          => "+group+","
end

unless "M#Owner#" =="[optional] User name or uid"
  puts "  owner          => "+owner+","
end

unless "M#Ignore#" =="[optional]"
  puts "  ignore         => "+ignore+","
end

case "M#Links#"
  when /^follow$/i
    puts "  links          => 'follow',"
  when /^ignore$/i
    puts "  links          => 'ignore',"
end

case "M#Purge#"
  when /^true$/i
    puts "  purge          => 'true',"
  when /^false$/i
    puts "  purge          => 'false',"
end

case "M#Recurse#"
  when /^true$/i
    puts "  recurse        => 'true',"
  when /^false$/i
    puts "  recurse        => 'false',"
  when /^inf$/i
    puts "  recurse        => 'inf',"
  when /^remote$/i
    puts "  recurse        => 'remote',"
end

unless "M#Recurse Limit#" =~ /\[optional\]/
  puts "  recurselimit   => "+recurselimit+","
end

case "M#Replace#"
  when /^true$/i
    puts "  replace        => 'true',"
  when /^false$/i
    puts "  replace        => 'false',"
  when /^yes$/i
    puts "  replace        => 'yes',"
  when /^no$/i
    puts "  replace        => 'no',"
end

case "M#SELinux Ignore Defaults#"
  when /^true$/i
   puts "  selinux_ignore_defaults  => 'true',"
  when /^false$/i
    puts "  selinux_ignore_defaults  => 'false',"
end

unless "M#SELinux Range#"  =~ /\[optional\]/
  puts "  selrange       => "+ selrange+","
end

unless "M#SELinux Role#"  =~ /\[optional\]/
  puts "  selrole        => "+ selrole+","
end

unless "M#SELinux Type#"  =~ /\[optional\]/
  puts "  seltype        => "+ seltype+","
end

unless "M#SELinux User#"  =~ /\[optional\]/
  puts "  seluser        => "+ seluser+","
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias          =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit          =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before         =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check          =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel       =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop           =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify         =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require        =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule       =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage          =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe      =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag            =>  "+metatag+","
end


puts "}"