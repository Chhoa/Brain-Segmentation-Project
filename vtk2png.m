module load matlab
addpath('/project/mang/chhoa/vtk_toolboxML')
vtkfile='/project/mang/data/ADNI_test_mesh_comparison/029_S_0824/binary_LV_029_S_0824_2007-09-14_10_07_16.0_MALPEM_mesh.vtk';
vtkdata=vtkRead(vtkfile);
slice_index=1;
vtk2d=vtkdata.data(:, :, slice_index);
pngfile = 'output_image.png';
imwrite(vtk2d, pngfile);
