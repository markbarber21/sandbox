#! /usr/bin/env ruby
require 'date' 

### Verbose Errors for missing commands
alias old_backquote ` 
def `(cmd) 
  result = old_backquote(cmd) 
  if $? != 0 
    fail "Command '#{cmd}' failed: #$?" 
  end 
  result 
end 
########################################

### New Functions for the String Class
class String
  
  # This function is problimatic and slow with large strings, nots its intent
  def strip_leading_mark(char)
    while self[0] != nil and self[0] == char[0]
      for i in 0...self.length()-1
        self[i] = self[i+1]
      end
      self[self.length()-1] = ""
    end
    self
  end
  
  def strip_leading_zeros()
    strip_leading_mark("0")
  end  
end
########################################

debug = false
if ARGV[0]
  debug = true
end

output = [];

now_date = DateTime.now

if debug
    puts "Update and Reboot - Debug".center(80, "-")
else
    puts "Update and Reboot - Release".center(80, "-")
end

puts "--- Svn update ---"
puts `svn up`

puts "--- Kill Server ---"
puts `sudo /usr/local/bin/mongrel_rails stop --pid ./pid`

puts "--- Migrate DB ---"

if debug
  puts `rake db:migrate`
else
  puts `rake db:migrate RAILS_ENV=production`
end

puts "--- Restarting Server ---"

if debug
  puts `/usr/local/bin/mongrel_rails start --chdir ./ -p 4021 --daemonize -P ./pid`
else
  puts `/usr/local/bin/mongrel_rails start  -e production --chdir ./ -p 4021 --daemonize -P ./pid`
end

puts "".center(80, "-")

#note on how to make runable  chmod u+x update.rb




