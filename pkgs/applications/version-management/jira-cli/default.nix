{ stdenv, buildPythonPackage, fetchPypi, pythonPackages }:

buildPythonPackage rec {
  pname = "jira-cli";
  version = "2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "04miwdmva7j4aqacfs1r760kbxkix1ygs8h1j6zlwfaiv3aihh9i";
  };

  propagatedBuildInputs = with pythonPackages;
  [
    jira
    termcolor
    suds-jurko
    keyring
    keyrings-alt
  ];

  # tries to use the Internet
  doCheck = false;

  patchPhase = ''
    sed -i '/^argparse.*/d' requirements/main.txt
  '';

  meta = with stdenv.lib; {
    description = "Command line utility to interact with your jira instance";
    homepage = https://github.com/alisaifee/jira-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ twey ];
  };
}
