module enumeration();

typedef enum {R, G, B} color;               // int color
typedef enum {a = 1, b = 2, c = 3} abc;
typedef enum {J = 2, K, L} jkl;             // J = 2, K = 3, L = 4
typedef enum {M, N = 4, O} mno;             // M = 0, N = 4, O = 5
typedef enum bit[1:0] {r, e, d} red;        // bit[1:0] red
typedef enum int {Q = 0, S = 1, T = 2} qst;       

color color_r;
color color_g;
color color_b;

abc abc_a;
abc abc_b;
abc abc_c;

jkl jkl_j;
jkl jkl_k;
jkl jkl_l;

mno mno_m;
mno mno_n;
mno mno_o;

red red_r;
red red_e;
red red_d;

qst qst_q;
qst qst_s;
qst qst_t;

initial
    begin
        color_r = R;
        color_g = G;
        color_b = B;

        if(color_r == R) $display("Color %0s: %0d", color_r.name(), color_r);
        if(color_g == G) $display("Color %0s: %0d", color_g.name(), color_g);
        if(color_b == B) $display("Color %0s: %0d", color_b.name(), color_b);

        abc_a = a;
        abc_b = b;
        abc_c = c;

        if(abc_a == a) $display("%0s: %0d", abc_a.name(), abc_a);
        if(abc_b == b) $display("%0s: %0d", abc_b.name(), abc_b);
        if(abc_c == c) $display("%0s: %0d", abc_c.name(), abc_c);

        jkl_j = J;
        jkl_k = K;
        jkl_l = L;

        if(jkl_j == J) $display("%0s: %0d", jkl_j.name(), jkl_j);
        if(jkl_k == K) $display("%0s: %0d", jkl_k.name(), jkl_k);
        if(jkl_l == L) $display("%0s: %0d", jkl_l.name(), jkl_l);

        mno_m = M;
        mno_n = N;
        mno_o = O;

        if(mno_m == M) $display("%0s: %0d", mno_m.name(), mno_m);
        if(mno_n == N) $display("%0s: %0d", mno_n.name(), mno_n);
        if(mno_o == O) $display("%0s: %0d", mno_o.name(), mno_o);

        red_r = r;
        red_e = e;
        red_d = d;

        if(red_r == r) $display("%0s: %0d", red_r.name(), red_r);
        if(red_e == e) $display("%0s: %0d", red_e.name(), red_e);
        if(red_d == d) $display("%0s: %0d", red_d.name(), red_d);

        qst_q = Q;
        qst_s = S;
        qst_t = T;

        if(qst_q == Q) $display("%0s: %0d", qst_q.name(), qst_q);
        if(qst_s == S) $display("%0s: %0d", qst_s.name(), qst_s);
        if(qst_t == T) $display("%0s: %0d", qst_t.name(), qst_t);
    end

endmodule