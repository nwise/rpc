class Choice < ActiveRecord::Base
  def weakness
    Choice.find(self.weakness_id)
  end
end
