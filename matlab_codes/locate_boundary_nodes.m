function d_known = locate_boundary_nodes(BC)
    node                = BC(:,1);
    dx                  = BC(:,4);
    dy                  = BC(:,5);
    loc_x               = logical(BC(:,2));
    loc_y               = logical(BC(:,3));
    nodes_dx            = node(loc_x);
    nodes_dy            = node(loc_y);
    dpx                 = dx(loc_x);
    dpy                 = dy(loc_y);
    Ndx                 = length(node_dx);
    Ndy                 = length(node_dy);
    N                   = Ndx + Ndy;
    nodes_dp            = zeros(N,1);
    dp                  = zeros(N,1);
    nodes_dp(1:Ndx,1)   = 2*nodes_dx - 1;
    nodes_dp(Ndx+1:N,1) = 2*nodes_dy;
    dp(1:Ndx,1)         = dpx;
    dp(Ndx+1:N,1)       = dpy;
    d_known             = [nodes_dp;dp];
end