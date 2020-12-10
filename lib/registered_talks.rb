require_relative "talk"

module RegisteredTalks
  TALK_LIST = [
    Talk.register("Pryin open the black box", 60),
    Talk.register("Migrating a huge production codebase from sinatra to Rails", 45),
    Talk.register("How does bundler work", 30),
    Talk.register("Sustainable Open Source", 45),
    Talk.register("How to program with Accessiblity in Mind", 45),
    Talk.register("Riding Rails for 10 years", 5),
    Talk.register("Implementing a strong code review culture", 60),
    Talk.register("Scaling Rails for Black Friday", 45),
    Talk.register("Docker isn't just for deployment", 30),
    Talk.register("Callbacks in Rails", 30),
    Talk.register("Microservices, a bittersweet symphony", 45),
    Talk.register("Teaching github for poets", 60),
    Talk.register("Test Driving your Rails Infrastucture with Chef", 60),
    Talk.register("SVG charts and graphics with Ruby", 45),
    Talk.register("Interviewing like a unicorn: How Great Teams Hire", 30),
    Talk.register("How to talk to humans: a different approach to soft skills", 30),
    Talk.register("Getting a handle on Legacy Code", 60),
    Talk.register("Heroku: A year in review", 30),
    Talk.register("Ansible : An alternative to chef", 5),
    Talk.register("Ruby on Rails on Minitest", 30),
  ]
  def all_pending_talks
    pending_talks = TALK_LIST.select { |talk| talk.start_time.nil? }.map { |talk| talk.subject }.join("\n")
    "\nPending Talks\n\n#{pending_talks}\n\n" if !pending_talks.empty?
  end
end
