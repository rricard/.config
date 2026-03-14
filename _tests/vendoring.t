Vendoring -- extracts a tarball to the target directory:

  $ mkdir fake-pkg && echo "hello from fake" > fake-pkg/fakefile.txt
  $ tar -czf fake-pkg.tar.gz fake-pkg
  $ printf 'out/mypkg file://%s/fake-pkg.tar.gz\n' "$(pwd)" > pkgs.txt
  $ VENDORING_ROOT="$(pwd)" sh "$TESTDIR/../_vendoring/update.sh" pkgs.txt > /dev/null
  $ cat out/mypkg/fakefile.txt
  hello from fake

Vendoring -- handles multiple packages in one manifest:

  $ mkdir fake-pkg2 && echo "pkg2 content" > fake-pkg2/pkg2file.txt
  $ tar -czf fake-pkg2.tar.gz fake-pkg2
  $ printf 'out/pkg1 file://%s/fake-pkg.tar.gz\nout/pkg2 file://%s/fake-pkg2.tar.gz\n' "$(pwd)" "$(pwd)" > pkgs2.txt
  $ VENDORING_ROOT="$(pwd)" sh "$TESTDIR/../_vendoring/update.sh" pkgs2.txt > /dev/null
  $ cat out/pkg1/fakefile.txt
  hello from fake
  $ cat out/pkg2/pkg2file.txt
  pkg2 content

Vendoring -- skips comment lines:

  $ printf '# comment\nout/pkg3 file://%s/fake-pkg.tar.gz\n' "$(pwd)" > pkgs3.txt
  $ VENDORING_ROOT="$(pwd)" sh "$TESTDIR/../_vendoring/update.sh" pkgs3.txt > /dev/null
  $ cat out/pkg3/fakefile.txt
  hello from fake
