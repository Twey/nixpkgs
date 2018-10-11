  azure-mgmt-storage = buildPythonPackage rec {
    version = "0.20.0";
    name = "azure-mgmt-storage-${version}";
    src = pkgs.fetchurl {
      url = mirror://pypi/a/azure-mgmt-storage/azure-mgmt-storage-0.20.0.zip;
      sha256 = "16iw7hqhq97vlzfwixarfnirc60l5mz951p57brpcwyylphl3yim";
    };
    preConfigure = ''
      # Patch to make this package work on requests >= 2.11.x
      # CAN BE REMOVED ON NEXT PACKAGE UPDATE
      sed -i 's|len(request_content)|str(len(request_content))|' azure/mgmt/storage/storagemanagement.py
    '';
    postInstall = ''
      echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/__init__.py
      echo "__import__('pkg_resources').declare_namespace(__name__)" >> "$out/lib/${python.libPrefix}"/site-packages/azure/mgmt/__init__.py
    '';
    propagatedBuildInputs = with self; [ azure-mgmt-common ];
    meta = {
      description = "Microsoft Azure SDK for Python";
      homepage = "https://azure.microsoft.com/en-us/develop/python/";
      license = licenses.asl20;
      maintainers = with maintainers; [ olcai ];
    };
  };
