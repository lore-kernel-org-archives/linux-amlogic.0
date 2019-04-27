Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76BFC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F790208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/w8JBY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F790208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6PCC4U+lz4idQ+AXXLoaauQ2P6DVN5j1wWlWTfvtjnE=; b=Q/w8JBY9u+swwmUEuLjOJZqYPP
	k1e1jJ1bneNy/AU70SuAn4U80kVoGScSVrK6FVbcdoj5Z1/AxEb17DEKKgmfq6ou1mFN7fqgJM68S
	m1yTGYkopCWS80vzOfDuBjfGBU7J0bF/z88/bbOV1/QF+EkSb9ViuqS0K9A1QrTt4LE8pGqm2ve37
	fnuynlL3kYaqyR8x1rcs4G2xColSQY4U2h041MnQSHMpLjDLPSJIVlItGpCc5NyFRPlJ82ftMVDFu
	Lsj8MHCuBXanCmU5VlVVW/EcIRB8LuHnTb20Hn5O6I3n6QItsf4le3speNHr//HHnWX2G+ac4TBCx
	r+yYjo5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpM-0000qC-1z; Sat, 27 Apr 2019 12:53:12 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpC-0000ch-Cw
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:05 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MNss4-1h9I592Io4-00OFB5; Sat, 27 Apr 2019 14:52:39 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/41] drivers: tty: serial: sb1250-duart: include
 <linux/io.h> instead of <asm/io.h>
Date: Sat, 27 Apr 2019 14:51:48 +0200
Message-Id: <1556369542-13247-8-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:rdRXb5foI78ZUKXg0PVAe5Z5nzYlAxuzsWdK2nGI/ZCG+/6jRlM
 hI3kp/kBUUgLKHfqLAS7fc8k7GQ2ADy4ZKXhqdqZiryVc7Z/Z2r9L5PNnJpvCGJ5Wm3QKlp
 qfPO4bQ3xuErAjl1GwNDMV08O2NC44IuFF/UesW2Ttt/YM+Ee5ZbuxprWyPUKJV4WjcRcmA
 KbeNYOb/RogJgZxW+H2Qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uIkJBFuyWwE=:my0C5wt5HQzdkDWW3sqLjW
 G57X9rEDzrdejwTIohdfyXbnVkKKkUjsq7O2WO6aaWwA/K7asaaqwwpANJiqlYwmtNzUe3m2F
 dIy98aX9m8AzimgrUpqTFcjmsVSy5jVNnA897BjXITdiOKUbqhDiJ8SEfxopoVvXA0ci4pE/u
 sCpkkmo4B6+eALwD3PacR4l75/GBQIcgR/X9YlludU/jwMa2Liob4BAm+iUTx6dTWwQyokWeE
 5ueRRrNwERDVxlERN61XurD0oaRK6EZk3C+alaLfFflaumVLpveKjf8NF9QNOKUCoI5MVXyiX
 HXunQn4iVV9oEPQo+yLEIGF4UfEE0Rsd1GkU6LkB/+Odbn2uQLNNWiC8KWt07Y56oarXOxrDk
 lA4uTn5RNuonkl8BJC6IAyi1AfCnyQmAgAOJlNSl4m+3PYHPhOrGjM7sgGTlh19tXj+5/CybH
 AVSJ2WFmYCNhq6mW/70XSDtRxr/UK1p1rzHbSTsjFAmr4I8RVMaqj3ZxfFotbghjdQK1581Pv
 69TkpSYev0ozeW+8xQuT5XGyqbrpcxKEzP7NDPBjAjIAKmwxFXVsCjrsmCQi802n4t/j7rgtj
 p2/1WTI2ZaKz4ftVg0fU4hcU0pFIksjotyumR0cs9ECKOFII7ztSji+wY2fpiuHhZ8jQiu3Va
 80px75vPXYZJQn8SviB8k53dJGNllXCrNlg32KHH9lod8kduYDxsK8NA4RIZxyaO3IOTafLNX
 tjDPR9hNlZyMzNBlAyzerGiY2oMGtk33LyAGRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_792177_8BB42CB4 
X-CRM114-Status: UNSURE (   9.10  )
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

Fix checkpatch warning:

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    #41: FILE: drivers/tty/serial/sb1250-duart.c:41:
    +#include <asm/io.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 655961c..b4342c8 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -38,7 +38,7 @@
 #include <linux/types.h>
 
 #include <linux/refcount.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/war.h>
 
 #include <asm/sibyte/sb1250.h>
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
