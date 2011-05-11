

                      MODFLOW-NWT - Version: 1.0
                  Newton Formulation for MODFLOW-2005


NOTE: Any use of trade, product or firm names is for descriptive purposes 
      only and does not imply endorsement by the U.S. Government.

MODFLOW-NWT version 1.0 is packaged for personal computers using one of the 
Microsoft Windows operating systems. Executable files for personal 
computers are provided as well as the source code. The executable files were 
compiled on a personal computer with the Intel(R) Core(TM)2Duo CPU T9500 
chipset, running the Microsoft Windows XP Professional operating system, 
using the Microsoft Visual Studio 2008 Version 9.0.21022.8 development
environment and the Intel(R) Visual Fortran Version 12.0.3470.2008 compiler. 
The source code is provided to aid users in compilation on 
other computers. However, no support is provided for compilation.

IMPORTANT: Users should review the file Summary_MODFLOW-NWT.txt for a description
of, and references for, this software. Users should also review the file 
release.txt, which describes changes that have been introduced into MODFLOW-NWT
with each official release; these changes may substantially affect users.

Instructions for installation, execution, and testing of this version of
MODFLOW-NWT are provided below.



                            TABLE OF CONTENTS

                         A. DISTRIBUTION FILE
                         B. INSTALLING
                         C. EXECUTING THE SOFTWARE
                         D. TESTING
                         E. COMPILING


A. DISTRIBUTION FILE

The following self-extracting distribution file is for use on personal
computers:

         MODFLOW-NWT_1.0.exe

The distribution file contains:

          Executables and source code for MODFLOW-NWT.
          MODFLOW-NWT documentation.
          Four MODFLOW-NWT sample problems.

The distribution file is a self-extracting program.  Execution of the
distribution file creates numerous individual files.  The extraction
program allows you to specify the directory in which the files should
be restored.  The default installation directory is C:\WRDAPP.  You
have the opportunity to specify an alternate installation directory
during extraction of the software. The following directory structure
will be created in the installation directory:


   |
   |--MODFLOW-NWT_1.0
   |    |--bin           ; Compiled MODFLOW-NWT executables for personal computers
   |    |--data          ; Sample problems
   |    |--doc           ; Documentation report for MODFLOW-NWT
   |    |--MODFLOW-NWT   ; Visual Studio project files
   |    |--output_test   ; Output files from running the sample problems
   |    |--src           ; Source code for MODFLOW-NWT

Included in directory MODFLOW-NWT_1.0\doc is the MODFLOW-NWT documentation 
report, which is a Portable Document Format (PDF) file. The PDF file is 
readable and printable on various computer platforms using Acrobat Reader 
from Adobe. The Acrobat Reader is freely available from the following World
Wide Web site:
      http://www.adobe.com/


B. INSTALLING

To make the executable versions of MODFLOW-NWT accessible from any
directory, the directory containing the executables (MODFLOW-NWT_1.0\bin)
should be included in the PATH environment variable (see explanation below).  

As an alternative, the executable files, MODFLOW-NWT.exe and MODFLOW-NWT_64.exe, 
in the MODFLOW-NWT_1.0\bin directory can be copied into a directory already
included in the PATH environment variable.

       HOW TO ADD TO THE PATH ENVIRONMENT VARIABLE
          WINDOWS 9 X AND WINDOWS ME SYSTEMS
          
Add the following line to the AUTOEXEC.BAT file:

  PATH=%PATH%;C:\WRDAPP\MODFLOW-NWT_1.0\bin

Note, reboot your system after modifying AUTOEXEC.BAT.


       HOW TO ADD TO THE PATH ENVIRONMENT VARIABLE
               WINDOWS NT SYSTEMS

From the Start menu, select Settings and then Control Panel.  Double click
System and select the Environment tab. To add a new user variable, enter
"PATH" in the Variable field and enter

   %PATH%;C:\WRDAPP\MODFLOW-NWT_1.0\bin

in the Value field.  Click Set and then click OK.  If a PATH user variable
already is defined, click on it in the User Variables pane, add
";C:\WRDAPP\MODFLOW-NWT_1.0\bin" to its definition in the Value field, and click
OK.  Initiate and use a new Windows Command Prompt window after making this
change.


       HOW TO ADD TO THE PATH ENVIRONMENT VARIABLE
             WINDOWS 2000 OR XP SYSTEMS
             
From the Start menu, select Settings and then Control Panel.  Double click
System and select the Advanced tab.  Click on Environment Variables.  If
a PATH user variable already is defined, click on it in the User Variables
pane, then click Edit.  In the Edit User Variable window, add
";C:\WRDAPP\MODFLOW-NWT_1.0\bin" to the end of the Variable Value (ensure that
the current contents of the User Value are not deleted) and click OK.  If
a PATH user variable is not already defined, in the User variables pane of
the Environment Variables window, click New.  In the New User Variable
window, define a new variable PATH as shown above.  Click OK.  Click OK
in the Environment Variables window and again in the System Properties
window.  Initiate and use a new Windows Command Prompt window.


C. EXECUTING THE SOFTWARE

A 32 bit and a 64 bit executable are provided in the MODFLOW-NWT_1.0\bin  
directory. Two executables are provided because computers often use either  
the 32 bit Windows XP or the 64 bit Windows 7 operating systems. Large 
simulations may not run on a 32 bit operating system due to limitations 
in the amount of available random access memory (RAM). A 64 bit operating
system provides much more available RAM than a 32 bit operating system. 
Thus, it is recommended that a 64 bit executable be used on a 64 bit operating  
system for large simulations.   

After the executable files in the MODFLOW-NWT_1.0\bin directory are installed in
a directory that is included in your PATH, MODFLOW-NWT is initiated in
a Windows Command-Prompt window using the commands:

      MODFLOW-NWT.exe [Fname]

or
      MODFLOW-NWT_64.exe [Fname]

The optional Fname argument is the name of the MODFLOW-NWT Name File.

The data arrays in MODFLOW-NWT are dynamically allocated, so models are not
limited by hard-coded array limits. However, it is best to have at least 
2 MB of RAM available to hold all of the required data. If there is 
less available RAM than the model requires, which depends on the size of the 
application, the program will use virtual memory; however, this can
slow execution significantly. If there is insufficient RAM to run
the model, then MODFLOW-NWT will not initiate the beginning of the 
simulation; however, the Windows Command-Prompt window may continue to 
indicate that MODFLOW-NWT is executing. For this circumstance, the program 
must be terminated manually using the Windows Task Manager application.

Some of the files written by MODFLOW-NWT are unformatted files. The structure
of these files depends on the compiler and options in the Fortran write
statement.  MODFLOW-NWT is compiled with the unformatted file type specified
as "BINARY". Any program that reads the unformatted files produced by
MODFLOW-NWT must be compiled with a compiler that produces programs that
use the same structure for unformatted files.  For example, Zonebudget
and Modpath use unformatted budget files produced by MODFLOW-NWT.  
Another example is head files that are generated by one MODFLOW-NWT
simulation and used in a following simulation as initial heads.  Both 
simulations must be run using an executable version of MODFLOW-NWT that uses 
the same unformatted file structure.


D. TESTING

Four sample problems with MODFLOW-NWT data sets are provided to verify that  
MODFLOW-NWT is correctly installed and running on the system.  The sample 
problems also may be looked at as examples of how to use the program. A 
description of the file structure for the sample problems and of directions for
running the problems are described in the 'Readme.examples.txt' file located in 
directory MODFLOW-NWT_1.0\data.


E. COMPILING

The executable files provided in MODFLOW-NWT_1.0\bin were created using the Intel  
Visual Fortran 12.0 compiler. Although executable versions of the program are  
provided, the source code also is provided in the MODFLOW-NWT_1.0\src directory so 
that MODFLOW-NWT can be recompiled if necessary. However, the USGS cannot provide  
assistance to those compiling MODFLOW-NWT.
