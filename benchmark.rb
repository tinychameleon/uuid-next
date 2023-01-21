# frozen_string_literal: true

require "securerandom"
require "benchmark/ips"
require "uuid/next"

Benchmark.ips do |b|
  b.report("stdlib") { SecureRandom.uuid }
  b.report("uuidv6") { Uuid::Next::V6.generate }
  b.report("uuidv6s") { Uuid::Next::V6.generate.to_s }
  b.report("uuidv7") { Uuid::Next::V7.generate }
  b.report("uuidv7s") { Uuid::Next::V7.generate.to_s }
  b.compare!
end
