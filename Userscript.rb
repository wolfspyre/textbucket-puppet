#user script


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


username        = wrapquotes "M#Username=[Required] User name#"
userensure      = wrapquotes "M#Ensure=[optional] Present, absent, or role#" 
usercomment     = wrapquotes "M#Comment=[optional] A description or the user's full name#"
useruid         = wrapquotes "M#UID=[optional] The numerical user ID#"
usergid         = wrapquotes "M#GID=[optional] The user's primary group. name or gid#"
usergroups      = wrapquotes "M#Addtl Groups=[optional] The groups to which the user belongs#"
userhome        = wrapquotes "M#Homedir=[optional] The home directory of the user#"
usermanagehome  = wrapquotes "M#Manage Home=[optional] True or false#"
usershell       = wrapquotes "M#Shell=[optional] The user's login shell#"
usersystem      = wrapquotes "M#System Account=[optional] True or false#"
userpassword    = wrapquotes "M#Password=[optional]#"
userpassmaxage  = wrapquotes "M#Password Max Age=[optional]#"
userpassminage  = wrapquotes "M#Password Min Age=[optional]#"
userexpiry      = wrapquotes "M#Expiry=[optional] The user's expiry date in YYYY-MM-DD format#"
userallowdupe   = wrapquotes "M#Allow Duplicates=[optional] True or false#"
userattrmemb    = wrapquotes "M#Attr Membership=[optional] Inclusive or minimum#"
userattr        = wrapquotes "M#Attributes=[optional] The attributes the user has#"
userauthmemb    = wrapquotes "M#Auth Membership=[optional] Inclusive or minimum#"
userauth        = wrapquotes "M#Auths=[optional] The auths the user has#"
useriaload      = wrapquotes "M#IA Load Mod=[optional] The name of the I&A module to use to manage this user#"
userkeymember   = wrapquotes "M#Key membership=[optional] Inclusive or minimum#"
userkeys        = wrapquotes "M#Keys=[optional]#"
usermembership  = wrapquotes "M#Membership=[optional] Inclusive or minimum#"
userprofmemb    = wrapquotes "M#Profile Membership=[optional] Inclusive or minimum#"
userprofiles    = wrapquotes "M#Profiles=[optional]#"

userproject     = wrapquotes "M#Project=[optional]#"
userrolememb    = wrapquotes "M#Role Membership=[optional] Inclusive or minimum#"
userroles       = wrapquotes "M#Roles=[optional]#"

metaalias       = wrapquotes "M#Meta-alias=[optional metaparameter]#"
metaaudit       = wrapquotes "M#Meta-audit=[optional metaparameter]#"
metabefore      = wrapquotes "M#Meta-before=[optional metaparameter]#"
metacheck       = wrapquotes "M#Meta-check=[optional metaparameter]#"
metaloglevel    = wrapquotes "M#Meta-loglevel=[optional metaparameter]#"
metanoop        = wrapquotes "M#Meta-noop=[optional metaparameter]#"
metanotify      = wrapquotes "M#Meta-notify=[optional metaparameter]#"
metasubscribe   = wrapquotes "M#Meta-subscribe=[optional metaparameter]#"
metarequire     = wrapquotes "M#Meta-require=[optional metaparameter]#"
metaschedule    = wrapquotes "M#Meta-schedule=[optional metaparameter]#"
metastage       = wrapquotes "M#Meta-stage=[optional metaparameter]#"
metatag         = wrapquotes "M#Meta-tag=[optional metaparameter]#"

unless "M#Username" =~ /\[Required\]/
   puts "user { "+username+":"
end
case "M#Ensure#"
  when /^absent$/i
    puts "  ensure        => 'absent',"
  when /^present$/i
    puts "  ensure        => 'present',"
  when /^role$/i
    puts "  ensure        => 'role',"
end
unless "M#Comment#" =~ /\[optional\]/
  puts "  comment        => "+usercomment+","
end
unless "M#UID#" =~ /\[optional\]/
  puts "  uid        => "+useruid+","
end
unless "M#GID#" =~ /\[optional\]/
  puts "  gid        => "+usergid+","
end
unless "M#Addtl Groups#" =~ /\[optional\]/
  puts "  groups        => "+usergroups+","
end
unless "M#Homedir#" =~ /\[optional\]/
  puts "  home        => "+userhome+","
end
case "M#Manage Home#"
  when /^true$/i
    puts "  managehome  => 'true',"
  when /^false$/i
    puts "  managehome  => 'false',"
end
unless "M#Shell#" =~ /\[optional\]/
  puts "  shell        => "+usershell+","
end
case "M#System Account#"
  when /^true$/i
    puts "  system  => 'true',"
  when /^false$/i
    puts "  system  => 'false',"
end
unless "M#Password#" =~ /\[optional\]/
  puts "  password        => "+userpassword+","
end
unless "M#Password Max Age#" =~ /\[optional\]/
  puts "  password_max_age  => "+userpassmaxage+","
end
unless "M#Password Min Age#" =~ /\[optional\]/
  puts "  password_min_age  => "+userpassminage+","
end
if "M#Expiry#" =~ /\d\d\d\d-\d\d-\d\d/
  puts "  expiry        => "+userexpiry+","
end
case "M#Allow Duplicates#"
  when /^true$/i
    puts "  allowdupe  => 'true',"
  when /^false$/i
    puts "  allowdupe  => 'false',"
end
case "M#Attr Membership#"
  when /^inclusive$/i
    puts "  attribute_membership  => 'inclusive',"
  when /^minimum$/i
    puts "  attribute_membership  => 'minimum',"
end
unless "M#Attributes#" =~ /\[optional\]/
  puts "  attributes        => "+userattr+","
end
case "M#Auth Membership#"
  when /^inclusive$/i
    puts "  auth_membership  => 'inclusive',"
  when /^minimum$/i
    puts "  auth_membership  => 'minimum',"
end
unless "M#Auths#" =~ /\[optional\]/
  puts "  auths        => "+userauth+","
end
unless "M#IA Load Mod#" =~ /\[optional\]/
  puts "  ia_load_module  => "+useriaload+","
end
case "M#Key Membership#"
  when /^inclusive$/i
    puts "  key_membership  => 'inclusive',"
  when /^minimum$/i
    puts "  key_membership  => 'minimum',"
end
unless "M#Keys#" =~ /\[optional\]/
  puts "  keys        => "+userkeys+","
end
case "M#Membership#"
  when /^inclusive$/i
    puts "  membership  => 'inclusive',"
  when /^minimum$/i
    puts "  membership  => 'minimum',"
end
case "M#Profile Membership#"
  when /^inclusive$/i
    puts "  profile_membership  => 'inclusive',"
  when /^minimum$/i
    puts "  profile_membership  => 'minimum',"
end
unless "M#Profiles#" =~ /\[optional\]/
  puts "  profiles  => "+userprofiles+","
end
unless "M#Project#" =~ /\[optional\]/
  puts "  project        => "+userproject+","
end

case "M#Role Membership#"
  when /^inclusive$/i
    puts "  role_membership  => 'inclusive',"
  when /^minimum$/i
    puts "  role_membership  => 'minimum',"
end
unless "M#Roles#" =~ /\[optional\]/
  puts "  roles  => "+userroles+","
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