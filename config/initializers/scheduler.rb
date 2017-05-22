#
# config/initializers/scheduler.rb

require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
#
#s.every '1m' do
s.every '1h' do
  m = Map.first
  mtype = Mtype.all.sample
  monster = mtype.monsters.create()
  m.monsters << monster


  Rails.logger.info "hello, it's #{mtype.name} time: #{Time.now}"
  Rails.logger.flush
end
