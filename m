Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCECCC5DF88
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvVCucHuelOocQCrQXRxt12NlGo7xsCxM6t13Aab7Aw=; b=uEGZaYCMzU4GBp
	PNnV15JOKkeygTTOKHZx5zQM4MX4mLv+k9tBbyEpNQUDT6JRRd0GYHBXpWF7sHOPkjvJltOCamgWo
	b+ZYk8vGnwk0J8uyApubyJfWTE2tzFfY6x9hr8V7gzEwadiz8BtwupkmIg08tHaTd/z/ifaLRG255
	AAJ6BW2/PF3WOCe2/VSzm51CpBPFoeYVMbSukO1OxyJpDmR6J0TQ9Y1FQlJKPJTh3SK0f80OKkjVf
	7Hk70isOJrm87l8U5x8sDVNrx7zJclWA3smDWHU8tFuGi+5f4MEAXbDnBKEMt5vzgpy0/73osvSux
	lSVNFPHsEZQD71aMl/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEN-00000008Z0Q-0E0u;
	Tue, 18 Aug 2026 19:12:15 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEI-00000008Yxk-0h5d
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:11 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so2035225e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 12:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080328; x=1787685128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMPOR156M0mqts600G+VeeVQ2Hm+QQSFhaSBmB76XDc=;
        b=Y/zre8hnplQcl7zkiVIO80G+S3RaJPgkG1G0Ff+ciLMdJEAy09FsWGjf5fDYHch+0q
         ra5IvERad/ShReYIu3DYTSmKyvkHagltB2gnYt2BEfoAi52UNuypNVQL7y/MAWRXOZ7X
         v5rnPNmkjWW0nssO0J2/CoryZsGnA7GynLofZ4S4Dz6o9beekqxuI2TEJ7Q4YmJu4tls
         ixkGVYvj2JF0SKqXchfcDGuUYovlPYuILYpBbIVP3EnXdVduy2mwlrvjzvhxuBko1IG+
         8Pzv9GpFyM2l83KoguRXfqkCBbog/ioXrm++aFi1XDApEIfMl6f0ERlr1JB0sYrOqzlE
         gjlw==
X-Forwarded-Encrypted: i=1; AHgh+RoPGf8gV+1c+/7tw5Y7oQz7r9Z57j0A9Jx9zfn07NYV2FeqrBMvjJBEYVqYt4ciudpypSlyoVggbgVExFtW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx92xB/pkbeVl8pRhDVAINnQXE4ke/baWYaMM/gdvfpAu14R0TV
	NXY6hXhss2SMakfJCKwGMrdLAIygqTBJNJlw5yZr7UpF2tA+JPXFr/vF
X-Gm-Gg: AR+sD13GJmWNYJzB/DgYfCXTrnKBjJYOSnpLMh01pOWi/dz79skXbD8m7g97C4kmi/m
	pMrHtDBWQ2y+cBEehy+4aipFkYFCINf0OcHorBF84OYLkEWK8RhJyuvVNovPEZL1mzfP3WFdD5d
	z/tMoDvF23KUeolY3JpVNBmE9R8V5mZQ7YsJsUE8rCupJJFMR+Z24flbkDiHiCBFekiaLH2qZq7
	eJ/TcXaz8PpJQsNEMOSgqo8aERNrh85XIdUGP1LQwjI2QoZdiGYp+W/9JprBM++gvKTtOP6SXH4
	GZfcO7MzIPPtnrjXWVmp6wWBjpT7pa3noJvwlVy6yuZ5AU0RyrtX6N+3XJZ3wHNlC16Zl0sWEKE
	Or2nTSXtde7F3BZWiX3vhFzT5iuxTw7r0ChltJZhNG+XaBshrV54Fj9Hew642+uvLzPx5wi8+WB
	TdrOXRW1sVRBb6xOcAkV6keGRgjSXdP9ebx9kGz2EfTxHPihDkN6Kbh18WXjTnkVq7wcMf1IaoL
	t12XadqTqlZNWa5BrjkX7RA2uk=
X-Received: by 2002:a05:600c:5253:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499a8fc25eamr3729925e9.12.1787080328303;
        Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:07 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Tue, 18 Aug 2026 20:11:59 +0100
Message-ID: <20260818191159.11523-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121210_213870_3D46A3D9 
X-CRM114-Status: GOOD (  10.14  )
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
index 677069e58f30..3f53630e107f 100644
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
