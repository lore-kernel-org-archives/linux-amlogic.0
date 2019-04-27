Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22913C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77712087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6nOzmYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77712087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BqPibwp8TEP7GnZf1xQ9rXpFCz/0g+lkxkKKTa00tUc=; b=t6nOzmYpjxRGTsPSRNTdfaHHap
	14S0TtrMZuoTQ96RzE4Vrej+eh8FcUGtwyGJcIboc6VZShuGh73k6GUPVsF2FYKNq7MAKwFgGLkBu
	v39FulEnQHynuL1RGBzQNIMsAB1GCOz7/N78EKzmOhzdvdKwC6iEAzEXwnj8ULwa+/m/oDwJ6iv00
	ZZ3HMoZ+Z3d2prLZVn9mEtYhmXyLqIpc3uZoEE2TbZR20HhCRBVCf1JEfkhvMsPoub7LJf1jX/qK0
	Y5OGNBjMQRCrsgRT2CJdaEsuDfDa/PAfSeIENMgzVTHiPNs0lwp1l/QyOm2t8iRKxmFLQdgMRgoUz
	afpwy4Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq0-0001m0-Fu; Sat, 27 Apr 2019 12:53:52 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpK-0000mP-PJ
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:17 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MG9c4-1hYhE40ZmG-00GaDP; Sat, 27 Apr 2019 14:52:56 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 26/41] drivers: tty: serial: sunzilog: use dev_info() instead
 of printk()
Date: Sat, 27 Apr 2019 14:52:07 +0200
Message-Id: <1556369542-13247-27-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:mAhDCbido9+iZFtRE4TdsCbv1vAr9Joy1VbiPU+XYBGA3j+D1i7
 8tBC3ZCd802YRf6g/j2wz/Rpr+rNfM3/C9qVun5TY7ecwFsuAGNQ9PkxsomQbrK7CQSqD9t
 lNVdEtEZXMG24nxtzJ9rZ1N16lMRzqr8eSk0ACn+9ciZWtRdbmtCGj6cenKYS6p9eJZMPGK
 +Gf+FP3wxSs4kFyyMktug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0SWS/YPHXl4=:xXTpK4xlmi8jyBmh5+ECF2
 2f9XUV5idTnhYPicmiA4uN9epzHkr0tM2wgGgfiaPSshMy4/xofCE6fehmo0kVhDKiF8UVbMG
 XR8itAO4whaeeAqp9zT5DYaaSKJ2vtlF2N3zWHCsj7pHbAGbhkSM9yxnLE5xXWK/rrI3rNFKs
 YIL05g1WGyY8xdJe4HFEc4NcJhKh0f6h9LUIcxhmKvH9XKe8ycd0Xe3RywlvzHmnWjcU1z9Vj
 T6vHj0osI3kq595a3frTeGB0+jpxTiEP9p6T6XiuZvNJcMFcVfR19rf4Gj2yDgphVYvMsQryv
 Ksrc5FpwDCtuUawC5zqz/Epzic7ZckEfLjO0q7+UoqsY0qU2w5PVM0DrEJwWrMmVrMhIrOFFw
 81XKksVUTD4AuR+sXqurAVCxRwn6CXlYCaUeQij0f2JVzNuq7fbmsbAgJpeEfV5/tIPLtdEaR
 vBt9XarGGDlzVuyi92jSjgdBgtKrY7LZr+9m6ioeJxy2ufRg0N32AcwiJeOcaGThmWCpht23Y
 m1ocX1+Dlr8+TlglVKRnWgCqKWI2lhH9KcTZN8l27ajs49owlLXy8zkyJUHaswH8NaJ7Vo4HJ
 /Q2JJ0/z9DlIk0AXgG0IJq1NdJttYEUAtvhk5Ms9Ad6jVBqAzeWwQ3FXaB1XSVn+7YmVjffw6
 nb8ej0Ia5DlAdpZ4D1aTwGxiigyP+2TidNSBWB6whE/gbiB9kfqBscb0vJZXs8WN/bVMk7qiH
 gIjVcmF0qrPRPdGta3xTuJy8beZywXyoAWaOnw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055311_578892_A2D5721F 
X-CRM114-Status: UNSURE (   7.95  )
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

Using dev_info() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index bc7af8b..6285bba 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -1489,14 +1489,12 @@ static int zs_probe(struct platform_device *op)
 		}
 		uart_inst++;
 	} else {
-		printk(KERN_INFO "%s: Keyboard at MMIO 0x%llx (irq = %d) "
+		dev_info(&op->dev, "Keyboard at MMIO 0x%llx (irq = %d) "
 		       "is a %s\n",
-		       dev_name(&op->dev),
 		       (unsigned long long) up[0].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[0].port));
-		printk(KERN_INFO "%s: Mouse at MMIO 0x%llx (irq = %d) "
+		dev_info(&op->dev, "Mouse at MMIO 0x%llx (irq = %d) "
 		       "is a %s\n",
-		       dev_name(&op->dev),
 		       (unsigned long long) up[1].port.mapbase,
 		       op->archdata.irqs[0], sunzilog_type(&up[1].port));
 		kbm_inst++;
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
