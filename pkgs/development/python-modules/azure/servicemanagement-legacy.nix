{ python, buildPythonPackage, fetchPypi, azure-common, requests }:
azure-servicemanagement-legacy = buildPythonPackage rec {
  version = "0.20.1";
  name = "azure-servicemanagement-legacy-${version}";
  src = pkgs.fetchurl {
    url = mirror://pypi/a/azure-servicemanagement-legacy/azure-servicemanagement-legacy-0.20.1.zip;
    sha256 = "17dwrp99sx5x9cm4vldkaxhki9gbd6dlafa0lpr2n92xhh2838zs";
  };
  propagatedBuildInputs = with self; [ azure-common requests ];
  postInstall = ''
    echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/__init__.py
  '';
  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://azure.microsoft.com/en-us/develop/python/";
    license = licenses.asl20;
    maintainers = with maintainers; [ olcai ];
  };
};
