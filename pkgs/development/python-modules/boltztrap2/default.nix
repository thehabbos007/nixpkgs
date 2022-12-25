{ lib
, buildPythonPackage
, fetchPypi
, spglib
, numpy
, scipy
, matplotlib
, ase
, netcdf4
, pytest
, pythonOlder
, cython
, cmake
}:

buildPythonPackage rec {
  pname = "boltztrap2";
  version = "22.12.1";
  format = "setuptools";

  disabled = pythonOlder "3.5";

  src = fetchPypi {
    pname = "BoltzTraP2";
    inherit version;
    hash = "sha256-gzjWAMUJcF5AyDS1Qx7opVbYewaqGgmFMDGWCh/2Wz4=";
  };

  dontUseCmakeConfigure = true;

  nativeBuildInputs = [
    cmake
    cython
  ];

  propagatedBuildInputs = [
    spglib
    numpy
    scipy
    matplotlib
    ase
    netcdf4
  ];

  # pypi release does no include files for tests
  doCheck = false;

  pythonImportsCheck = [
    "BoltzTraP2"
  ];

  meta = with lib; {
    description = "Band-structure interpolator and transport coefficient calculator";
    homepage = "http://www.boltztrap.org/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ costrouc ];
  };
}
