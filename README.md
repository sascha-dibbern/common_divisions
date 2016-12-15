# common_divisions

# DESCRIPTION

"common_divisions" is a generic CFEngine3 based library, where promises-files are structured as divisions for usage under CFDivisions.

CFDivisions is a CFEngine3 module for organizing promises in a modular and goal intention based structure.
( See more about [CFDivisions](https://github.com/sascha-dibbern/CFDivisions) )

# INSTALLATION

The content of "common_divisions" can be copied into the CFEngine path $(sys.workdir)/master/common_divisions on a machine acting as CFEngine hub.

## Enabling divisions

Modify $(sys.workdir)/master/promises.cf by adding:

  bundle common divisions
  {
    classes:
      # Non-verbose cfdivisions-run
      !cfdivisions_verbose::
        "common_divisions" 
          expression => usemodule (
            "cfdivisions",
             "--library=common_divisions --namespace=common_divisions --inputs_path=$(sys.workdir)/inputs"
          );

      # Verbose cfdivisions-run
      cfdivisions_verbose::
        "common_divisions" 
          expression => usemodule (
            "cfdivisions",
              "--library=common_divisions --namespace=common_divisions --inputs_path=$(sys.workdir)/inputs --verbose"
          );
  }

and modify in "body common control" the "inputs"- and "bundlesequence"-definitions to contain the generated variables from the execution of the "cfdivisions" module. 

body common control
{


      inputs => {
                 ...
                 "services/main.cf",

                 # Divisions 
                 @(cfdivisions.cfdivisions_common_divisions_inputs),

                ...
      };

      bundlesequence => {
                         ...

                         main,
			  
                         # Divisions 
                         @(cfdivisions.cfdivisions_common_divisions_bundlesequence),

                        ...
      };
}

## Enable documentation for divisions

CFDivisions can generate POD and man3 documentation from divisions this divisions-library.

  bundle common divisions
  {
    classes:
      ...

      # Cfdivisions documentation-run
      cfdivisions_documentation::
        "common_divisions_documentation" 
          expression => usemodule (
            "cfdivisionsdoc",
            "--library=common_divisions --namespace=common_divisions --inputs_path=$(sys.workdir)/inputs"
          );
      ...
  }

# LICENSE

See LICENSE file.

# AUTHORS

 *  Sascha Dibbern [http://sascha.dibbern.info/](http://sascha.dibbern.info/)
    (email: sascha at dibbern.info)

