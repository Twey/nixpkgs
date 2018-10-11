{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, azure-nspkg
}:
buildPythonPackage rec {
  pname = "azure-storage-nspkg";
  version = "3.0.0";

  disabled = pythonOlder "2.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rmlsdfnrzgvqkmbmkwwmy2gk8ap60dpw4i5h239brn07301alw5";
  };

  propagatedBuildInputs = [ azure-nspkg ];

  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ olcai ];
  };
}
