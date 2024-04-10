require 'rails_helper'

RSpec.describe AnswersController, type: :request do

  context 'on addition' do
    context 'on two numbers' do
      before do
        get '/', params: {"q" => "613e2e30: what is 4 plus 3"}
      end

      it "succeeds" do
        expect(response.body).to eql "7"
      end

      context 'on three numbers' do
        before do
          get '/', params: {"q" => "613e2e30: what is 4 plus 3 plus 3"}
        end

        it "succeeds" do
          expect(response.body).to eql "10"
        end
      end
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

  context 'on largest number' do
    before do
      get '/', params: {"q" => "5d861f20: which of the following numbers is the largest: 73, 178"}
    end

    it "succeeds" do
      expect(response.body).to eql "178"
    end
  end

  context 'on substraction' do
    before do
      get '/', params: {"q"=>"e559d940: what is 0 minus 17"}

    end

    it "succeeds" do
      expect(response.body).to eql "-17"
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

  xcontext 'on actor check' do
    before do
      get '/', params: {"q" => "0b953bb0: TODO"}
    end

    it "succeeds" do
      expect(response.body).to eql nil
    end
  end

  context 'on city check' do
    before do
      get '/', params: {"q" => "5a3109c0: which city is the Eiffel tower in"}
    end

    it "succeeds" do
      expect(response.body).to eql "Paris"
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
  
  context 'on fibonacci' do
    before do
      get '/', params: {"q" => "308a2e80: what is the 12th number in the Fibonacci sequence"}
    end

    it "succeeds" do
      expect(response.body).to eql "144"
    end
  end
end