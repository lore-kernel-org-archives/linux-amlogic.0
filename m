Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6841C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9681421530
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sHh5PS9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9681421530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NiODd5rEI1yITXZFcXxNVWTZzYsC6kCqNyN7h/er6b4=; b=sHh5PS9UmuvpamcjNlseERhffp
	92EFiyTCtbHwPM0YCyAhI1WBn3J8PyV8UutpXo1LFKi6SGltqpvw5fjz7k1qOveikaMZ12tmpYvMT
	qUeFhFjzfFGOYYE18gUw9qUSUhYyNABjsQKHmubXZA2GOLiu88kJCUDmJ8rLJkmvu7ionj+NB2Zkf
	m05lA6WxXa4zMWBVtinhLZ+l4WvaBG4/m8umewlT4wEV6WOR0gKyY3PRy8BP5CVlXnEtuiaabR0V+
	oM+vAQGCHzt36sc6SEm67RbQMl9pYxdCDmhP5ASM/lWxr+BmxD3aiOIo/UaJzKMhnySiSmbaFUgq5
	mYwnIvUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpl-0001Om-35; Sat, 27 Apr 2019 12:53:37 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpD-0000er-UR
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:09 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mspy4-1gVqbE43aa-00tCHb; Sat, 27 Apr 2019 14:52:37 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/41] drivers: tty: serial: dz: fix use fix bare 'unsigned'
Date: Sat, 27 Apr 2019 14:51:45 +0200
Message-Id: <1556369542-13247-5-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:CBJBinnswYpZ8Sdk7wFOAsULywVOOhB0O51QI1ZS6aG2XtvP5Ax
 rUdddfq4rw+u/9EFqOQzXc3/JM5V7fsK23L/z85bPCOANxd2GuzAoLWyurSK9Ii+GNlroRp
 D+hqD+3RuR/9qgEHat/Ucs2oZfFOYySxVG+wr6Q+wrWn6MY4YELLqYiMi6+Z1GHMHZ9Sbi6
 A0dnBU9i+mqDN3d/fmLxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MH/lZafoCx0=:C6VQMV1HsKH9OxnmfiwWwi
 ls6ASJ0mneciKIXS+1V+wSxBJcpan2IpZ08XLTD6SYv7YXOIMII1L/KWbG0T9oFUOLphs/Fg3
 l2AlwPRiDgZqonUsBVKpGTsKSv27ETHk1u8CP6XiFhZ9cNW2T3FLm/M/RZiJJEVU+b4hat+oG
 V/t5hoDjxIiN6XeMIGY3ZKep3tzRsiG+Yf5WrxF7xmHK3ns0GM3BNTiW1nXz2EqwNDtGAyeZq
 Vvqo3PBXcwPXiB6IUXXnKOdfKgojhgqctY7SufpZAYrm+1D2LBSe3PgUHcGQeS6y3DDBI1EER
 ik2lMkxjtSrUzyrZhTKgo1kjcSBthFwMG5B29FUWZC9SlsTzEYflKLY1mlrZ/DBKrktMH6+KG
 e3fXGk80CchhUtjMmL7Eyykp3o924p2zhQIBYAL0puuxE6/cYR/3HyeTlGe42KZuMH9EZn0+g
 n/3ogS9RFBh7aesoWqrAsTgXRq6ILeiUjg/9gPYWefwJguOeS1NTOW2WOOrphR2Dfrcvy72gC
 mu2hsdgjoNnA4njyhs3XxuFnlYyWLsuBOT3jqHXTTXDPK9vFMOFSfp50AeuB6lwEo12Rxs0Ip
 8eo0NdOrxwE+PMaT+iD6IJzKHMvoTFwflMb6JOcc69Pg8tOMFpOm2QWk0WlCbVyrrlaOAVFD2
 JxVH/iny2tox/lLVNnjx1smE1j9T7d7BKieB2e6XjF/H3MzZFm2Qw/hD3pnmYq+Kcy8sdTENK
 uVS7NH13R3Km3ewXsX6v4Ea4yuju79Q+cCDxjQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055304_338065_EC2CD1C1 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix checkpatch warnings:

    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
    #103: FILE: dz.c:103:
    +static u16 dz_in(struct dz_port *dport, unsigned offset)

    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
    #110: FILE: dz.c:110:
    +static void dz_out(struct dz_port *dport, unsigned offset, u16 value)

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index b3e9313..559d076 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -100,14 +100,14 @@ static inline struct dz_port *to_dport(struct uart_port *uport)
  * ------------------------------------------------------------
  */
 
-static u16 dz_in(struct dz_port *dport, unsigned offset)
+static u16 dz_in(struct dz_port *dport, unsigned int offset)
 {
 	void __iomem *addr = dport->port.membase + offset;
 
 	return readw(addr);
 }
 
-static void dz_out(struct dz_port *dport, unsigned offset, u16 value)
+static void dz_out(struct dz_port *dport, unsigned int offset, u16 value)
 {
 	void __iomem *addr = dport->port.membase + offset;
 
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
