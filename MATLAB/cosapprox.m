function [ sinu1, cosu1 ] = cosapproxd(u1)
persistent coscoefs
if(isempty(coscoefs))
    coscoefs = gencoscoefs;
end

u1t = uint32(u1*2^16);
quadrant = floor(u1t/(2^14));
xcos = mod(u1t,2^14);
cos_index = floor(xcos/(2^7));
sin_index = cos_index;
xbcos = double(mod(xcos,2^7));
xbsin = xbcos;
x_max = 127;

if(quadrant == 1 || quadrant == 3)
    xbcos = x_max-xbcos;
    cos_index = x_max-cos_index;
    
end
if(quadrant == 0 || quadrant == 2)
    xbsin = x_max-xbsin;
    sin_index = x_max-sin_index;
end
cos_index = cos_index
sin_index = sin_index
cosu1 = coscoefs(cos_index, 1)*xbcos + coscoefs(cos_index, 2);
sinu1 = coscoefs(sin_index, 1)*xbsin + coscoefs(sin_index, 2);

if(quadrant == 1 || quadrant == 2)
    cosu1 = -cosu1;
end
if(quadrant == 2 || quadrant == 3)
    sinu1 = -sinu1;
end

end
