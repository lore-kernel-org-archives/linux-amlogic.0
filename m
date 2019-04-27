Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A016C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F423D208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIxKVNRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F423D208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i88Vjd4OyBjAp8LrqoIDODXNxyzQquMfHhdOnClSd0M=; b=BIxKVNRlYen2n8evIrmBVz7Ymx
	WpNqPns97AB61HHJmnM/GRsSwVddW/9NJ8LPQlnYf9hzlghvxNVUxL4uDcA6xa0LiJVhzy+2rzFQ4
	Jv94NQvwje5CL+DRE5OiJu1dfe2sYsGthcJaRclATbBCP0cqbaNNnQqW5egcl6gHZD1qJDtJ/OANb
	w9g7/xud4oyW0mobEtBjaDNtT6zxah1rsQn9z2ZnR4FhTKvxQ1ecod/XZh148OerpwrZrekB7LSC5
	KC7UypHDPvaWYWDB7VbI6l8JtrRnPbVuNyvi5lOmVA+QJiTvTZZNy9E4V5sKKHnjBZUtX6oqGCDqy
	vM7NuW/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpX-00018B-8O; Sat, 27 Apr 2019 12:53:23 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpD-0000eT-QJ
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:08 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MHoZS-1hX2X90am6-00EvFl; Sat, 27 Apr 2019 14:52:49 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 18/41] drivers: tty: serial: apbuart: use dev_info() instead
 of printk()
Date: Sat, 27 Apr 2019 14:51:59 +0200
Message-Id: <1556369542-13247-19-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:OVKGRVf0aXMWmtc1PHtqfEjiYENJhZU3hpSHmEA0npVSmInw18W
 peVVZAyjlFJAio3YAZ7zsEC8Fe2VQ89wyDlbJaIzUmZGMMp3iII6gzrN822v79B5j0vvLsh
 71zzSbmGgmkHHfJu8peOu878gwp/4AQZkem15Rl7F+pbbfe+1IRXXc3iTGk/vbwXXy8feJ1
 A4wTh5WhUYxm3/nJIj4hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJPYxrqUW4Q=:IX4zfaBz7w6xvHD6+zvUEx
 9lgTvdeuV59hcukEVZymu+p6tcoSHdR0K1YyNeMpb8uyuppx99cFXsn6a/2c3QwCqdTtaOI7b
 NM555G1mdTA4tx9beSLOpohIzVc1IAh0aF9aqOMLarv10YlFJVBypKsS7eozOr8YjLPwNCA7y
 xLNnSL9nvqoyuR6pmZ9cvRyyyP6/eYw4Fc/aHOZVjluv6XaHH1kDZqcwruoEvA55uYtvnSHac
 9MjLs8ftcbsYmjTSWf1ukKC9wrnPzPU62l5wd6argIoQ2M9shIoE9+TB45W0N7bfJyq0mDbaX
 TJHKhxyRPW+/7p9yUNV10hZ7DQE+aMsD5fm2A2ANmTrYm1EOuOJrwHBgNOvOC8EJ4+jTkk6/W
 BwDYOySXQ80cH6wqZIg+DXq1/w/mFQHSkmwtbd0oqKoJWF1i+ZJF+Ic9yETZqxb/VKtT1JjId
 aY7KauvC1h+u+2i6Ia65kuNV1gsqfMmGLLZjy0AiXOjEvc13FOU1AbsdYNOJA5WSEPHUqWLHT
 SoAIo9fOAKbG2KsIwCu7Zo2mryl45CvXBMMMbNQ9jt5fV9nD8v7BkFwLkMucoFwqTowZs8u5T
 g8EDSIiimu5RjbwcGKHM6HD5X5/g/5FrZKGvHbfpY29hrmOad8MLWYtKwnASbuVRUr6XWpvrq
 WJJr4n5/Cu72gbTk0oEBe4AhzNbI9tMroHYK2nYqhfZrYtIznaI/92IoE9ZcqFvyCxwmiSEKp
 6Y0UpIDYj+h2G2Yvy0Vj7nMLmkVAnbhBJyzm0A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055304_252405_37BA5929 
X-CRM114-Status: UNSURE (   9.65  )
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

Using dev_err() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/apbuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index d2b86f7..89e19b6 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -568,7 +568,7 @@ static int apbuart_probe(struct platform_device *op)
 
 	apbuart_flush_fifo((struct uart_port *) port);
 
-	printk(KERN_INFO "grlib-apbuart at 0x%llx, irq %d\n",
+	dev_info(&pdev->pdev, "grlib-apbuart at 0x%llx, irq %d\n",
 	       (unsigned long long) port->mapbase, port->irq);
 	return 0;
 }
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
