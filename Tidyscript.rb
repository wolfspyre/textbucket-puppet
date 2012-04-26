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

tidyname      = wrapquotes "M#Name=[optional] Pretty name#"
tidypath      = wrapquotes "M#Path=[Required] Path to tidy#"
tidyage       = wrapquotes "M#Age=[optional] Age to prune#"
tidybackup    = wrapquotes "M#Backup=[optional]#"
tidymatches   = wrapquotes "M#Matches=[optional] One or more file patterns to match#"
tidyrecurse   = wrapquotes "M#Recurse=[optional] True, false, or inf#"
tidyrmdirs    = wrapquotes "M#RMDirs=[optional] True or false#"
tidysize      = wrapquotes "M#Size=[optional] value in b, k(default), m, g, or t #"

tidytype      = wrapquotes "M#Type=[optional] what to test on: atime, mtime, or ctime#"

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

if "M#Name#" == "[optional] Pretty name" then
   puts "tidy { "+tidypath+":"
else
  puts "tidy { "+tidyname+":"
  puts "  path      => "+tidypath+","
end
unless "M#Age#" =~ /\[optional\]/
  puts "  age       =>  "+tidyage+","
end
unless "M#Backup#" =~ /\[optional\]/
  puts "  backup    =>  "+tidybackup+","
end
unless "M#Matches#" =~ /\[optional\]/
  puts "  matches   =>  "+tidymatches+","
end
case "M#Recurse#"
  when /^false$/i
    puts "  recurse   =>  'false',"
  when /^true$/i
    puts "  recurse   =>  'true',"
  when /^inf$/i
    puts "  recurse   =>  'inf',"
end
case "M#RMDirs#"
  when /^false$/i
    puts "  rmdirs    =>  'false',"
  when /^true$/i
    puts "  rmdirs    =>  'true',"
end
if "M#Size#" =~ /^[0-9]+(b|k|g|m|t|bytes|kilobytes|megabytes|gigabytes|terabytes)/i
  puts "  size      =>  "+tidysize+","
end
case "M#Type#"
  when /^atime$/i
    puts "  type      =>  'atime',"
  when /^mtime$/i
    puts "  type      =>  'atime',"
  when /^ctime$/i
    puts "  type      =>  'atime'," 
 end

unless "M#Meta-alias#" =~ /\[optional metaparameter\]/
  puts "  alias     =>  "+metaalias+","
end

unless "M#Meta-audit#" =~ /\[optional metaparameter\]/
  puts "  audit     =>  "+metaaudit+","
end

unless "M#Meta-before#" =~ /\[optional metaparameter\]/
  puts "  before    =>  "+metabefore+","
end

unless "M#Meta-check#" =~ /\[optional metaparameter\]/
  puts "  check     =>  "+metacheck+","
end

unless "M#Meta-loglevel#" =~ /\[optional metaparameter\]/
  puts "  loglevel  =>  "+metaloglevel+","
end

unless "M#Meta-noop#" =~ /\[optional metaparameter\]/
  puts "  noop      =>  "+metanoop+","
end

unless "M#Meta-notify#" =~ /\[optional metaparameter\]/
  puts "  notify    =>  "+metanotify+","
end

unless "M#Meta-require#" =~ /\[optional metaparameter\]/
  puts "  require   =>  "+metarequire+","
end

unless "M#Meta-schedule#" =~ /\[optional metaparameter\]/
  puts "  schedule  =>  "+metaschedule+","
end

unless "M#Meta-stage#" =~ /\[optional metaparameter\]/
  puts "  stage     =>  "+metastage+","
end

unless "M#Meta-subscribe#" =~ /\[optional metaparameter\]/
  puts "  subscribe =>  "+metasubscribe+","
end

unless "M#Meta-tag#" =~ /\[optional metaparameter\]/
  puts "  tag       =>  "+metatag+","
end

puts "}"