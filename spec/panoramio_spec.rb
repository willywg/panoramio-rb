require "spec_helper"

describe PanoramioRb do
  describe "parameters" do
    it "has a version number" do
      expect(PanoramioRb::VERSION).not_to be nil
    end

    it "has a default url" do
      expect(PanoramioRb::URL).not_to be nil
    end

    it "has default options" do
      expect(PanoramioRb::DEFAULT_OPTIONS).not_to be nil
    end
  end

  describe "method" do
    describe ".get_panoramas" do
      context "without options" do
        it "get panoramas successfuly with default options" do
          panoramio = PanoramioRb.get_panoramas

          expect(panoramio.photos).not_to be nil
          expect(panoramio.photos.count).to eq(20)
        end
      end
    end
  end 
end
