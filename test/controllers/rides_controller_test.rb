require "test_helper"

describe RidesController do
  it "should get index" do
    get rides_index_url
    value(response).must_be :success?
  end

end
