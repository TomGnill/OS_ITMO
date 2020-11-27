
namespace Lab_no3
{
    enum Attributes
    {
        ATTR_READ_ONLY = 0x01,
        ATTR_HIDDEN = 0x02,

        ATTR_SYSTEM = 0x04,

        ATTR_VOLUME_ID = 0x08,
        ATTR_DIRECTORY = 0x10,
        ATTR_ARCHIVE = 0x20,
        ATTR_LONG_NAME = ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID
    }
    class DirEntry
    {
        public char[] Name = new char[8];
        public char[] Extension = new char[3];
        public byte Attr;
        public byte NTRes = 0x00;
        public byte CrtTimeTenth;
        public ushort CrtTime;
        public ushort CrtDate;
        public ushort LastAccDate;
        public ushort FstClusHI;
        public ushort WrtTime;
        public ushort WrtDate;
        public ushort FstClusLO;
        public uint FileSize;

        public DirEntry(string name)
        {

        }
    }

}

