individual_percentage = zeros(1, 5);
thrust = [125, 125, 150, 320, 320]*10^3;
for i = 1:5
   s = sum(abs(u_actual.Data(:, i))); 
   [n_samples, not_rel] = size(u_actual.Data(:, i));
   average_thrust = s/n_samples;
   individual_percentage(i) = (average_thrust*100)/thrust(i); 
end
total_average = sum(individual_percentage)/5; 
u_mean = [u_mean total_average]; 