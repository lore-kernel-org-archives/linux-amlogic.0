Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E4AC43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BBA2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCN1KWWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83BBA2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2I1M23Qiw4BkTPIyruE76yOHwpAcj7+BvYy1T7AkCDM=; b=mCN1KWWx+5l3ZRiDuhjNm9tmaw
	9Ouvj7FsCiCstqaABWC2c4kHZ9pYBSERJJyi44EmcSKhDZOZQu4tkkwDLmNs1nCuICzTXBreLKNg1
	wK/VHNl2z116LWfYrqApUVCDujUFhVP51eX+g51RHbDtvLERWYgJ5I1gMt5eY+hMNgcd/twYZiVBr
	T5kN2hq/x79/7qzmamrgC3rf16SghYDR1KIFzrXnqBXOQBbAwEdId11jCg0uzcd/ZXloM5DSEoloW
	boTcfaHpWoZ+3F/e0yKL9KtbdkpnL5c0D0BVgKdzdAuGcYYzmOhhV3lH/K2SB20+0SeaLWaukvMKA
	t67SHy1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpF-0000h7-F9; Sat, 27 Apr 2019 12:53:05 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpB-0000ci-VR
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:03 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVNF1-1hBGZC1Cwp-00SLNE; Sat, 27 Apr 2019 14:52:41 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/41] drivers: tty: serial: sb1250-duart: fill mapsize and
 use it
Date: Sat, 27 Apr 2019 14:51:50 +0200
Message-Id: <1556369542-13247-10-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:ZaCk4lb7tsU+VMSXb76laO+FYz7IB7DvruPd8DW8Z5VN86cLAXx
 XoTjgpy1D4cW0l6Dtk8ovOsbJ8N9Wa/Bbip0AWVSYaXLx73ljAgB+eT7NLTxRv9yXwxk0n6
 HH2/FDKHKTK7DJe3OrFZeO4xRkkEqT/D7RK5KNlvmu7PNcsk+uX5W9PhxlgNSIsAXElPf5S
 ey1fWSh+9w6GIdr1VGyZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bMjmK7y/pZk=:+AFfLGXZen+R/LjlG6zSk7
 L8sUEG8PAms3y8zIqVAQwMY6qAqR82Lr0rV3bmYkKN7tHlDRaITbqgcrePCA9GhxzAAamUqAf
 YwUlxTo4PLwjN1ylObX8wcBa9n6x6fJFhwBBYNjLMxo2rfYeunsf+B/mSAmul4qeuDFXvTiJR
 rLJjI4Q5l7VTPJ5zet72iWe0Hlp6PHbzAvsjIEeuOp0SraT4dJbsI7FZwjziDhZxH+ATmIsbb
 Kql4oUhkX+us1ZmJ42xUQasNo8zIArVrpR8vPsLM2jB/KzVDVkBjOTYmsByxB6ebMmMZFuPQd
 Q1ynq6X0xmA9TnjqSxTZikf1QA00We/n674kmX1LPWfbLz9t1njHTRpVxCALOyNjl22t9oqC0
 X5HvRIzJpn99vxUo1kTCGnHvD9Z8ouFu6TplGDfMsbVcUxgipevllxBYDC6h7bNmKhBjqnTMK
 06KakDCYlO0MY5EqGM2o5YxobEmB4gMoCiId14JTpNmX/F3DYudyaFLE0P+lWuFO7tUdgIZ/p
 hgGMynJm3bUU5Gt08dqMxN+WABde7p7fXqouDHErv3RZaOoAz6dcjciU+wuCblZWxT0OC28oP
 2u+KrAW0cbW4rM3u3mhzvA4/EA+YrH3HZHdGpWT3e9DlT2ljYYgQBAHO0cTMM/hSp1MuYkjdS
 41dTTuSXboMqixDvStEni4kBMKHteWCKINqCGhSJZBVy3lEq2Rb9jsrRZemdRp4Vhj4RMcfhE
 Fxrt899EKT3VTfQKp4V20bneFn76TA5cuj+Bcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_314592_87D03F8C 
X-CRM114-Status: GOOD (  11.74  )
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
 drivers/tty/serial/sb1250-duart.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 227af87..1184226 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -658,7 +658,7 @@ static void sbd_release_port(struct uart_port *uport)
 
 	if(refcount_dec_and_test(&duart->map_guard))
 		release_mem_region(duart->mapctrl, DUART_CHANREG_SPACING);
-	release_mem_region(uport->mapbase, DUART_CHANREG_SPACING);
+	release_mem_region(uport->mapbase, uport->mapsize);
 }
 
 static int sbd_map_port(struct uart_port *uport)
@@ -668,7 +668,7 @@ static int sbd_map_port(struct uart_port *uport)
 
 	if (!uport->membase)
 		uport->membase = ioremap_nocache(uport->mapbase,
-						 DUART_CHANREG_SPACING);
+						 uport->mapsize);
 	if (!uport->membase) {
 		dev_err(uport->dev, "Cannot map MMIO (base)\n");
 		return -ENOMEM;
@@ -693,7 +693,7 @@ static int sbd_request_port(struct uart_port *uport)
 	struct sbd_duart *duart = to_sport(uport)->duart;
 	int ret = 0;
 
-	if (!request_mem_region(uport->mapbase, DUART_CHANREG_SPACING,
+	if (!request_mem_region(uport->mapbase, uport->mapsize,
 				"sb1250-duart")) {
 		pr_err(err);
 		return -EBUSY;
@@ -716,7 +716,7 @@ static int sbd_request_port(struct uart_port *uport)
 		}
 	}
 	if (ret) {
-		release_mem_region(uport->mapbase, DUART_CHANREG_SPACING);
+		release_mem_region(uport->mapbase, uport->mapsize);
 		return ret;
 	}
 	return 0;
@@ -812,6 +812,7 @@ static void __init sbd_probe_duarts(void)
 			uport->ops	= &sbd_ops;
 			uport->line	= line;
 			uport->mapbase	= SBD_CHANREGS(line);
+			uport->mapsize	= DUART_CHANREG_SPACING;
 		}
 	}
 }
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
