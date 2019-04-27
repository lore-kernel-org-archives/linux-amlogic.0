Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C23FC43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508C12087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3DShXr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 508C12087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HeY2E14SNor5sllICWQzTNvl3C1cDFeuniIoqG/rbiw=; b=f3DShXr3kL3KneTu8v7Uiv6Mh5
	TTrHOtORDTsbBrrGyaWXJZzR5NG3oOKg2sm0y9e0jG6To8iaZ4sDWCyC0MFFrWWndhh4EW/1J6vam
	tzuSqus+yIpFkDfhIMBRQBKZeL0G55YCS8kStQkuysM/WFOzkbFVfiEwy6DvlqRBFV7acZbkRcznQ
	LX3q4X6Z7+K7M2GhgJO6Rkb5iF/VYIK9XowKP1LQr5kteq81A1GJ49ATMkYN6+z8TteaPb97NZ+jz
	cgVg2BQzFpl3sYK3fMFAq9QRUglFinBGvxEgTHLF2UyS6kFnMtxbAuAaQiWPGRAejLU4VBx2o8qEp
	OLmO6yvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqD-00027H-TY; Sat, 27 Apr 2019 12:54:05 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpQ-0000wf-Og
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:26 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2wCi-1hLTog0PAy-003R4p; Sat, 27 Apr 2019 14:53:02 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 33/41] drivers: tty: serial: zs: use dev_err() instead of
 printk()
Date: Sat, 27 Apr 2019 14:52:14 +0200
Message-Id: <1556369542-13247-34-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:QF40RLIzjg39yF+kkJLwWE6eyJO2lDQl6Yzy88yH5771K+U+/wt
 1Wjl3D+kIur6TBPIOh4jOyMYXzSox/0XX1Hcf4zFuPQmKc9TKSN1fBoJRYlf+0M/kOR3PC/
 l9Y251gM1AKpBxtXImahYkduMkU7yDZeVYsF1N1b7uZfo2UV2TlEEwBb0bCY34hAZbZneXk
 NbA8aA4/MktrW0coiKTyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Eh3DZPiCkGY=:tjxD2QwfgapatdwHmJnkdr
 PSdGT9lcKoxn0vZ7Rp//x/uyFYBtQLUi29IcunkocMEKUs5YJFdHogbVsFAVMVJLZO8ZzntWV
 O7kttBq5DAGhsobsWXs4e23+7HwMITcEiszncVa9/3sUVc1cH0grthAJlNpQumTFiLTwCEiiy
 +AFXv1re1PUwC5xEmLzo9ui0isgMgVA1xQUwsRbOaPLMm9NhDZ+d0FJwbTo3KHNsiTsZFuWxL
 9JQM7Z22RLBAG9wa3ASrrfM5zKmHkSEOPc2X/N82bli24aD3TTUO9a+J+ojmDWRplKpAIUyZT
 fXId/zFNr7AEGUcX7VezsKhscHBTO758/ZyMrcgNAMWDnhT/70u6TQvUuOifW8D/Y1Hghh6cB
 4QO6ZhurmdxyZ0oOhuThszQgC1ht87ExyjwAYJVydH9z6gq+SRyceTbbE4E3B8S9L8NXdBQ/X
 zKuAsUqVCpO6cv0AGCVD4beEqaRkWxfry7+cFMzTYdlW9kxaiakkPg3peM6cGo/Y3aOswdDEM
 yOFjkyXAkmIJS/Cpq3mFMRySCepHNYPls7KvZMbIrJ54ISXVvnt2+YnC5ifFf5IWfXTwyd4en
 JgZaWxnJ+lu2qoKH06DlO+YuUroKlBo/Cj+M98Q3I29qfcokFkZmGZ4OCqvk9mLjVWnIDVpkp
 NK+vpcb7NDaHyHNl5rybbr37KyjM3iS4zuldMiVnuspOHZWY+urLdryZZCNfYizdguQmQcDYI
 VGv8B4cGjKb5Hp8pFpGXlDXptI7yMcxq50+aGQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055317_641663_E6908FAA 
X-CRM114-Status: UNSURE (   9.89  )
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
 drivers/tty/serial/zs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/zs.c b/drivers/tty/serial/zs.c
index b03d3e4..adbfe79 100644
--- a/drivers/tty/serial/zs.c
+++ b/drivers/tty/serial/zs.c
@@ -767,7 +767,7 @@ static int zs_startup(struct uart_port *uport)
 				  IRQF_SHARED, "scc", scc);
 		if (ret) {
 			atomic_add(-1, &scc->irq_guard);
-			printk(KERN_ERR "zs: can't get irq %d\n",
+			dev_err(uport->dev, "zs: can't get irq %d\n",
 			       zport->port.irq);
 			return ret;
 		}
@@ -995,7 +995,7 @@ static int zs_map_port(struct uart_port *uport)
 		uport->membase = ioremap_nocache(uport->mapbase,
 						 ZS_CHAN_IO_SIZE);
 	if (!uport->membase) {
-		printk(KERN_ERR "zs: Cannot map MMIO\n");
+		dev_err(port->dev, "zs: Cannot map MMIO\n");
 		return -ENOMEM;
 	}
 	return 0;
@@ -1006,7 +1006,7 @@ static int zs_request_port(struct uart_port *uport)
 	int ret;
 
 	if (!request_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE, "scc")) {
-		printk(KERN_ERR "zs: Unable to reserve MMIO resource\n");
+		dev_err(uport->dev, "zs: Unable to reserve MMIO resource\n");
 		return -EBUSY;
 	}
 	ret = zs_map_port(uport);
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
