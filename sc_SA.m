T0=100;
Tmin=0.01;
T=T0;

ans_a=0;
ans_b=0;
ans_l=1.1;
ans_c=0;
now_a=ans_a;
now_b=ans_b;
now_l=ans_l;
now_c=ans_c;

ans_val=calc_dis(ans_a,ans_b,ans_l,ans_c);
now_ans=ans_val;


while (T>Tmin)
    for i=1:200
        tmp_a=now_a;
        tmp_b=now_b;
        tmp_l=now_l;
        tmp_c=now_c;
        loc=rand;
        if loc<0.25 
            if rand<0.5
                tmp_a=tmp_a+0.01;
            else
                tmp_a=tmp_a-0.01;
            end
        else
            if loc<0.5
                if rand<0.5
                    tmp_b=tmp_b+0.01;
                else
                    tmp_b=tmp_b-0.01;
                end 
            else
                if loc<0.75
                  if rand<0.5
                      tmp_l=tmp_l+0.1;
                  else
                    tmp_l=tmp_l-0.1;
                  end
                else
                    if rand<0.5
                      tmp_c=tmp_c+0.01;
                    else
                    tmp_c=tmp_c-0.01;
                    end
                end
              end
        end
        if ((tmp_a<(-pi/2)) || (tmp_a>(pi/2)) )
            continue;
        end
        if ((tmp_b<(-1163*pi/9000)) || (tmp_b>(1163*pi/9000)) )
            continue;
        end
        if ((tmp_l<1) || (tmp_l>4) )
            continue;
        end
        if ((tmp_c<(-pi)) || (tmp_c>pi) )
            continue;
        end
        tmp_ans=calc_dis(tmp_a,tmp_b,tmp_l,tmp_c);
        
        if tmp_ans<now_ans
            now_ans=tmp_ans;
            now_a=tmp_a;
            now_b=tmp_b;
            now_l=tmp_l;
            now_c=tmp_c;
            if (now_ans<ans_val)
                ans_val=now_ans;
                ans_a=now_a;
                ans_b=now_b;
                ans_l=now_l;
                ans_c=now_c;
            end
        else
            if rand()<exp((now_ans-tmp_ans)/T)
                now_ans=tmp_ans;
                now_a=tmp_a;
                now_b=tmp_b;
                now_l=tmp_l;
                now_c=tmp_c;
            end
        end
    end
    T=T*0.99;
end

ans_a
ans_b
ans_l
ans_c
ans_val
