{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, futures
, azure-cosmosdb-nspkg
, azure-common
, azure-storage
, azure-storage-common
}:
buildPythonPackage rec {
  pname = "azure-cosmosdb-table";
  version = "1.0.5";

  disabled = pythonOlder "2.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0i81iikkrdjkck4jqm76xsf1wdb7p4549x0i70mgqsh3jb3w4d2a";
  };

  propagatedBuildInputs = [
    futures
    azure-cosmosdb-nspkg
    azure-common
    azure-storage-common
  ];

  testInputs = [ azure-storage ];

  meta = {
    description = "Microsoft Azure CosmosDB Table SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ twey ];
  };
}
