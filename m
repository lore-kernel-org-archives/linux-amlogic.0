From: wsa@the-dreams.de (Wolfram Sang)
Date: Fri, 8 Jul 2016 10:39:01 +0900
Subject: [PATCH v2] i2c: meson: allow build with COMPILE_TEST
In-Reply-To: <1467836225-2427-1-git-send-email-ben-linux@fluff.org>
References: <1467836225-2427-1-git-send-email-ben-linux@fluff.org>
Message-ID: <20160708013901.GB10192@tetsubishi>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Jul 06, 2016 at 09:17:05PM +0100, Ben Dooks wrote:
> This driver should be buildable with COMPILE_TEST so
> add this to the dependency for it.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Care to explain why the first one was better? A bit confused here...

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160708/a857a19d/attachment.sig>
