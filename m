Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DFDC10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EA92147A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 17:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YL7knSk7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YNBV7o+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EA92147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C81gYSHVkuXcpFE9Scl7+4lzmtkkqVyf4eZoLezM0s=; b=YL7knSk79HTBZZ
	0/Lmrf0TEdzuu0y6U+GrWo1RS5aRVZSOUhl0Ciar22YWVJliYVv0vdhNT2CFNSiTqVlKIgc5lWzrK
	PBYvbUYVx51o3xQs8bVk8ULlfARG7g+5ifGNcdKbanIjRqNbThk3KgwgigUmylao2AkFf9KMu3m6I
	YPVnEPZ+T1JKF+h3ClW9wunewz8Y5dUoV/004iDxPtJ1q5TwWU4ToNsQlet0ANPnpgLQtuvNB30L7
	bJ4/uczXsOINEYsdZejPLCFVkFlUXUOOd8NPGP5/oXOjVxcblgcOrn4Be1qTFlN/GbTHoF3uufIVj
	PBSBVdHbMoMHS1KLSHBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFMFw-000099-On; Sat, 13 Apr 2019 17:15:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFMFo-0008R9-LL; Sat, 13 Apr 2019 17:15:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id w15so14636723wmc.3;
 Sat, 13 Apr 2019 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3t2VA5TTre+AZliJf9BQLiPu2UPCQMoeVa/gyjIW8SY=;
 b=YNBV7o+DMqHuxMHouOE/GNfPBXveM9hvT5oc9C4FrVqZy8LuDEfwi9/SETrPKnMNvA
 C+Kqk6/Fa2Ud1yKfudDbcA0f10DSxhjZitAisi2DIfhVbX2YVkxXRHF8OVPWHctBRnW6
 m3wmdo7dHjzRAZdsG03XiQnbbOz5r88t8TFknjlZMYDJ5j0OtxwinZlUrNhENO2uyKDB
 i5Ih2P3jclBMhU9FVRb01pmUo2U8RpCW21QGR3JgOwbeH9HC3xzmQ6opKPI/+oY8P3/A
 i/ZibEXHLn9utIHzFwUFewN+vv4BHngdOf/JQTALq6UTWHjUpkgJlaC2vBUmwvBeoV2F
 2eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3t2VA5TTre+AZliJf9BQLiPu2UPCQMoeVa/gyjIW8SY=;
 b=JMOI7Dw+S4joZw0YTZG5x8PL7NXCrwNm5I3ozLBkq64hxeDNJ0ucIOUExJzPRuv3j8
 7LUSzB0gjYL84lIh3QeDNy81Z124nmpg1LtgpPNiRYsHwRKAuh6MepUzbtn5dZ5B+jzB
 TAkrttZlPbQ45uoj3p01b7qns6hQ3ToRoqqvvZv6jMZXlPHBZQ/6bi9cHmly9ibekBpl
 XxlawJdRBtG0kl6+13cZFoYF2cU3kr4AOfEVqkfKAc0K7yLtPnbwEK+y5Bp9vw9OuzUE
 u4RVoQOwWGwromoE+oYXjyAT6QQ/Lby0nGjpAG0ModAPogHffbona9WOifF2sx2aGcKS
 thmQ==
X-Gm-Message-State: APjAAAUb3DywqlTMiJAH+YGmxR/XIwYofSFOEMhDPgWCB32zBW/1m6a7
 IRw+B+MZbyegaO6ciEviBtU2+NGA
X-Google-Smtp-Source: APXvYqxdocTQnfviHVwHfmzUPilRZK9Z+H8UpylYEkwgI1prhyx5CDMUlAOI4buWF98nqmXS90m26g==
X-Received: by 2002:a1c:c186:: with SMTP id
 r128mr15209469wmf.100.1555175746655; 
 Sat, 13 Apr 2019 10:15:46 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0010B8127C043607D1.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:10b8:127c:436:7d1])
 by smtp.googlemail.com with ESMTPSA id h84sm16745965wmf.15.2019.04.13.10.15.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 10:15:45 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/3] ARM: dts: meson8: add the canvas module
Date: Sat, 13 Apr 2019 19:15:30 +0200
Message-Id: <20190413171532.25967-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
References: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_101548_694428_05584A70 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: mjourdan@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the canvas module to Meson8 because it's required for the VPU
(video output) and video decoders.

The canvas module is located inside thie "DMC bus" (where also some of
the memory controller registers are located). The "DMC bus" itself is
part of the so-called "MMC bus".

Amlogic's vendor kernel has an explicit #define for the "DMC" register
range on Meson8m2 while there's no such #define for Meson8. However, the
canvas and memory controller registers on Meson8 are all expressed as
"0x6000 + actual offset", while Meson8m2 uses "DMC + actual offset".
Thus it's safe to assume that the DMC bus exists on both SoCs even
though the registers inside are slightly different.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7ef442462ea4..6b5c90bb960b 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -228,6 +228,27 @@
 		};
 	};
 
+	mmcbus: bus@c8000000 {
+		compatible = "simple-bus";
+		reg = <0xc8000000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xc8000000 0x8000>;
+
+		dmcbus: bus@6000 {
+			compatible = "simple-bus";
+			reg = <0x6000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x6000 0x400>;
+
+			canvas: video-lut@20 {
+				compatible = "amlogic,canvas";
+				reg = <0x20 0x14>;
+			};
+		};
+	};
+
 	apb: bus@d0000000 {
 		compatible = "simple-bus";
 		reg = <0xd0000000 0x200000>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
