using System;
using System.IO;

namespace Lab_no3
{
    class Program
    {
        static void Main(string[] args)
        {
            FAT12 fat12 = new FAT12(512, 2, 4000, 2, 0);
        }
    }
}
