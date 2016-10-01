From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 1 Oct 2016 22:40:59 +0200
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
Message-ID: <CAFBinCAA9J4o2cs4ruSuPRH4qK6izDoxJCneE=Uogk0c+_DSkQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Oct 1, 2016 at 10:15 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Wed, Sep 14, 2016 at 5:30 PM, Giuseppe CAVALLARO
> <peppe.cavallaro@st.com> wrote:
>> Also you could check the AXI tuning and PBL value. To be honest
>> (thinking about your problem) I can actually suspect some related
>> problem on bus setup. So I suggest you to play with these value
>> (better if you ask for having values from HW validation on your side).
>> Otherwise the stmmac uses a default that cannot be good for your
>> platform. For example, sometime I have seen that PBL is better if
>> reduced to 8 instead of 32 and w/o 4xPBL...
> unfortunately the original kernel/firmware shipped with my device
> seems to be also affected by that TX bug, so comparing with the
> "stock" values does not work for me.
I tried the following changes:
- snps,pbl = <4>; in .dts
- snps,pbl = <2>; in .dts
- snps,pbl = <8>; in .dts and disabled DMA_BUS_MODE_MAXPBL (= 4xPBL) in stmmac

None of these seem to have any impact on the TX problem
-------------- next part --------------
A non-text attachment was scrubbed...
Name: meson-stmmac-pbl.patch
Type: text/x-patch
Size: 1012 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161001/8e44374c/attachment.bin>
