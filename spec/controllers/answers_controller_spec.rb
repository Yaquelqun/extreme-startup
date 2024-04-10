require 'rails_helper'

RSpec.describe AnswersController, type: :request do

  context 'on addition' do
    before do
      get '/', params: {"q" => "613e2e30: what is 4 plus 3"}
    end

    it "succeeds" do
      expect(response.body).to eql "7"
    end
  end

  context 'on addition' do
    before do
      get '/', params: {"q" => "613e2e30: what is 4 plus 3"}
    end

    it "succeeds" do
      expect(response.body).to eql "7"
    end
  end
end