{ stdenv, buildPythonPackage, fetchPypi, pythonPackages }:

buildPythonPackage rec {
  pname = "hiro";
  version = "0.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "077s97fzm0scmp60vhyskgbx2jqyqz2jmh1j04ylrwkp633dmnap";
  };

  propagatedBuildInputs = [ pythonPackages.six ];
  checkInputs = [ pythonPackages.mock ];

  #patchPhase = ''
  #  sed -i '/^argparse.*/d' requirements/main.txt
  #'';

  meta = with stdenv.lib; {
    description = "Hijacks a few commonly used time functions to allow time manipulation";
    homepage = http://hiro.readthedocs.org/;
    license = licenses.mit;
    maintainers = with maintainers; [ twey ];
  };
}
