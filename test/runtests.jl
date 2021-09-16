using Test
using MiscFunctions

@testset "Tests" begin

    x = [-8π, -2π, 2π, 0, 4π, 6π]
    m = cmean(x)
    sd = cstd(x)
    @test abs(m) < 1e-15
    @test sd ≈ 0

    array = [0.1, -8.6, 2.2, 1.97, 0.15, -1.93, -0.1]
    value = 1.94
    index = find_closest(value, array)
    @test index == 4

    value = -2.2
    index = find_closest(value, array)
    @test index == 6

end
