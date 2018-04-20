{ stdenv, buildPythonPackage, fetchPypi, pythonPackages, isPy3k }:

buildPythonPackage rec {
  pname = "keyrings.alt";
  version = "2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "19l5mlr5n70997xx9zkmbgx77xzjmb48ymmh4s4knh8vkxpbsf7l";
  };

  propagatedBuildInputs = with pythonPackages;
  [
    six
  ];

  # gets confused under Python 2.x
  doCheck = isPy3k;

  #patchPhase = ''
  #  sed -i '/^argparse.*/d' requirements/main.txt
  #'';

  meta = with stdenv.lib; {
    description = "Alternate keyring backend implementations for use with the keyring package";
    homepage = https://github.com/jaraco/keyrings.alt;
    license = licenses.mit;
    maintainers = with maintainers; [ twey ];
  };
}
