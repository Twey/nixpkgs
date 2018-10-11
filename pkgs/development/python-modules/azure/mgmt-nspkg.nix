azure-mgmt-nspkg = buildPythonPackage rec {
  version = "1.0.0";
  name = "azure-mgmt-nspkg-${version}";
  src = pkgs.fetchurl {
    url = mirror://pypi/a/azure-mgmt-nspkg/azure-mgmt-nspkg-1.0.0.zip;
    sha256 = "1rq92fj3kvnqkk18596dybw0kvhgscvc6cd8hp1dhy3wrkqnhwmq";
  };
  propagatedBuildInputs = with self; [ azure-nspkg ];
  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = licenses.asl20;
    maintainers = with maintainers; [ olcai ];
  };
};
