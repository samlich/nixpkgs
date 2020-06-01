{ lib, fetchFromGitHub, python38Packages }:

python38Packages.buildPythonPackage rec {
  pname = "PubChemPy";
  version = "1.0.4";
  
  src = fetchFromGitHub {
    owner = "mcs07";
    repo = "PubChemPy";
    rev = "v${version}";
    sha256 = "0rmrhsvnqv11s8p01bbi0mfvzxyasjda5zbb0cpwgjlk49vavgxf";
  };

  # manifest references nonexistant pubchempy_test
  # https://github.com/mcs07/PubChemPy/issues/45
  doCheck = false;
  
  nativeBuildInputs = with python38Packages; [
    pytest
  ];
  
  propagatedBuildInputs = with python38Packages; [
    pandas
  ];

  meta = with lib; {
    homepage = "https://github.com/mcs07/PubChemPy";
    license = licenses.mit;
    description = "Python wrapper for the PubChem PUG REST API";
    longDescription = ''
PubChemPy provides a way to interact with PubChem in Python. It allows chemical searches by name, substructure and similarity, chemical standardization, conversion between chemical file formats, depiction and retrieval of chemical properties.
    '';
  };
}
  
