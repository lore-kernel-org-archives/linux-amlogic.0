Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD17C10F14
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714582171F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KCAQOTsW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aJds8UMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 714582171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkLY5tWbBktYpPtpadN4toaR6FvCwJvm/j/UTdqTmlU=; b=KCAQOTsWCTX7IX
	LHq1NbuTUOkA5ITgJH3ozeOwL5NWhfw0YW8nC/mEiZFzCtnBtBPbFi6Bx1HOPAl7iWgGj4WNCrd7n
	jBfUZWaKL241bCGh0T04v1svfVblKeTN8a/2d2jodI49Ogk/iLfvDb5/fOla5xb7ZfLnK9rcK/TFT
	uLL4gbonvSXCsx0ZPMu5RDXVIh330NPPBps5z4xoAlRtOu4uThYFLzaer7frNHPrKOMkODQ13vK5n
	maWsOV8pRLMzuRVwY5sH2ya2BU8G2eLyfvnMrZhyRQlIr6sFq/9WwjQmvuTB8zzrEU6BrA2R7JPdF
	K2jJdHngfc986WQi6HFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvgD-0004az-Ud; Fri, 12 Apr 2019 12:53:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvew-0002zJ-Nt
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:52:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id t17so11752664wrw.13
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWwFb/x/5djGRQFOAMKS9jR6gvNhGl6yp11Dvv7sduU=;
 b=aJds8UMcq31d/Jx5oG4bxxbazE5RXiMDjt3rTmBGHiVfuQDP6Rhy8Q9ktE1tmXMy95
 2ASHaq16IpPYzOX6eC8DQjsRKzgBv17pLfY1Jpj01DP42R2W/qH30mTwLP/Ux4jsC1Ks
 M3fNdqTfGnkcw1b+TMILwgeZBCQr3z8w5J8c1+TAbrnONrH6YtIvcWeSsy1hhwKWMPyQ
 GPh0yhZNruBRKXpceq0FHZ7xWtYkvB6muNijT7RQACKvJYrVO0zZgmyBY03JJBUBLiS7
 QUJQTAjtnmD6RWQvGGJzJc/gxjybHw5+loDfhqP9NKeexK2M2NV+Qi8rsT/DxAyMQNKc
 hAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWwFb/x/5djGRQFOAMKS9jR6gvNhGl6yp11Dvv7sduU=;
 b=eurMrYNgcT5HG73dmFXeW9qMA9nHJhE018uQLlbZwRCE3QfFta9vw0jP9bb+LF6aQV
 d29bgulu3AoC5SVBBsohWARfz0TZqjvHOK9v7QR0p6S7KADZMR2uUkYLrzcRSyhA6QQD
 HFRMmGVjfgf2dTzcrCey4ipV2+m0pIZXFGqgV8wLr/klx2KW/MLbQ1U1q3jdAZwv0hrz
 EbIvXDpQsDs5bAC9u02rBsfdrBE87C46DjKxMEIHNeIKa0DMNeKvR7kJMyPXVG87TUe6
 Ps9HR7zYGPejwgVmWXzMJn0c1IM7BsbHVLO22RhYXiMq2SAk/wY4Rz/e4lkm9qHkgxoQ
 Z/ow==
X-Gm-Message-State: APjAAAXmtizk5ED9WK3FJ28kSdbMklVH3rNlmfAZj+MmAdMreCMr393K
 54hdzsOT4YpUJID0XHlX+R1nS5uO2og=
X-Google-Smtp-Source: APXvYqzF1xmnzjs3JDjLGzZTIbfa0ZdFr/2qaQT4OKX+ROJviZKWq1zN2dh40Iw7bRCBq2Q9J94kRA==
X-Received: by 2002:adf:e510:: with SMTP id j16mr37111086wrm.259.1555073516421; 
 Fri, 12 Apr 2019 05:51:56 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 6/7] arm64: dts: meson: g12a: add pdm
Date: Fri, 12 Apr 2019 14:51:35 +0200
Message-Id: <20190412125136.28232-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055159_289612_F40CECA9 
X-CRM114-Status: UNSURE (   8.31  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the PDM audio capture device of the g12a SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 90b23bacd51c..ab46b2b0fb86 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -239,6 +239,19 @@
 				};
 			};
 
+			pdm: audio-controller@40000 {
+				compatible = "amlogic,g12a-pdm",
+					     "amlogic,axg-pdm";
+				reg = <0x0 0x40000 0x0 0x34>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "PDM";
+				clocks = <&clkc_audio AUD_CLKID_PDM>,
+					 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+					 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+				clock-names = "pclk", "dclk", "sysclk";
+				status = "disabled";
+			};
+
 			audio: bus@42000 {
 				compatible = "simple-bus";
 				reg = <0x0 0x42000 0x0 0x2000>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
