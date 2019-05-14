Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CCBC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DADF221473
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nIcSFJTl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YoxYoVPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DADF221473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq3YQQACcW8Km3IU59/rjN9CRfiJanYcpU0YeSlVfsM=; b=nIcSFJTl8FBylS
	xMUah+Hul6DNh3HMkJLw6GQFRDLDVvztwCTt16d2CnFA2oaQUTUuMkL67qC0RY50GMIxc5dPVwXNk
	62SyLBMXLo2GDwHyDnooc0PkABt1yAvO1XjxpPkKgi3BHg6ssiysAyKaGOmJbCX4++zHpk4AquEIf
	qEXCY0JC6oVJxZAEFR2As2Q1KBkWv46BSGYc/UaC541PU7bRYLl+J6ArwcAGVWugd1ur1xq/XQz8T
	Jh5MU9uTemrMEw6CwH9LDv6iIDwVZoQ5dHMjcgJ4vWeBlvupVnvQYd+GL98i+HIIN+7u7xiv2wowD
	10Gp5aomawrAVdcVqQ9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQVP2-0000g8-Vd; Tue, 14 May 2019 11:15:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQVOx-0008RM-MH
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 11:15:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 7so2393930wmo.2
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KH/9jGUTYqNchbklGeod/jCiLtawhcosDapSAft/y/g=;
 b=YoxYoVPOitJltIYLqd6dVcVS8kBc0olC0nqpmZOXI1okxviKNcCGelSEGL3srl9FuR
 8teYFRzjPqEKQKvo45cx1QF6GxMcOazu+vkGdD6bhVzvFL2+BBmtFwB04qYdijZ5bfZz
 0QHCQZybDoT5YyNXgZepeTbECSU6pyMyrVciLByz5PWOqrGtfgLwWpUEUySccnOMdSqj
 vt6kaB5r/q12Zys9C/bGNLiErKd3vmSuizSacJ3/X988PKeHdvj4OkLv7WIg7Uhe8MsI
 ZoDmSRsm0zzeUoaO9ZwBWkOR3eZTIut2jHmpvhkxuv2peJK1dwY3R/tG0ArjJIA+C2PC
 VCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KH/9jGUTYqNchbklGeod/jCiLtawhcosDapSAft/y/g=;
 b=b55O8dyKjN7yNpR4li85WSnNeVgD19+oDeZpdc8Sdir4reX2kBaQMJ5oGhTYO+zM67
 JZL5dLjrSvvungSgtfIYYk9E+JgcT8Q3SFWN+yBspq57O6UGK9ItoVtAgXXQ+QOpW+Kz
 hLvSAco1IfFWHkSdf9Wpo6DuDtSf3Z+Ls4TS/KfeOf+2jq6SFjgE4B+w9u+T/BbEs4T5
 lQNMHL5KES4gl7ME4uyrfhGJm1QbzaBVSNQ0MzhUYAVANQUsElgXYnpGiV/bbmyVxGk2
 dVB+3Q68PHZ5bfb+v20LABjNurytFaPxpREWu+XklIJrXwuoaeyknLoBxvXPXZTXUEC4
 rEIQ==
X-Gm-Message-State: APjAAAUp/OJXi38w7rXl4yB/JFdd66QYSMb/f0m6LiqOpvEKEXjwmWWf
 h8UAOU2D50lkh88E4rtxH41s6uApyy0=
X-Google-Smtp-Source: APXvYqyFXBhASQ7s2Rzi8oOTabzfkeNhlmXxwFIUALwnaLudgCnEC7/4EHYWhhjH2bC1IexA/KblNw==
X-Received: by 2002:a1c:eb12:: with SMTP id j18mr530763wmh.48.1557832518385;
 Tue, 14 May 2019 04:15:18 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c130sm7289922wmf.47.2019.05.14.04.15.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 04:15:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/8] arm64: dts: meson: g12a: add audio clock controller
Date: Tue, 14 May 2019 13:15:03 +0200
Message-Id: <20190514111510.23299-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_041520_844600_44E71130 
X-CRM114-Status: UNSURE (   8.95  )
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

Add the g12a clock controller dedicated to audio.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index e6c0c19b3223..09aa024d9f0e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -673,6 +673,42 @@
 				};
 			};
 
+			audio: bus@42000 {
+				compatible = "simple-bus";
+				reg = <0x0 0x42000 0x0 0x2000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x42000 0x0 0x2000>;
+
+				clkc_audio: clock-controller@0 {
+					status = "disabled";
+					compatible = "amlogic,g12a-audio-clkc";
+					reg = <0x0 0x0 0x0 0xb4>;
+					#clock-cells = <1>;
+
+					clocks = <&clkc CLKID_AUDIO>,
+						 <&clkc CLKID_MPLL0>,
+						 <&clkc CLKID_MPLL1>,
+						 <&clkc CLKID_MPLL2>,
+						 <&clkc CLKID_MPLL3>,
+						 <&clkc CLKID_HIFI_PLL>,
+						 <&clkc CLKID_FCLK_DIV3>,
+						 <&clkc CLKID_FCLK_DIV4>,
+						 <&clkc CLKID_GP0_PLL>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4",
+						      "mst_in5",
+						      "mst_in6",
+						      "mst_in7";
+
+					resets = <&reset RESET_AUDIO>;
+				};
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
