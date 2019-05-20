Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C468C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F7A20815
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ly2oCmsp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Cbqk3Ii8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F7A20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLgLs+IXVOYTRXGpke5Lqh3wE6c8g71qD+LKAi+SQJc=; b=Ly2oCmspBUcc6e
	vzBLnBp6JNqMR2jQmuDIfsnAHySc1n8sMMeM98HWQKKTMG1mQKrzmlni3SfG6AsCaQbTJUL/OQZIY
	XcDZUP7YOkj/QPOBEKXakpw9+B7Loil/mR/IdzqGaSLjNKlP9ATF99z5YuwiX9CWk1+6LsA8y5q/u
	AzLPdI/ikGLocnQqWCNc44ma3ap6QirBC1QKAToK7sF2E+vE/pYn6ajVxfuJmdLATIwiN5nXSma0o
	Q7q49hbbIz3Nr/YoymDhqzxQLBcPb02xyQ/VYRBaYm52r+ESzk9YdQtC2aLFIFbs+L3ZEuDJS/Qbn
	Q/4+zX+U7eWh8i2hnCrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSi7L-0004kd-Tf; Mon, 20 May 2019 13:14:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSi7I-0004gU-9L
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:14:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id n25so12590813wmk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JgNiUlcyTLppuY9tH0ogOnTGm4dNQIA4Aw7Xw6YAiwk=;
 b=Cbqk3Ii8e7bOSzJ0ptEJRWFqbnaWoT1kfUF2zytpr1axifZncBF183TsnnWcfTbOGt
 BHyQ7+XEBgVfKlMuQozejU9acPZExKrOqegeVRi8BiftxAAkKE8qaGAheclhfJWSGUfG
 jh1JJUSq1Mcp5p3laR6tVKstrK6MFuhL/HylVWiA+CZMALnfFKkYCP7K7iT0Bdy9nkfc
 MxGcel7qYSvjjevanb1DaCxRcu7rhB8jcpYXic7+7UM3OWJOeNANMPjGQoE7OfZkYePY
 xTluxTb+dThkZFvy2KiR+PSnZwZPc7dbb4DrrE6iY6Sl0ss9xlDOcZZh5J0MN6m/x1rY
 CR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JgNiUlcyTLppuY9tH0ogOnTGm4dNQIA4Aw7Xw6YAiwk=;
 b=SR5V8KYu0NkWgygV58y7nkvNotCBhQmD/gNkNXSqI56u2dcvnBd64f5uaWaeoomifq
 wMDeuXwwbAEqManROSB2wHv/dryqWdORqVR/06ADPttnFWnLwi49scv7IfczlkJ13y2l
 bklJ87yVRgtPNOD4Ysm1Qtx25YRtIewQlhJrpB/3B6ToZc/MORjiKuIJTWLLHssOjhx5
 hlWfiLZuKVqUuAs5mSqUdmcRMpIh3+A4uFdzFVcfstEzB4R5N1lsuQKzoRng2eCnrGAj
 fK3ck+YQZ4ng54W0ApsiikAphFemzWMQGcW+7pUZtKxckub6hLMwX2GlCoBb7513IXRM
 zG7g==
X-Gm-Message-State: APjAAAVOsNf3bbYVXswTq17bUPtR60S2SkN29l9hOL6bTMGPq6giQLvy
 qGF1zKKMOKjjo/XVGox1tWW0bYi1ISM=
X-Google-Smtp-Source: APXvYqyWr5RHhb38v+c9DGSDDjroLx1VJ4vpASEZv3rClG1SjtEohEjSfWfel9sbjtvmOB5JVHNoHQ==
X-Received: by 2002:a1c:7f10:: with SMTP id a16mr11482879wmd.30.1558358050598; 
 Mon, 20 May 2019 06:14:10 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z8sm18054284wrh.48.2019.05.20.06.14.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 06:14:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/5] arm64: dts: meson: g12a: add ethernet pinctrl
 definitions
Date: Mon, 20 May 2019 15:13:58 +0200
Message-Id: <20190520131401.11804-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520131401.11804-1-jbrunet@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_061412_431882_D2EA481F 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 1d16cd2107ea..def02ebf6501 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1109,6 +1109,43 @@
 						};
 					};
 
+					eth_leds_pins: eth-leds {
+						mux {
+							groups = "eth_link_led",
+								 "eth_act_led";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_pins: eth {
+						mux {
+							groups = "eth_mdio",
+								 "eth_mdc",
+								 "eth_rgmii_rx_clk",
+								 "eth_rx_dv",
+								 "eth_rxd0",
+								 "eth_rxd1",
+								 "eth_txen",
+								 "eth_txd0",
+								 "eth_txd1";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
+					eth_rgmii_pins: eth-rgmii {
+						mux {
+							groups = "eth_rxd2_rgmii",
+								 "eth_rxd3_rgmii",
+								 "eth_rgmii_tx_clk",
+								 "eth_txd2_rgmii",
+								 "eth_txd3_rgmii";
+							function = "eth";
+							bias-disable;
+						};
+					};
+
 					tdm_c_din2_z_pins: tdm-c-din2-z {
 						mux {
 							groups = "tdm_c_din2_z";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
