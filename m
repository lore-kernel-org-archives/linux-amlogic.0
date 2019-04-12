Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC611C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B312084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2/8shVX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jGNInin9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B312084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lv+WtFbr4lzG73qe/wKUegLHjFpI82xr2QlA8VF/X2s=; b=Z2/8shVXpUBhVC
	a7TGEzITzAGUrSoYB7+8DdEFZ5XsZDCICNbLIH4d8KFURPr/kFBvIc8W/I2311rSu/4s2HN1x21RB
	47BGKnS1A0TEbR4aaGQPQGqUWzQ68QNKZd/fm4s2JyjSR5LKKuC9PyZ1ZifLD3ZIuOUmB4aJ5ag+w
	veVqv7Qhujv82PQ8AEmTZDMyk7NNTlzkjAIsWk4keA5nLueE/KyXHQkKnueM605ng4B08NpemL2uc
	hBDjVzR+YLiUQMHWwHhVebIpGMg5Vnmchi8+da8h3/C+jSQCzbFH9TuaAMttXBC2COGTTKI2QhRPw
	k+bvLF5YMqHadvKWNVmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt43-0002Bw-13; Fri, 12 Apr 2019 10:05:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt3j-0001mT-33
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:05:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id t17so11119847wrw.13
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TvmR6ZC2WBqA56mgWPjb45tpByysg+xqHoPIFiNE7Fk=;
 b=jGNInin92KMDYoznDFiw8loAVyH9c++D/ZSBrY/xSg/L1LcXGyKr1owkBA+OsVtmmo
 t5Rkm1GptUiy2JiW6kV1ImloTSk3DONl9e6DTBkjRdfMSwePL2mIpXehMRDKzQdr8AoX
 WskJj8I821uuoc8p8RjJWR0e/5hHCBmrTh//bJw3D0aqCxfmhFDlNS5iFR85sgEvjKOJ
 L5u4hDGaO8R4gZyS7NQNNk/8ZbOAS2TYOi/1PHlV4kZOztET5/Y8K6RURIgDK1kD32Yl
 TwVotHg0HypKoWbG+SPbqaa6X2OI2Gw8N3ZzdXoy6Pm/sdrEbEZ9pH7pgJkwArJyNxoD
 h2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TvmR6ZC2WBqA56mgWPjb45tpByysg+xqHoPIFiNE7Fk=;
 b=l6N7LGVxeU8+dP9CyWZAgHefliwMoa8Za1mx/BpwV8sf+LDULyDaMs81U9P9G5acMZ
 uRnMI5Nl1S/vczVkKxrCwgoWKP1610s+m1eUmfd3fi2EW8O8yaXkZeIBm3wIVGKsAoT0
 n6/cSAv1g0nyPI6GhBREo8ynMEisNR3lWrRWjeTLB/lz8UUltbhDyLq5sNwfc3o4syCq
 qi1So3my+jKMf+DAckPCXqCKIrKttwIUeJ59ruCap++Ifv2LleGuT/nJSIluXT5AxLEw
 y/fvRnKr0npBVDk5tGFGDfwYHBKQWXptiCwGVim3LK/lgV9QPVjujYFegIjK+Sua40sE
 dGZg==
X-Gm-Message-State: APjAAAUD5VfXaZdd+I/YMUj/Mw0lYEJSYbWlo5f9T0CMfVidqxRY9Fn5
 BIm15EUzBbaVe62qmU5IKj1IUA==
X-Google-Smtp-Source: APXvYqykgrvRBIEJ2DXSga7rKAqseH7dBWIsfKFYhMUw2FKueq46rB12K7ULsVNM50nfWa/ew1wIgQ==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr35812966wrq.242.1555063521422; 
 Fri, 12 Apr 2019 03:05:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm10545602wmh.0.2019.04.12.03.05.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 03:05:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/3] arm64: dts: meson-g12a: Add IR nodes
Date: Fri, 12 Apr 2019 12:05:16 +0200
Message-Id: <20190412100518.24470-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412100518.24470-1-narmstrong@baylibre.com>
References: <20190412100518.24470-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030523_156906_BAA1A370 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A SoCs uses the exact same IR decoder as previous
families, add the IR node and the pintctrl setting.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 734c5ee60efa..9cb76d325bb7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -559,6 +559,13 @@
 						mux {
 							groups = "pwm_ao_d_e";
 							function = "pwm_ao_d";
+						};
+					};
+
+					remote_input_ao_pins: remote-input-ao {
+						mux {
+							groups = "remote_ao_input";
+							function = "remote_ao_input";
 							bias-disable;
 						};
 					};
@@ -623,6 +630,13 @@
 				status = "disabled";
 			};
 
+			ir: ir@8000 {
+				compatible = "amlogic,meson-gxbb-ir";
+				reg = <0x0 0x8000 0x0 0x20>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			saradc: adc@9000 {
 				compatible = "amlogic,meson-g12a-saradc",
 					     "amlogic,meson-saradc";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
