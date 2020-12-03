Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3DCC63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C6320665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C6320665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB3SdaMRVKL/8552ESkaoL4yHvc4/X+fhngJH1vJPuw=; b=eTpPn03m9S5VMC5SYmlCoHlpm3
	BNyeLIgChrNNAUl1duzddCz4m2GtwS8Ysonpiw1UqTUPqQFdqZVVmq7EDq9geFoX1sPvc3cO1VB28
	zg5Y0LQ7X6Xa023NcoTAGdOwT/ClSFUSf+TPQwW5jEcr7JBnxuqxh7WBQQ8ZJTha5y/CMZ0Id7+8j
	OGmCtf63vXczQw7CxOxLh8P8KkXEit0+E8DuFIxUdY68ZaPP5i2YHaGmq8+PkizTqF+g4W0DCpcO6
	k5oqxncUoFgQ/gpknwnmulMOgSSbjNinNN2h5wR+Ki+FAWkAcl3BNqvWdGlpu8w2Y5O+gXPzk5/OB
	xfmc+j+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhfa-0008PA-PB; Thu, 03 Dec 2020 06:00:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfO-0008KN-Dr; Thu, 03 Dec 2020 06:00:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id h21so2571638wmb.2;
 Wed, 02 Dec 2020 22:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dxWzeifwzXJ8noPCs15h/EHSm9BBgorS6bs8r2VapUw=;
 b=nfH7OYWIw0J+z1tIfWzUQM45lxCokcLmQcieCVApZEyurRmlPJ7PsupvrSVnLrFZbJ
 ZT7cnyXmxAJ0IEhdJd5XU+Az23Y4WBFBfXx6vAKdUAgrfxTCThXIjAErYcbu9n5WExyL
 iyKWXqwYTYw6drECbFRtEfcKbkuHriRGXpg0C/YXglxG6sJrMm9ckfcVkzs4bh0CuxoX
 guNQTxCdsqmhtKJcw5bd2RYFN6mzWpzWYivSO/63AmG9XxKq0vd6S2LNgOHoAD2uFOfX
 qDt+Q2DoF2r2APwTYmWhybcjNKESaCyQV8R4tnCdFgh+hFnA6mas1k+LjaB2sWqLKZF+
 MH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dxWzeifwzXJ8noPCs15h/EHSm9BBgorS6bs8r2VapUw=;
 b=d3B2oXJXy0L+N6oa3jMZfSt07ZWXoM7GFFqMS1UJin/9qqEYVYXTLvLI5uPjb/BRsM
 l+yb75uJA2SxTMB4s/VkqYs7mMoU07vZk8wa1/lFQQ4u57Nl5gCZf7h45zdQOOwzBkj0
 DId/QfNca6RRoHgb46TIJEHIHw/K75XadUMKMFN+h2vqBwc1pC7LHrcsdCFxtP5eHYmp
 cWHkUCgzG7Ccv82cvEBN3cKFbBWUTKbYXnAZeIfgoFI6EL7D/znuP8dkSAmRxldGQ7lw
 50JhTVfLz5U7KvWGePaG9MebJ5W7y41OzGdnN7pzUgveRhW9zOe6izzdOvYLCJKsGsH9
 44TA==
X-Gm-Message-State: AOAM532qrLt5WZzieqg7YsEagJCmupmJvXkkxfG2g/RAS6fD7sPHk58P
 y0XlTSUPLcPVu7Zv5qdmPK0=
X-Google-Smtp-Source: ABdhPJyvD8UtGxEO3hLOc/p+glcLR1EiZYUEsRp5yrqNY5N9GUyR5uNJOY+xkfutM6LnJ23Sy6YABQ==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr1400052wmo.40.1606975232264; 
 Wed, 02 Dec 2020 22:00:32 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:31 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] arm64: dts: meson: add audio playback to khadas-vim
Date: Thu,  3 Dec 2020 06:00:18 +0000
Message-Id: <20201203060023.9454-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010034_497172_BE57D062 
X-CRM114-Status: GOOD (  13.57  )
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

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 638a5992d760..7aa08f74c49b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "khadas,vim", "amlogic,s905x", "amlogic,meson-gxl";
@@ -63,6 +64,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-KHADAS-VIM1";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
