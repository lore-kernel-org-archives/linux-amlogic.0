Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCCEC4321B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8F520C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Th/OQssD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8F520C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7//+32dJsEPntZNzue0buRq7OyUV4KO/lGAQ/dnLM88=; b=Th/OQssDdYHDWboCte8PRqNFxe
	RLKQObNA4bQkXDfWF/sDwEQYp3yDjiIU9pWXEAonIZ9k/sLaN6t/BqaZPFYrBYiU0jCkz5QTlH+9a
	BEEEf+iYNF7IAHZQYbuIQSfbqjoFUct3ij3xGLVxKozpfBBlYJ3YEcP125I/RMhF9yUTUjVE+dM8T
	hSZPLCXZBZv4mRRX9d0iNIxdrUl8QhHwU8zy/OxsyyIQ0bbGNypQ8ztklDTh91L9vo8TdNTy4CxPU
	IvVqSl9VyjvrYRKoIc/+yaN3hYTMjscOaGNRoRtNR6g77Zce2QLVAeYcvlvIpBGr3AWrXM0Dfha+i
	IADTBEdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpJ-0000lr-2r; Sat, 27 Apr 2019 12:53:09 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpC-0000d8-0z
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:04 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MWRZr-1hIx843db1-00XpY8; Sat, 27 Apr 2019 14:52:44 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/41] drivers: tty: serial: uartlite: use dev_dbg() instead
 of pr_debug()
Date: Sat, 27 Apr 2019 14:51:53 +0200
Message-Id: <1556369542-13247-13-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iKlivJb6BzLykaezfbMDcQZdn+ix2ooVfsC6tW0pEhl98LAPDeE
 JRRVgVcfczmetBZDaIj6bTxrIsuLJZWRq491LJqAx+h9NbgwnoIDbHxcrTYcX/2PcSRokum
 actVckV0OuFGgmAK7gUuP0HXW1/BSfc94DTxmg7pJbcD5SZVKeVCxYgAJklKBryYGvN1CJo
 ibF50Jd1+Py/n87SQbwsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u5P2g8JRH2I=:qGaH8ryqR7sUqOGrLtEnq0
 2WfUNdHCnLg10s1ecEg65pn/njtDsMqOeP8gNEpxCMTzcWsLT9VA4DU3CEBVa3HCzjiKJcfHG
 eTHURytwvHGp7s9jZVE5iai0hKZDLmT9tnCMG0O5bDybrILrbz2OaCok/sor106qS90eCocZA
 WHMkOGw0j1qJeCv0leK1Z4fuVANM96a4sKdqYlnLL2v1g0Yy7Qv2BA/TyHUBS+K7r2RGhcM93
 TQCZfinRHziPPxnqY8q6GJipcuPVsuiLqzJC0H8npIwN2FnPLLAPYV/vgXo00WkXMfxjp7mWe
 s9cDM9K+72I9v9RY2NCSZ4HlPW78uNjLRoKXH9UI6yEUBsHch/+0OxFFZTB2NnEgI5hM4CxaA
 aW2LQCsOERK9kjsOnJFUi/mvk0axc5fq8TDylOAwQOSe0Nkpla45hTAsiHS221ZrBXCbrV5zA
 vp2fnOF01p7Eyj5ee/bkdEt+KrcA0YHPLrsTPFX/ReZeKT0iqAavOA1IICkPrbO/J9OgpkqPM
 +e5kU1Y2uDllo5BJ52L6yldoO9jgsv77olPmdDGKDcAfFx4RUBuMjYer7MOaRBSCwUzPaMwsD
 tgJ7G6LdN06zK0oIyp9V0oKzUCmMe1VTLSZaAIbSfUawtMPghR9Z49rdDsyfAYZ2DohkJIPTF
 xQn1Ht0ha1HyECC5uOoj7J38mbBQIygbj3uOhqVZj78SrVH8ls26OFebX6TDxvvF5GTZrl2n3
 rnTYYYquT1fzWtIJQj/tIvkv4pDPeDZLTev6ZQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_435205_7C9005DB 
X-CRM114-Status: UNSURE (   9.78  )
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

Using dev_dbg() instead of pr_debg() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/uartlite.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index b8b912b..44d65bd 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -352,7 +352,8 @@ static int ulite_request_port(struct uart_port *port)
 	struct uartlite_data *pdata = port->private_data;
 	int ret;
 
-	pr_debug("ulite console: port=%p; port->mapbase=%llx\n",
+	dev_dbg(port->dev,
+		"ulite console: port=%p; port->mapbase=%llx\n",
 		 port, (unsigned long long) port->mapbase);
 
 	if (!request_mem_region(port->mapbase, ULITE_REGION, "uartlite")) {
@@ -519,7 +520,8 @@ static int ulite_console_setup(struct console *co, char *options)
 
 	/* Has the device been initialized yet? */
 	if (!port->mapbase) {
-		pr_debug("console on ttyUL%i not present\n", co->index);
+		dev_dbg(port->dev, "console on ttyUL%i not present\n",
+			co->index);
 		return -ENODEV;
 	}
 
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
