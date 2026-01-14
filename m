Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C22CD31A2A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxjUPb79OKHYbjN1jShQNssFMVAiSlIdmNBXg1AHf8Q=; b=FeSUmRjFiIURhO
	JNyMW6ZwJ95gc6ntd5AoCb2hREeVgBjdYxqqS1ViCogH6x2EBZEJC5eUrd9mDQGffpViio/ADhsbE
	aFnZLtiyAUImltPUrTDJ7Zu5j0UwvYAtUG9DOpXXLDGwsQCTqy6J7L6Qnl/QCdz7Y1sFiNMZlcpWA
	6wDsb3YaZu0Sym5+KU/8bNSGIo2Raqtopo9MVaWc111U/9idjynCCQ1CMYrPzfPxsU2vF1fw6GSOB
	sLqkf4iNpVTE7bZGr0kLx2kYFtZbJUFxcigZuFRX65pz/m8VTJ2ztJ09X7KKSFqfex3Lz06UGysjP
	d3kLxh+2AGTI6pZGs5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwh0-00000008Qcy-423q;
	Wed, 14 Jan 2026 08:57:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgx-00000008QZM-3Qv3
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fbc305882so4553970f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 00:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381046; x=1768985846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbpaa7L+YJuoLVfHbsYDx/DJv0PXVpPmjwlFSpBUWBI=;
        b=uvQ53ewXftY7fi222SIGBndUvcROi23Z/AX/hO1kW/WsQQ82J9Uc5Hu/mQM3qOKgry
         b4yO7DYs9mlsa4YzujLqSOU4txaDCrJmuk9F3WyQC5ME2eAbpKxA99C7vQwANeQDsZqO
         sRCALNAyJrVCISN/Wx97Ea/tMN586hxCLc4Q50EnBihSVF5q1wpbBiTDJjR4SoUg8Mb6
         2ptj+VTLFZ6B4yLuAWE/9nVOFGMCb5mfIHJJG8y6X1u/pkWRdugEk/irLjxbXTFV/zl/
         70S/J4l2gPcawZjE5F0Vt5J3YPV4gQryvwD071qGETBu3vbYn+x7mH9ZVsEHEtAwnVWp
         /CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381046; x=1768985846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbpaa7L+YJuoLVfHbsYDx/DJv0PXVpPmjwlFSpBUWBI=;
        b=WoxPApoA/T8KaEXzZGnu6h4vPfZCJtAjr4VEs7J5G3YyM0APg92ZaXP3DM9x/V+oVd
         POxvjj4kmgfObIG/BHiYeAb+8x0CQNMNPb4Mr+X+oXnS12hqI7mCEYs5jBGl0Scx71hd
         9/0ORtYiWRKeorqCzI5SP2rz1S39W/URnm+Kf/OoDGofu/mCag3FZY2DBNS21ksB2iPQ
         fMcPcAqCHEB453PRTyl9KIV8bruEQNbv9ZSa85NJMW+gB0ONuPlj6C3+eqIt1KMsfim9
         SqklBRlgM5kShzGwEvzy3yaVcirQu0xTkjidGpfIiDAa9dT8veGiEYX0ZgLT8iHwIAxK
         CwXg==
X-Forwarded-Encrypted: i=1; AJvYcCUwUk2/KivWcID7csv/b69Fp2l8FFZZ4HwyUPglgkimPNdIlfm7ZtDie5zWP+MSuGouZVNAJ5Po2Vy+oXba@lists.infradead.org
X-Gm-Message-State: AOJu0YwfRSRNtxvraH3vpwITiHVVottgqs6GhCOfcvZlp5bkyOWweXXx
	fn4GjyuRLNVyIUuATG32J17oKG9FsMFp2+7ELvt+8w7+4ZprX7DuzwnSw7CxlcHS1Sw=
X-Gm-Gg: AY/fxX4adiq/zAZzCCOWZJ0f/Qx1qVv9IyjBaaufoThsOcBXL0cXzmzPRDpw5qPemp0
	B+23a/IOVxJ1/LZaaExDpXKcJFHrzcyGwphC1aMFZg+Qmv6gLuYPeJUb+fHvlaHetOmslLfmQRD
	lrMHM8ssEDNZr24c8DtsDL0FNADc1ZhnpqGgKZmTLgAbXGsVcsWJfTA68E96+158zMOdRleFvG0
	f9Xs/54aG9y2MPd9df0oNpqPFMF3A8KrDsa9gtkpHOZsnJfEvVaGzgZhBrmwwe5yOczI4z6MlUm
	U8i+7DH9QWw0wGBnyaodoFV9sYPlKcvVcffPAOReSXbKcbPOB3uctBn/p5TtiACQHh2K4f9H9ed
	XVn8AMA6xwjoC+Clhp7DCbZP3FQW6KebX7LGNn3nzYra0vnn+qUkTrIkQZF8NZUNGS7umVI9IHo
	XhqPx34B1yvQ==
X-Received: by 2002:a05:6000:220e:b0:432:84f9:95f4 with SMTP id ffacd0b85a97d-4342d5ff890mr1552392f8f.31.1768381045966;
        Wed, 14 Jan 2026 00:57:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0dacc5sm48674680f8f.5.2026.01.14.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 09:56:54 +0100
Subject: [PATCH v2 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-2-7e9ab5f12286@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=r6xTJIIhs4KBJzOofj3YmS5sCR9M9eszyosDM0nO4jw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1prUpxsKi9it/0m/bgAZT2A9oFBRfTID+V7Y
 cqqmzLwYT+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaawAKCRDm/A8cN/La
 hdljEACH5P/J/ngeUurRcWIgGvlXQgv9J6Z77okYA6+NAN7TREISt7XGVzQHQUysSUKZaetZBBq
 pz0op8r7Ia8KK4DwPhjc1BW/5e3mw4yciOAsZBwK93wMomVOa2ZjnlLjzd9LgU6NUEW9vC5QqsW
 Qw+rM5L0Z8yRL8lOJjAqncw9Od2gR+h7OhdmN6azZNPK97qfOs/V24h4E27tqxPT/i8tuLLQZ8I
 ex7l4CQCfjVby6Ml4qnbRpeSnMLwrghHQ2ovLlX+FsjoDJ7VPtPL6tlQNTY4T5ZPREhvj4D/BrQ
 anoN+mMqhpYOUVoEQS+wJ19eyfnQT0aHoBNTv2tUi55G4NlbZ8XFjJvzDBUEM9FmhQkqiQuzsk+
 414yn2suP/Uu9BuvWU0BtU8xS8hvBxr93mCuSy59opxHI1xBkUHaH5u/MpAumHEb0IxbXhXz4EV
 c0hBwNl7/E+1e1m+LjwHnXiFpDEnBBNnqy7uW9F6paAK0M3/Vi7MEZDHk9qzHWvdy1cQTLjbPhC
 Yw7vV/ydHLmQ2KMz2+xdLOnuNm9Bzw8sCTVOwIniNc/ecySJ5TkgzlJia3m22t5x/Sq3FH8hmbG
 WhGTxxAtzQpxBTaKnnXiCvNhWlUWRZ5mmS/cCDmj4GOfyCeIqyYqSFhzhgEvsAjRiwEg9csI4Ug
 rMMABOA876AxKOw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005727_892869_E613CF0F 
X-CRM114-Status: UNSURE (   9.67  )
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

MMC A and C are mis-represented as having their "clkin0" input connected to
xtal while it is actually connected to the MMC clock, probably in an
attempt to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 62538fd9db6b..6324d1eb5994 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -819,13 +819,17 @@ sdio: mmc@fe088000 {
 			reg = <0x0 0xfe088000 0x0 0x800>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_A>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
 			cap-sdio-irq;
 			keep-power-in-suspend;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd: mmc@fe08a000 {
@@ -849,13 +853,17 @@ emmc: mmc@fe08c000 {
 			reg = <0x0 0xfe08c000 0x0 0x800>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_NAND>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_C>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_NAND_EMMC>;
 			no-sdio;
 			no-sd;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 	};
 };

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
