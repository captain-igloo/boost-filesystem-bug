#include <iostream>
#include <boost/filesystem.hpp>

int main() {
    boost::filesystem::path path("/tmp");
    boost::filesystem::recursive_directory_iterator it(path), ite;
    while(it != ite) {
        if (!boost::filesystem::is_directory(*it)) {
            std::cout << it->path() << std::endl;
            boost::filesystem::remove(it->path());
        }
        try {
            ++it;
        } catch(std::exception& e) {
            std::cout << e.what() << std::endl;
            it.no_push();
            ++it;
        }
    }
    return 0;
}
