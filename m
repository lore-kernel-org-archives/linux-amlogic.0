Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03785C79F85
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKV4HCTTvL+76MJK48WhnTPqWWJ0z+MmEgKl1GdWLFA=; b=hstIVQv5QpvtF9
	rcM0HJvu4dG2bkPc66WEdAHu/yepr9/yNuzt9riP77IT+UBiJB0z04zEwy9S7B8KHRwJEGj5nXs20
	fYF++ouF8CZc87gcv/xRXVI2rSEypAydyDHtEfyIYIbUnI6XPOsK3SADSOAeMrIeZawHa88Pl8ug5
	r8AEfqy61dLmoyCeL28Qx/1Oc54FallQPozXEdi4nf+w6a1sGIfbFQb/06gPY+qc37Q1pXhbBZ6FA
	ZysIOHyeWT5d6gqg2y8F6oWSau2WlamqDMwmGPlruPKP5LXHUiTGWC85ManWh446zr3Fc2QE90k9t
	KvQX/BKlsALpi8H2XxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNm-00000004Clj-3pqV;
	Sat, 05 Sep 2026 15:32:42 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNj-00000004Cho-2SN4
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48589798dbbso1610334f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622358; x=1789227158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cvLPMe39R/AaBDs2Mh5u5mXzrtCLtGEuv4B7IhLgiQ=;
        b=d94vkAh0S9zaTQLS08P6008j0HhaXm0HfIPLHuXHmAv67SD+J+51LeLRdm7FX+Ycz8
         1T6SADrWYy484Nggej7og+yTgSIQd40JIehxzq02vFB1VWnx7B4Tit7POyxkCH4I6jd7
         /uPpmZUKLx0k0rr4TtXyzN2IlKnYlsYey6juseYH9ROSBKc7mNHf/pn067zWyLTRRYFT
         4eab8CWhvMIyLom33ORCX1fKqPQ3Q/Pbo4ziag2s+0hwLNnnt4krghLIEVjFz6UOtNDw
         836ItED+GYjqXdJRhMI5j1HJaXavQgOyZXUKm2NA6P87ojqk19NsF47TTrsTsvnAoFV5
         8VYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0x9NbUloUbcSxqnTmahy5IDgpYjzs3xyxid00WCYT/6kgirtmR1qJIQvJZ6KKGLlFnn+E59aOkwXKspgV@lists.infradead.org
X-Gm-Message-State: AFuF++l6YsoIFXTP7RAOm9BCww1/bb6DSnOmsQMF5JsJJk7GxHLezy4F
	htpJX4+XUbhe32KQHvydTCYh/RgLr/q+ILPw4QepuE6trxw/WZ05THCt
X-Gm-Gg: AYBFou0IDl207dEwWeCUkvYJnZGuG9VwkbUYzoFKP4nrCehU3M8gSljSpDDU0KWvpOp
	1Z+I3KYKm7UMsoo1RAEA0s8+K05zqCa2v/zOT8lEiMd/b8jQNJVGuGP+ruAc/LhZ8iPeETDoTeN
	nng265OVCjqNBk/im65ZLmVWn8HV8ehsvRzzkeUo9IHCNF6kh8JehSkb8dGx+WjN1GpOVCp9sAc
	ZiCiavrQzCplRaFXrF3VBZxLzG6KSmgkDCf9W3lfA8KIJ2nmSYGDDxvtikl9N9LuOQAOZFpx3Q0
	U/j7p9MnLZNEZ+1JKqUTFJCcus1AVDO1duhSE8mSkVFemwYCRr4Altt5bVNysH+HXLEoTsd9yXG
	ZW1EaAcpgACVqte1UjQJ6GSOf/Gj16mgMCBqFAGVQHAITqJp+RgrZSf9s/KYxA+O6sZntPJJS+D
	izFgeYtNq8lTuQ5GT+fM10IFeWYVs2TTisxKed6nsNPYzDSntqIJt2n2RmZ/nkTKoX5M4QHyzqr
	9Vw5eh0ulfBHmFn20exvd3xdqNkg3EeEAfP
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id ffacd0b85a97d-4858a4671b8mr11204628f8f.46.1788622357649;
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
Date: Sat,  5 Sep 2026 16:32:32 +0100
Message-ID: <20260905153234.133217-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083239_638797_F7870BCD 
X-CRM114-Status: GOOD (  14.64  )
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

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..c0f1e929fc13 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -139,6 +139,7 @@ struct meson_mmc_data {
 	unsigned int always_on;
 	unsigned int adjust;
 	unsigned int irq_sdio_sleep;
+	bool has_pipeline_clk;
 };
 
 struct sd_emmc_desc {
@@ -1204,6 +1205,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (IS_ERR(core_clk))
 		return PTR_ERR(core_clk);
 
+	if (host->data->has_pipeline_clk) {
+		struct clk *pipe_clk;
+
+		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
+		if (IS_ERR(pipe_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson_mmc_clk_init(host);
 	if (ret)
 		return ret;
@@ -1322,12 +1332,22 @@ static const struct meson_mmc_data meson_axg_data = {
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
