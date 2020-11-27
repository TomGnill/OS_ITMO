using System;
using System.IO;
using System.Text;

namespace Lab_no3
{
    class BiosParametersBlock
    {
        public byte[] jmpBoot = { 235, 60, 144 }; //part0
        public string OEMname = "MSWIN4.1"; //part1
        public ushort BytsPerSec;           //part2
        public byte SecPerClus;             //part3
        public ushort RsvdSecCnt;           //part4
        public byte NumFATs = 2;            //part5
        public ushort RootEntCnt;           //part6
        public ushort TotSec16;             //part7
        public byte Media = 0xF8;           //part8
        public ushort FATSz16;              //part9
        public ushort SecPerTrk;            //part10
        public ushort NumHeads;             //part11
        public ushort HiddSec;              //part12
        public uint TotSec32;               //part13

      
        public BiosParametersBlock(ushort bytspersec, ushort rootentcnt, ushort totsec16, ushort numheads, ushort totsec32)
        {
            BytsPerSec = bytspersec;
            SecPerClus = (byte)(32768 / bytspersec);
            RootEntCnt = rootentcnt;
            TotSec16 = totsec16;
            NumHeads = numheads;
            TotSec32 = totsec32;
        }

        public void WriteFat(FileStream newStream)
        {
            using (newStream)
            {
                byte[] хуй = new byte[34];
                byte[] part1 = Encoding.ASCII.GetBytes(OEMname);
                byte[] part2 = BitConverter.GetBytes(BytsPerSec);
                byte[] part4 = BitConverter.GetBytes(RsvdSecCnt);
                byte[] part6 = BitConverter.GetBytes(RootEntCnt);
                byte[] part7 = BitConverter.GetBytes(TotSec16);
                byte[] part9 = BitConverter.GetBytes(FATSz16);
                byte[] part10 = BitConverter.GetBytes(SecPerTrk);
                byte[] part11 = BitConverter.GetBytes(NumHeads);
                byte[] part12 = BitConverter.GetBytes(HiddSec);
                byte[] part13 = BitConverter.GetBytes(TotSec32);

                int offset = 0;

                System.Buffer.BlockCopy(jmpBoot, 0, хуй, 0, jmpBoot.Length);
                offset += jmpBoot.Length;

                System.Buffer.BlockCopy(part1, 0, хуй, offset, part1.Length);
                offset += part1.Length;

                System.Buffer.BlockCopy(part2, 0, хуй, offset, part2.Length);
                offset += part2.Length;

                System.Buffer.SetByte(хуй, offset + 1, SecPerClus);
                offset += 1;

                System.Buffer.BlockCopy(part4, 0, хуй, offset, part4.Length);
                offset += part4.Length;

                System.Buffer.SetByte(хуй, offset + 1, NumFATs);
                offset += 1;

                System.Buffer.BlockCopy(part6, 0, хуй, offset, part6.Length);
                offset += part6.Length;

                System.Buffer.BlockCopy(part7, 0, хуй, offset, part7.Length);
                offset += part7.Length;

                System.Buffer.SetByte(хуй, offset + 1, Media);
                offset += 1;

                System.Buffer.BlockCopy(part9, 0, хуй, offset, part9.Length);
                offset += part9.Length;

                System.Buffer.BlockCopy(part10, 0, хуй, offset, part10.Length);
                offset += part10.Length;

                System.Buffer.BlockCopy(part11, 0, хуй, offset, part11.Length);
                offset += part11.Length;

                System.Buffer.BlockCopy(part12, 0, хуй, offset, part12.Length);
                offset += part12.Length;

                System.Buffer.BlockCopy(part13, 0, хуй, offset, part13.Length);

                newStream.Write(хуй, 0, хуй.Length);
            }
        }
    } 
   
}
