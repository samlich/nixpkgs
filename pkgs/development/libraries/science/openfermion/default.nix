{ lib, fetchFromGitHub, python38Packages }:

python38Packages.buildPythonPackage rec {
  pname = "OpenFermion";
  version = "0.11.0";
  
  src = fetchFromGitHub {
    owner = "quantumlib";
    repo = "OpenFermion";
    rev = "v${version}";
    sha256 = "1i6cszzmfbcg43xfk1g87m78s8wzyh3fcwk54lbwry1mxcpcgx7y";
  };

  nativeBuildInputs = with python38Packages; [
    pytest
  ];
  
  propagatedBuildInputs = with python38Packages; [
    numpy
    scipy
    h5py
    networkx
    pubchempy
    requests
  ];

  meta = with lib; {
    homepage = "https://github.com/quantumlib/OpenFermion";
    license = licenses.asl20;
    description = "The electronic structure package for quantum computers";
    longDescription = ''
OpenFermion is an open source library for compiling and analyzing quantum algorithms to simulate fermionic systems, including quantum chemistry. Among other functionalities, this version features data structures and tools for obtaining and manipulating representations of fermionic and qubit Hamiltonians. For more information, see our release paper https://arxiv.org/abs/1710.07629.
    '';
  };
}
  
