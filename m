Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C64C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B462075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAZ4VHq6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b0Q4yp19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B462075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1C+3LoEVDIj+7PNoXnfE8w6SVIjnZcJvv50xJHS54IA=; b=PAZ4VHq6FMs03f
	QT1O53tHAcN9CboD308UdOoVypicApYm29JO0L21YpFSHVmBL5N4TJn8IA6TZy7FIeL5CxokaZbAM
	xkALLD25Mc8MnrvMmRBZxCvOh6KBF1ZQEFXC5qFLQFxVLaGLfMuPiDQc7fbKDGSJtztkZoQ6w8DtB
	uzLd2Wau2Pct7czO2OdRSVLiXsd924f8DBDfJs2Gaqb41DhMCXwwVEPAb5wj4rww3v70QaCC+gYYb
	LP5q19YH9+bNW8vILk/lEjvd0inWMadwQUdHP+iySDPFdGBwrTSFKD3S6UI/R8WX07tnahqrpp6M9
	0XbLrgPFRA9JUhVkAmaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R5U-0008Tc-O2; Mon, 25 Mar 2019 15:00:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R4R-0005ta-Fm
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:59:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id j9so10536477wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1nsOWFPG6K9bGK6UYys+/cEUbualMnKnuKmrKMXNZ0=;
 b=b0Q4yp19uYsNtycqKcgc6HYVdkmFwenHMO6o9QfqUaE11SN/7syw3bFbBxdnq0glvt
 G/aCN6KeUKGgDoEs+foL42p3twNe8WnapUEmyhKzWSi1+ZamzhsgFxYJSBxUd8blKlpc
 DwlMzyNshnv0EX6wreZiDhTJ1XW6krdicRQP+Sv03N2AG+0LQxWKubK/FiT2LBHCfkXH
 7KMP9Gp7MYsBITjrp81nYE4ybVr7CFYbmzvA/g3vPlFZE88M4BUTT1rLmFkvAJPF5Ygw
 fO81KvgQnjFBw7lPDy3B6XlH85MzPsri+JIdnQgze30YptDPpvz8lh9rWCl7I92IImSl
 3GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1nsOWFPG6K9bGK6UYys+/cEUbualMnKnuKmrKMXNZ0=;
 b=m5+aJYhum5Msg9fNk2m6ldkUJeqRO0FQRp3fOYjWfsA0biYnneKwmGgT4xUU7+Gfnx
 4Rv13XP7+MaIkn4Q74FgXEcY9Cg6M5lkfiXgUs/ZI0sjo8EV4twXT/34XIz7jasPVGLI
 3JNb2r89nfjjKWEvYLI2rSTo8Z2I2MQztnprdgxyYIRax+JZuItpkn7ZGctcgjED7QQM
 8x6fQIX+6BXT7Wie30ygd2L7BJv95lVWG1uGeSM4dIkz3KBI5P4woqPETZ3/vM6XZFRp
 GzNmI/edXtxLNux8wuTLazk76vgZ7lkYJi7rvyLaPPGSxfCE5ALZTxeSfecMeR/8E4dA
 VJEA==
X-Gm-Message-State: APjAAAVC2HTwVCpczyay0+Lqa2rP0W7DAyEjIDeV07GW5xYCi8H67kXk
 EFXfZ1PYbm9OMu4CtRL+DPqxOGwcZQErXQ==
X-Google-Smtp-Source: APXvYqxn3AZzRk5fzm57yi+eh1d1s7G5yiWV3bZNjUt1v+8mTPVc9pfhFOpqFgQrsa0X7XUm3rRzGQ==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr15703740wru.30.1553525963296; 
 Mon, 25 Mar 2019 07:59:23 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d11sm12836156wmb.19.2019.03.25.07.59.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:59:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 5/5] arm64: dts: meson-g12a-u200: Add support for Video Display
Date: Mon, 25 Mar 2019 15:59:14 +0100
Message-Id: <20190325145914.32391-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325145914.32391-1-narmstrong@baylibre.com>
References: <20190325145914.32391-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075927_861460_B9981B29 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the HDMI, CVBS and CEC attributes and nodes to support
full display on the U200 Reference Design.

AO-CEC-A is used for now until AO-CEC-B is supported.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 2240e365af27..a9f217b9e86c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -24,6 +24,16 @@
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
+	cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -33,6 +43,17 @@
 		regulator-always-on;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
 	main_12v: regulator-main_12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
@@ -102,6 +123,32 @@
 
 };
 
+&cec_AO {
+	pinctrl-0 = <&cec_ao_a_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&vcc_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
