
using System;
using System.IO;
using System.Text;

namespace Lab_no3
{

   public class FAT1216BootSector
    {
        public byte DrvNum = 0x80;             //part0
        public byte Rsvd = 0x00;               //part1
        public byte Sign = 0x29;               //part2
        public uint VolID;                     //part3
        public string VolLbl = "NO NAME    ";  //part4
        public string FilSysType;              //part5
        public byte[] BootCode = new byte[448];//part6
        public ushort BootSign = 0xAA45;       //part7
     



        public FAT1216BootSector(string filsystype)
        {
            FilSysType = filsystype;

            VolID = 100;//Convert.ToUInt32(DateTime.Now.ToString());
            for (int i = 0; i < BootCode.Length; i++)

            {
                BootCode[i] = 0x00;
            }
        }


        public void continueBuild(FileStream stream)
        {
            using (stream)
            {
                byte[] хуй = new byte[512];
                byte[] part3 = BitConverter.GetBytes(VolID);
                byte[] part4 = Encoding.ASCII.GetBytes(VolLbl);
                byte[] part5 = Encoding.ASCII.GetBytes(FilSysType);
                byte[] part7 = BitConverter.GetBytes(BootSign);
                int offset = 34;


                System.Buffer.SetByte(хуй, offset + 1, DrvNum);
                offset += 1;

                System.Buffer.SetByte(хуй, offset + 1, Rsvd);
                offset += 1;

                System.Buffer.SetByte(хуй, offset + 1, Sign);
                offset += 1;

                System.Buffer.BlockCopy(part3, 0, хуй, offset, part3.Length);
                offset += part3.Length;

                System.Buffer.BlockCopy(part4, 0, хуй, offset, part4.Length);
                offset += part4.Length;

                System.Buffer.BlockCopy(part5, 0, хуй, offset, part5.Length);
                offset += part5.Length;

                System.Buffer.BlockCopy(BootCode, 0, хуй, offset, BootCode.Length);
                offset += BootCode.Length;

                System.Buffer.BlockCopy(part7, 0, хуй, offset, part7.Length);
                offset += part7.Length;
                stream.Seek(34, SeekOrigin.Begin);
                stream.Write(хуй, 0, хуй.Length);
            }
        }
    }

   public class FAT32BootSector
    {
        public uint FATsz32;         //part0
        public ushort ExtFlags;      //part1
        public ushort FSVer = 0;     //part2
        public uint RootClus = 2;    //part3
        public ushort FSInfo = 1;    //part4
        public ushort BkBootSec = 6; //part5
        public byte[] Reserved = new byte[12];//part6
        public byte DrvNum = 0x80;   //part7
        public byte Rsvd = 0x00;     //part8
        public byte Sign = 0x29;     //part9
        public uint VolID;           //part10
        public string VolLbl = "NO NAME    ";//part11
        public string FilSysType;    //part12
        public byte[] BootCode = new byte[420];//part13
        public ushort BootSign = 0xAA45;//part14


        public FAT32BootSector(string filsystype)
        {
            VolID = Convert.ToUInt32(DateTime.Now.ToString());
            FilSysType = filsystype;

            for (int i = 0; i < Reserved.Length; i++)

            {
                Reserved[i] = 0x00;
            }
            for (int i = 0; i < BootCode.Length; i++)
            {
                BootCode[i] = 0x00;
            }
        }


        public FileStream continueBuild(FileStream stream)
        {
            using (stream)
            {
                byte[] хуй = new byte[34];

            }

            return stream;
        }
    }
}

