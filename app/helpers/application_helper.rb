module ApplicationHelper
    
    #methods that goes in these files are going to be used primarily in views
    #if you want to use them mainly in your controllers, put them in the application_controller file

    def full_name(person) 
        fn = person.first_name + " " + person.last_name
        fn.titleize
    end
end
