textbucket-puppet
=================

a set of ruby scripts designed to work with bassetsoftware's textbucket for the easy generation of core puppet types

TextBucket can be gotten from http://bassetsoftware.com/b.cgi/textbucket/index

the storedata file is opened when textbucket starts, and blindly saved when textbucket closes,
so put it in place before opening the applicaiton.

the storedata file should be placed:

~/Library/Application Support/Text_Bucket/storedata
