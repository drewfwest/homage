def error_messages(object_with_errors)
  if object_has_errors?(object_with_errors)
    all_error_messages = object_with_errors.errors.full_messages.map do |message|
      error_message = message.split(" ")
      error_message.delete_at(0)
      error_message.join(" ")
    end
  end
end

def object_has_errors?(object)
  object.errors.full_messages.length > 0
end