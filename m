Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419BAC5DF8C
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91zWnkX47nagMDUaUbguFQYB0bS9prB2d4b5Dvl2U1s=; b=rv4KNswXs6IOk5
	TvGJz9FUOMS7OsFzvR+lcrIxB8nWQoY8iPrmVDwiAMfZUPh5uALzJnnDwsaCAOa8GGc2PsL8Arybj
	pOcN7KbrXu7FWzhSupepqc7q87P+s2KC+VHvO3mRCbNuAZaF2Frp35he2Sgko4byoJgbDDcuF4K/B
	0MZRaW5ov2RcHn8dgU/rJYI38552OCmUOJooCHHUGZfus9h3rkaN+mJkWlKXNXDQgG6LF+Ppk2CFH
	5d4sJREASQMKBws0svtCFTQheHK+ytLgct/1dc9tIzDJIQZeQBEaQf0bRSsCuLoWTunFuvZzScyFy
	wgTwR88yBE1eYgLxFcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6m0-0000000FJUm-2H4z;
	Sun, 23 Aug 2026 11:54:00 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6lt-0000000FJQM-3YT5
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:54 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so15422665e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 04:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486032; x=1788090832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jThRiaQ/26wqHZ1vL8lEl8IaaxJS8aQBBZUVqHcHFM=;
        b=iaB1mPdeuaWAWImrOg+3UJLGdIt9mtwE2xzeK06/v1IQ+yQb6kGMJ0rRip+hMV26Ku
         AWj7+xoVY+MCGIl4bHLWYob4XXyhAZ0b69Zav10ixePDs7O9TfrmerONuuWlIvqs7tJi
         9DUtsU+onhmuqxDsNqUR6KyS/XkhO5Q8FKNlT8+vFHBwvYCJsWXJeoejJ81giDJy1aBP
         IuZ8xibfpdQbO4qmLsLCTNI/glmH9j4gjbKDvQs86OpbAWYdq7SD76sGlnHUje91ILlu
         wgXEHnoCWMS7qzIlQ6u4KMkEgtFODp3yfjF0495mO0GguBOls4n0cpp97pv83TboLHH6
         jivw==
X-Forwarded-Encrypted: i=1; AHgh+RoxtXM4m2BJGdL6EoXdYXtGao+2CCZDCOAM7KI77Ly4fx4nNL8mjT6Gt9/zJWbAdb3V+thuYSg13nmEMlrw@lists.infradead.org
X-Gm-Message-State: AFuF++lzr0uN31o0k+HNle9iT0MGZdkYrdErsME3vmKItI42E5MC5wB3
	m4GO1+j0Zv/ex7+P5WnplcKNt5wMtNQnn9GNe/wYB2ZSF/qJ735vMz22
X-Gm-Gg: AR+sD12pDnFt13ccyf3kFG23STKxccr1v6kJsmAtQeuMC6Fsd6t92wzwZR5dewD0RF/
	d/kjaJTAkHpFI7x+BHxF2N0pj8nlTVsQ1SRAi5yarP/V+XqsTLeK+pALyOkx9utzFggEi5ir6HD
	gv4PHKyf+7IxHpHHzVbCjhjWPxdq7GEIG2oupct7FWuALFcugrDGtcoWCQy25S40b5sV0nhaUBm
	sAnc87Koa8eSmwZrs/X7lhEQW3J854U+B6dqvtykRPjYLR2wB0ej3Q5+KS/VAG6R/PypRMiu/cT
	ZIL+m2lFA8gFoRHyyi3aGdQMt8I9w64wOJ99DIJnwwxw4HEa8yrLvTcYMBdG5/tVXztCzRsmkes
	Syv74XYMnjqSY2WbZRR8maFznCHh85dIhu0fzX4Buib5AdUhQ6CRpwqNaWHdqhIldgtTcCyiZII
	4CIu+Oats19eyMAzpz3Dap9wEiVle6wGVGCD3MYFvXZx9jOuphTmzFIZvUc9YNoOtxUEJ5XSyOa
	/HAtcadKzIC+fuuzqUa3f2+il8WKkW3/A1ARCQ=
X-Received: by 2002:a05:600c:6296:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-499b8327cd8mr242910645e9.7.1787486032189;
        Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Sun, 23 Aug 2026 12:53:35 +0100
Message-ID: <20260823115335.102219-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045353_891757_E7177E3B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
cards refuse that switch, and the SD specification says the only way
to recover is to power the card off and start again.

SD_3V3 is marked regulator-always-on, so the supply never goes off,
the card stays stuck half way through the switch, and the MMC core
retries forever:

  mmc1: error -95 whilst initialising SD card

Drop regulator-always-on. regulator-boot-on still turns the supply on
at boot, and a card that refuses the switch now falls back to high
speed instead of failing to initialise.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 75d81ad6830d..c94afaaf8826 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	sdio_pwrseq: sdio-pwrseq {
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
