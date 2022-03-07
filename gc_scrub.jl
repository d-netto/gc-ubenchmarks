using BenchmarkTools

gctimes = []

for i in 1:25
    stat = @timed begin
        GC.gc(); GC.gc(); GC.gc()
    end
    push!(gctimes, stat.gctime)
end

@show mean(gctimes)
