Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ED0C3A5AB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D692B20828
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 13:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVtU7/Ep";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GuL5k8VK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D692B20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FXC444TC2gJwxYqkAgVItXIJeZF5meTzx1M7pr7bns=; b=TVtU7/EpIDkwUP
	RkP+DIb0JO3V3o1Qy9TWumPEsVCKocF8vYEOLK/yfKQ6LnZNfItHVVO9CP+grYLPvmOhIz4rMfMnM
	SWJ3FqDFqR4wPvQ/XNvazWyT4Wb6vqIDDwg7uG4VZ7tBOoJk4C5Vq/SzsHlv3vs52XOhLTGoeSUVa
	v16y1rjkK3fOYfz6jw8IMdRbUprTjbV4mUXy6kNfXyDyvUtqzP+6QXr8Dd+4aiSsoiTFUGKo6/A0G
	sJJGxNfzUWgpMe3uZwrm4RQFe1vAEzP5nDrEIXyVx5Wf/uyigEq7s3rCw42roX/3sJdKZMMlccsOZ
	axija4IWKX4ajEKRZdGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5s9z-0002EV-So; Thu, 05 Sep 2019 13:50:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5s9v-0002Av-Vu
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 13:50:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id y8so2866201wrn.10
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lkoesH5emPCZ1WO3WioUS9Ej0K8oiEzZCArs+vDclk=;
 b=GuL5k8VK7SEUa+eInzXIJKoFOrY5XaFAmFl23toxiV9qAxemzM16AiY5hfan5632fD
 Ar2eIp2Upvmf7AHmPSJnRaZz7ftMWRdjsHuOXlZrLHn/Qu/j9XNJnng7FoZ3hChfhFK3
 hOaBNN7s5cqT3FS0T/Qmw5WNPAh2PbxyadZqHbHVd91S1FULPPx0wFL5+ba2EbHP8+28
 XpsvjJbsCOEYKO8eVcJGQ9o8ZpZHE9zUHsf9YGglvLcMsAhy4UgdcbhLxIHkMB5H/afR
 U2zqGMb3SeB8Xb02JsPQcHc4AkdUsVpcdyzi5EJO5VaPLwmy69xBAhSsIOJRB16JPT8T
 Wu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lkoesH5emPCZ1WO3WioUS9Ej0K8oiEzZCArs+vDclk=;
 b=Sp+h6T+x2Yq9coJNk/qAlgo+sJu7n29hmRyWPJHxYNKYheX4XvV0h7Hux42z0hPwvU
 LwaBBgYZBEtHHKl/LLlc1ZU5RZAV5XFty8XYQWBmkYwJyiiC87jvIzXGB5xj2O9HbfJ4
 Mpolcy2ts4A4+8S+6FBO79Mm94kGkUB2bXmIZtKUX6+j8R40d0QSLW6U4YYg8KjJTyQw
 u8SlDm03Gn1rZpq7EYl1tNmJFidCU2BJ7j7shKJl56N5weBhQzCfLObzd1sCesKm0Yec
 C/ioQ5W/rpJNFoaga9sm2yHClyNH3euHT23Q11H60pv50V+AlPBJ0aGlRZShPHj6PIPx
 J1OA==
X-Gm-Message-State: APjAAAVjb3/C8HTXyrMVR21420eBHaAdFD6BMirZXzLtfctnUQlVRzWv
 D7eq2nW3q+4p2/y3DJiAsH8gwg==
X-Google-Smtp-Source: APXvYqyKxa95xgFb51AsXEWgQity6G8T5bn82NLaGUMSLyirFtOPoyCtT+sjuAmBC+yu4d78xYsgOg==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr2618861wrq.71.1567691446803;
 Thu, 05 Sep 2019 06:50:46 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id y3sm3324893wra.88.2019.09.05.06.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 06:50:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/2] reset: meson-audio-arb: add sm1 support
Date: Thu,  5 Sep 2019 15:50:40 +0200
Message-Id: <20190905135040.6635-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905135040.6635-1-jbrunet@baylibre.com>
References: <20190905135040.6635-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_065048_022416_76738416 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the new arb reset lines of the SM1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson-audio-arb.c | 43 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index c53a2185a039..1dc06e08a8da 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -19,6 +19,11 @@ struct meson_audio_arb_data {
 	spinlock_t lock;
 };
 
+struct meson_audio_arb_match_data {
+	const unsigned int *reset_bits;
+	unsigned int reset_num;
+};
+
 #define ARB_GENERAL_BIT	31
 
 static const unsigned int axg_audio_arb_reset_bits[] = {
@@ -30,6 +35,27 @@ static const unsigned int axg_audio_arb_reset_bits[] = {
 	[AXG_ARB_FRDDR_C]	= 6,
 };
 
+static const struct meson_audio_arb_match_data axg_audio_arb_match = {
+	.reset_bits = axg_audio_arb_reset_bits,
+	.reset_num = ARRAY_SIZE(axg_audio_arb_reset_bits),
+};
+
+static const unsigned int sm1_audio_arb_reset_bits[] = {
+	[AXG_ARB_TODDR_A]	= 0,
+	[AXG_ARB_TODDR_B]	= 1,
+	[AXG_ARB_TODDR_C]	= 2,
+	[AXG_ARB_FRDDR_A]	= 4,
+	[AXG_ARB_FRDDR_B]	= 5,
+	[AXG_ARB_FRDDR_C]	= 6,
+	[AXG_ARB_TODDR_D]	= 3,
+	[AXG_ARB_FRDDR_D]	= 7,
+};
+
+static const struct meson_audio_arb_match_data sm1_audio_arb_match = {
+	.reset_bits = sm1_audio_arb_reset_bits,
+	.reset_num = ARRAY_SIZE(sm1_audio_arb_reset_bits),
+};
+
 static int meson_audio_arb_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
@@ -82,7 +108,13 @@ static const struct reset_control_ops meson_audio_arb_rstc_ops = {
 };
 
 static const struct of_device_id meson_audio_arb_of_match[] = {
-	{ .compatible = "amlogic,meson-axg-audio-arb", },
+	{
+		.compatible = "amlogic,meson-axg-audio-arb",
+		.data = &axg_audio_arb_match,
+	}, {
+		.compatible = "amlogic,meson-sm1-audio-arb",
+		.data = &sm1_audio_arb_match,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, meson_audio_arb_of_match);
@@ -104,10 +136,15 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
 static int meson_audio_arb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct meson_audio_arb_match_data *data;
 	struct meson_audio_arb_data *arb;
 	struct resource *res;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	arb = devm_kzalloc(dev, sizeof(*arb), GFP_KERNEL);
 	if (!arb)
 		return -ENOMEM;
@@ -126,8 +163,8 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 		return PTR_ERR(arb->regs);
 
 	spin_lock_init(&arb->lock);
-	arb->reset_bits = axg_audio_arb_reset_bits;
-	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
+	arb->reset_bits = data->reset_bits;
+	arb->rstc.nr_resets = data->reset_num;
 	arb->rstc.ops = &meson_audio_arb_rstc_ops;
 	arb->rstc.of_node = dev->of_node;
 	arb->rstc.owner = THIS_MODULE;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
