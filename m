Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F800D38FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykjRqWDKzZLNvccVqf+dL8E1Wc+DciADMUB2R2KPpEc=; b=K7+YzIqK5BTPf3
	5Do1Na23ql4DftKcLIitw9wQ+bRXbEJh4LAeqN5CUqEPdye0fzzCF9Pn+lqHdaCTZfgFli6Bks0C5
	yVY28wbdKQ8kjRtMtbYgCo9b4hs5DP+Bpz90aozDjZX4J3HVecYZzvD26vAjBVCmdcDIs66kkgAtU
	ma4oeGsLp9oLjJ+qrKMpEsRHy3C3JO5W97cFAcFZM923Ag+7FlUqa7cj4AvA6X+6qY2pq/SecWY6L
	D8Peeoxf9yRlMk/1l1Suwvliph0snVcGUv+Q7nCrxszTZHWir/escZZ76UWpNdHrNxym0iJN2N/Sy
	mDcpZBfhUM6YeACaGAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N3-0000000A3P5-0B5Z;
	Wed, 14 Jan 2026 17:09:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Mz-0000000A3LM-3G8y
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so66485e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 09:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410560; x=1769015360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbaEokaRCynXGgwZAsN2Ldlp+XK1esNZb8TISMcIDhU=;
        b=McLA/JaVy/1zGrmnYA2CG4exu3EUApvpWHq19TkifJNeocf2tBwhqJZk9wXBLW1VoF
         TKvXc7yUavk/FqwmaONZ3zbZZOAArXWRNqfZXlEkYoZrirm2tm6p8QP4KkKz4YciSAed
         hL50zLlDArzkAUhIXQKWZSzZxK+5ekvjIHUKs+snjueSF96+SxQ8pcQOh5g/l5XJi5Bv
         v0xriZ+W5BuQr58pU75CvqPsn4dmo74J5l8RPDnG+xvWsIT27VKoTcf25aIqJe5U9MTi
         DotRWHVyqR76kObckDOlWBpm3rubzwQMKDN5W5yUomCrG2yx5PpUQ8MPbI4MNMUabzbZ
         APwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410560; x=1769015360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbaEokaRCynXGgwZAsN2Ldlp+XK1esNZb8TISMcIDhU=;
        b=sWVKAN+PRER3LLYG2Kn81fV9ztgdD4gLBgEbh6a3wFaB6gClD7nak51N5jYxgg1uHt
         7uX1P8ny+z0hNl4LxdSh78T1orSSPRBvXiVHjcwpywMdXssWoJb0ctXtu3HGkFr3o0JS
         cU/IWBokE1p8FtKTT7GGx9nZPPLg1f6XlS0pu7+h6SnMSpW/uHaD/OsGxQsmKgX5vSvN
         mxnf0t+y1wEG6WXRCkuyyrOQhWkt7X7FJmMvPrLRYtzVQ/Ne07pEOrCSofjbL/vxSF3s
         4Pv5USJgcR9wOjqTCXm4LIvhFH+V0PZhKNgd9L4tUgc7rtl+oPnu7GEVEPIhLUq+Y+h4
         268g==
X-Forwarded-Encrypted: i=1; AJvYcCXGmZLeRkT0XRy8mw3vQ4IaK3C+O6hJdZfvt45dC3q+dmSXc1YMBUdL40BGnYvVOyE6I1xpQgtaMaV/CXko@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3gYig5Pa9/L921c1etUNYm3wW0WPQZCqkyVikp8QllHX5mVrC
	5tD8fcf3yCLk0LFWXqGxdqksz8zW5t2Vp7tXEdhGLUSB0MOMIBj65x/hY7aUTE33yq8=
X-Gm-Gg: AY/fxX5y4SEp9Q0nf7NbHdzc8QYmSuTfS0xYY49mctu3ip6Xnni+HENVd1ojcDRiubT
	S+3yIexmQ19Tqy4wPiVxOm8hlzgYGFdhDOLVFXW5n4K/C6nFUGboBC2Q3cQkNJQsXA47JDhhuof
	jLLIKmS1zsDXou2cMGGYKQL+hZuOFV3rhKK/un81912prAwEAVP7bnTfEfpyOUMpZ6oXtmCZXoF
	adBQw8vHsMs9zk8QIZN+MB1MkEuksn6Xd5+M1mb8Cx2b7ExBIKYEjWvHDCddKFWA1BK09dAYTYG
	VOg0bDmtq9Y5PscuAP6ryhcgM/iJZJcaXbZ1gOf8OUVYAjKdh2F9C84B6AsOP7/sogtty3gaelQ
	1C0y6PLIa5/Yv/FRqY1ju0vruM5mv5S+iijYVjw8qPDyBaYIKRJlfuWp52Sl32BgKB3jvAHIViV
	zvv/L2p8FPZ36q/GbKqb7w
X-Received: by 2002:a05:600c:8719:b0:47d:2093:649f with SMTP id 5b1f17b1804b1-47ee32e5de9mr44996145e9.8.1768410559834;
        Wed, 14 Jan 2026 09:09:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47f4b2755absm1854285e9.15.2026.01.14.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:19 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:48 +0100
Subject: [PATCH 1/6] arm64: dts: amlogic: c3: assign the MMC signal clocks
MIME-Version: 1.0
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-1-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ko+xWiQ4lTs8l11VaKdcA5Y4Q0/MGgAgE7QxZSa5HcY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ822mIZD4uDh1QWbhb+XeSD+xaDGJuZWIH+76
 y3q1/f0cBeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNtgAKCRDm/A8cN/La
 hTphD/0WD0aIlphz1SaGDEqBNVzGb7WDx4RCAqfyl0NLtxx5eRsEblOhMwPJ8dR82sld65wu4oj
 Wj8WuDXKOfJGZLBAyPLzKTMdWFlqbchT6vrBJmcm1qBOEudHmUUJ56YvMRwV9LZKPbmFGZBWSxL
 XZXK/VKQvBvcEqP3X7C2rOR/hjfF8XqvrzFWMK9NbOko6hMjjKLp1mneoYPcvvR9o2iTgYk7rnd
 CNC5MsAIbIBKWImB1/9Edtw+0rGiju+vDRC0romGpiqht8QeCxgyFkDMVUtUse5OgaC7z9HIl1X
 CNgEE9AQ+KAw2DqQDXwEslUTiVT2tzYFYHJ2v8nB4sFBw6jSKR1Ndq/gSWzwBUKbPw7kZyoRDgc
 GLW+niSGqZlf+PanfKUqt9a84X3j6Ud39iseKNte4gf+Z465wU+fJhyVcj/04ZnB9992uZGuxOf
 YC4PBuI4JVJaiL2noPl10YhfUuL7l3OeF8Irr2I7Y1q4BxKQ6166s3GYvMxd5WGmjoQzihP/zcD
 2qPyxdpYUr46opbtTgo0+6n0sG8wfhjIHkWNFVFDd7NeIJGj+ScVXsa515zep2NLHmrQWYNqAQW
 xFeDf8ljoK4lVw+cdKTaKrteyh96v9k3UqiB9o+DtDLIGPIMVLyWK8Hiop+yd/2Jzn+UVtRKoMj
 ZEJYOG8gbv8ebpQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090921_872085_BAEF4A75 
X-CRM114-Status: UNSURE (   8.42  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 520b792e8317 ("arm64: dts: amlogic: add some device nodes for C3")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 11e5323f95b7..4e6757a57fb9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -969,6 +969,10 @@ sdio: mmc@88000 {
 				no-sd;
 				resets = <&reset RESET_SD_EMMC_A>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+				assigned-clock-rates = <24000000>;
+
 			};
 
 			sd: mmc@8a000 {
@@ -984,6 +988,9 @@ sd: mmc@8a000 {
 				no-sdio;
 				resets = <&reset RESET_SD_EMMC_B>;
 				status = "disabled";
+
+				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+				assigned-clock-rates = <24000000>;
 			};
 
 			nand: nand-controller@8d000 {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
