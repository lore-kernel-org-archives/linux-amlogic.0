Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6EFC3DA6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 06:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XnLMJxegYdvuxClAz2DAXVfXrR/G3eKKzT+rCN/99E=; b=CRyCT+DURkopDp
	XUN7MM1twnzvTuKwNdHTLILRB8oW+h3unEdSjOkNHYh1CLKC/YO2OA+ZItMvYdBchS5MWQAj1pXkE
	H8XZmKwyhlg77l5Ndz5GpGwFLMMXkCrikSTSIhgw1Mm50CedBOp+jnhopG875yF4tXl4qNe1Wwmso
	DJz75lYdu5O5eF6SMJV57AxduTn83m40+niykLplzsYaPn/P75TxNqGD1YGhHLgpXk6Na5cas3XgB
	IOh6PUCTdDO/Eor2I993Y9ElZEPGNmL7jziqADBKJ0d1bBeaL4HMvn7lJ6EvzPrnNFA1R6+f9m3v5
	QDOOBfsBj7A2oU2Rxe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3P6-002I3b-1f;
	Thu, 24 Aug 2023 06:01:12 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3P2-002I0f-2H;
	Thu, 24 Aug 2023 06:01:10 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 24 Aug 2023
 14:01:05 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, xianwei.zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 5/6] soc: amlogic: Add support for T7 power domains controller
Date: Thu, 24 Aug 2023 13:59:29 +0800
Message-ID: <20230824055930.2576849-6-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_230108_750409_05454562 
X-CRM114-Status: GOOD (  12.14  )
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

From: "xianwei.zhao" <xianwei.zhao@amlogic.com>

Add support for T7 power controller. T7 power control
registers are in secure domain, and should be accessed by SMC.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
---
V1 -> V2: Modify T7_NIC flag  "ALWAYS_ON"
---
 drivers/genpd/amlogic/meson-secure-pwrc.c | 73 +++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
index 3e7e3bd25d1f..2233f6cb7e71 100644
--- a/drivers/genpd/amlogic/meson-secure-pwrc.c
+++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/power/meson-a1-power.h>
 #include <dt-bindings/power/amlogic,c3-pwrc.h>
 #include <dt-bindings/power/meson-s4-power.h>
+#include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -164,6 +165,69 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_AUDIO,	0),
 };
 
+static struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
+	SEC_PD(T7_DSPA,		0),
+	SEC_PD(T7_DSPB,		0),
+	TOP_PD(T7_DOS_HCODEC,	0, PWRC_T7_NIC3_ID),
+	TOP_PD(T7_DOS_HEVC,	0, PWRC_T7_NIC3_ID),
+	TOP_PD(T7_DOS_VDEC,	0, PWRC_T7_NIC3_ID),
+	TOP_PD(T7_DOS_WAVE,	0, PWRC_T7_NIC3_ID),
+	SEC_PD(T7_VPU_HDMI,	0),
+	SEC_PD(T7_USB_COMB,	0),
+	SEC_PD(T7_PCIE,		0),
+	TOP_PD(T7_GE2D,		0, PWRC_T7_NIC3_ID),
+	/* SRAMA is used as ATF runtime memory, and should be always on */
+	SEC_PD(T7_SRAMA,	GENPD_FLAG_ALWAYS_ON),
+	/* SRAMB is used as ATF runtime memory, and should be always on */
+	SEC_PD(T7_SRAMB,	GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(T7_HDMIRX,	0),
+	SEC_PD(T7_VI_CLK1,	0),
+	SEC_PD(T7_VI_CLK2,	0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(T7_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(T7_ISP,		0),
+	SEC_PD(T7_MIPI_ISP,	0),
+	TOP_PD(T7_GDC,		0, PWRC_T7_NIC3_ID),
+	TOP_PD(T7_DEWARP,	0, PWRC_T7_NIC3_ID),
+	SEC_PD(T7_SDIO_A,	0),
+	SEC_PD(T7_SDIO_B,	0),
+	SEC_PD(T7_EMMC,		0),
+	TOP_PD(T7_MALI_SC0,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_MALI_SC1,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_MALI_SC2,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_MALI_SC3,	0, PWRC_T7_NNA_TOP_ID),
+	SEC_PD(T7_MALI_TOP,	0),
+	TOP_PD(T7_NNA_CORE0,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_NNA_CORE1,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_NNA_CORE2,	0, PWRC_T7_NNA_TOP_ID),
+	TOP_PD(T7_NNA_CORE3,	0, PWRC_T7_NNA_TOP_ID),
+	SEC_PD(T7_NNA_TOP,	0),
+	SEC_PD(T7_DDR0,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(T7_DDR1,		GENPD_FLAG_ALWAYS_ON),
+	/* DMC0 is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(T7_DMC0,		GENPD_FLAG_ALWAYS_ON),
+	/* DMC1 is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(T7_DMC1,		GENPD_FLAG_ALWAYS_ON),
+	/* NOC is related to clk bus, and should be always on */
+	SEC_PD(T7_NOC,		GENPD_FLAG_ALWAYS_ON),
+	/* NIC is for the Arm NIC-400 interconnect, and should be always on */
+	SEC_PD(T7_NIC2,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(T7_NIC3,		0),
+	/* CPU accesses the interleave data to the ddr need cci, and should be always on */
+	SEC_PD(T7_CCI,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(T7_MIPI_DSI0,	0),
+	SEC_PD(T7_SPICC0,	0),
+	SEC_PD(T7_SPICC1,	0),
+	SEC_PD(T7_SPICC2,	0),
+	SEC_PD(T7_SPICC3,	0),
+	SEC_PD(T7_SPICC4,	0),
+	SEC_PD(T7_SPICC5,	0),
+	SEC_PD(T7_EDP0,		0),
+	SEC_PD(T7_EDP1,		0),
+	SEC_PD(T7_MIPI_DSI1,	0),
+	SEC_PD(T7_AUDIO,	0),
+};
+
 static int meson_secure_pwrc_probe(struct platform_device *pdev)
 {
 	int i;
@@ -257,6 +321,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
 	.count = ARRAY_SIZE(s4_pwrc_domains),
 };
 
+static struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
+	.domains = t7_pwrc_domains,
+	.count = ARRAY_SIZE(t7_pwrc_domains),
+};
+
 static const struct of_device_id meson_secure_pwrc_match_table[] = {
 	{
 		.compatible = "amlogic,meson-a1-pwrc",
@@ -270,6 +339,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-s4-pwrc",
 		.data = &meson_secure_s4_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,t7-pwrc",
+		.data = &amlogic_secure_t7_pwrc_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
