require 'spec_helper'

describe "Smartdc::Api::Packages" do

  before(:all) do
    @object = Object.new
    @request = Smartdc::Request
  end

  describe ".read" do
    it "should return a package" do
      @object.stub(:content) {fixture('packages')[0]}
      name = @object.content['name']
      @request.stub_chain(:new, :get).with('my/packages/' + name) {@object}

      packages = Smartdc::Api::Packages.new({})
      packages.read(name).content['name'].should == name
    end
  end

  describe ".all" do
    it "should return some packages" do
      @object.stub(:content) {fixture('packages')}
      @request.stub_chain(:new, :get).with('my/packages', {}) {@object}

      packages = Smartdc::Api::Packages.new({})
      packages.all.content.count.should > 0
    end
  end

end
