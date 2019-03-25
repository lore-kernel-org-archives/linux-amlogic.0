Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426F2C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E012082C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9zrFOPK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yfJMTXxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E012082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9HhdaHrSUHnrB695F+CrcK0YvUWhKza6axHI9Qadoc=; b=E9zrFOPKxTNZ4f
	w3sh0qQv2SXMu123I35EYyO2lDzByb2G/1yWneKyJYHmSrgd60eOgyuh9rIHx00VXY9sL7k1q5Tsv
	3dodA9/oLIzQYd3OHXWr/wVBPkE3ZIq8mPU7/NUrRmWSuW3UXYpQOaKOfSAQMMJyqLK7j47/QAVWF
	PFajfbR8iL1jTAdsnlxeZ03pGzyH/gQluYP5+RVDILVAJWp67w8Bzn8LDBD3VxppI8TNlSJoWi2ut
	NJFHmd7AGLUSP4bCD4t8KAuZUusGBuK3f6aSv81k16afDIuGN0i83V+GqmQGmlnwnYxbdNSDTiHkK
	U5LRj3jh0Oh+R2AIBUHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R5T-0008Rz-0S; Mon, 25 Mar 2019 15:00:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R4R-0005v2-Bx
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:59:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id t5so10497199wri.7
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=apV9C5vnP7hnEusl0/IGwUCXCWFQYz3Mv2aqqCWrzLU=;
 b=yfJMTXxVFPlFyyU+42XRfCkkBpWD+/LOPBHR0tPtu4LZ9AoHhwT5tr4c2oZmITtWLk
 u3E58CoGEDnBteD7ZDxBIKvMKG2EKvKzHRo1KSTarhzBVmAhLSkshkvI9o4UAuuB9jf6
 bWdC70hHjT0ZoBoc/2ojDkDWfW26Y/sXvVE6Qc4xmazFSCWmg5Q2NC6yCozsmwBRPehr
 LV0Wghr+vGUL6hMyQVLbD+SVfBWxpaPUSRvTXyz8169RUtaSHRUhDGhKwWP8CSNpi/xM
 nXQRYlbnysHV92tZ4T8hfobTL5KQcO0zbK+y0+eRm7skrNNgIbzb1uJRXK79mrbGiUUX
 ylQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apV9C5vnP7hnEusl0/IGwUCXCWFQYz3Mv2aqqCWrzLU=;
 b=GwPcxBW+d8uTDHsWz4kTTzO8y6bHMMljsm9iohoH+KNdcjXKCdVxp2AtwyqhfctXAX
 SqCksfTNQETns9LSvSfCxRLEdaX4IaZT7YryRf9tnpU+hJ2PXn5TFr6l+AyOCipkDEuE
 z8TwYYkx+yD0TrwCfkRI7HKarOPOAuNvqgFPqm3wjD0ebm+uUBIcTW3xqDoCAp2RmxqG
 9qv+ol0iQBGSX2AuaHA3JvpIV4sOGdH/aD2XCgmNuKXxrzNqE6N+SYhWzjIQwmLd95yi
 ScZ0V+i3q2EXJaYbfKCtXH/nYlRvIJECeunKahA96mJDl8HHoU+nsfIz2YC144/SsqEm
 iIhA==
X-Gm-Message-State: APjAAAUJn4GiZVXbdIfprtLot4i7+210mfGZHHFS7BAtNucveRNtALMz
 4wgNhtkjDJT5NQ4INkdN4XK+aw==
X-Google-Smtp-Source: APXvYqwN4zaEmF5iuFKZFyAjXGO9tPJ1DFzwz/S+O80NbMMGeaQKO1pzPObYHUrK3BCPp28MDFhG9Q==
X-Received: by 2002:adf:e949:: with SMTP id m9mr6399327wrn.237.1553525962254; 
 Mon, 25 Mar 2019 07:59:22 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d11sm12836156wmb.19.2019.03.25.07.59.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:59:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/5] arm64: dts: meson-g12a-sei510: Add support for Video
 Display
Date: Mon, 25 Mar 2019 15:59:13 +0100
Message-Id: <20190325145914.32391-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325145914.32391-1-narmstrong@baylibre.com>
References: <20190325145914.32391-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075927_798488_4F176618 
X-CRM114-Status: GOOD (  11.25  )
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

AO-CEC-A is used for now until AO-CEC-B is supported.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index c350a0165d44..3e7a8a4093f2 100644
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
@@ -103,6 +124,19 @@
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
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao1v8>;
@@ -120,6 +154,18 @@
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
