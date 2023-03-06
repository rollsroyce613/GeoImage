function [RMSE] = objFun(parameter_process_0, t_observed, temp_observed)

    a = parameter_process_0(1); % T_steady
    b = parameter_process_0(2); % r_divide_B
    c = parameter_process_0(3); % A
    d = besselk(0,b); % 第二类0阶贝塞尔函数

    % 温度计算公式参考：des Tombe et al. (2019) 
    for i = 1:size(t_observed,2)

        t = t_observed(i);
        fun1 = @(s) exp(-s-((b^2)/4./s))./s; % 井函数自变量
        w_1(i) = integral(fun1,c/t,inf);
        temp_computed(i) = a*w_1(i)/2/d;
        temp_computed(1) = 0;

    end

    % 观测曲线和计算曲线之间的不适宜度，其中1:36为舍去光缆护套影响的时间，3 h
    RMSE = sqrt(sum((temp_computed(36:end)-temp_observed(36:end)).^2)/size(temp_observed(36:end),2));

end