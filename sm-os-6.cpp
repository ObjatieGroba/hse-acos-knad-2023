#include <vector>
#include <iostream>
#include <unistd.h>
#include <thread>
#include <atomic>
#include <mutex>
#include <condition_variable>

struct Client {
    /// ID, NAME...
    int balance = 100;
//    std::mutex mx;
};

std::vector<Client> clients(100);
std::mutex mx;
std::condition_variable cv;

void func(std::mutex &mx1, std::mutex &mx2);

void trans(size_t i, size_t j, int k) {
    std::unique_lock lock(mx);
//    mx.lock();
//    std::unique_lock locki(clients[std::min(i, j)].mx);
//    std::unique_lock lockj(clients[std::max(i, j)].mx);
//    std::lock(clients[i].mx, clients[j].mx);

//    for (auto it = mutexes.begin(); it != mutexts.end(); ++it) {
//        if (!(*it).try_lock()) {
//            --it;
//            while (it != mutexes.begin()) {
//                (*it).unlock();
//            }
//            (*it).unlock();
//        }
//    }

    while (clients[i].balance < k) {
        cv.wait(lock);
    }
    clients[i].balance -= k;
    clients[j].balance += k;

    cv.notify_all();

//    clients[i].mx.unlock();
//    clients[j].mx.unlock();
//    mx.unlock();
}

void process(size_t i, size_t j) {
    for (size_t _ = 0; _ != 10000; ++_) {
        trans(i, j, 10);
    }
}

int main() {
    std::thread t1([]() {
        process(0, 1);
    });
    std::thread t2([]() {
        process(1, 0);
    });
    t1.join();
    t2.join();
    std::cout << clients[0].balance << ' ' << clients[1].balance << std::endl;
}
