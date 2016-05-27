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

  describe "methods" do
    describe ".get_panoramas" do
      context "without options" do
        it "get panoramas successfuly with default options" do
          panoramio = PanoramioRb.get_panoramas

          expect(panoramio.photos).not_to be nil
          expect(panoramio.photos.count).to eq(20)
        end
      end
      context "with options" do
        it "get panoramas within specific area" do
          area = {
            minx: -72.69483717012992, 
            miny: -13.307931783110847, 
            maxx: -72.39756282987008, 
            maxy: -13.018468216889152
          }
          panoramio = PanoramioRb.get_panoramas(area)

          photo = panoramio.photos.first

          expect(photo.latitude).to be_between(area[:miny], area[:maxy])
          expect(photo.longitude).to be_between(area[:minx], area[:maxx])
        end

        it "get panoramas from User ID" do
          user_id = 7449659
          panoramio = PanoramioRb.get_panoramas(set: user_id)

          photo = panoramio.photos.first

          expect(photo.owner_id).to eq(user_id)
        end
      end
    end
  end 
end
