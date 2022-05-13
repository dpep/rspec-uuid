describe RSpecUUID::Matchers do
  context "with a valid UUID" do
    let(:uuid) { "992c94bd-5870-4e02-ad2d-a9435f7fffe6" }

    specify { expect(uuid).to be_a_uuid }
  end

  context "with generated UUIDs" do
    specify do
      100.times { expect(SecureRandom.uuid).to be_a_uuid }
    end
  end

  context "with invalid UUIDs" do
    specify { expect("abc").not_to be_a_uuid }
    specify { expect(:xyz).not_to be_a_uuid }
    specify { expect(123).not_to be_a_uuid }
    specify { expect(nil).not_to be_a_uuid }

    it "fails with a useful message" do
      expect {
        expect(nil).to be_a_uuid
      }.to fail_including("expected a UUID")
    end

    it "fails with a useful negation message" do
      expect {
        expect(SecureRandom.uuid).not_to be_a_uuid
      }.to fail_including("did not expect a UUID")
    end
  end

  context "with a UUID version" do
    let(:namespace) { Digest::UUID::OID_NAMESPACE }
    let(:uuid_v3) { Digest::UUID.uuid_v3(namespace, "123") }
    let(:uuid_v4) { SecureRandom.uuid }
    let(:uuid_v5) { Digest::UUID.uuid_v5(namespace, "123") }

    specify { expect(uuid_v3).to be_a_uuid(3) }
    specify { expect(uuid_v3).not_to be_a_uuid(4) }
    specify { expect(uuid_v3).not_to be_a_uuid(5) }

    specify { expect(uuid_v4).to be_a_uuid(4) }
    specify { expect(uuid_v5).to be_a_uuid(5) }

    it "fails with a useful message" do
      expect {
        expect(uuid_v3).to be_a_uuid(4)
      }.to fail_including("UUID v4, found a UUID v3")
    end
  end
end
