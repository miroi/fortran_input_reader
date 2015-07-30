import os
import sys
import subprocess
import shlex
import shutil
import sys
import time
import datetime

HERE = os.path.abspath(os.path.dirname(__file__))

# ------------------------------------------------------------------------------


def exe(command):
    """
    Executes command and returns string representations of stdout and stderr captured from the console.
    When universal_newlines=True stdout and stderr are opened in text mode.
    Otherwise, they are opened in binary mode. In that case captured stdout and stderr
    are not strings and Python 3 throws type error when compared against strings later in tests.
    Note:
    This feature is only available if Python is built with universal newline support (the default).
    Also, the newlines attribute of the file objects stdout, stdin and stderr are not updated by the
    communicate() method.
    See https://docs.python.org/2/library/subprocess.html
    """
    stdout, stderr = subprocess.Popen(shlex.split(command),
                                      stdout=subprocess.PIPE,
                                      stderr=subprocess.PIPE,
                                      universal_newlines=True).communicate()

    if stderr:

        sys.stderr.write(stderr)

    return stdout, stderr

# ------------------------------------------------------------------------------


def configure_build_and_exe(name, setup_command):

    stamp = datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d-%H-%M-%S')

    os.chdir(os.path.join(HERE, name))

    if sys.platform == 'win32':
        setup_command += ' --generator="MinGW Makefiles"'

    setup_command += ' build-%s' % stamp

    stdout, stderr = exe(setup_command)

    os.chdir(os.path.join(HERE, name, 'build-%s' % stamp))

    if sys.platform == 'win32':
        stdout, stderr = exe('mingw32-make')
        shutil.copy('..\src\examples\EXAMPLE.INP', 'bin\EXAMPLE.INP')
        os.chdir('bin')
        stdout, stderr = exe('example1.exe')
    else:
        stdout, stderr = exe('make')
        shutil.copy('../src/examples/EXAMPLE.INP', 'bin/EXAMPLE.INP')
        os.chdir('bin')
        stdout, stderr = exe('./example1')

    return stdout, stderr

# ------------------------------------------------------------------------------


def test_examples():
    stdout, stderr = configure_build_and_exe('', 'python setup.py --fc=gfortran')
    assert 'Hello World!' in stdout
