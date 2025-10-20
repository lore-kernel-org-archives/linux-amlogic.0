Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B916CCD193
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Oct 2025 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CSSgd2COHxx3t0k29fZQJ+AVNFJrrzyVmlHhjOv9/QA=; b=iiSl7Iw1g1Ko4c
	KLfgFHH9V3pvhiMqesriUSNcSQ2z+Vg2FWoZxkQAHXJaaHJnc5K7VD6haPt8dPH9OE+19FuyngRmI
	JzoAMJD7+RQsTjsumLrrFS0Xwabo7EtXwFRmPzRPU+/qpYMMpNSi8LfanW65zK1G7ZVgj1kos4eoT
	A1i+Yru02LnAvnPjjBZuIIfyCPBbE/PzkCo0ot0C0kPp4NLS/HjJuwHNe35l1ObGYp9ImnyX3K44W
	CwBVo050iMJq6n8/OUt0v4gk09nffG/tfeWPDHAlSbOwCNvG8BhRnmP8z1GH+Bu1vQ2EkIXU5HAlo
	17hPHmLKbb65IwfMWRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArXb-0000000E4VD-0HIC;
	Mon, 20 Oct 2025 15:11:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArXW-0000000E4UG-1bNE
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Oct 2025 15:11:18 +0000
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-03 (Coremail) with SMTP id rQCowADXH3oMUfZo9hsqEg--.25932S2;
	Mon, 20 Oct 2025 23:11:10 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] rtc: amlogic-a4: fix double free caused by devm
Date: Mon, 20 Oct 2025 23:09:56 +0800
Message-ID: <20251020150956.491-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADXH3oMUfZo9hsqEg--.25932S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xr1kuF48Kr17GFyDJryxZrb_yoW8JF1UpF
	Z7GFyjkFsIqrW8Ka1DXrykXF15K3y8ta48KrWUW3sa93WrJFykAFZ7J3W8Xan5CrWkGa13
	Wr4Utr1rGF1DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-Originating-IP: [114.245.38.183]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsBA2j2KwVh2AAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081114_801280_B1969BC5 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock obtained via devm_clk_get_enabled() is automatically managed
by devres and will be disabled and freed on driver detach. Manually
calling clk_disable_unprepare() in error path and remove function
causes double free.

Remove the redundant clk_disable_unprepare() calls from the probe
error path and aml_rtc_remove(), allowing the devm framework to
automatically manage the clock lifecycle.

Fixes: c89ac9182ee2 ("rtc: support for the Amlogic on-chip RTC")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-amlogic-a4.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 1928b29c1045..ed36b649c057 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -390,7 +390,6 @@ static int aml_rtc_probe(struct platform_device *pdev)
 
 	return 0;
 err_clk:
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(dev, false);
 
 	return ret;
@@ -425,7 +424,6 @@ static void aml_rtc_remove(struct platform_device *pdev)
 {
 	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(rtc->sys_clk);
 	device_init_wakeup(&pdev->dev, false);
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
