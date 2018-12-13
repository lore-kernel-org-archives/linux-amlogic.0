Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C645C67873
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE91F20849
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9O9Zgvy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Qd8Lutf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE91F20849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11nbW7rKrOf9v9cvWAOW6yz7kagDkrw6Xq3/fuNZtTE=; b=S9O9Zgvy83S8nG
	dVNGq6a5XMjxjpKpzlRzvpHSpZlFI82qN9EX3knOmZ03cL01AL1y5RO37/kRLsTDYJKzAJe5meHAw
	ATNsgcaaq8/4GirfpQkXag1XM90lrMADT4wMponGBY/jefASxprekGEnrHJ9W8kVJ18WSDU7L55qt
	ZUCocdzjgS/oHUzs53gAz1MT8k/OrWLddd13GFqmkygDDx9wqGq3RK88UeS5COdkwY+8ZmZOFr8tp
	D12FO9cW9fwrXolxNCyxqIwCIIJvSr/LBsEagwQe2Rdt5vk37LN90r7+Aekdxz8sUKLilLHs2vDL4
	LyDrly8RipMiQhlIWE1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXS6n-0000dV-JO; Thu, 13 Dec 2018 14:37:01 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXS6e-0000JC-Rz
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 14:36:57 +0000
Received: by mail-wm1-x342.google.com with SMTP id r24so14043829wmh.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 06:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3LDYQT4F7qXvGWqvCs7Js1wTvrjLPyoPq0KJKGY64nE=;
 b=Qd8Lutf9Ism6TNlten1CU1PFaR3DMHrkd5ixR1rQNsuhbmK43zot3f4oR1Iqk+qXTr
 MQnK7z270bX+hfqaAm6eskA9hE+knB9o3GFDrQPe0tQ32uc0emqYIM3hoTVR+2cXT2Bh
 sfeCZrhlFX4eOlZ8Sa+egDli+yJbDRPrw7isu+0u9Y8IJH4eqo7kYeOQNKbjkD/1TuFz
 kyyW5olHk+4cSCEHtPL6BxDIHpAH0pi8z+zA1oaYdRPSUe3rYx8coNxzR5BCWTA3tB6z
 Kbk7G6RY1hSDU8FwDQ+O+LgTQhXLR6J7u1hCzEzFwoYYSzhtzCE319YKnny8cf2AoMKI
 8CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LDYQT4F7qXvGWqvCs7Js1wTvrjLPyoPq0KJKGY64nE=;
 b=tLV99O6r8HzzdGIrbP/Jgeot0L0vFOpvwOZudQ40odUS/QzqFpl2cOb5WtRAEZZtKf
 1LLmZ29hh9ekkmD5vcmYgZNGPriSD7401CW6//z6kQidFjPLw8wptxeE+i/9srLpC624
 fdDw7vBROrnAQ66bT/Q/iuoGj2Dx1XR30NOTpldvC4AYETzKvtrEEyvKMbBbv8xMm6K6
 4OaL1/0BdC1hx7jdJF42Aq4Z65HVjGS1Dcel+kvF0z8hsdtcFu+8V96HI4W5GYk6Sh0W
 5TdRmALX2kYEhCeNocB2h1Fu5FPD72SvVbvetU9OX1WkNZID1ThBt8Smbg+rCla6cbJo
 J7NQ==
X-Gm-Message-State: AA+aEWZqoBRqjH9qz/MsgoG5tkfWnEWE0/NvjF9gRULPpDrQoThOlT9c
 oGk9aSjeD9Jn66t+yobpewyJUsHWr0c=
X-Google-Smtp-Source: AFSGD/VjQtBgbWoJhsI9qizZMKzRkv1YdNxQa0zY5A6WZSJZwKg5EAJ/PPd7wxOY/mJyoT7sIQwMQQ==
X-Received: by 2002:a1c:da0c:: with SMTP id r12mr10118590wmg.54.1544711800882; 
 Thu, 13 Dec 2018 06:36:40 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id e12sm4929930wmf.22.2018.12.13.06.36.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 06:36:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/3] arm64: dts: meson-axg: add spdifin
Date: Thu, 13 Dec 2018 15:36:29 +0100
Message-Id: <20181213143631.19218-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_063653_362735_01623F58 
X-CRM114-Status: UNSURE (   9.26  )
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

Add the SPDIF input device of the axg audio subsystem

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index fffd55787981..781632bd60ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1260,6 +1260,18 @@
 				status = "disabled";
 			};
 
+			spdifin: audio-controller@400 {
+				compatible = "amlogic,axg-spdifin";
+				reg = <0x0 0x400 0x0 0x30>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "SPDIFIN";
+				interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+					 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+				clock-names = "pclk", "refclk";
+				status = "disabled";
+			};
+
 			spdifout: audio-controller@480 {
 				compatible = "amlogic,axg-spdifout";
 				reg = <0x0 0x480 0x0 0x50>;
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
