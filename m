Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F92C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 21:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C3424687
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 21:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+z8LUFo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNM+BG8w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C3424687
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67dTcNhKPp7hG1s2Unxqr7GvuKEKzEVd4sJVeRx2R2U=; b=b+z8LUFoSHAVaM
	MzPYtTzrwb0MVdhf4RwLUe2TemXT31V6kYgIazoTiy/0ttqYhMmja/64SbpmZmHDA/ODbi+DhMgTN
	iixBHvInhpXvjZZbQB3Bk9XMlqJYS2saPEpd783A+9fHVV93M1j/AuGXDZHdHFtgvEsQ8W3O7ykGF
	aQeA1hgTVQ3zBrVhgHoDAQsv4JQO4wpQ2dNc0oTTuUigfKRolZCgJlxo/ZsIDhxHQ8sT7eOk2Cf0z
	B6Ho0+xdAfcC5InfBw+5ChuUbHGA7Qm+tUAIieiEFVSe7LKD2m/J8341cRpkvbGMHFgFaJ8Wl6jut
	Nq3sAhiheg4q5g/G+cnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemk8-0001iU-Hq; Tue, 10 Dec 2019 21:08:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemjr-0001UT-NA; Tue, 10 Dec 2019 21:08:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B4AF20836;
 Tue, 10 Dec 2019 21:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012091;
 bh=NzH5TClbBu5462yRYw6EnxsG/S/iQa3NNe+nix4WRqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kNM+BG8wCiLQlbGqkGHBZAhTGr36z2cvL3riXJXnxFVtfKtVJ/PwyG0wshyPfmjIt
 NEmxW0SonhacuPaFV+LDT1V95srEngMztAyekShcJ4acZhKwgLOUuV7Tdg+RIAfK88
 xf4bd2DOvqTVpeh3Mr+hWUILZVsIN6MDnRVnU2r0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 068/350] media: meson/ao-cec: move
 cec_notifier_cec_adap_register after hw setup
Date: Tue, 10 Dec 2019 16:02:53 -0500
Message-Id: <20191210210735.9077-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_130812_862131_E099BBAF 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit 3e84a18a259e1df35e5b549ab92ec3baf82ff010 ]

When probed after the HDMI notifier, calling cec_notifier_cec_adap_register()
calls the enable() adapter callback, but the HW is not yet set up.

Moving cec_notifier_cec_adap_register() right before cec_register_adapter()
fixes the following crash:
Ignoring spurious kernel translation fault at virtual address 0000000000000008
[...]
Hardware name: Khadas VIM (DT)
[...]
pc : __do_kernel_fault+0xdc/0x120
lr : __do_kernel_fault+0xdc/0x120
[...]
Call trace:
 __do_kernel_fault+0xdc/0x120
 do_page_fault+0x180/0x458
 do_translation_fault+0x64/0x70
 do_mem_abort+0x3c/0x98
 el1_da+0x20/0x94
 meson_ao_cec_adap_enable+0x30/0x218 [ao_cec]
 __cec_s_phys_addr+0x184/0x270
 cec_s_phys_addr+0x44/0x60
 cec_notifier_cec_adap_register+0x68/0x90
 meson_ao_cec_probe+0xb0/0x288 [ao_cec]
[...]
 el0_svc_compat+0x8/0x10

Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 20958f9d5c48 ("media: meson/ao-cec: use cec_notifier_cec_adap_(un)register")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 36 +++++++++++-----------
 drivers/media/platform/meson/ao-cec.c      | 30 +++++++++---------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3b39e875292e4..3d8fe854feb0a 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -662,34 +662,27 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	if (IS_ERR(ao_cec->adap))
 		return PTR_ERR(ao_cec->adap);
 
-	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
-							ao_cec->adap);
-	if (!ao_cec->notify) {
-		ret = -ENOMEM;
-		goto out_probe_adapter;
-	}
-
 	ao_cec->adap->owner = THIS_MODULE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &meson_ao_cec_g12a_regmap_conf);
 	if (IS_ERR(ao_cec->regmap)) {
 		ret = PTR_ERR(ao_cec->regmap);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->regmap_cec = devm_regmap_init(&pdev->dev, NULL, ao_cec,
 					   &meson_ao_cec_g12a_cec_regmap_conf);
 	if (IS_ERR(ao_cec->regmap_cec)) {
 		ret = PTR_ERR(ao_cec->regmap_cec);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -699,45 +692,52 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->oscin = devm_clk_get(&pdev->dev, "oscin");
 	if (IS_ERR(ao_cec->oscin)) {
 		dev_err(&pdev->dev, "oscin clock request failed\n");
 		ret = PTR_ERR(ao_cec->oscin);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = meson_ao_cec_g12a_setup_clk(ao_cec);
 	if (ret)
-		goto out_probe_notify;
+		goto out_probe_adapter;
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	device_reset_optional(&pdev->dev);
 
 	platform_set_drvdata(pdev, ao_cec);
 
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_core_clk;
+	}
+
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
 	if (ret < 0)
-		goto out_probe_core_clk;
+		goto out_probe_notify;
 
 	/* Setup Hardware */
 	regmap_write(ao_cec->regmap, CECB_GEN_CNTL_REG, CECB_GEN_CNTL_RESET);
 
 	return 0;
 
-out_probe_core_clk:
-	clk_disable_unprepare(ao_cec->core);
-
 out_probe_notify:
 	cec_notifier_cec_adap_unregister(ao_cec->notify);
 
+out_probe_core_clk:
+	clk_disable_unprepare(ao_cec->core);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
index 64ed549bf0120..03600e8b3ef00 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -624,20 +624,13 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	if (IS_ERR(ao_cec->adap))
 		return PTR_ERR(ao_cec->adap);
 
-	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
-							ao_cec->adap);
-	if (!ao_cec->notify) {
-		ret = -ENOMEM;
-		goto out_probe_adapter;
-	}
-
 	ao_cec->adap->owner = THIS_MODULE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(ao_cec->base)) {
 		ret = PTR_ERR(ao_cec->base);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -647,20 +640,20 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 					0, NULL, ao_cec);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ao_cec->core = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(ao_cec->core)) {
 		dev_err(&pdev->dev, "core clock request failed\n");
 		ret = PTR_ERR(ao_cec->core);
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = clk_prepare_enable(ao_cec->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
-		goto out_probe_notify;
+		goto out_probe_adapter;
 	}
 
 	ret = clk_set_rate(ao_cec->core, CEC_CLK_RATE);
@@ -674,9 +667,16 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 	ao_cec->pdev = pdev;
 	platform_set_drvdata(pdev, ao_cec);
 
+	ao_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							ao_cec->adap);
+	if (!ao_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_clk;
+	}
+
 	ret = cec_register_adapter(ao_cec->adap, &pdev->dev);
 	if (ret < 0)
-		goto out_probe_clk;
+		goto out_probe_notify;
 
 	/* Setup Hardware */
 	writel_relaxed(CEC_GEN_CNTL_RESET,
@@ -684,12 +684,12 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_probe_clk:
-	clk_disable_unprepare(ao_cec->core);
-
 out_probe_notify:
 	cec_notifier_cec_adap_unregister(ao_cec->notify);
 
+out_probe_clk:
+	clk_disable_unprepare(ao_cec->core);
+
 out_probe_adapter:
 	cec_delete_adapter(ao_cec->adap);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
