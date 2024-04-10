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
      get '/', params: {"q" => "5d861f20: which of the following numbers is the largest: 73, 178"}
    end

    it "succeeds" do
      expect(response.body).to eql "178"
    end
  end

  context 'on multiplication' do
    before do
      get '/', params: {"q" => "fd461e10: what is 4 multiplied by 18"}
    end

    it "succeeds" do
      expect(response.body).to eql "72"
    end
  end

  context 'on addition' do
    before do
      get '/', params: {"q" => "5d861f20: which of the following numbers is the largest: 73, 178"}
    end

    it "succeeds" do
      expect(response.body).to eql "178"
    end
  end

  context 'on square/cube' do
    before do
      get '/', params: {"q" => "0b953bb0: which of the following numbers is both a square and a cube: 521, 64, 100, 417"}
    end

    it "succeeds" do
      expect(response.body).to eql "64"
    end
  end

  context 'on actor check' do
    before do
      get '/', params: {"q" => "0b953bb0: TODO"}
    end

    it "succeeds" do
      expect(response.body).to eql nil
    end
  end

  context 'on prime' do
    before do
      get '/', params: {"q" => "cb96ace0: which of the following numbers are primes: 7727, 157"}
    end

    it "succeeds" do
      expect(response.body).to eql "7727"
    end
  end
  
end