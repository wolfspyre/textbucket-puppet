#exec script


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

execname        = wrapquotes "M#Namevar=[optional] Pretty name#"
execcommand     = wrapquotes "M#Command=Required: command to execute#" 
execcwd         = wrapquotes "M#CWD=[optional] Directory to perform the exec#"
execenvironment = wrapquotes "M#Environment=[optional]#"
execgroup       = wrapquotes "M#Group=[optional] Group name or gid#"
execuser        = wrapquotes "M#User=[optional] User name or uid#"
execlogoutput   = wrapquotes "M#Log Output=[optional] True, False, or on_failure#"
execonlyif      = wrapquotes "M#Only if=[optional]#"
execpath        = wrapquotes "M#Path=[optional]#"
execrefresh     = wrapquotes "M#Refresh=[optional]#"
execreturns     = wrapquotes "M#Returns=[optional]#"
exectimeout     = wrapquotes "M#Timeout=[optional]#"
exectries       = wrapquotes "M#Tries=[optional]#"
exectrysleep    = wrapquotes "M#Try Sleep=[optional]#"
execunless      = wrapquotes "M#Unless=[optional]#"
metaalias       = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit       = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore      = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck       = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel    = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop        = wrapquotes "M#Meta-noop=[optional metaparameter]#"
execrefreshonly = wrapquotes "M#refreshonly=[optional] True or False. Only relevant if using subscribe or notify#"
metanotify      = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metasubscribe   = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metarequire     = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule    = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage       = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metatag         = wrapquotes "M#Meta-tag=[optional metaparameter]#"

if "M#Namevar#" == "[optional] Pretty name" then
   puts "exec { "+execcommand+":"
else
  puts "exec { "+execname+":"
  puts "  command      => "+execcommand+","
end

unless "M#Group#" =="[optional] Group name or gid"
  puts "  group        => "+execgroup+","
end

unless "M#User#" =="[optional] User name or uid"
  puts "  user         => "+execuser+","
end

unless "M#CWD#" =~ /\[optional\] Directory to perform the exec/
  puts "  cwd          =>  "+execcwd+","
end

unless "M#Environment#" =~ /\[optional\]/
  puts "  environment  =>  "+execenvironment+","
end

case "M#Log Output#"
  when /^true$/i
    puts "  logoutput    => 'true',"
  when /^false$/i
    puts "  logoutput    => 'false',"
  when /^on(_| )?failure$/i
    puts "  logoutput    => 'on_failure',"
end

unless "M#Only if#" =~ /\[optional\]/
  puts "  onlyif       =>  "+execonlyif+","
end

unless "M#Path#" =~ /\[optional\]/
  puts "  path         =>  "+execpath+","
end

unless "M#Refresh#" =~ /\[optional\]/
  puts "  refresh      =>  "+execrefresh+","
end

unless "M#Returns#" =~ /\[optional\]/
  puts "  returns     =>  "+execreturns+","
end

unless "M#Timeout#" =~ /\[optional\]/
  puts "  timeout      =>  "+exectimeout+","
end

unless "M#Tries#" =~ /\[optional\]/
  puts "  tries        =>  "+exectries+","
end

unless "M#Try Sleep#" =~ /\[optional\]/
  puts "  try_sleep    =>  "+exectrysleep+","
end

unless "M#Unless#" =~ /\[optional\]/
  puts "  unless       =>  "+execunless+","
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias        =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit        =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before       =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check        =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel     =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop         =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify       =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require      =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule     =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage        =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe    =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag          =>  "+metatag+","
end

puts "}"