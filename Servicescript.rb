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

svcname       = wrapquotes "M#Name=[Required] Name of service#"
svcensure     = wrapquotes "M#Ensure=[optional] True, running, false, or stopped#"
svcenable     = wrapquotes "M#Enable=[optional] True, false, or manual#"
svcbinary     = wrapquotes "M#Binary=[optional] Path to the daemon#"
svchasrestart = wrapquotes "M#Has Restart=[optional] True or false#"
svchasstatus  = wrapquotes "M#Has Status=[optional] True or false#"
svcmanifest   = wrapquotes "M#Manifest=[optional]#"
svcpath       = wrapquotes "M#Path=[optional] search path for finding initscripts#"
svcpattern    = wrapquotes "M#Pattern=[optional] pattern to search for in the process table#"

svcrestart    = wrapquotes "M#Restart=[optional]#"
svcstart      = wrapquotes "M#Start=[optional]#"
svcstatus     = wrapquotes "M#Status=[optional]#"
svcstop       = wrapquotes "M#Stop=[optional]#"
svccontrol    = wrapquotes "M#Control=[optional]#"

metaalias     = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit     = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore    = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck     = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel  = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop      = wrapquotes "M#Meta-noop=[optional metaparameter]#"
metanotify    = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metasubscribe = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metarequire   = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule  = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage     = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metatag       = wrapquotes "M#Meta-tag=[optional metaparameter]#"

unless "M#Name#" == "[Required] Name of service"
   puts "service { "+svcname+":"
end
case "M#Ensure#"
  when /^(true|running)$/i
    puts "  ensure      =>  'running',"
  when /^(false|stopped)$/i
    puts "  ensure      =>  'stopped',"
 end
case "M#Enable#"
  when /^true$/i
    puts "  enable      =>  'running',"
  when /^false$/i
    puts "  enable      =>  'stopped',"
 end
unless "M#Binary#" =~ /\[optional\]/
  puts "  binary      =>  "+svcbinary+","
end
case "M#Has Status#"
  when /^false$/i
    puts "  hasstatus   =>  'false',"
  when /^true$/i
    puts "  hasstatus   =>  'true',"
end
case "M#Has Restart#"
  when /^false$/i
    puts "  hasrestart  =>  'false',"
  when /^true$/i
    puts "  hasrestart  =>  'true',"
end
unless "M#Manifest#" =~ /\[optional\]/
  puts "  manifest    =>  "+svcmanifest+","
end
unless "M#Path#" =~ /\[optional\]/
  puts "  path        =>  "+svcpath+","
end
unless "M#Pattern#" =~ /\[optional\]/
  puts "  pattern     =>  "+svcpattern+","
end
unless "M#Restart#" =~ /\[optional\]/
  puts "  restart     =>  "+svcrestart+","
end
unless "M#Start#" =~ /\[optional\]/
  puts "  start       =>  "+svcstart+","
end
unless "M#Status#" =~ /\[optional\]/
  puts "  status      =>  "+svcstatus+","
end
unless "M#Stop#" =~ /\[optional\]/
  puts "  stop        =>  "+svcstop+","
end
unless "M#Control#" =~ /\[optional\]/
  puts "  control     =>  "+svccontrol+","
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias       =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit       =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before      =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check       =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel    =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop        =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify      =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require     =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule    =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage       =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe   =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag         =>  "+metatag+","
end

puts "}"