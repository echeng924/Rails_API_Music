10.times do
  Artist.create({
    name: FFaker::NameBR.name,
  })
end

100.times do
  Song.create({
    title: FFaker::DizzleIpsum.word,
    body: FFaker::DizzleIpsum.paragraph,
    artist_id: Random.rand(1..10)
  })
end
