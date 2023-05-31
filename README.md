I am using boost::filesystem to loop over files in a directory and conditionally delete them.  It works in boost 1.71 but not in boost 1.74.  Is this a bug or am I doing something wrong?  What is the recommended way to iterate over a directory and delete files?

    $ git clone https://github.com/captain-igloo/boost-filesystem-bug.git

    $ cd boost-filesystem-bug

    $ docker build -t focal  -f focal.Dockerfile  .

    $ docker build -t jammy  -f jammy.Dockerfile  .

    # boost 1.71, files deleted
    $ docker run -it focal /test-boost/a.out
    "/tmp/b"
    filesystem::recursive_directory_iterator directory error: No such file or directory
    "/tmp/a"
    filesystem::recursive_directory_iterator directory error: No such file or directory
    "/tmp/c"
    filesystem::recursive_directory_iterator directory error: No such file or directory

    # boost 1.74, first file deleted, then crashes
    $ docker run -it jammy  /test-boost/a.out
    "/tmp/b"
    filesystem::recursive_directory_iterator increment error: No such file or directory
    a.out: /usr/include/boost/filesystem/directory.hpp:534: void boost::filesystem::recursive_directory_iterator::disable_recursion_pending(bool): Assertion `(!is_end())&&("disable_recursion_pending() on end recursive_directory_iterator")' failed.
