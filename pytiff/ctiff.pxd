from libcpp.string cimport string

cdef extern from "tiffio.h":
  # structs
  cdef struct tiff:
    pass
  ctypedef struct TIFF:
    pass

  # typedefs
  ctypedef unsigned int ttag_t
  ctypedef unsigned int ttile_t
  ctypedef int tsize_t
  ctypedef void* tdata_t
  ctypedef unsigned short tsample_t
  ctypedef unsigned short tdir_t
  ctypedef unsigned int ttile_t
  ctypedef unsigned int tstrip_t
  # functions
  # general functions
  string TIFFGetVersion()
  int TIFFGetField(TIFF*, ttag_t, ...)
  TIFF* TIFFOpen(const char*, const char*)
  void TIFFClose(TIFF*)
  tsize_t TIFFReadTile(TIFF* tif, tdata_t buf, unsigned int x, unsigned int y, unsigned int z, tsample_t sample)
  int TIFFReadScanline(TIFF* tif, tdata_t buf, unsigned int row, tsample_t sample)
  ttile_t TIFFNumberOfTiles(TIFF* tif)
  tstrip_t TIFFNumberOfStrips(TIFF* tif)
  # directory functions
  tdir_t TIFFCurrentDirectory(TIFF* tif)
  int TIFFSetDirectory(TIFF* tif, tdir_t dir)
  int TIFFReadDirectory(TIFF* tif)
  tdir_t TIFFNumberOfDirectories(TIFF* tiff)
  #RGBA functions
  int TIFFReadRGBAImage(TIFF* tif, unsigned int width, unsigned int height, unsigned int* raster, int stopOnError)
  int TIFFReadRGBATile(TIFF* tif, unsigned int x, unsigned int y, unsigned int* raster)
  unsigned short TIFFGetR(unsigned int pixel)
  unsigned short TIFFGetG(unsigned int pixel)
  unsigned short TIFFGetB(unsigned int pixel)
  unsigned short TIFFGetA(unsigned int pixel)
