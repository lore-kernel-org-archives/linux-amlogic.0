Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE556C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:33:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F87B20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaITn3ty";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="glJp3/n0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F87B20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvUMV6X/+I1QdJN6cBaxB9D71EFeLlxu/TCRDOyFaJA=; b=BaITn3tynvF/jF
	YnrcMgJav8JwsSJCFLAeSdLJChRA7IRmqOlPwX2WLdZrDQfqrxw7tBFzHwUJ/E8Gwq9hC+WZIBJOW
	DYGo1IlJJf9k3kmf7yIrfpuL8FDq+Nr7x2aX9sstSbVC4+SU/BIMG1kI+qzI1RrPmtzHDGEyJZzB3
	m9lM7TsSOFrydNRfKfAZTXbVI8h/asuW0/r7ZJy/OEPUPlP8zjZF4+pKbRWtU9OCqQ/3Z72nq1Gum
	orH67HAZ/oXZ8hQ3Bgt28zs0gfulqQ4pw/4l+sG2lQWEhRtcDDJHDOm125vWyzI6SQVWNqLpL65yZ
	lo9zLqClfiB3JIKDrRqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQeG-00015W-O8; Mon, 08 Apr 2019 09:33:04 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQd1-0007pO-64
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:31:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id z24so13992630wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yaU7NIMcW3tdSdPQAkkny9SZP4+9jAbAzKLhaKmgEX0=;
 b=glJp3/n0ZKJJSx+E6CpcZmnF1wEOmEF/AfSiaJJX/UJL3jDuCqbasudOEZ/kwMD5xh
 5n5wGNQ5UYmBrDrigDXiiRPba4S/mFfZMy5spi+B1gcamB/o/VPHeQ9ha0jVJbjyNPdR
 VA8XpiQBoO0UWZiuWoM3SxUm5l25sB3gg5U+q0ZaVJ94eg5+p1Hue3iHuIlGw4yHHUyL
 06Ln/7xW6n46cst2CyV/aiGSNAdHOyGQGNPUAgPi6j0E7qwWFoAuBt3dxTFQBoF4lmP5
 Wn6LlSuR32lawNNEv63XJOkShQLLmrpPRIOLYCytV6QjSxhggUKEKpZmfYFBBLu4K7lT
 DTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yaU7NIMcW3tdSdPQAkkny9SZP4+9jAbAzKLhaKmgEX0=;
 b=UWOkmlTtCXA5sz0rZR4elIEKK0e44iQMKWyd51ZFWfMdLO/mBM25Rs9a5bKiKapw5e
 vS+onPJjuGRsIkmJ5z4IQoPaLukNOPDdKn+ZkCkNz6sJJYN/Q+AybUHO32NtlKcIuT+p
 5EJsvh402qT1OoXPt3u+N5vVzWImfPtTrARp/CvtnSRUy/kEYMLbgCe+mkKweEGU8dYA
 x/YXUEU6xwib+h6Hev079Eqh2TIuF2KTgDyO1uzZQB8ufJ2lbGD9beiVtkqOn39dY6vp
 OjlzK6hwLbHnwRGPGqyl2N+svaJYu7teapvtMvuYSTctrHz6ANEimEU1jUzFvIt/CYL5
 kAdQ==
X-Gm-Message-State: APjAAAVLE6gLRzSt/tGKHr0Zao5ygzyHbNGvPug7F/ZswD68WMz0OnUK
 VUPobVfGybAJA5jK7/QUBB4bKQ==
X-Google-Smtp-Source: APXvYqwfSOl9DE6nbVm0MkaxAsI771gH+QmlwapHjt0w1hAxbt8Pvd6trrP6zooM95Hdrymq+oy0PA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr17542154wmk.18.1554715905695; 
 Mon, 08 Apr 2019 02:31:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c10sm36777427wru.83.2019.04.08.02.31.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:31:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 5/5] arm64: dts: meson-g12a-u200: Add support for Video
 Display
Date: Mon,  8 Apr 2019 11:31:39 +0200
Message-Id: <20190408093139.27161-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408093139.27161-1-narmstrong@baylibre.com>
References: <20190408093139.27161-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_023147_313444_EE21CB34 
X-CRM114-Status: GOOD (  11.70  )
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

AO-CEC-B is used by default and AO-CEC-A is disabled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 2240e365af27..0e8045b8a915 100644
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
@@ -102,6 +123,39 @@
 
 };
 
+&cec_AO {
+	pinctrl-0 = <&cec_ao_a_h_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cecb_AO {
+	pinctrl-0 = <&cec_ao_b_h_pins>;
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
