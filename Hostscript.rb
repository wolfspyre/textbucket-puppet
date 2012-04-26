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

hostname      = wrapquotes "M#Name=[Required] hostname#"
hostensure    = wrapquotes "M#Ensure=[optional] Present or absent#"
host_aliases  = wrapquotes "M#Host Aliases=[optional]#"
hostip        = wrapquotes "M#IP=[Required]#"
hosttarget    = wrapquotes "M#Target=[optional]#"
hostcomment   = wrapquotes "M#Comment=[optional] comment#"

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

unless "M#Name#" =~ /\[Required\] hostname/
   puts "host { "+hostname+":"
end
case "M#Ensure#"
  when /^absent$/i
    puts "  ensure        => 'absent',"
  when /^present$/i
    puts "  ensure        => 'present',"
end
unless "M#Host Aliases#" =~ /\[optional\]/
  puts "  host_aliases  =>  "+host_aliases+","
end
unless "M#IP#" =~ /\[Required\]/
  puts "  ip            =>  "+hostip+","
end
unless "M#Target#" =~ /\[optional\]/
  puts "  target        =>  "+hosttarget+","
end
unless "M#Comment#" =~ /\[optional\]/
  puts "  comment       =>  "+hostcomment+","
end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias         =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit         =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before        =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check         =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel      =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop          =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify        =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require       =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule      =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage         =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe     =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag       =>  "+metatag+","
end

puts "}"