Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E3EC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C046A2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j015ltcs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C046A2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i79epSsEzzCLCP3FCad/oqxV9sr4wZjTT8+R8zfw2ew=; b=j015ltcsgkxAE365lCCLFi5Ms8
	3bWZG1dWWf0rR9s5VMiASLwKc1ozO51c7p+ni7JofejeVRZywVWWpI9kPKdq4Mb0yaz/hgCOTlshs
	DDiovMUt0ycIyJ90i2AM6SRqDdy2alKJAUPzri3nDc1NFhyLHZEoqexjq9wB36YMs3QBwdqtQSwJf
	xf9CVfCuP5xU4n+GWRsMFhMljmcf2r9bAUcbx5//OoxEU83v0Uipsp2Sv9EuZtDi3vzonBXupq+09
	+gEfghSA5+PUqy2I/tGHVOu0Zlte1NjThta6MSY2ZJbT2+nuFpOis/HQvFwjbyE1IQ9TmHLDtypoG
	IGYyWPIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq5-0001tn-RH; Sat, 27 Apr 2019 12:53:57 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpN-0000r4-Kk
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:21 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5G1V-1gbeYR2mc1-0118EA; Sat, 27 Apr 2019 14:52:58 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 29/41] drivers: tty: serial: sunzilog: cleanup logging
Date: Sat, 27 Apr 2019 14:52:10 +0200
Message-Id: <1556369542-13247-30-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:uxxvCa66CYSGi3Em4nuMPvtSzL45VE6ce5qM7EP5uZ2jwnJH/Rf
 VzWdbFvPirBwCJNu9f+Jwyc9lVwLpUGhejFkC7ldZJdxwR7DA2BRn+Vl0BQckBceQIF7qXC
 WyxgtztRffigF7v1SzndzvbVeMKNS2DbGfpYfH4EV+kNq293CGWXupsg6VWK6tqIR7aTFMf
 +tRlOKQpyia0QglzkJKNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y11A1qYqUqI=:8rPS9vSRvAXoCM5mb5BhuI
 WjE5yIVWUmfvDmA/AQ4ypZ+srkteIQs198t/oJOqUwZx5Rp3SPAGlO++llU7eG0RNjUsALBZq
 ZUvb6zw3f9sYxfEGhrGcIODhWtEO5jSQT4jIVhGurbVttXmC6195bA40SA690OEhhnFI/qCEi
 WSwQCTE70G9mH5ZlezP2NFueEhbG7kWFhxlgd96LRp1M9Nb1RFDllOpLiSlWwuEgrwYc/txEZ
 Jz5ZQj7Ur9cWxizBCpYX6lQ8MA/6iwg/+OwOBQFBaO9/oRTiS2RJak0h4ldhbLbwq2zihGidG
 1rGx2U2IrRbLZ4JMDQtJAaneQYfRx5ecqZDD3UkLCP4Ei05fNui5iI8OpZLsbkAWQMiKsryvO
 2kCFC0VRHePJTFZPqt9Ik9I0+gIoWPxwpdB8LfjEbEvj6k6/XPYQgonaBdL12TN97JkTvX7X2
 zPhIz62y5IwAPzLzViaQBeYU5gJWmkOIO+mcjozxcMghEPjcS0OHpgnDA8TYNsChOcClWQN5U
 ZTY0rQijbKo7+Fr6crZw1sEjpHfTqC53E74pOXaRvnpUsI/uBenbneEDtTlLAdpaHpm6wTBvF
 WLYWF5qQwW7fPx/YeqvLiajUl4U2/pvABrvxsQRwW6Zi/tOfEaKerfDWvrHkfNX97OpQ9rjqO
 aqTj8y5/k3NSG39yLJhNMUwbIOnBHg3Ua0eJn7jjxkxpYM82/aUzhOuEWTDJOxHkTsenB2gj8
 mCkokTH7YsmuOy7tzDvemUKChz641N4UkAKV+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055314_623174_EB37F96C 
X-CRM114-Status: UNSURE (   9.00  )
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

    WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
    #1238: FILE: drivers/tty/serial/sunzilog.c:1238:
    +	printk(KERN_INFO "Console: ttyS%d (SunZilog zs%d)\n",

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 85edb0d..dba723c 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -1235,7 +1235,7 @@ static int __init sunzilog_console_setup(struct console *con, char *options)
 	if (up->port.type != PORT_SUNZILOG)
 		return -1;
 
-	printk(KERN_INFO "Console: ttyS%d (SunZilog zs%d)\n",
+	pr_info("Console: ttyS%d (SunZilog zs%d)\n",
 	       (sunzilog_reg.minor - 64) + con->index, con->index);
 
 	/* Get firmware console settings.  */
@@ -1615,9 +1615,8 @@ static int __init sunzilog_init(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk(KERN_INFO
-			 *        "Enable IRQ for ZILOG Hardware %p\n",
-			 *        up);
+			/* pr_info("Enable IRQ for ZILOG Hardware %p\n",
+			 *         up);
 			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       |= SUNZILOG_FLAG_ISR_HANDLER;
@@ -1655,9 +1654,8 @@ static void __exit sunzilog_exit(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk(KERN_INFO
-			 *        "Disable IRQ for ZILOG Hardware %p\n",
-			 *        up);
+			/* pr_info("Disable IRQ for ZILOG Hardware %p\n",
+			 *         up);
 			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       &= ~SUNZILOG_FLAG_ISR_HANDLER;
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
