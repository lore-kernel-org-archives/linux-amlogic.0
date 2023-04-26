Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B0FC7618E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Apr 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnlzQK1bZwU9yt1EBXm4+/L+dO/x8WxdgXoATHyKFUU=; b=IB6lDPGTfV9gAq
	PmfoyPSMxUHhs+uHTQE8RQHa2oehEYdFV6q5ZHGBaAIvFZsDljh/PtJCJeTbLzVV/BjI5Ox/gPPfs
	BMJIFeKTzFN0ffL6XtA3H/JSSB5MC+1yJaz66ZaFQxLeJQItQ/c2vTbmcGpIiiRIo9hvalbiUBe2F
	9uO9wtZLbwuLoPsdJAFba4nhy0L3t1LH+u5wivcXi9xIAylODev9J0nLkRhsU7eH6wT//Gb/NPUt2
	VyIeb+U45hVjr0XBGnsRRJbI78ivUReP3u4Q2+4OQ1fFobfuyo/ZlWFTfSGTHBNRV7HeAYMSdBgcS
	NqeWg+ROEW8njzlKLlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcPL-003SDQ-30;
	Wed, 26 Apr 2023 10:29:55 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcP8-003Ry0-2z;
	Wed, 26 Apr 2023 10:29:45 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 042DB5FD7C;
	Wed, 26 Apr 2023 13:29:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682504978;
	bh=eyzCCsK01f/afWykUeqT1z5S763OYcMrDYYa5HTJ5Mo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g9JZahJWGBQmrx8vhJ0nSwBEYhead3HRMZY0AoFLAOFacFXGCNm5+PpB/CszqPHwV
	 N2MFLEllnAcwuctLrLFN2/ubVoDK1cagkH4gZNMPPDc1G8ZUyAPOpuVXib+x4F6ZYC
	 oYsXJyRF9pxLxGOupUvKtVsQQHYBZeYYM8Ss7bOXg6YRlcKzxM87ESBuPESkjZlLFM
	 olW/fIRnLMR9DAT4gFCM8cbd78wPNrQJr7/QBPRAfvJKFZwD8AJKPH99W/TFRTOCcW
	 vP5I7Z7nVDL8QrlrCuWM2AU2OHSPDpfA+K7ObsDNzSkB2/w9rv65pysvk2TaUHBmR/
	 FzwUGTavhRVMw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 13:29:37 +0300 (MSK)
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
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v3 2/5] usb: dwc2: support dwc2 IP for Amlogic A1 SoC family
Date: Wed, 26 Apr 2023 13:29:19 +0300
Message-ID: <20230426102922.19705-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
References: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_032943_345184_0DD8826A 
X-CRM114-Status: UNSURE (   9.61  )
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

The Amlogic A1 uses dwc2 Synopsys IP as its USB peripheral (gadget)
endpoint, with different DWC2 parameters when compared to previous
Amlogic SoCs.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/params.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 9ed9fd956940..098fbfc774ab 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -161,6 +161,25 @@ static void dwc2_set_amlogic_g12a_params(struct dwc2_hsotg *hsotg)
 	p->hird_threshold_en = false;
 }
 
+static void dwc2_set_amlogic_a1_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->otg_caps.srp_support = false;
+	p->speed = DWC2_SPEED_PARAM_HIGH;
+	p->host_rx_fifo_size = 192;
+	p->host_nperio_tx_fifo_size = 128;
+	p->host_perio_tx_fifo_size = 128;
+	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
+	p->phy_utmi_width = 8;
+	p->ahbcfg = GAHBCFG_HBSTLEN_INCR8 << GAHBCFG_HBSTLEN_SHIFT;
+	p->lpm = false;
+	p->lpm_clock_gating = false;
+	p->besl = false;
+	p->hird_threshold_en = false;
+}
+
 static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -258,6 +277,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_params },
 	{ .compatible = "amlogic,meson-g12a-usb",
 	  .data = dwc2_set_amlogic_g12a_params },
+	{ .compatible = "amlogic,meson-a1-usb",
+	  .data = dwc2_set_amlogic_a1_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
