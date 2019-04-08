Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91FEC282DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991BA20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZOs1L1d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Aw66rmbD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991BA20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nEfy1lIGkgEz5SGTy3L5e1s+LWcwi7z1OVZUXwdmSc=; b=HZOs1L1dxtI0lu
	lxVD8HXiykC0opCmoQN42JFvxiaXdOYjAoDjDlZ8vCPDNwLgz2737eILZTar+LbX1KB9FtbnuBpEL
	QF+nNiaGaE6w5U9eCj8iqIF0adu6BTgWtNgsqzYD9zR3QwUTubLD9g04xBYI7KDh7uTBQRRyoj420
	LwbWFznWYKrPikqmNNOxPDGlanPT8PpLGLvL7DxA3MhnhTgxL/2s7aFIkWtg3hybOUyeDqOXbxc25
	aot0k5CUqbUGf6SIUJafm4qkeDcQ5n0WuogseukonhR/ELOrFsZVZSarw7I3SnJrPu49+jsWLyGKv
	L2zGg4pNb61d+x9qkQlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQe3-0000pF-SC; Mon, 08 Apr 2019 09:32:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQcz-0007oF-OL
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 09:31:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id w15so13911355wmc.3
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0OhW0PixCcZE3GgEvOYBQ3vXGDFPSSPy6kTggO+4Z8=;
 b=Aw66rmbDlY21uk3y7OpuNy9TIevo2FXV++FK0kZ+TLdEpfHoO9BREktAkplxeHy5WT
 IRXIPfYzylhya6Zp/89Uqxy/MHp0m8kSGxIZfbB2LGMr61/DMbG84LX8bslaqzVjeppi
 Wn1+/pEEucV2NW8+jsHWYK5AYL0IU7yfOy8qUckBSyLVG7/HhIQNO19e8JUfE56acZlO
 RaDPzrcnrVrhniIEJvRGNU+xNF1VBde5GRIVcZJHArLxPV3gcvpDrA/FdFbbPIdxJ/jb
 n8iGa1U//p7KuhMYceq9TLEK4WEht7NKSaMRiEO7Bsh/N0VUSi0EVDu82rBy3PaWeKdm
 X4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0OhW0PixCcZE3GgEvOYBQ3vXGDFPSSPy6kTggO+4Z8=;
 b=qDDhPdq5oMb0JfpJeu8k/iP0YoWb9DHrIMhfsrQ7/W3uKKv7Oq8xBK2/hEziGHrV1r
 8QB6iJPAzeHSVeu1Kfux0nxq7GqJ6KYwose0zgnVaHoInO2N2xjgzjRUYriwVLacY5Ld
 hbGkilK8EH/6hBfDTNHB3v02Qq6iWKMb0ir/h8Yw/jM0doGrWg5V6FYoGk495cgpGWtU
 3wZAKg/4z2KCJAobWL8eW4nSLAKzEWxdAsKt5JIR4koBlx6JCeEFlxT/Gt3/dPoM2c4b
 PSZPZzWg9ojYiqfNHZ7WDaDIogHvJpRkAE/XhBluXGdHbar2Qh7Grt5JNy7rEbpLqgwW
 c4Qw==
X-Gm-Message-State: APjAAAW1tuyKz/TPXiGJIjrzqN1AV2ZhX2QcN5a8FPGFHP+dfLY4OJm0
 g7RvX2gMurX3jM0lkzv30oOVDA==
X-Google-Smtp-Source: APXvYqy5TFymeRw5ntPQxMe3cCfJSmX0KwOqNbF0Mqfo24DAhGH3N0rMSXJ59QYDjE/mIqKbjs779g==
X-Received: by 2002:a1c:81c9:: with SMTP id
 c192mr16687549wmd.124.1554715904264; 
 Mon, 08 Apr 2019 02:31:44 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c10sm36777427wru.83.2019.04.08.02.31.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 02:31:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 4/5] arm64: dts: meson-g12a-sei510: Add support for Video
 Display
Date: Mon,  8 Apr 2019 11:31:38 +0200
Message-Id: <20190408093139.27161-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408093139.27161-1-narmstrong@baylibre.com>
References: <20190408093139.27161-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_023146_392492_2BC0B47C 
X-CRM114-Status: GOOD (  11.85  )
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
full display on the SEI510 STB.

AO-CEC-B is used by default and AO-CEC-A is disabled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index c350a0165d44..34b40587e5ef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -44,6 +44,16 @@
 		stdout-path = "serial0:115200n8";
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
 	dc_in: regulator-dc_in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
@@ -61,6 +71,17 @@
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
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -103,6 +124,26 @@
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
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao1v8>;
@@ -120,6 +161,18 @@
 	};
 };
 
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
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
