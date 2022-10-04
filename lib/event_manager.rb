class EventManager

  # Handlers array
  def handlers() = @handlers ||= []

  # Add a new handler
  def subscribe(handler)
    handlers << handler
  end

  # Remove a handler
  def unsubscribe(handler)
    handlers.delete handler
  end

  # Trigger all handlers
  def broadcast(*args)
    handlers.each { |handler| handler.call(*args) }
  end
end
