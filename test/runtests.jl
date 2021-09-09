using Test
using MiscFunctions

@testset "Tests" begin

    x = [-8π, -2π, 2π, 0, 4π, 6π]
    m = cmean(x)
    sd = cstd(x)
    @test abs(m) < 1e-15
    @test sd ≈ 0

end
