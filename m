Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C242AC2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93392206B8
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJpahakF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doXg7c2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93392206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bef3cmrnBXyXFYRHQuMCSpANSs6AQLPiwdsaUMwJ8m8=; b=UJpahakFafshugMVik8kugm7G6
	d717qs0GiGMDbEDhoSbLh7g49U/fpXx5ke9PBEclZigbxpf4gqkV/BRXaYVL8lSetartSRUmLMeAb
	Gguz8aJzqSk+YLtIweOK7EhdFB9Mkf5Plq9QaerqmFWiknBMc+B2Ks3h3kw/fjn9BcwqEudNhxnvO
	U1da3zeohSVRegi4JsIPGgziKCA1nqY/z+mS+t9R7K/zPEtJdgHo8ZTSTUtIBK548xzv+nYdtkAYw
	DP2BvvVHEmE39kOfCFcCjx9gwYqoT88tE0rEEBOFZuuAEKN10KpcItyfAlHY5XoOAs6EDp8QStRXT
	68YZ9QLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2uG-0001Mj-6v; Sun, 19 Apr 2020 05:54:16 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2tZ-0000bO-Js; Sun, 19 Apr 2020 05:53:35 +0000
Received: by mail-lj1-x241.google.com with SMTP id u15so6395420ljd.3;
 Sat, 18 Apr 2020 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ETRJ8mYOQ9yujZCmmqXpwwej2/FIPoryFM9Z1P/Qlt4=;
 b=doXg7c2ioYYkK4WQWUgxwqfnC7y2oLopTk782suwNGNXZ0e7YECuLuH2BXq+6ZPgii
 S6cwZkCRxikfxD7Xqvv8gidbuAvo0P4hWDBIPYgJhqmFpOYlo+HtrOhrFCtoirYr59FT
 KWAErbGNxbllP5le9+rfK/vIHOhTjG0FEs2g3D3PIadq7Dl+3ywFMt5JDKt07zhqODJb
 VPxDq2Gz1RetdyOB7gG/aoR9ARiVrg6PkCL398UN57t/fFLknoQt8gY2mYR7qCKYk/hE
 PfoDt2bl2yJs2RrFXXNFeqLdVKOGa8PYT7aREueGPMA0xePcoCuEWLRiGuQRcGlDn0ZG
 JBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ETRJ8mYOQ9yujZCmmqXpwwej2/FIPoryFM9Z1P/Qlt4=;
 b=hrSY9AWdyo9RnIIGVTkTmnpFDsc6Abp4GtFTqWpSFKkYh9Fw55HmOze8J8UHiy2qpR
 fzToQZEResnB6iNthDYWUXJPR1uSfIKghc76SrYNJqE5gLBrHX22jPbJkBklU2b3xE2l
 XWW7XxwJYf2ehSygo1XtRVeenvElafwSNIopWqAJ3tGe0yAs3J5L8NmCRjcOV9KHWK7Z
 +5ueIDOnUq5MJhQifUkgBkYVCmS4cyY9VYoMTnKkaVUEDPXCbETk0EacOk61G9GsErym
 GaWKaeQmwniw/DkiczYjN9n1j2eyy1Li/4Pf1ITkOcERFzNttPREqiPopSrk0tYwkJds
 gQOA==
X-Gm-Message-State: AGi0PubcIjyAPJtIFhAU3pJJh+2rAxmUtaRCbXOGCcvFn3iAfg0ltN04
 KGBDNJho1vnxwCu1ZUo7wmY=
X-Google-Smtp-Source: APiQypIpk5R47A7gcnVm6RNFywZg4lAADQNzbBgdyL8UkwtSc5G/cscsnrcEghuNWSwMncxxIZzIBQ==
X-Received: by 2002:a2e:b889:: with SMTP id r9mr2631829ljp.203.1587275611832; 
 Sat, 18 Apr 2020 22:53:31 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h7sm3366247ljg.37.2020.04.18.22.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:53:31 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: meson-g12b-gtking: add initial device-tree
Date: Sun, 19 Apr 2020 05:53:20 +0000
Message-Id: <20200419055322.16138-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419055322.16138-1-christianshewitt@gmail.com>
References: <20200419055322.16138-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_225333_667771_FAE0C927 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
board with an S922X chip.

- 4GB LPDDR4 RAM
- 64GB eMMC storage
- 10/100/1000 Base-T Ethernet
- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
- HDMI 2.1 video
- S/PDIF optical output
- Analogue audio output
- 1x USB 2.0 port
- 2x USB 3.0 ports
- IR receiver
- 1x micro SD card slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile             |  1 +
 .../arm64/boot/dts/amlogic/meson-g12b-gtking.dts | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index eef0045320f2..1fd28e84e808 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
new file mode 100644
index 000000000000..461da47ed463
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-w400.dtsi"
+#include "meson-g12-audio-hdmi-spdif.dtsi"
+
+/ {
+	compatible = "azw,gtking", "amlogic,g12b";
+	model = "Beelink GT-King";
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
