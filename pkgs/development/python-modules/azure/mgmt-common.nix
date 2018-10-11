azure-mgmt-common = buildPythonPackage rec {
  version = "0.20.0";
  name = "azure-mgmt-common-${version}";
  src = pkgs.fetchurl {
    url = mirror://pypi/a/azure-mgmt-common/azure-mgmt-common-0.20.0.zip;
    sha256 = "1rmzpz3733wv31rsnqpdy4bbafvk5dhbqx7q0xf62dlz7p0i4f66";
  };
  propagatedBuildInputs = with self; [ azure-common azure-mgmt-nspkg requests ];
  postInstall = ''
    echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/__init__.py
    echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/mgmt/__init__.py
  '';
  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = licenses.asl20;
    maintainers = with maintainers; [ olcai ];
  };
};
