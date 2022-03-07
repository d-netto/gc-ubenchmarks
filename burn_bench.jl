using Statistics
using TimeZones

burn() = sum(hash, ["trashfire"^min(1000, i) for i in 1:100_000])
zdts = [now(tz"UTC") for _ in  1:100_000_000]

gctimes = []

for i in 1:100
   push!(gctimes, (@timed burn()).gctime)
end

@show mean(gctimes)
