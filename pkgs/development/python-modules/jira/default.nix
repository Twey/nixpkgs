{ stdenv, buildPythonPackage, fetchPypi, pythonPackages }:

buildPythonPackage rec {
  pname = "jira";
  version = "1.0.15";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1s3z85kn3s29qbas8b5j2fjal1pf14npy170skamil0dbcfql410";
  };

  propagatedBuildInputs = with pythonPackages;
  [ requests requests-toolbelt requests_oauthlib pbr ordereddict defusedxml  ];

  # uses parameters that don't seem to be recognized by nix_run_setup
  doCheck = false;

  patchPhase = ''
    sed -i '/^argparse.*/d' requirements.txt
  '';

  meta = with stdenv.lib; {
    description = "Eases the use of the JIRA REST API from Python";
    homepage = https://github.com/pycontribs/jira;
    license = licenses.bsd2;
    maintainers = with maintainers; [ twey ];
  };
}
