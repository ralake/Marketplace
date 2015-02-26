class InvalidParameterError < Exception
  def message
    "One of the rule parameters is invalid: "
  end
end