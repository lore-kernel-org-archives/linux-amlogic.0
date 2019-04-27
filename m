Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856A7C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E2F2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A4kiutWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E2F2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TwToEl+yi0WIlDRaOuhfT0BXKRaeANT0JHX9gD4Mbx0=; b=A4kiutWf3STMfm/ouWS/ZK7/jo
	G+D7l15HJD4bWGMQjG6ve6lKQjJm79mJYl/7ZyReV80f9MC0S7O9P+9f9WvqJON11mxQbxdz/gehx
	l7cBBwIRoQNQPqly5FzWTJCNVBsSHTeXWYW1ftotaMwdKCIvO6CsTtLOzyF41rvd/u6FjoTOae83k
	XZ/dTTKCHNJa7a2/5uN93PjMUzATxxzcH2PqQFZca50Mk9aiJ/gk1yKOro9o91ctERau8vPWGE63b
	dcFrOoHNmM4iPAIfnpPjuDizr7/OOxNLh+C2FiQHyVomMt2E5e5pe+39uLF20NlIIFmDsUtBo9l5U
	OZVhTJWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq4-0001rj-4E; Sat, 27 Apr 2019 12:53:56 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpM-0000pj-JA
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:18 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRCFw-1h5zEz3V3s-00N8iN; Sat, 27 Apr 2019 14:52:57 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 28/41] drivers: tty: serial: sunzilog: fix includes
Date: Sat, 27 Apr 2019 14:52:09 +0200
Message-Id: <1556369542-13247-29-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Vc4oNRhzaq0GImBAR5CgiZ+whb77bqy0PxtEF5afHcYFvx1oVZb
 siNewF36P93CZkzncVMQnr4mlIS/A8kCZTaukIk2D/GuBtTc3OHRLhlyKjwaq32J2XmrRlB
 f2vNOVy/3BrWxRfFIWguM5CtYi1a+WcUK3nW67RriXOHA4rE+69skktXGN0uJRmUq+H07n0
 K1/tFtsXXjzqS2NXo4RKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WBmzZwx4lgo=:NspLTi8etU0+1fQAgbr3D+
 7NJFSTzzIk8QcOgiGlxnnfA2ff9WuC2M+mUQl8CvyQPR1cl5KPNVz+Gs6GXBQgE3j+OdFEawT
 DF05YFVSL08zlHfEFGE/TaD2nZByEqUJeW9HwLJGSeckhVexHLC2nadK/PuPkZ8nQB9SDQC3m
 ggNu6zfAJ11Ymokt621Nqj/cAvK8z2g4R951W43UVyRBAPjNJLZnAWzl69dWoVEF6khz0dvoy
 NB6mQKt80tpbAIibungsiH8r/5jjf6cFypWqPbSnSL8aM68Agdeu6XvXr9NvzuK6v7vttxLz1
 XLkGi5Z7QILTWz1PWT2CP+pScInyi2KU5cWyYES+DQae3LncVeZn/UZqqvSmcV5vRuSUbWG1S
 ASupKOd9PdBnOLF7fgH4kGptvX4+k+m8hh+/IHKlLFPs4Z5V07XsPTjGP43ir6PzrBAkofC8R
 6L72iwY6PeL8WMTHw/dSgL2YdMYSLFOpnbyHooEr5hYrThcvmcHJ+TqqxR/35kt8iKd/n6kpY
 SnCPBvP/ssZHx6Ve5P17ibQdCA38lmObFRnsxaRCxeO8ceOqqJJVhD0Rnj9qz0JmfcH23axV0
 Cqo9n5OxSPdnKd10oAo8jAWkFqZFJHT3aNUP47SCVF6v8Hc030w7nv5Wy3TQJrANkYGs2zaDK
 CGdtJifVuhg6VVTvqYCedOdrWh+OZuszAW+DcmULVA8NOVb5UD1WF6EvFALLrnahi67Xh1A+O
 1a1p4u9mxM+I2OORa29atLFeiS8iBIPcjEkwbg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055313_271518_24C1F47F 
X-CRM114-Status: UNSURE (   9.11  )
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
    #38: FILE: drivers/tty/serial/sunzilog.c:38:
    +#include <asm/io.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 17b0520..85edb0d 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -34,8 +34,8 @@
 #endif
 #include <linux/init.h>
 #include <linux/of_device.h>
+#include <linux/io.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/setup.h>
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
