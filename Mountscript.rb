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

mountname     = wrapquotes "M#Name=[Required] Name of mount#"
mountfstype   = wrapquotes "M#FSType=[Required] The mount type#" 
mountensure   = wrapquotes "M#Ensure=[optional] Absent, defined, present, mounted, or unmounted#"
mountatboot   = wrapquotes "M#At Boot=[optional]#"
mountdevice   = wrapquotes "M#Device=[optional] The device providing the mount#"
mountdump     = wrapquotes "M#Dump=[optional] 0 or 1#"
mountoptions  = wrapquotes "M#Options=[optional] Options for the mount as they would appear in fstab#"
mountpass     = wrapquotes "M#Pass=[optional]#"
mountremounts = wrapquotes "M#Remounts=[optional]#"
mounttarget   = wrapquotes "M#Target=[optional]#"
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

unless "M#Name#" == "[Required] Name of mount"
   puts "mount { "+mountname+":"
end

case "M#Ensure#"
  when /^absent$/i
    puts "  ensure     =>  'absent',"
  when /^(present|defined)$/i
    puts "  ensure     =>  'present',"
      when /^mounted$/i
    puts "  ensure     =>  'mounted',"
      when /^unmounted$/i
    puts "  ensure     =>  'unmounted',"
 end
unless "M#FSType#"=~ /\[Required\]/
  puts "  fstype     =>  "+mountfstype+","
end
unless "M#At Boot#"=~ /\[optional\]/
  puts "  atboot     =>  "+mountatboot+","
end
unless "M#Device#"=~ /\[optional\]/
  puts "  device     =>  "+mountdevice+","
end
case "M#Dump#"
  when /^0$/i
    puts "  dump       =>  '0',"
  when /^1$/i
    puts "  dump       =>  '1',"
end
unless "M#Options#" =~ /\[optional\]/
  puts "  options    =>  "+mountoptions+","
end
unless "M#Pass#" =~ /\[optional\]/
  puts "  pass       =>  "+mountpass+","
end
unless "M#Remounts#" =~ /\[optional\]/
  puts "  remounts   =>  "+mountremounts+","
end
unless "M#Target#" =~ /\[optional\]/
  puts "  target     =>  "+mounttarget+","
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias      =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit      =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before     =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check      =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel   =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop       =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify     =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require    =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule   =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage      =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe  =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag        =>  "+metatag+","
end

puts "}"