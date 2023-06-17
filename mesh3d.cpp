#include "itkBinaryMask3DMeshSource.h"
#include "itkImageFileReader.h"
#include "itkMeshFileWriter.h"

int isoSurfaceMeshWriter(std::string inputFileName, std::string outFileName)
{
  constexpr unsigned int Dimension = 3;
//  using PixelType = unsigned char;
  using PixelType = double;
  using ImageType = itk::Image<PixelType, Dimension>;

  using ReaderType = itk::ImageFileReader<ImageType>;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(inputFileName);

  try
  {
    reader->Update();
  }
  catch (itk::ExceptionObject & ex)
  {
    std::cout << ex << std::endl;
    return EXIT_FAILURE;
  }

  using MeshType = itk::Mesh<double, Dimension>;

  using FilterType = itk::BinaryMask3DMeshSource<ImageType, MeshType>;
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput(reader->GetOutput());
//  filter->SetObjectValue(255);
  filter->SetObjectValue( 1 );
  filter->Update();

  using WriterType = itk::MeshFileWriter<MeshType>;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(outFileName);
  writer->SetInput(filter->GetOutput());
  try
  {
    writer->Update();
  }
  catch (itk::ExceptionObject & error)
  {
    std::cerr << "Error: " << error << std::endl;
    return EXIT_FAILURE;
  }

  return EXIT_SUCCESS;
}

int main(int argc, char *argv[])
{
  if (argc < 3)
  {
    std::cerr << "Usage: " << argv[0] << " <inputImage> <outputMesh>" << std::endl;
    return EXIT_FAILURE;
  }
  return isoSurfaceMeshWriter(argv[1], argv[2]);
}

