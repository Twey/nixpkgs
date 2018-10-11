{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, dateutil
, futures
, pyopenssl
, requests
, azure-nspkg
}:
buildPythonPackage rec {
  pname = "azure-cosmosdb-nspkg";
  version = "2.0.2";

  disabled = pythonOlder "2.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1n4wl1dr18sy5rjvlss9vh5mrqxqbr4a7iskqrjrm3c1jbk93xmc";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  meta = {
    description = "Microsoft Azure CosmosDB Table SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ twey ];
  };
}
