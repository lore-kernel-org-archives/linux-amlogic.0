Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296A0C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D362075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NR5wRGAy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0PXFX9I7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D362075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJlp/fPo8WseyvoCfsTZZ3qxzAFad1KOBRNGs/TkgEs=; b=NR5wRGAytaSvYe
	ze5IEbPSjcDHMqJvl5xgq0yEc3z6g6p4du2GIcCt4soK8Eu1PI+zRPs+8z0wy5G7raGw5TN/fgZAk
	4uEbYJmqCi7EDt2/8Wgc0YQnbVQIMvIugQrTFFSI1neOjFTNGeasDt4xTZ4RH1Ov89AYFHaT2vibi
	wB7Pkeki/U6HQ/6IM+ecjLSFoo88veDFPDLtYEc1zAHDbgxH1/Tima95B472luo/ce5D3ziEHEV8V
	ObDnC36+3jgoagVUtm3LOb/xDBnGscAwoi6N1c1YuTep2Hg5kNOtnb8kIjUrxP+/V4kNj9MZbk84E
	DMLLERjhqOmxYvccMxCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R4p-0006S5-NU; Mon, 25 Mar 2019 14:59:51 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R4O-0005sw-KJ
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:59:29 +0000
Received: by mail-wr1-x444.google.com with SMTP id q1so10564156wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0+TIG6VNjrqUujR6aG+tFwwFoGuZYT2WNxyTgEQcO8=;
 b=0PXFX9I7jb9iP16DZa4aEdcF7/XDIIQs4p8Vr45jAfJoxVHaeG1I/WVPwRwlK3WzWq
 h/rCwxiwgpu82NIGy8gJPr65mmxCSX0FLrQ3XteuI8ApgJo6MtqKziw0L2+hzxA82uTr
 qvFOhLxXR1JtgGGjQAwAicpfynbkrpQ5b8mRMojH3Iz8AsMSTRmz0wXLFhFtRkabEcCj
 ddYZ+84cQh47kdakz8TZ/s0vVBRFTylxqy8+Aj8pUfK8/tnSVj5YHvb+2yhkaJEChWJT
 A4u0GxRZdgaQTIoW/sftrpm0slWvl9CAqlPl7An8WtyPrehAvro0CkLxx71JTwsX8WJM
 6PWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0+TIG6VNjrqUujR6aG+tFwwFoGuZYT2WNxyTgEQcO8=;
 b=Ea1zj+2caM5qBd3mj3fNM/s/kyu8z9hcjSGh0nKbtJiGC5KYEHautfKApzqIY+dLi3
 9SDxe7PoG+FPI+7xOxQ8tgTho04UCiSLCsy//42QjnvVPvOOpMxbhr1Wkhzn9NIf/lCR
 6P1gids7+NOEcnz1/5H1MIjA3uldS2M/ahU60Xs0kH0Exj/C+Pwgh4VfmmwhS3N2a0it
 WVXsHoPKs2Eg1EvEykYT8I0U1esekU3vbm4sWeZS/3EO+Q7SYi9jSL5jF3GZabSbuqN5
 oYUOeTkBn8CtmbAxJCTFXTVtGyRV9RG5yJGbx8eDgT3DMN+8aKTkEBE1Nv619/DAJHGl
 ZK4w==
X-Gm-Message-State: APjAAAX4GJB8MsN1lGnTWGT74lFs07+Mb3XQf9+rsNlMgUzdiAN7+8s8
 NNuhCJIGSSjOs6lZj1v4O9lI7Q==
X-Google-Smtp-Source: APXvYqwMam1A4aufyBg2Z8cGjwAt+XemUqKzVmBCCtbnhW19uT4Uh4kASSjbEU/TLZOQVi4qp0Oisg==
X-Received: by 2002:a5d:66c2:: with SMTP id k2mr15403349wrw.312.1553525961075; 
 Mon, 25 Mar 2019 07:59:21 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d11sm12836156wmb.19.2019.03.25.07.59.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:59:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 3/5] arm64: dts: meson-g12a-x96-max: Add support for Video
 Display
Date: Mon, 25 Mar 2019 15:59:12 +0100
Message-Id: <20190325145914.32391-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325145914.32391-1-narmstrong@baylibre.com>
References: <20190325145914.32391-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075924_715414_CB2AF00E 
X-CRM114-Status: GOOD (  11.10  )
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
full display on the X96 Max STB.

AO-CEC-A is used for now until AO-CEC-B is supported.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b5b88262c06a..eac4f5523e78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -24,6 +24,27 @@
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
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -90,6 +111,32 @@
 	};
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
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
