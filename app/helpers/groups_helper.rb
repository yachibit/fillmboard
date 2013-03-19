module GroupsHelper
  def select_random_user(group, sample_number = 4)
    User.find(group.users.pluck(:user_id).sample(sample_number))
  end
end