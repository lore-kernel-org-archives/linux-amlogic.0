Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B0C47088
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzfwjNQyLfCjmo6wStgwP+6tY2/KvE8i7HRgHKrRxZ0=; b=z1UFbcmqhSGRH+
	fcq8sEShxP9PdrAZPhqpAG0u5wMqmEmccBNSMH+/csYv4wxYavXHrNfY60sI43ixZg+4OxEVIWJsC
	f0L4PiPYuv+gMgHYEUsdebPXEvwnRmUo8vURysmNojfQbGn6gdXZ2x0h4+oG4o1kmcDHv8nvDkqZG
	Unu9dI2r14ibBdU3L4fqC/Aozi4dkc89Eds3cCW9wkdy20F4tXHfosvyOE50VKSFYLYwBQJwePP7+
	AisbmxL4pufdK950/DdxAaAc8+GL7tY/JaCRflkNbOOmY8OQ7DmYL2dnMIoBNd4lDozJ38cuORKbR
	cHnpOw9fnK16UlxeYGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14c8-00G6ul-6y; Fri, 02 Dec 2022 11:53:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14b2-00G6Jo-IL; Fri, 02 Dec 2022 11:52:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id ha10so11039811ejb.3;
        Fri, 02 Dec 2022 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57nQPIWboUhS0hM6UAXc+mV0l81PKd9lsPdM8FKXFZQ=;
        b=dVxzLkdhqEgqAKSv+70d22Uvs8M8T9J4rDG/8s4Oza0wQ0nriev5N8Qr5s1LjcPQTl
         EWIVfMQ76Lr0iDoC8moEya14poTgrFjQjojMmoa/vkCLJ+o64o/H1yxYxWJ1fR1oy/Nc
         1lKARHnRHQEoi9E91Vj7G+nYaoQpCs51nSo7jB2JP/+BXi1u0EJRJ18/9UYKemR2WpT3
         7ty8QKrRSwU6e+Cec5v0dwtfxuyAgOVNG9VV3m6F8nEV6kZwTDUlz2nF4P1J6sAoTJMp
         V9w3NX7V+lgSRlVgBaoE/z0QxvKVdYuv2dcc8oQWAh3OxenMr3iQMAC1XGvm+p4XBUtF
         uopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57nQPIWboUhS0hM6UAXc+mV0l81PKd9lsPdM8FKXFZQ=;
        b=srpksyNlTg3PDbtROKocMvELfsmmYn4Xk3je/iBuOv1P4DDCgbv63bBxr4FIOWe0mr
         jPO5z2OwNc3loJUcFdgm8ItN52joWEAFU2dicKUACocknPvELCsN5lbEzQBdCbXv6ADf
         CjdXJ8hG7GQ/w+rrNT5M3M25CesxqNNHUQ3D3hPXe1KQGXFLoVm81iaIsvoC1T5e4vo7
         uYm5vj0nMliiwmXb1V78IZp14hqm7lTS1WD7npm9h3145b25oa9uLWFygLyVaPkBs1JR
         rvG2iCt+V+uwFIKZ4NvVhBQXuKwh5WUae5kThC2cX75KnsKYHYOIR5gzpLeG7L2wDgPl
         YUaw==
X-Gm-Message-State: ANoB5pmHz909UTQvvsLUiDRAlc1Bzpx7CGX0/6NOYigVIv1aCdZH+y35
	a+19ywm+H4DUe48lxVymWKo=
X-Google-Smtp-Source: AA0mqf5dmSPQFvDVM2KnCeukh0RGM++NkoeSCFP2ggwb6ZRYdBekyNSRZ5XIe69a0MWQn+J1fofwOg==
X-Received: by 2002:a17:906:a0d9:b0:78d:b912:6a6c with SMTP id bh25-20020a170906a0d900b0078db9126a6cmr60973122ejb.124.1669981966379;
        Fri, 02 Dec 2022 03:52:46 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:45 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 8/8] arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs
Date: Fri,  2 Dec 2022 12:52:20 +0100
Message-Id: <20221202115223.39051-9-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035248_623184_28ADF37D 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The power sequence is different between SoCs in that family, so get the
right bits for each one.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 61c8461df614..d7eb01509685 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -11,7 +11,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 #include <dt-bindings/thermal/thermal.h>
-#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -2493,6 +2492,5 @@ npu: npu@ff100000 {
 			 <&clkc CLKID_NNA_AXI_CLK>;
 		clock-names = "core", "bus";
 		resets = <&reset RESET_NNA>;
-		power-domains = <&pwrc PWRC_G12A_NNA_ID>;
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index ee8fcae9f9f0..886380b5a96f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -139,3 +139,7 @@ map1 {
 &mali {
 	dma-coherent;
 };
+
+&npu {
+	power-domains = <&pwrc PWRC_G12A_NNA_ID>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 80737731af3f..318a16aa4433 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -543,3 +543,7 @@ &vpu {
 &usb {
 	power-domains = <&pwrc PWRC_SM1_USB_ID>;
 };
+
+&npu {
+	power-domains = <&pwrc PWRC_SM1_NNA_ID>;
+};
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
