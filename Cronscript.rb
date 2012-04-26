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

cronname = wrapquotes "M#Name=[optional] Pretty name#"
croncommand = wrapquotes "M#Command=[Required] The command to execute#"
cronensure = wrapquotes "M#Ensure=[optional] Present or absent#"
cronenvironment = wrapquotes "M#Environment=[optional]#"
cronhour = wrapquotes "M#Hour=[optional] 0-23#"
cronminute = wrapquotes "M#Minute=[optional] 0-59#"
cronmonth = wrapquotes "M#Month=[optional] 1-12 Month name#"
cronmonthday = wrapquotes "M#Month Day=[optional] 1-31#"
cronspecial = wrapquotes "M#Special=[optional]#"
crontarget = wrapquotes "M#Target=[optional]#"
cronuser = wrapquotes "M#User=[optional]#"
cronweekday = wrapquotes "M#Weekday=[optional] 0-7 or Name of day#"
metaalias = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop = wrapquotes "M#Meta-noop=[optional metaparameter]#"
metanotify = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metarequire = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metasubscribe = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metatag = wrapquotes "M#Meta-tag=[optional metaparameter]#"

if "M#Name#" == "[optional] Pretty name" then
   puts "cron { "+croncommand+":"
else
  puts "cron { "+cronname+":"
  puts "  command      => "+croncommand+","
end

case "M#Ensure#"
  when /^absent$/i
    puts "  ensure       => 'absent',"
  when /^present$/i
    puts "  ensure       => 'present',"
end

unless "M#Environment#" =~ /\[optional\]/
  puts "  environment  =>  "+cronenvironment+","
end
unless "M#Hour#" =~ /\[optional\] 0-23/
  puts "  hour         =>  "+cronhour+","
end
unless "M#Minute#" =~ /\[optional\] 0-59/
  puts "  minute       =>  "+cronminute+","
end

unless "M#Month#" =~ /\[optional\] 1-12 Month name/
  puts "  month        =>  "+cronmonth+","
end

unless "M#Month Day#" =~ /\[optional\] 1-31/
  puts "  monthday     =>  "+cronmonthday+","
end

unless "M#Special#" =~ /\[optional\]/
  puts "  special      =>  "+cronspecial+","
end

unless "M#Target#" =~ /\[optional\]/
  puts "  target       =>  "+crontarget+","
end

unless "M#User#" =~ /\[optional\]/
  puts "  user         =>  "+cronuser+","
end

unless "M#Weekday#" =~ /\[optional\] 0-7 or Name of day/
  puts "  weekday      =>  "+cronweekday+","
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