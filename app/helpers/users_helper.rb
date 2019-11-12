module UsersHelper
    def user_full_name(user)
        "#{user.first_name} #{user.last_name}" if current_user.present?
    end

    def get_current_user_worked_hours_in_minute
        ((Time.now - current_user.current_sign_in_at) / 1.minute).to_i if user_signed_in?
    end
end