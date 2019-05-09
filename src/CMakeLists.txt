# CMake file to build mfnwt executable

set(SOURCE
  de47_NWT.f
  gwf2bas7_NWT.f
  gwf2bcf7.f
  gwf2chd7.f
  gwf2drn7_NWT.f
  gwf2drt7.f
  gwf2ets7.f
  gwf2evt7.f
  gwf2fhb7.f
  gwf2gag7.f
  gwf2ghb7_NWT.f
  gwf2hfb7_NWT.f
  gwf2huf7.f
  gwf2hydmod7.f
  gwf2ibs7.f
  gwf2lak7_NWT.f
  gwf2lpf7.f
  gwf2mnw17_NWT.f
  gwf2mnw27_NWT.f
  gwf2mnw2i7.f
  gwf2rch7.f
  gwf2res7.f
  gwf2riv7_NWT.f
  gwf2sfr7_NWT.f
  gwf2str7.f
  gwf2sub7_NWT.f
  gwf2swi27.f
  gwf2swr7.f
  gwf2swr7util.f
  gwf2swt7.f
  gwf2upw1.f
  gwf2uzf1_NWT.f
  gwf2wel7_NWT.f
  gwflakmodule_NWT.f
  gwfsfrmodule_NWT.f
  gwfuzfmodule_NWT.f
  hufutl7.f
  lmt8_NWT.f
  mach_mod.f90
  MF_NWT.f
  mhc7.f
  modules.f90
  nogmg.f
  NWT1_gmres.f90
  NWT1_ilupc_mod.f90
  NWT1_module.f
  NWT1_solver.f
  NWT1_xmd.f
  NWT1_xmdlib.f
  obs2bas7.f
  obs2chd7.f
  obs2drn7.f
  obs2ghb7.f
  obs2riv7.f
  obs2str7.f
  parutl7.f
  pcg7_NWT.f
  sip7_NWT.f
  utl7.f
)

add_executable(mfnwt ${SOURCE})
target_compile_options(mfnwt
  PRIVATE ${Fortran_WARN_FLAGS}
  PRIVATE ${Fortran_BUILD_FLAGS}
)

write_openspec_inc(openspec.inc mfnwt)

install(TARGETS mfnwt
  RUNTIME DESTINATION bin
)
