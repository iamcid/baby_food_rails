module ApplicationHelper

    def nav_bar
        if logged_in?
            render partial: 'layouts/loggedin_nav'
        end
    end

end
