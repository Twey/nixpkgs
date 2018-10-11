{ lib, python, isPyPy, buildPythonPackage, fetchPypi, azure-nspkg }:
buildPythonPackage rec {
  pname = "azure-common";
  version = "1.1.16";
  disabled = isPyPy;
  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1c5vp6w0393s1z540hbicqmc1biyw3pw4bmrcmlh7h41zxvsw1i6";
  };
  propagatedBuildInputs = [ azure-nspkg ];
  postInstall = ''
    echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/__init__.py
  '';
  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ olcai ];
  };
}
