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

    # Test binary boundary search
    X_target = -13
    fun = x -> x > X_target
    err = 0.1
    x_range = [-17, 84]
    X = binary_boundary_search(fun, x_range, err)
    @test abs(X_target - X) < err
    
    # Target is outside of the range to the left
    fun = x -> x > -100
    X = binary_boundary_search(fun, x_range, err)
    @test X == x_range[1]

    # Target is outside of the range to the right
    fun = x -> x > 100
    X = binary_boundary_search(fun, x_range, err)
    @test X == x_range[2]

    # r2_score
    x = [1, 2, 3]
    y = [3, 5, 1]
    R2 = r2_score(x, y)
    @test R2 ≈ -7.5

    x = [0, 4, 5]
    y = [1, 2, 3]
    R2 = r2_score(x, y)
    @test R2 ≈ 1-9/14

    x = [0, 1, -8]
    y = [0, 1, -8]
    R2 = r2_score(x, y)
    @test R2 ≈ 1

    # ptp
    x = [1 5 -1 7; 4 0 -5 0]
    @test ptp(x) ≈ 12
    @test ptp(x; dims=2) ≈ [8; 9]

    # smooth
    y = [-2, -5, 1, -1, 3, 0, 6]
    yy = smooth(y)
    @test all(yy .≈ [-2, -2, -0.8, -0.4, 1.8, 3, 6])

    yy = smooth(y, 1)
    @test all(yy .≈ [-2, -5, 1, -1, 3, 0, 6])

    yy = smooth(y, 100)
    @test all(yy .≈ [-2, -2, -0.8, 0.2857142857142857, 1.8, 3, 6])

end
