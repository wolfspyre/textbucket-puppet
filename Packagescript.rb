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

pkgname       = wrapquotes "M#Name=[Required] Name of Package#"
pkgadminfile  = wrapquotes "M#Adminfile=[optional]#"
pkgensure     = wrapquotes "M#Ensure=[optional] Absent, installed, present, purged, held, or latest#"
pkgallowcd    = wrapquotes "M#Allow CDrom=[optional] True or False#"
pkgcfgfiles   = wrapquotes "M#Config Files=[optional] Keep or Replace#"
pkgflavor     = wrapquotes "M#Flavor=[optional]#"
pkginstopt    = wrapquotes "M#Install Options=[optional] hash of additional options#"
pkgrespfile   = wrapquotes "M#Response File=[optional]#"
pkgsource     = wrapquotes "M#Source=[optional] Local file or url to packagefile#"
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

unless "M#Name#" == "[Required] Name of Package"
   puts "package { "+pkgname+":"
end
case "M#Ensure#"
  when /^absent$/i
    puts "  ensure        =>  'absent',"
  when /^(present|installed)$/i
    puts "  ensure        =>  'present',"
      when /^purged$/i
    puts "  ensure        =>  'purged',"
      when /^held$/i
    puts "  ensure        =>  'held',"
      when /^latest$/i
    puts "  ensure        =>  'latest',"
 end
case "M#Allow CDrom#"
  when /^(0|false)$/i
    puts "  allowcdrom    =>  'false',"
  when /^(1|true)$/i
    puts "  allowcdrom    =>  'true',"
end
unless "M#Adminfile#" =~ /\[optional\]/
  puts "  adminfile     =>  "+pkgadminfile+","
end
case "M#Config Files#"
  when /^keep$/i
    puts "  configfiles   =>  'keep',"
  when /^replace$/i
    puts "  configfiles   =>  'replace',"
end
unless "M#Flavor#"=~ /\[optional\]/
  puts "  flavor        =>  "+pkgflavor+","
end
unless "M#Install Options#"=~ /\[optional\]/
  puts "  install_options  =>  "+pkginstopt+","
end
unless "M#Response File#"=~ /\[optional\]/
  puts "  responsefile  =>  "+pkgrespfile+","
end
unless "M#Source#" =~ /\[optional\]/
  puts "  source        =>  "+pkgsource+","
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
  puts "  tag           =>  "+metatag+","
end

puts "}"