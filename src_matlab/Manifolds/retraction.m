function [x0] = retraction(x, f, gradf, val)
    t0 = 0;
    [t0,~] = newton(@ret1, @dret1, t0, 0.0001, 1500);
    t0 = t0(size(t0,2));
    if ~isnan(t0)
        gfx = gradf(x);
        x0 = x + t0 * gfx';
    else
        n = 10000;
        d = f(x);
        delD = abs((d-val)/n);
        j = 0;
        if d > val
            for j = 1:n
                t0 = 0;
                [t0,~] = newton(@ret2, @dret1, t0, 0.0001, 1500);
                t0 = t0(size(t0,2));
                gfx = gradf(x);
%                 if isnan(t0)
%                     disp('t0 nan')
%                 end
                x0 = x + t0 * gfx';
            end
        else
            for j = 1:n
                t0 = 0;
                [t0,~] = newton(@ret3, @dret1, t0, 0.0001, 1500);
                t0 = t0(size(t0,2));
%                 if isnan(t0)
%                     disp('t0 nan')
%                 end
                gfx = gradf(x);
                x0 = x + t0 * gfx';
            end
        end
    end
    
    function v = ret1(t)
        v = f(x + t*gradf(x)') - val;
    end
    function v = ret2(t)
        v = f(x + t * gradf(x)') - (d-j*delD);
    end
    function v = ret3(t)
        v = f(x + t * gradf(x)') - (d+j*delD);
    end
    function df_t = dret1(t)
        gradfx = gradf(x);
        df_t = gradf(x + t * val)'*gradfx;
    end
end