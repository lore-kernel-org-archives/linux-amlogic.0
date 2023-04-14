Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19384C77B6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH101SBVOJpclfO7DIm/hoKxURO8RdhpjwRDZqrtbGo=; b=RvUtSVhti/LVDp
	Ho6G/Vn7q2PT+t/r0uF53KvxNTbKNvePpsp8hVylJFqhay6xhWQRoTbgpeKP+Xg5Elt7YtcBS7pan
	6fHJW2GDLfpLLeg1TC6IG4aCi7N+XdPwhRLJJRT3RTvUJGHVvBr1HgzH5bKrmjZOh4tAtKAh9mGky
	NXgGHFjjMviIbfo7rUnKHC4X0F0IfABpheZ98p1V4A9abk3YGK2zt34r2DqGxJy+1oOk3PWM1m9mB
	lQrKgbxkw3sdnulq6doRP/tYPfWvPWTvNTfIJWXpqmzrxS+FyWVOAaLrASHZ7bC4t6GYbZ+lIekkG
	llSruwreGHbuvVt3+NYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLI7-009wnn-1R;
	Fri, 14 Apr 2023 15:24:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLHz-009wdy-2e;
	Fri, 14 Apr 2023 15:24:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4C8645FD25;
	Fri, 14 Apr 2023 18:24:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681485873;
	bh=09WqdKYRyw2DjfHpWjzV6C/vopcEZSQEhMfI25aDH40=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SHKv3Sz6dKqRl3xEMp3YCFcI87PO0RRN6UG+Ap/geWAsxptpePbI9uV9og2cLbym+
	 31Ya1Biqp7lNlZi2VZha/RlhuZfIewNctx6BDQTUFFRKr6TWRrCB2iDh9Tzs8tUnG5
	 pj5/YVqlXFgmVoCjVGfv/vRA6Xd2YDGT5iq41z5bB3oZ690XEtg4Hq5Go0zho0Hwgc
	 rh5PfU7wTjZqpK13jAktPzoI2aFqQS1Ug0g+ewLCOUe+Eif6K4fAIkJi3jKjI0wzaH
	 1DOmj68rBYrvtnnfLy+ZklpiD58kNAgvtnsnkQzUw5Lv5zFlAisl4l4aHJijJOpgNy
	 xQqXeJ1niLmRg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 14 Apr 2023 18:24:33 +0300 (MSK)
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
Subject: [PATCH v1 2/5] usb: dwc2: support dwc2 IP for Amlogic A1 SoC family
Date: Fri, 14 Apr 2023 18:24:20 +0300
Message-ID: <20230414152423.19842-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/14 08:08:00 #21104846
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_082440_210336_2C77EC6C 
X-CRM114-Status: UNSURE (   8.95  )
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
