{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, dateutil
, futures
, pyopenssl
, requests
, azure-cosmosdb-table
}:
buildPythonPackage rec {
  pname = "azure";
  version = "4.0.0";

  disabled = pythonOlder "2.7";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0l0frn0klq4lsx2g2ab0gijyqzii498srkqb76ly3zyc5wrzlskx";
  };

  propagatedBuildInputs = [
    dateutil futures pyopenssl requests azure-cosmosdb-table
  ];

  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ olcai ];
  };
}
