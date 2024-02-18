%% Calculate x, y, and z positions for atoms with alternating layer structure and voids
clear all


num_rows = 5;  % Set the desired number of rows here
num_layers = 5;
dp = 2;
gap_odd_rows = 2;
xmin = 0;
xmax = 10;
ymin = 0;
ymax = 10;
zmin = 0;
zmax = 10;
box_size = xmax - xmin;
atom_count = 1;


%% Calculate total number of atoms (considering dynamic layer counts)
for k = 1:num_layers
    for i = 1:num_rows
        x_offset = 1;
         if mod(k, 2) == 1 & mod(i,2) == 1
             num_atoms_per_row(i) = floor(box_size / (2 * dp));
             x_offset = x_offset + gap_odd_rows;
         elseif mod(k, 2) == 1 & mod(i,2) == 0
             num_atoms_per_row(i) = floor(box_size / (dp));
         elseif mod(k, 2) == 0 & mod(i,2) == 1
             num_atoms_per_row(i) = 0;
         elseif mod(k, 2) == 0 & mod(i,2) == 0
             num_atoms_per_row(i) = floor(box_size / (2 * dp));
             x_offset = x_offset + gap_odd_rows;
         end
         for j = 1:num_atoms_per_row(i)
             if mod(k, 2) == 1 & mod(i,2) == 1
                x = xmin + (j - 1) * (dp) + x_offset; 
                x_offset = x_offset + gap_odd_rows;
             elseif mod(k, 2) == 1 & mod(i,2) == 0
                x = xmin + (j - 1) * (dp) + x_offset;
             elseif mod(k, 2) == 0 & mod(i,2) == 1
                x = 0; 
             elseif mod(k, 2) == 0 & mod(i,2) == 0
                x = xmin + (j - 1) * (dp) + x_offset;
                x_offset = x_offset + gap_odd_rows;
             end
             y = ymin + (i - 1) * dp + 1;
             z = zmin + (k - 1) * dp + 1;
             atom_data(atom_count, :) = [atom_count, 1, x, y, z, 1, atom_count];
             atom_count = atom_count + 1;
         end
    end
end                
% Display or use the calculated atom_data
disp(atom_data);

%% Bond data section (adjust for specific interactions)





