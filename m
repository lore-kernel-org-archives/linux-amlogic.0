Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE111C282DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3FBB20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B7vRWexP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JRc9RRhX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3FBB20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8/6HDbcFMs9XINpSxx5hoIg2sk/C2fyLoCJWIOvEyY=; b=B7vRWexP+Yfqtr
	XJx/Bjbd+So54AmQ4jMKqqQ+rRrnStcLOtXNv3nKLxDh+2deeO2O1ITsWpp0En9bWfbJM32uVKl1U
	9ZFY2kDeNrmAjFxuFsMRT0DAALKlPUk9uo9Blzx1CGuV9NzcUQat0LkFNpIktUTMV5DGNXAIG7tdq
	7OYg3eHoh1L4wgpGEfwL7ngHetNdA82SGD8xU7NrHXGiRL90oCZRbUuN4usBe9tME22xwahSRt/Eq
	MuqWJ1LUzvkH5TtwIREE4IVMI98hKx+fWWsN8UEXcyi0vS4TXNuVZmqiZfNzBc4xvC+vtDRKNBv3L
	s85NpfEu30FAIN9yAbNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQdd-0000Fr-Ql; Mon, 08 Apr 2019 09:32:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQcy-0007oD-W4
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:31:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so13488419wmf.1
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C90Y7HygE0mkNukG/zDtJRz6NFRvz69KyUip09FFMs0=;
 b=JRc9RRhXAFeK6/yMJOEoo+ScnEDx9ifHzUyRxv7dljS2OoA1xHrAqOPWoAGty9tKhg
 bch9NbCy7zjwWdfZLjXLx7QGzGXkJs2yGI+3qezzVFCNcH//DdzRZ16nIwZYQl/U9Ia5
 te1IHjdP3Sq1WqYVTQFBWJ0LvMHyT319tx4XAcb5ON/rmcdOQiMFPno+5fcadbnX2bz6
 BBHVoBr+EVHsmojhrgTktOVXGk85A4RRS7xLOPfVDDMX3SQX5xtHn66vwYOfH3tDMowC
 ochqLgtlYecoWpI2QbHWYsBYvHUxnt4hcgBa0R6lZkfvJHuWK1VuefNRlR3Rq3G3U3Z5
 7tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C90Y7HygE0mkNukG/zDtJRz6NFRvz69KyUip09FFMs0=;
 b=rC6uwS4VZmCBQVe90BHlClJxoDe8pBRJu4dwjkEjJOrwwMDSKQc6m97+OAt1myovdN
 oesW5u6QNhGY76C4xG2pGhi0XcHtFsEutp8h4XBRHucZVTvFkNx+lCPxvFi6pZJbW8mA
 kUBfe4velxC3FhXRyZEwa/s1FmeV6Dk3LH61yWwunzTAK0/pmPk4lK75+gwEatGGOja3
 VWYsdH3gpsxl7Q8vPLZjWasf/XR59PRAGyMSzxTx2qJY7eARNWCNXiaKIPozFoe4+TnF
 vk2DXMdH4TZcMxqapGuZrmxS9ZHiJsvm4L/JohwYl3BMYQI8psvs/pfqHuiX5mb7cAcj
 mVDA==
X-Gm-Message-State: APjAAAU0lcZ6bbAYTyXWIoav/CQ0AvGPAJqUDz3eSoxIzhPhS0jDT86c
 WqQBjcgGlUGQCoQ8rpehnA3T8g==
X-Google-Smtp-Source: APXvYqzGJm0dfH6FBRfvfvtnlLB9Y1VEibjdkqVJe52rHJ1ryuwPncpH1hHkmVUKV7XvyZS5S5fpXw==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr16514545wma.57.1554715903558; 
 Mon, 08 Apr 2019 02:31:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c10sm36777427wru.83.2019.04.08.02.31.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:31:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 3/5] arm64: dts: meson-g12a-x96-max: Add support for Video
 Display
Date: Mon,  8 Apr 2019 11:31:37 +0200
Message-Id: <20190408093139.27161-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408093139.27161-1-narmstrong@baylibre.com>
References: <20190408093139.27161-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_023146_390563_303B550B 
X-CRM114-Status: GOOD (  11.60  )
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

AO-CEC-B is used by default and AO-CEC-A is disabled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b5b88262c06a..b3d913f28f12 100644
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
@@ -90,6 +111,39 @@
 	};
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
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
