Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5078AC79F81
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huYPjXzHdGpHL1dwntCfNz3ecpBgDvn/Egb/5Arl2QA=; b=Q3njF4TXyS9J8n
	AiDx6T+L2oc7VcHsm+yFz1ObRLV4DEphBQ0k3ogIF0rxrA/9IHPlu3FlkDLzOhL+cvIjLkSEnTMDz
	qTRD4eLl6LfMlpn5CqjQtyKs0U4mfQMuvLRChCNPhJTwaduGCoId9SfDFOCxVsczExAjUxsJ1n27X
	rTfVcgHe6/3FuGQ4B18jjhAzCihycHD8AduY8I5ulPzxVbe9shHppSSnCcqFoYO/3v7RBTpFy60FZ
	E2MqGIYPTWoLvH9vWcbxo8866sTGoA5wrA6pvX+g+g9Mt6Eto8nlLArYEmQ1TQKmSY634a6CbZqbf
	JOAEG4f0ZTlGtzydrSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP5-00000000jzj-1y6z;
	Thu, 03 Sep 2026 22:59:31 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP2-00000000juA-3bN7
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:29 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441fa5c37so245239f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476367; x=1789081167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/s6nvcJwx7Ifs5qcA8T+nQv2xmeJ2s33utca3H2YozM=;
        b=R4c1ka6kyEl0gU7GgH0LWHmI8KMJxF9vWhx4vzBHx3BsnNL6Ik0OQfu7d3x4An2QOH
         qMxTxukVubsEuSOpYjkYqoTJRCCEdJSS0+swJ4MrR84Hamjms9FOUJXiqqq5nkheB2gA
         V4E/o/uejI/FSZ2v/idEv8ByEggyEC7JcEYtIK7MSZ3yGwzJLJKTV+1zoh2PClXIAUzE
         KcldshEZICi4Lk1MwrqQT4F0wLJRSSqKdzAZx6m1NQd8M/cH8Cl50BlQ7ghZoK0d41fd
         078o1nzRM/przC8mSxsSap4NuLmkADL3Tmaz1SJm3giIh1VuhenJodjitVbm7dVA+Qtl
         BHBw==
X-Forwarded-Encrypted: i=1; AKwUvBy+eWWd1bwjH6aQyy1tf4lZk+QwBjjKsQqPCDY/+0x4BsM377e3NzSlC9A48gn7Fv/XQATE9OYPXZgNqFdB@lists.infradead.org
X-Gm-Message-State: AFuF++nO3FFNY0b7p/5vrcQtiwc1jYlEGgQdUNEUqjlulZlATAc69ZAB
	RJRAbUrIu7K35kEF2lp3iG0mG/2mdzNsj2oMayJlaYxVDNX5pfWh1kxL
X-Gm-Gg: AYBFou3oqAORPH1qFjKIiABff2OIr1r4oztBSTTQ6sjSWQil8jbp3nq3ittilkS4DkG
	v1qBCBI2V+ogBatj0pM0+lrbiHVv1JkdtKfJrjke6aUebOeb0JPlrpZ7Q8ghHk7zUBwMpYlNQcD
	ov7qnu2FNalOBc2vEO3YrjgvXnJwBCdi/AXX8DPDQ1FqwM3BTbKJNJD4KnWBPlFfUAwkknfNppN
	tMbdKdBRITGrfPfjhkUyQyBdrPV8CSV4oLU1u9pluuUaOdZpcjZMMq9icz58j6RZh39gnsaof/7
	f340sfjqpNfq3S1foNaeLDmP9+mdl+98pNOo7S2HjqU+R2VlW5iTxRh4vSrN7Q2ZMy8jKBWcJgr
	p2wKvd2xX1Cj3kPNUM12RIJ+4sD7eFFGzpZkaA/+C2I6QXEuVPCtyfYOa+5VzOfRn4rHo7MsRWl
	zVmBn+bogYZGw50SJkTaeicRTwL0UrHkokzyxYmikMX8DsrV6Irsucjj7/pEYpXUOf91C2wQdno
	bfObNqIEIKRA17dCt/ICciFO5Sbx953+p2WpJc=
X-Received: by 2002:a05:6000:2505:b0:485:8ad5:f965 with SMTP id ffacd0b85a97d-4858ad5ff97mr104210f8f.2.1788476366934;
        Thu, 03 Sep 2026 15:59:26 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:26 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
Date: Thu,  3 Sep 2026 23:59:19 +0100
Message-ID: <20260903225921.2290441-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155928_917375_FE67A7D9 
X-CRM114-Status: GOOD (  15.62  )
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

On the T7 SoC, the bus path between the SD/eMMC controllers and the
NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
design to help timing closure. The stage has its own gate clock and,
when that clock is disabled, a controller that starts a DMA transfer can
never complete it, hanging the storage devices and, from there, the
whole system.

Add a dedicated match data for the amlogic,t7-mmc compatible that makes
the driver claim and enable the "pipeline" clock for as long as the
device is bound.

The clock is deliberately not optional: the hardware cannot do DMA
without it, and failing the probe with a clear error is preferable to
booting and hitting an undiagnosable DMA hang later.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..68566d7eccc7 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -52,6 +52,7 @@
 #define   CLK_RX_DELAY_MASK(h)		(h->data->rx_delay_mask)
 #define   CLK_ALWAYS_ON(h)		(h->data->always_on)
 #define   CLK_IRQ_SDIO_SLEEP(h)		(h->data->irq_sdio_sleep)
+#define   CLK_PIPELINE(h)		(h->data->has_pipeline_clk)
 
 #define SD_EMMC_DELAY 0x4
 #define SD_EMMC_ADJUST 0x8
@@ -139,6 +140,7 @@ struct meson_mmc_data {
 	unsigned int always_on;
 	unsigned int adjust;
 	unsigned int irq_sdio_sleep;
+	bool has_pipeline_clk;
 };
 
 struct sd_emmc_desc {
@@ -1204,6 +1206,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (IS_ERR(core_clk))
 		return PTR_ERR(core_clk);
 
+	if (CLK_PIPELINE(host)) {
+		struct clk *pipe_clk;
+
+		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
+		if (IS_ERR(pipe_clk))
+                      return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
+					   "missing pipeline clock\n");
+	}
+
 	ret = meson_mmc_clk_init(host);
 	if (ret)
 		return ret;
@@ -1322,12 +1333,22 @@ static const struct meson_mmc_data meson_axg_data = {
 	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
 };
 
+static const struct meson_mmc_data meson_t7_data = {
+	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
+	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
+	.always_on	= CLK_V3_ALWAYS_ON,
+	.adjust		= SD_EMMC_V3_ADJUST,
+	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson_mmc_of_match[] = {
 	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
+	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, meson_mmc_of_match);
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
