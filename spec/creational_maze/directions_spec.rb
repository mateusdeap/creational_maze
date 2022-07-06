require "spec_helper"

RSpec.describe Directions do
  let(:dummy_class) { Class.new { extend Directions } }

  describe "#all_directions" do
    it "returns an array with the four cardinal directions as symbols" do
      directions = dummy_class.all_directions
      expect(directions).to eq(%i[north south east west])
    end
  end

  describe "#opposite_directions" do
    context "given a valid direction" do
      it "returns north for south" do
        expect(dummy_class.opposite_direction(:south)).to be(:north)
      end

      it "returns west for east" do
        expect(dummy_class.opposite_direction(:east)).to be(:west)
      end

      it "returns south for north" do
        expect(dummy_class.opposite_direction(:north)).to be(:south)
      end

      it "returns east for west" do
        expect(dummy_class.opposite_direction(:west)).to be(:east)
      end
    end

    context "given an invalid direction" do
      it "raises an ArgumentError" do
        expect { dummy_class.opposite_direction("some gibberish") }.to raise_error(ArgumentError)
      end
    end
  end
end
