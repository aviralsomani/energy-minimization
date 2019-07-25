function [x0] = retraction(x, f, gradf, val)
    t0 = 0;
    [t0,~] = newton(@ret1, @dret1, t0, 0.0001, 1500);
    t0 = t0(size(t0,2));
    gfx = gradf(x);
    x0 = x + t0 * gfx';
    
    function v = ret1(t)
        gx = gradf(x);
        if isnan(gx)
            return
        end
        v = f(x + t*gx') - val;
    end
    function df_t = dret1(t)
        gradfx = gradf(x);
        df_t = gradf(x + t * val)'*gradfx;
        if isnan(df_t)
            return
        end
    end
end