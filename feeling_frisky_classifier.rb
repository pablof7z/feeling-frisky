# Make sure your class name is a Camelized version of the file name
class FeelingFriskyClassifier
  include Frisky::Classifier

  on_push :push_handler

  def self.push_handler repository, push_event
    Frisky.log.info "Just received a push event by #{push_event.actor.name} " +
                    "for repository #{repository.full_name}, " +
                    "pushed #{push_event.commits.count} commits!"
  end
end
