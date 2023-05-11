Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3614FC77B7F
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 21:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAgVcF/OzR8UFAVe4ODUM6VwHKVcCYnAVnXVrmn+gv0=; b=rIXW2KxbCBTHQk
	gE28is1evu7oEqDoKEQAIqFHwFmD7Z+JRowOtIitPUfdcLd+vBcjcsorI35q+tgkCxmhW3GqB6Rjg
	nr022yRP6CClvb73lF2sLHeTgT3J3wSkVfd/CAwGpfM74PxhZh/Jq3pdgO6eUxeFbMcN9a2ue99oD
	s50dbluaDD76cNVFxfbCg17EH2HjJe9LlWy1WjBOy+/gV/Cngi+291eIheUGHUdNsNA/wIEbsiY6s
	n0njM8LDaAjwB82MqIZCgND5Qv4X+7klijU7OOlnM9J2hRX0+9oraz1SaBgL2qMKuS34E8fhTntyW
	e+CHu+5m1TXE6PklrcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDTW-009z3N-0N;
	Thu, 11 May 2023 21:05:22 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDTM-009yyD-0q;
	Thu, 11 May 2023 21:05:15 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2567B5FD62;
	Fri, 12 May 2023 00:05:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683839110;
	bh=izMKXdTFH1h2UBa+MY3F3v9dqaNkzDFsQICpQYJio5U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lAqWEQ3PMUY37Xoo9RjMkqSYFW71Ex4lEIV5r5bPkbSm3VvjG6VN21slRxo3EtFPn
	 NdCJ9UsMt+lb5YdHQLxs9aERJ/MIwokQFNHbCr+pQ5AKLS5NXKbUREgi0py/ifPm5n
	 nV0vIAh783Roh1WO6WU4OjiXjxPCHLNhSNQbeFcdmJCs7H/AehdA0l3dgLy6PWjVm+
	 U3TIRhTuxct1FCuElre23kqogWOUp+7mUkZ4gi9CiBF3KNeho4wJv/TsKP8CYJlm5F
	 aHCBdCx9cBFt5nMbdIlLeAyGEIE0cvEMHQ4npapWjZIomKzH1uRD0vNgVJaz0T23t2
	 0pBkT95bf2kLw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 12 May 2023 00:05:10 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v4 3/3] usb: dwc3-meson-g12a: support OTG switch for all IP versions
Date: Fri, 12 May 2023 00:04:55 +0300
Message-ID: <20230511210455.6634-4-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230511210455.6634-1-ddrokosov@sberdevices.ru>
References: <20230511210455.6634-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_140512_667649_A1F47688 
X-CRM114-Status: GOOD (  14.26  )
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

From now, the Amlogic A1 USB controller is capable of switching between
host and gadget modes based on the status of the OTG_ID signal or via
manual USB role change.
Previously, only the Amlogic A1 IP version did not use OTG support for
host only mode, but this is no longer applicable.
Therefore, the 'otg_switch_supported' option can now be removed as
it is no longer required.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index b282ad0e69c6..a13afdb219e8 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -140,7 +140,6 @@ static const char * const meson_a1_phy_names[] = {
 struct dwc3_meson_g12a;
 
 struct dwc3_meson_g12a_drvdata {
-	bool otg_switch_supported;
 	bool otg_phy_host_port_disable;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -189,7 +188,6 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
  */
 
 static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
-	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
@@ -203,7 +201,6 @@ static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
 };
 
 static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
-	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
@@ -217,7 +214,6 @@ static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 };
 
 static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
-	.otg_switch_supported = true,
 	.clks = meson_gxl_clocks,
 	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
 	.phy_names = meson_a1_phy_names,
@@ -230,7 +226,6 @@ static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
 };
 
 static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
-	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
 	.phy_names = meson_g12a_phy_names,
@@ -242,7 +237,6 @@ static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 };
 
 static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
-	.otg_switch_supported = false,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
 	.phy_names = meson_a1_phy_names,
@@ -307,7 +301,7 @@ static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
 			U2P_R0_POWER_ON_RESET,
 			U2P_R0_POWER_ON_RESET);
 
-	if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
+	if (i == USB2_OTG_PHY) {
 		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
 				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
 				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
@@ -490,7 +484,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
 {
 	int ret;
 
-	if (!priv->drvdata->otg_switch_supported || !priv->phys[USB2_OTG_PHY])
+	if (!priv->phys[USB2_OTG_PHY])
 		return -EINVAL;
 
 	if (mode == PHY_MODE_USB_HOST)
@@ -589,9 +583,6 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
 	int ret, irq;
 	struct device *dev = &pdev->dev;
 
-	if (!priv->drvdata->otg_switch_supported)
-		return 0;
-
 	if (priv->otg_mode == USB_DR_MODE_OTG) {
 		/* Ack irq before registering */
 		regmap_update_bits(priv->usb_glue_regmap, USB_R5,
@@ -841,8 +832,7 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
-	if (priv->drvdata->otg_switch_supported)
-		usb_role_switch_unregister(priv->role_switch);
+	usb_role_switch_unregister(priv->role_switch);
 
 	of_platform_depopulate(dev);
 
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
