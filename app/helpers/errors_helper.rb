module ErrorsHelper
    def display_errors_for(object)
        render partial: 'errors/errors_message', locals: {object: object}
    end
end