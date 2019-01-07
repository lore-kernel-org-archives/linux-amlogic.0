Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643BDC43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF3820859
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 09:53:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCTCTaMI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y9L8sBmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF3820859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUfmqOayCWL5xm6TPGnP9ljh8z/CP3AeUgB9KAMCY8U=; b=kCTCTaMIah2hLz
	WAb6+LkAacwC2qv5KQl6s8UVsUK5Vw6rgP2zfKXuk/CoCw+bFVDR0ePBemOA646MB40l/Mzc+czr3
	MkbiTPQ9TjpQzwVFGQww821JQWVGkCcFq8EPA6kE6sqO1rZI0G+UQH7OWhyy7ukOy7lbOs4Ig5MTV
	Bogb+/cS5+BO2PSMzpU/WHTL0KqEzTnvwTGtn/tXQDwFR9jFCc4sLsJjX5QRm6YcB7Bpi064DMKbK
	1hxICSWRp3AQ6nvfAQST8XSK8cuFgWiiNstzPtCQNZrBDpzKhnXPznIujt9pSBwf7GiXtvqgpPAjM
	iEP62Vcw7LIF1x7Hvq+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggRbS-0000mX-8o; Mon, 07 Jan 2019 09:53:50 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggRaz-0000FC-Kj
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 09:53:23 +0000
Received: by mail-ed1-x542.google.com with SMTP id g22so247248edr.7
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7SKzOiXnEB8V8kNaFY7oKymTvoiedc8KfN1lhPOUJLQ=;
 b=Y9L8sBmEUN0ssnruN1jgw0AIE0tp2H1pffnw2gT/arl0ktarhfuXwpE1/QgyXQoMQD
 naiDwBew62y9TlHWhboXrcpQ8pMhwGkV/Sfc6N6TJiftPc+BtMupzxtIeC7g+YlAAnHi
 B2vs04jImVZ96RoUJopKX7Y7JeMmjmnocng2hrpKR+peOKqRpMeyTSKxemDGUZsx0dn0
 bagXDRaiqNWVB+xJriYjRRzg9N6uk0DeiPiDnxEdYPl73lXmYI8WVUdydVAsAdBiVIpE
 +8x5IEePR3U7YFwNH8RwuFKehhuNhnz1KvUuuaXuaAYPi/nPMxeNdcGKbgUCGD7gWjet
 2hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7SKzOiXnEB8V8kNaFY7oKymTvoiedc8KfN1lhPOUJLQ=;
 b=XgP4EIenUohectNMadVKayns5rPJjAiUoXMF+OdtSXu1ceEMNapDVq7FtM5xwD9v7X
 ftbnc3iqfyMrt/JyeOAmqwqi0hcjUIXvjfex7kxIyi+eAeLVGY+LzFHLjv8yLOMYdRKm
 CVXeirbHQH2j6fntHOSrngm9jzEyNgnTaADpMXplCVdz0XOyNfrw/UWmhFEhF6OpFFD9
 mIFPHnRheV3vEdshXMEGcyAt9EHZKF2aYu9udbO4/Cbam//97FFMHMDnf7ApRFq5TlVU
 vuskCUA6OYTNTz/4wmvw71Up8JX9x8b5CEuvM+xLZdXdMDO7XzmZHS5+EIMN0wcfA4QV
 dtqw==
X-Gm-Message-State: AA+aEWaVf5NUkGBKRZtqJTsEddAc7o4j+/iObMYCIhhCXyVlXlEXiQ//
 ZEo2WT8Qw5tCEDWlCCd7NSSIlQ==
X-Google-Smtp-Source: AFSGD/UouQf+f6JhSLbTJ6InMkLtv/eLnEguNHKAaQBHw2rmmmUtjEgi9dofj3ItJ8A6Of1kOqDa5g==
X-Received: by 2002:a50:f098:: with SMTP id v24mr55022704edl.78.1546854800261; 
 Mon, 07 Jan 2019 01:53:20 -0800 (PST)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id f6sm35737049ede.53.2019.01.07.01.53.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 01:53:19 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/2] arm64: dts: meson-gx: add support for simplefb
Date: Mon,  7 Jan 2019 10:53:07 +0100
Message-Id: <20190107095307.15233-3-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190107095307.15233-1-mjourdan@baylibre.com>
References: <20190107095307.15233-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_015321_675077_6F5CA42C 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SimpleFB allows transferring a framebuffer from the firmware/bootloader
to the kernel, while making sure the related clocks and power supplies
stay enabled.

Add nodes for CVBS and HDMI Simple Framebuffers.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 22 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 44c5c51ff1fa..a6ffdbba37b9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -50,6 +50,28 @@
 		};
 	};
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		simplefb_cvbs: framebuffer-cvbs {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-cvbs";
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+
+		simplefb_hdmi: framebuffer-hdmi {
+			compatible = "amlogic,simple-framebuffer",
+				     "simple-framebuffer";
+			amlogic,pipeline = "vpu-hdmi";
+			power-domains = <&pwrc_vpu>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <0x2>;
 		#size-cells = <0x0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a7b883ced0a8..a60d3652beee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -784,6 +784,12 @@
 	resets = <&reset RESET_SD_EMMC_C>;
 };
 
+&simplefb_hdmi {
+	clocks = <&clkc CLKID_HDMI_PCLK>,
+		 <&clkc CLKID_CLK81>,
+		 <&clkc CLKID_GCLK_VENCI_INT0>;
+};
+
 &spicc {
 	clocks = <&clkc CLKID_SPICC>;
 	clock-names = "core";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5c3d78aafeb..3093ae421b17 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -787,6 +787,12 @@
 	resets = <&reset RESET_SD_EMMC_C>;
 };
 
+&simplefb_hdmi {
+	clocks = <&clkc CLKID_HDMI_PCLK>,
+		 <&clkc CLKID_CLK81>,
+		 <&clkc CLKID_GCLK_VENCI_INT0>;
+};
+
 &spicc {
 	clocks = <&clkc CLKID_SPICC>;
 	clock-names = "core";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
