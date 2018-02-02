require './poker_hand_rankings'

# iterate over the hand
describe "poker_hand_rankings" do

  context "when passed a hand of 5 cards" do
    describe "#each_card" do
      it "should return an array" do
        expect(each_card("4h Qd 3s 4s Ac")).to be_instance_of(Array)
      end
      it "should return each individual card" do
        expect(each_card("4h Qd 3s 4s Ac")).to eq(["4h", "Qd", "3s", "4s", "Ac"])
      end
    end
  end

  context "when evaluating the hand" do
    describe "#high_card" do
      it "should return the card of the greatest value" do
        expect(high_card(["4h", "Qd", "3s", "4s", "6c"])).to eq("Qd")
      end
      it "should know that aces are high" do
        expect(high_card(["4h", "Qd", "3s", "4s", "Ac"])).to eq("Ac")
      end
    end

    describe "#has_pair?" do
      it "should return true if the hand contains two like cards" do
        expect(has_pair?(["4h", "Qd", "3s", "4s", "Ac"])).to be(true)
      end
      it "should return false if the hand does not contain two like cards" do
        expect(has_pair?(["4h", "Qd", "3s", "5s", "Ac"])).to be(false)
      end
    end

    describe "#has_two_pair?" do
      it "should return true if the hand contains two pairs" do
        expect(has_two_pair?(["4h", "Qd", "Qs", "4s", "Ac"])).to eq(true)
      end
      it "should return false if the hand does not contain two pairs" do
        expect(has_two_pair?(["4h", "Qd", "3s", "5s", "Ac"])).to be(false)
      end
    end

    describe "#has_three_of_a_kind?" do
      it "should return true if the hand contains three like cards" do
        expect(has_three_of_a_kind?(["As", "Ad", "Ah", "3c", "8s"])).to be(true)
      end
      it "should return false if the hand does not contain three like cards" do
        expect(has_three_of_a_kind?(["4d", "Kh", "Qs", "2c", "9h"])).to be(false)
      end
    end

    describe "#has_straight?" do
      it "should return true if the hand contains five cards in a sequence" do
        expect(has_straight?(["3d", "6h", "7s", "5c", "4c"])).to be(true)
      end

      it "should be able to recognize the Ace as being a high card as well as a low card" do
        expect(has_straight?(["Ad", "3h", "4s", "2c", "5d"])).to be(true)
        expect(has_straight?(["Jd", "Kh", "10c", "Ad", "Qd"])).to be(true)
      end

      it "should return false if the had contains five cards not in sequence" do
        expect(has_straight?(["4d", "6d", "4h", "5c", "Jd"])).to be(false)
      end
    end

    describe "has_flush?" do
      it "should return true if the hand contains five cards of the same suit" do
        expect(has_flush?(["3h", "4h", "9h", "Jh", "Ah"])).ti be(true)
      end
      it "should return false if the hand does not contain five cards of the same suit" do
        expect(has_flush?(["4d", "10h", "9c", "Kh", "Js"])).to be(false)
      end
    end

    describe "#has_full_house?" do
      it "returns true if the hand contains a pair AND three of a kind" do
        expect(has_full_house?(["4d", "4s", "Jh", "Jd", "Jc"])).to eq(true)
      end
      it "returns false if the hand does not contain a pair AND three of a kind" do
        expect(has_full_house?(["4s", "5c", "9h", "Jc", "Ad"])).to eq(false)
        expect(has_full_house?(["4d", "4s", "Jd", "Qs", "8h"])).to eq(false)
        expect(has_full_house?(["5h", "3d", "3s", "Kc", "3h"])).to eq(false)
      end
    end

    describe "#has_four_of_a_kind" do
      it "returns true if the hand contains four like cars" do
        expect(has_four_of_a_kind?(["9h", "9c", "9d", "4s", "9s"])).to be(true)
      end
      it "returns false if the hand does not contain four like cards" do
        expect(has_four_of_a_kind?(["5h", "4h", "9h", "2h", "4c"])).to be(false)
      end
    end

    describe "#has_straight_flush?" do
      it "returns true if the hand contains five cards that share a suit in sequential order" do
        expect(has_straight_flush?(["5s", "4s", "7s", "6s", "8s"])).to be(true)
      end
      it "returns false if the hand does not contain five cards that share a suit and/or are not in sequential order" do
        expect(has_straight_flush?(["4h", "9h", "2s", "9s", "Ad"])).to be(false)
        expect(has_straight_flush?(["9d", "Js", "Kh", "Qc", "10c"])).to be(false)
        expect(has_straight_flush?(["4s", "7s", "Js", "As", "2s"])).to be(false)
      end
    end

  end
end
