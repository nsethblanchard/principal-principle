module ApplicationHelper
    
    #methods that goes in these files are going to be used primarily in views
    #if you want to use them mainly in your controllers, put them in the application_controller file

    def full_name(person)
        fn = person.first_name + " " + person.last_name
        fn.titleize
    end

    def button_text  #changes the text of the buttons based on the actions- for our partials
        if controller.action_name == "new"
           return "Add"
        elsif controller.action_name == "edit"
           return "Update"
        else
           return "Submit"
        end
      end
end
