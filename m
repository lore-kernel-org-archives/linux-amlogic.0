Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E586AC43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DE5208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRcACRWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7DE5208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nbmSW8yZkqM8krUaEXKcG6soWbPZbvAtW79EIAv9Qgo=; b=nRcACRWIdnqdpy/pi2vu+6tb1n
	V00RNgA5MGw0gD17+CMECJw1I2JYco820p5uTIGjox9Zt6afXCaPfHZLFU4FSFLvt3giWG1ci6cEh
	DG6LfcomPIwhJGbUMgyVW8nOHDAplPk6hlnjTowgJbDKEoyWv0rQ/OjLXZTYGwxZdSw3e/kgujZFk
	pCwrqw/twqCQqAUTvcOXMF6Mk/fYc9fSkFrPSEdaDGqbsxZhLWJNWPIMe8hXat5UHfkkTyqDFm02n
	Fy8rhVUjjVhcTxCAE+1d+XqH3iyIfRj3wc4hYU3608EjsElXqZ3XpO7BM2ke7bjvcS0ro/hBlPzh+
	ShQexhkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqM-0002Og-83; Sat, 27 Apr 2019 12:54:14 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpS-0000zv-Rg
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:31 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N79q8-1ghy553AGC-017Rst; Sat, 27 Apr 2019 14:53:03 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 35/41] drivers: tty: serial: 8250: add mapsize to platform data
Date: Sat, 27 Apr 2019 14:52:16 +0200
Message-Id: <1556369542-13247-36-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:JcK0nmXUqvVZov6FpygbFCYx2SBIMbt8YBo1Pyu7lLXpjQoFRY+
 pUU91A2VFsC0opVj58fPkR0Q6FJXQi2dkc/wvSXJs1UuyFbz9fA4rXDWaSqNdJmI+Ni3NVN
 GCHT5mxv7iA219z7s0oyXnMLdcGAYrX/sQa9g9+0osWcxqkU8TBbfxVPdIH8z0lkkec4VUA
 Jy3EMpSULncwPlRSUSCNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKE131FklXQ=:N+5TupvitkXMK24q5/jyxA
 sIX3ic5BD+uHPAGs20GJwkwPl9UDpk0TIanYdXumBoGIe0pn8xQHfMNAGWo6dzwFRYczrf7xW
 TxJABWtuVu+JiQ10VmrYJ6qbGD6m4TbE/uBc0upnH9JxQ1cVsfzzBmwiGXmmAaK657CfdpoPS
 Fz7U84teAYYbICi2O4GD/aLJ8uzK2AiOYExJtogutwoUfYQhEeqnt1MAK5B8+inbvVsZudb+l
 JJHjzlpoU/Oc+93FvVVMaymuIzy9f5R5gZGyofQ18Ch3DkihSAI67zUaYRbcl98qsSoKBF0qU
 0Bi3tP98ckrPEa8aT6/eEbWNDmQIaMq18HS/MVAYgP0Spig/t1UW2ix047NzAc3r2ovU57cD/
 m3113f332KKSzj3AKd4QtXe9A+c95IFcsbX/8ZcEtEUh4OjJicZ9FooqDctilf0RHzaAa2R0C
 rBL1UlQkiaGPBiXr/zXerWVeQj+YNsmUc6K/CvV8fuooCj8sZm9wrLZ8jVV/8DBx0EmiKK0FQ
 FMksN9EPcLIzrmxsrW7WAaj8ObKHty46EJiN+qpvZ7NIRTVKtyKeC7eYev77pxyv6ynBQwIto
 XvolrpgZ5uald3Dm9wAVwKn9K+v7AhEHQZv/NkEVcxJbA6C5VQ4xHu1nfwLeN8MtF/mnGnkCL
 7eovd4m1Pa0fyY2AFdvo5Xvee3L7sL7797X+E77dYhJ60wioVIWdRHlMcJMcL86pG4RtHQe3Y
 1TtyyEi0bqAfCKemGdUTrRo5E1LDoLRshCvoXw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055319_810534_D077382C 
X-CRM114-Status: GOOD (  10.82  )
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

Adding a mapsize field for the 8250 port platform data struct,
so we can now set the resource size (eg. *1) and don't need
funny runtime detections like serial8250_port_size() anymore.

For now, serial8250_port_size() is called everytime we need
the io resource size. That function checks which chip we
actually have and returns the appropriate size. This approach
is a bit clumpsy and not entirely easy to understand, and
it's a violation of layers :p

Obviously, that information cannot change after the driver init,
so we can safely do that probing once on driver init and just
use the stored value later.

*1) arch/mips/alchemy/common/platform.c

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/8250/8250_core.c | 1 +
 include/linux/serial_8250.h         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index e441221..71a398b 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -814,6 +814,7 @@ static int serial8250_probe(struct platform_device *dev)
 		uart.port.iotype	= p->iotype;
 		uart.port.flags		= p->flags;
 		uart.port.mapbase	= p->mapbase;
+		uart.port.mapsize	= p->mapsize;
 		uart.port.hub6		= p->hub6;
 		uart.port.private_data	= p->private_data;
 		uart.port.type		= p->type;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 5a655ba..8b8183a 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -22,6 +22,7 @@ struct plat_serial8250_port {
 	unsigned long	iobase;		/* io base address */
 	void __iomem	*membase;	/* ioremap cookie or NULL */
 	resource_size_t	mapbase;	/* resource base */
+	resource_size_t	mapsize;	/* resource size */
 	unsigned int	irq;		/* interrupt number */
 	unsigned long	irqflags;	/* request_irq flags */
 	unsigned int	uartclk;	/* UART clock rate */
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
