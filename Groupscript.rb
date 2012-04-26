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

groupname                = wrapquotes "M#Namevar=[Required] Name of group#"
groupensure              = wrapquotes "M#Ensure=[optional] Absent or Present#"
groupgid                 = wrapquotes "M#GID=[Optional] Specified numerically#"
groupallowdupe           = wrapquotes "M#AllowDupe=[Optional] True or False#" 
groupattributemembership = wrapquotes "M#Attr Membership=[optional] Inclusive or Minimum#"
groupattrbutes           = wrapquotes "M#Attributes=[optional] Array of key\=value pairs#"
groupauthmembership      = wrapquotes "M#Auth Membership=[optional]#"
groupialoadmodule        = wrapquotes "M#IA Load Module=[optional]#"
groupmembers             = wrapquotes "M#Members=[optional]#"
groupsystem              = wrapquotes "M#System=[optional]#"
metaalias                = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit                = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore               = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck                = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel             = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop                 = wrapquotes "M#Meta-noop=[optional metaparameter]#"
grouprefreshonly         = wrapquotes "M#refreshonly=[optional] True or False. Only relevant if using subscribe or notify#"
metanotify               = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metasubscribe            = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metarequire              = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule             = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage                = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metatag                  = wrapquotes "M#Meta-tag=[optional metaparameter]#"

unless "M#Name#" == "[Required] Name of group"
   puts "group { "+groupname+":"
end

case "M#Ensure#"
  when /^absent$/i
    puts "  ensure           =>  'absent',"
  when /^present$/i
    puts "  ensure           =>  'present',"
 end

 unless "M#GID#" =="[optional] Specified numerically"
  puts "  gid              =>  "+groupgid+","
end

case "M#Allow Dupe#"
  when /^true$/i
    puts "  allowdupe    =>  'true',"
  when /^false$/i
    puts "  allowdupe    =>  'false',"
end

case "M#Attribute Membership#"
  when /^inclusive$/i
    puts "  attribute_membership  =>  'inclusive',"
  when /^minimum$/i
    puts "  attribute_membership  =>  'minimum',"
end

unless "M#Attributes#" =="[optional] Array of key=value pairs"
  puts "  attributes       =>  "+groupattrbutes+","
end

unless "M#Auth Membership#" =~ /\[optional\]/
  puts "  auth_membership  =>  "+groupauthmembership+","
end

unless "M#IA Load Module#" =~ /\[optional\]/
  puts "  ia_load_module   =>  "+groupialoadmodule+","
end

unless "M#Members#" =~ /\[optional\]/
  puts "  members          =>  "+groupmembers+","
end

case "M#System#"
  when /^true$/i
    puts "  system    =>  'true',"
  when /^false$/i
    puts "  system    =>  'false',"
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias            =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit            =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before           =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check            =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel         =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop             =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify           =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require          =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule         =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage            =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe        =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag              =>  "+metatag+","
end

puts "}"