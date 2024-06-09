describe "be_a_uuid" do
  context "with a valid UUID" do
    subject { "992c94bd-5870-4e02-ad2d-a9435f7fffe6" }

    it { is_expected.to be_a_uuid }
  end

  context "with nil UUID" do
    subject { "00000000-0000-0000-0000-000000000000" }

    it { is_expected.to be_a_uuid }
  end

  context "with generated UUIDs" do
    specify do
      100.times { expect(SecureRandom.uuid).to be_a_uuid }
      100.times { expect(Faker::Internet.uuid).to be_a_uuid }
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
    let(:uuid_v7) { UUID7.generate }

    specify { expect(uuid_v3).to be_a_uuid(version: 3) }
    specify { expect(uuid_v3).not_to be_a_uuid(version: 4) }
    specify { expect(uuid_v3).not_to be_a_uuid(version: 5) }

    specify { expect(uuid_v4).to be_a_uuid(version: 4) }
    specify { expect(uuid_v5).to be_a_uuid(version: 5) }
    specify { expect(uuid_v7).to be_a_uuid(version: 7) }

    it "fails with a useful message" do
      expect {
        expect(uuid_v3).to be_a_uuid(version: 4)
      }.to fail_including("expected a UUID v4, found a UUID v3")
    end

    describe ".of_version" do
      it { expect(uuid_v3).to be_a_uuid.of_version(3) }

      it { expect(uuid_v4).to be_a_uuid.of_version(4) }
      it { expect(uuid_v4).not_to be_a_uuid.of_version(3) }

      it "requires a version argument" do
        expect {
          expect(uuid_v4).to be_a_uuid.of_version
        }.to raise_error(ArgumentError)
      end

      it "can not be used simultaneously with kwarg version" do
        expect {
          expect(uuid_v4).to be_a_uuid(version: 4).of_version(4)
        }.to raise_error(ArgumentError)
      end
    end
  end

  it "is composable" do
    data = {
      abc: { a: 1 },
      uuid: SecureRandom.uuid,
      uuid_v5: Digest::UUID.uuid_v5(Digest::UUID::OID_NAMESPACE, "123"),
    }

    expect(data).to include(uuid: a_uuid)

    expect(data).to match(
      abc: a_hash_including(:a),
      uuid: a_uuid,
      uuid_v5: a_uuid(version: 5),
    )
  end
end
