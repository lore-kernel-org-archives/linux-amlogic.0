Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0C0C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC28E208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIGkRRLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC28E208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nG8dLpHQoze21xVaiOl93FvRlgXzApWuEAeGed1U7Gw=; b=QIGkRRLu7bmbBzHTu+R1ngeIg5
	QmcKhJYEPmAs05jFDUggbf3Os7mahm0hr+M8V3mZcnr9SKKTTckpZ1c8CB26osoOJXB5gDnVnzeo9
	2Rjvsny7bZgWS207vSGHow+Dxf4THv/Bihy4STi/1IFhkWMCzhzgyIP0kGke99VNmaAy6z2C49ikC
	JdO70kLP6c95ShH7pLqvPfZS5BXsaSQHb3I/8ZRbQb65IrvQOj5FfEg8tHTMNkFV3/ae2plaGBJcd
	QpgqpZ4Ij+ZPNOVsYRcutuvHNOltsj3FMxqTGDPeGZrWrZ0xBhGmjy71bq0//doYrev0IVWb5ywCt
	13alRvzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqT-0002ZZ-19; Sat, 27 Apr 2019 12:54:21 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpY-00018v-H9
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:33 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4bA6-1hJp7z0BBm-001m7B; Sat, 27 Apr 2019 14:53:09 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 41/41] drivers: tty: serial: lpc32xx_hs: fill mapsize and use
 it
Date: Sat, 27 Apr 2019 14:52:22 +0200
Message-Id: <1556369542-13247-42-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:NfvV5UR6Ok9kQv6ROMSW720NbVRt8zJA2j6SiVCta9zO0Jw5F68
 oDYmpeAiqIZsk1sS86lqn4+pdFZWevIEnEZ69zvk7cMJbxGvaG9S0AMXx6E3vAMZVzd7pPE
 dnjPcyK+WGDDc90Ms7ezLEUDc+ruGvc0EkFIZ+8daJJAv3bsvnnSUMXjXwFBnPEgLp6qoWu
 RKq97jOfEVGzQSAvfA3Lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kstkQConv8Y=:FRqaAKBl04WQWWJ/xhmytR
 ow68932EyMejNE2ydtWTf0Nk48WsWDBX+U00qXQiCeX9RLfuAjZhJilURAne8iEvlgV02R+n0
 A2GYXlH6RAocA+3/XNEogage/GN6dO4HAMa6C/jwf7JzbK5UWacs4I86YK6BjId9I8QaBDRgB
 kf36Yrz9heQ6rpkUEPNwg7vs0J835p/+DW0ua1TLJJlSFnCt+nM1Z7WstcwbivmVU+gVR/Qqx
 LJN2HlNYlbXhHrWMmA6exILj0ML6d2lYydBx/ivglWsiafz+dSezxWkhz08L8VIqiIK6dShE3
 srcNtj9cCMeeXy/WuKz1SoACQyyWLzFX5vJ7HF9AD7gMD8mGgq8+HhaWZ4LUAaR/dSriR/R3e
 B3lrMjPoO3yEqTwjmVNFPEHpLcxgHp3k0K3Z94bAYryqu/D8Q3Kol+4OglHPh7K6XXE7/78xA
 oUHoCvvSmoukL8/pOHIkrZr9VoXnBeU4ZV3EjcqSp85aW5Q6jRGfhhvHsog/vo9c0GQByGKDm
 IhDlqb2OO2SeLSFm9kDdRiPNxLsJCsxNdbJujreUgg5JbBJjQnJ034mhihaiaT1Aiki1mOiMB
 OI/mo7wAX4gLt7UHYKkjXmMizG1VASLtLoiFffgH9E2VkMfVV4CHN+LQBdpOkpoUf5rl7srXx
 Kiaqeii/5ydXPnHLqiI2CQtzy/PupKJZ0jWzWsaeQ4xVmH8rQepFc6frR/i5b/8B5xfPqj2Q5
 /wVryOKfpTVqR4EsCEJA4sFCJJjcxbeUyiEL7g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055325_321801_C50D5968 
X-CRM114-Status: GOOD (  10.71  )
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

Fill the struct uart_port->mapsize field and use it, insteaf of
hardcoded values in many places. This makes the code layout a bit
more consistent and easily allows using generic helpers for the
io memory handling.

Candidates for such helpers could be eg. the request+ioremap and
iounmap+release combinations.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/lpc32xx_hs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/lpc32xx_hs.c b/drivers/tty/serial/lpc32xx_hs.c
index f4e27d0..d1f09aa 100644
--- a/drivers/tty/serial/lpc32xx_hs.c
+++ b/drivers/tty/serial/lpc32xx_hs.c
@@ -579,7 +579,7 @@ static void serial_lpc32xx_release_port(struct uart_port *port)
 			port->membase = NULL;
 		}
 
-		release_mem_region(port->mapbase, SZ_4K);
+		release_mem_region(port->mapbase, port->mapsize);
 	}
 }
 
@@ -590,12 +590,15 @@ static int serial_lpc32xx_request_port(struct uart_port *port)
 	if ((port->iotype == UPIO_MEM32) && (port->mapbase)) {
 		ret = 0;
 
-		if (!request_mem_region(port->mapbase, SZ_4K, MODNAME))
+		if (!request_mem_region(port->mapbase,
+					port->mapsize, MODNAME))
 			ret = -EBUSY;
 		else if (port->flags & UPF_IOREMAP) {
-			port->membase = ioremap(port->mapbase, SZ_4K);
+			port->membase = ioremap(port->mapbase,
+						port->mapsize);
 			if (!port->membase) {
-				release_mem_region(port->mapbase, SZ_4K);
+				release_mem_region(port->mapbase,
+						   port->mapsize);
 				ret = -ENOMEM;
 			}
 		}
@@ -684,6 +687,7 @@ static int serial_hs_lpc32xx_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 	p->port.mapbase = res->start;
+	p->port.mapsize = SZ_4K;
 	p->port.membase = NULL;
 
 	ret = platform_get_irq(pdev, 0);
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
