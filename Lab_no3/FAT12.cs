using System.IO;

namespace Lab_no3
{
    public class FAT12 : ICreateIMG
    {
        BiosParametersBlock bpb;
        FAT1216BootSector bs;

        public FAT12(ushort bytspersec, ushort rootentcnt, ushort totsec16, ushort numheads, ushort totsec32)
        {
            bpb = new BiosParametersBlock(bytspersec, rootentcnt, totsec16, numheads, totsec32);
            bs = new FAT1216BootSector("FAT12   ");
            Mount("image.img", 2 ^ 23);
        }

       public void Mount(string filename, long Size)
       {
            var fs = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
            fs.SetLength(Size);
            bpb.WriteFat(fs);

            var cs = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
            cs.SetLength(Size);
            bs.continueBuild(cs);
       }
    }
}