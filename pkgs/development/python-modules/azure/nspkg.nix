{ lib, buildPythonPackage, fetchPypi }:
buildPythonPackage rec {
  pname = "azure-nspkg";
  version = "3.0.2";
  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1l4xwdh0fcnvrv0mzig4g2kgqkfbsy64zjm1ggc6grk3mykcxlz7";
  };
  meta = {
    description = "Microsoft Azure namespace package for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ olcai ];
  };
}
