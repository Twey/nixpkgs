{ lib
, python
, buildPythonPackage
, fetchPypi
, jsonschema
, futures
, dateutil
, requests
, azure-common
}:
let
  wheel = buildPythonPackage rec {
    pname = "wheel";
    version = "0.30.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "1j2knvhzgv71yli5nw6fxn87rrdxsx2xw8ldn28gs8z8jh5gw5cm";
    };

    propagatedBuildInputs = [ jsonschema ];

    # No tests in archive
    doCheck = false;

    # We add this flag to ignore the copy installed by bootstrapped-pip
    installFlags = [ "--ignore-installed" ];

    meta = {
      description = "A built-package format for Python";
      license = with lib.licenses; [ mit ];
      homepage = https://bitbucket.org/pypa/wheel/;
    };
  };
in buildPythonPackage rec {
  version = "0.36.0";
  pname = "azure-storage";
  src = fetchPypi {
    inherit pname version;
    sha256 = "0pyasfxkin6j8j00qmky7d9cvpxgis4fi9bscgclj6yrpvf14qpv";
  };
  propagatedBuildInputs = [ azure-common futures dateutil requests ];
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
