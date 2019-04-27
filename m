Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25188C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6234212F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDIBr/mW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6234212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pTa2QHDG6pof08SNTMiyiCWq8YDOBELOpln+X0+nJJA=; b=BDIBr/mWvnpEC/vbgY2rTtrJZr
	Axc9qbCamjwNYxGfAgcb9Gq5nKjzDRb+IVv/B1N0UjKMXXYEOFEGA7alg0m8gJCvFooKVzDmAf7++
	/OIy9eQK01bk61VSOPkba2ZFqN3zEjVN3eXLb+LUaO9dBYNkhAyGauxOnWiHIjqVKRhxQiCRiEDr+
	KIT3Sg5KlmR33eHq2SvxVl21AEhSXAqVHZRNB5uWUgwCiHXu8G49jsNPjOhExfj8wTq9XOSPSdeVl
	QYamdPnA/xK2v9BN/dlkKecECyuadqZmKU4cx0JEeAlePVWYNWVm8/Vxh9qCPdorzwEGtlpXQ4Evt
	WdglvNow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpo-0001TZ-M8; Sat, 27 Apr 2019 12:53:40 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpD-0000dC-PB
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:08 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MmDAW-1gu8kq1m7s-00iDvn; Sat, 27 Apr 2019 14:52:40 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/41] drivers: tty: serial: sb1250-duart: fix checkpatch
 warning on printk()
Date: Sat, 27 Apr 2019 14:51:49 +0200
Message-Id: <1556369542-13247-9-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:9XC3q0bfB2HQ4mApDU4u33n5sD/YoC7EqQPmqP5NMOedGA7sE7R
 zQ+4UMW4bXxRANtgf2zvHO2GKXDxkdKE28JdO/iNudeY0F3mJ+xc3fTNvs7ITqMXpD+h9nY
 QJb/I3M0+a59qd+LyzEcKpCXtBXjQ/BRgErxc0fambEKaAP14TyYVth7y55V4vy+3k5d+oN
 x/fGxgcPqoZSgK+QJd3pA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KbQ0fHA3Nqk=:FuSxcrnKlCstL3CnqMetR8
 enSY2gm0q2GMzPD3zuPC8fZO7HmPN6yxLTvM8eVFp60ICRPcNK4tMFyvmEXAwQhCqV+QlhVfY
 /3SomP72AOXBFjUdm37A6u738T8AWaYhzD3ax41xd/91uO6TvCLXB01NFygTZ69KjGGvd6dHl
 J9lyE8nv3ouQZE4YSkwJ+QPVxRnzV+nPfZBZk/QPt3B8dqdrBa8sVikNqDUZSkcX6lYQS36SE
 LOscWWeMcd9cDI+xfMIg49C4I58k/YvzfJVXt4DERZ2OqnsDVF39SPQ6mxZd8kyZyvkWY68FT
 v4aBhQVWDfpD1t0GubgtmYzo8UOl2KV+/SB6VWAzR3um3S2sxVGVPm3DwToX97W+XO2x/IxZK
 Q6Pr1u8NIEMSywIsghBEkavAFQJyp6Kw1JS9qBGMdHI80KFXdjgfG+6C3hhkvcy6C1d4Y3nMS
 g+SUL9XMx7ynle+l8ySONYsf3S9/5LAeIgUVPU0xC0OjIcIwKL5yM7en/m6fRkNDK5yzev23m
 aXQatsJ5bHJbeQqA6Vbp/dppRd+sjlJA37mRBhWORrP0GnCiSK/iBZGK1z624u2RV/axQxVU8
 FgXt6VT4izE0gGVOenS522mBiI0JYa1/T+aqrIxVh2Mgd9NqSega9IxAQlHRGjbwRynjJt5Sg
 1101agAP9tCRr5Tje2tMwCcYDgbVyx7BPu9adznbugp+wmE/O4zeZ31tCdtTIo7gfOhkLPJ0f
 XXLVpK9o1Fyph8MTqd6Mt+RVaDYvSrfKML+CcA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055304_251771_A458966C 
X-CRM114-Status: GOOD (  10.85  )
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

checkpatch complaints:

    WARNING: printk() should include KERN_<LEVEL> facility level
    #698: FILE: drivers/tty/serial/sb1250-duart.c:698:
    +		printk(err);

    WARNING: printk() should include KERN_<LEVEL> facility level
    #706: FILE: drivers/tty/serial/sb1250-duart.c:706:
    +			printk(err);

Even though it's a false alarm here (the string is already prefixed
w/ KERN_ERR), it's nicer to use pr_err() here, which also makes
checkpatch happy.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index b4342c8..227af87 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -689,13 +689,13 @@ static int sbd_map_port(struct uart_port *uport)
 
 static int sbd_request_port(struct uart_port *uport)
 {
-	const char *err = KERN_ERR "sbd: Unable to reserve MMIO resource\n";
+	const char *err = "sbd: Unable to reserve MMIO resource\n";
 	struct sbd_duart *duart = to_sport(uport)->duart;
 	int ret = 0;
 
 	if (!request_mem_region(uport->mapbase, DUART_CHANREG_SPACING,
 				"sb1250-duart")) {
-		printk(err);
+		pr_err(err);
 		return -EBUSY;
 	}
 	refcount_inc(&duart->map_guard);
@@ -703,7 +703,7 @@ static int sbd_request_port(struct uart_port *uport)
 		if (!request_mem_region(duart->mapctrl, DUART_CHANREG_SPACING,
 					"sb1250-duart")) {
 			refcount_dec(&duart->map_guard);
-			printk(err);
+			pr_err(err);
 			ret = -EBUSY;
 		}
 	}
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
