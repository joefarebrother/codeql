using System.IO;

namespace Semmle.Extraction
{
    public abstract class UnlabelledEntity : Entity
    {
        protected UnlabelledEntity(Context cx) : base(cx)
        {
            cx.AddFreshLabel(this);
        }

        public sealed override void WriteId(TextWriter writer)
        {
            writer.Write('*');
        }

        public sealed override void WriteQuotedId(TextWriter writer)
        {
            WriteId(writer);
        }
    }
}
