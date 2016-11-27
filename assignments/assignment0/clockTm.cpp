#include <iostream>
#include <chrono>
#include<ctime>
#include<ratio>
using namespace std;
int main ()
{

  chrono::high_resolution_clock::time_point t1 = chrono::high_resolution_clock::now();
  std::cout << "printing out 1000 stars...\n";
  for (int i=0; i<1000; ++i) std::cout << "*";
  std::cout << std::endl;

  chrono::high_resolution_clock::time_point t2 = chrono::high_resolution_clock::now();

  //chrono::duration<chrono::milliseconds>
  auto time_span = chrono::duration_cast<chrono::double>(t2 - t1);

  std::cout << "It took me " << time_span.count() << " milliseconds.";
  std::cout << std::endl;

  return 0;
}
