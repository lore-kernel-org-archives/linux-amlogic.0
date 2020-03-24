Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D80CC4332B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:23:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE7E2080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lYP87xAR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r3YYIIXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EE7E2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI0alboIUjq9cZ0SR1D9ARpOoW1f4WWZxRQUWRaWZ24=; b=lYP87xARvtsla+
	mLMB6vPzDeFE4ntvQ88Bus9vXAWaSc56ZjvPsSABfKoOERQu/6BDQBH+/MvwJldAhqy+PBEbFGmKO
	EvGaKYyf5jBUhrHzPnsJtkxQ9q2BjoZiYs3HelzywwIjvNUYy2MoGzUYmKOdfaRUwFwu5CrFyeFHc
	4fG0ps9v6fUhSIdeVUxcbSFQ6FvWSZLMkcHv9S0yEHaf4TgXSECnbOXsNEiBHMGbNg4dbeJSzgdlK
	7FYYI+1uylvN68QQpw1lG4LYqPzDJVH7Udy0lnk6CD+M6vYVPNzj4IeXXNS5SZGsHQsdL/v09Qlwz
	oXFB1azlfj6UF1Fewavw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgi3-0003vj-8f; Tue, 24 Mar 2020 10:22:59 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgfx-0001wL-BD
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 10:20:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id v25so701141wmh.5
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAt+HdDto2gFeGUw4ztWf5Rpdip/FjGrs7cpqwQNhSQ=;
 b=r3YYIIXWo1CNzzCPPmO7j+2H6A7TCKHz2xQF9BT6aNiJNQ8RnNBzd1UxrAJccxqmmk
 krIOaubpkJtZtcEKW8weSa+9ZCtrw01enYSCqjI96lWPli3kDnvRBiosdpVYa4j4IYoQ
 VmvuGozP58hTOxpei3Y8J+b1AJuh3hd3s4ZsGeeCGGFlYtkZrv75/eV2NY3moeurf8uy
 ARM+QHrd8igOo7/Z3ZAgte1CJeEdhrm4ne90Gb5CMhkoNRYulqj2hnZrtUCtQ2PfAztS
 7yks/oclmXesLLhZyFAvyAhKM7HxS1KuICQXwpPx5ASEhBmLm99Pu4ux4DBCreOCuEfR
 ktOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAt+HdDto2gFeGUw4ztWf5Rpdip/FjGrs7cpqwQNhSQ=;
 b=fBSJfa2oIZNEXvhV0VK4886gaHp/K7rOEkNyZ2dsR2qmQe/1dZqvtjTKG9RgCFowcS
 6pqmU/9HqBN9GHlClQwX/nCC6+jrD4vjj2MD+q2YWQX25X3auRQnZbuUVBsNiLoQbF0w
 Ij6Bi6bR9w84RafAEgDoJfFX1exs57CpaldEu2LP7c/gTAYpNWN8m8/S3dyyQdU7q5EH
 7H8IkUu9iMAH0+GebUReEHk754Irn29MpQ5rEipnrnVmsjYskb4W3bz67RjEhLWFZ+Ev
 sWFwZW81iBR0GmHmwaijfSH/jPJLT4PTAjfCzj5qmuEX+I0BVP2sqs6v6mUVGfYhQYau
 4ycA==
X-Gm-Message-State: ANhLgQ0GyI6gIzABcz0cUqKfY1U7mY44BQ7jtyE2odCa2/bcgdkarIQN
 9lPA4TANPEhEIPAX/gvRBmBJnA==
X-Google-Smtp-Source: ADFU+vvrml3+ybJ3VeVfRgDYJVaxmt4+SDOcYN4kMnq4qe5+1jf3MqolpUDfWJHUw2xnpPJMQI+5bQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr4434252wmc.49.1585045247270; 
 Tue, 24 Mar 2020 03:20:47 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 03:20:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH 07/13] usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host
 phy disconnect
Date: Tue, 24 Mar 2020 11:20:24 +0100
Message-Id: <20200324102030.31000-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_032049_451518_1DAEC5BC 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic GXL/GXM SoCs, the OTG PHY status signals are always
connected to the DWC3 controller, thus crashing the controller when
switching to OTG mode when port is not populated with a device/cable to
Host.

Amlogic added a bit to disconnect the OTG PHY status signals from the DWC3
to be used when switching the OTG PHY as Device to the DWC2 controller.

The drawback is that it makes the DWC3 port state machine stall and needs
a full reset of the DWC3 controller to get connect status to the port
connected to the OTG PHY, but not the other one.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 65c220b577d0..04ef70661711 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -123,6 +123,7 @@ struct dwc3_meson_g12a;
 
 struct dwc3_meson_g12a_drvdata {
 	bool otg_switch_supported;
+	bool otg_phy_host_port_disable;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	const char **phy_names;
@@ -147,6 +148,19 @@ static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 
 static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv);
 
+/*
+ * For GXL and GXM SoCs:
+ * USB Phy muxing between the DWC2 Device controller and the DWC3 Host
+ * controller is buggy when switching from Device to Host when USB port
+ * is unpopulated, it causes the DWC3 to hard crash.
+ * When populated (including OTG switching with ID pin), the switch works
+ * like a charm like on the G12A platforms.
+ * In order to still switch from Host to Device on an USB Type-A port,
+ * an U2_PORT_DISABLE bit has been added to disconnect the DWC3 Host
+ * controller from the port, but when used the DWC3 controller must be
+ * reset to recover usage of the port.
+ */
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -282,6 +296,13 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
 					       enum phy_mode mode)
 {
 	if (mode == PHY_MODE_USB_DEVICE) {
+		if (priv->otg_mode != USB_DR_MODE_OTG &&
+		    priv->drvdata->otg_phy_host_port_disable)
+			/* Isolate the OTG PHY port from the Host Controller */
+			regmap_update_bits(priv->usb_glue_regmap, USB_R1,
+				USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
+				FIELD_PREP(USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
+					   BIT(USB2_OTG_PHY)));
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
 				USB_R0_U2D_ACT, USB_R0_U2D_ACT);
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
@@ -289,6 +310,12 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
 		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
 				USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
 	} else {
+		if (priv->otg_mode != USB_DR_MODE_OTG &&
+		    priv->drvdata->otg_phy_host_port_disable) {
+			regmap_update_bits(priv->usb_glue_regmap, USB_R1,
+				USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK, 0);
+			msleep(500);
+		}
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
 				USB_R0_U2D_ACT, 0);
 		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
@@ -421,6 +448,13 @@ static int dwc3_meson_g12a_role_set(struct device *dev, enum usb_role role)
 	if (mode == priv->otg_phy_mode)
 		return 0;
 
+	if (priv->drvdata->otg_phy_host_port_disable)
+		dev_warn_once(priv->dev, "Manual OTG switch is broken on this "\
+					 "SoC, when manual switching from "\
+					 "Host to device, DWC3 controller "\
+					 "will need to be resetted in order "\
+					 "to recover usage of the Host port");
+
 	return dwc3_meson_g12a_otg_mode_set(priv, mode);
 }
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
