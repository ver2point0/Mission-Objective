namespace :objective do
  desc "Delete objectives older than 7 days"
  task delete_objectives: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
