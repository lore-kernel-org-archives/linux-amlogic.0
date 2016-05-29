From: trini@konsulko.com (Tom Rini)
Date: Sun, 29 May 2016 13:09:03 -0400
Subject: [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
In-Reply-To: <20160529163814.GB21309@mephisto>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <20160529163814.GB21309@mephisto>
Message-ID: <20160529170903.GV7419@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 29, 2016 at 06:38:14PM +0200, Carlo Caione wrote:
> On 08/05/16 08:30, Beniamino Galvani wrote:
> > Hi,
> > 
> > this series adds a very basic support for Amlogic S905 SoC (GXBaby)
> > and for the ODROID-C2 board [1], and is based on u-boot sources
> > available from the board vendor [2]. At the moment the only supported
> > devices are the integrated UART and Ethernet adapter.
> 
> Hey guys,
> what's left for this patchset to be merged?

Good timing.  I've got this locally and just need to finish my unit
tests before I can merge.  But, due to the DM PR I've had to disable eth
as you'll need to address GPIO for this platform next.  Thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160529/af097ebe/attachment.sig>
