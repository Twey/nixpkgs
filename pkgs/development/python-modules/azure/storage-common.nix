{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, dateutil
# , futures
, requests
, azure-common
, azure-storage-nspkg
}:
buildPythonPackage rec {
  pname = "azure-storage-common";
  version = "1.3.0";

  disabled = pythonOlder "2.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0k00fzrqjz5jqz160d06qcbjx4pgd6m6jakkhni47s44qzmmhmjq";
  };

  propagatedBuildInputs = [
    requests
    dateutil
    azure-common
    azure-storage-nspkg
  ];

  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ olcai ];
  };
}
