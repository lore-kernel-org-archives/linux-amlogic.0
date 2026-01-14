Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F61D29FE5
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znTkGph3UO0qWTXDQvefl47UhqAmYQRSwvdY34t80g4=; b=NGyhURiUV/oD2s
	AZJ3BgkaPx2E/QIlLqLLqjcn8Q+t/zhkeXkBvOKP5TTCwRkfqiDx7ciYXwrCi//h4dzzCTAtpuUxf
	EZEdbpk5qeeox8zcLWGM2yveCoXygD3hWRTnYNVqggSly23nqK4TcwsaV6urYnHvTLOBcgIBm3JCY
	V5XGybzxR6mKYsFV6tf9b6a/QJA3kZO0j0tmqhDgonEoYxLP00qz7HkD8nnrBtjMLpdISiETcy34G
	wmgqIvpNmS1mmvORzWvcpaJkvmgTxgMnwfKJYNwwxAJGYQSIwAvvxAco6b0Ll8sMpFzlLhVyYcLxy
	z233KIQJeJUBIQfJc4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLp-00000008qSA-1TkF;
	Wed, 14 Jan 2026 10:43:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLm-00000008qPk-41Ge
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so57377365e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387421; x=1768992221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlByN8C1Eu2c9UjKXvt2bF4y//Mr04/U71i3Y158psI=;
        b=bxWKK46VmCLVYRluUF/Q/IZphSuImwc3NpSxGiLLYtF2xCQuvQ1C3pBYr1pFuKbdxJ
         U3XhiG2yMZf+Y75N+VitawvI4Qz3xjfkW2ftDU05jI0IqQIjZiLyYd34FXw0lgXVfaZm
         1OZ8uBFCKORAmK9dLfRLEZpSeUlTXw3blLoztsBxkBrdMPkMXbk4juCZ/0P37y5gmiPF
         JV4frYKOyUdMCBMiOF84e3mOmqQsv4unvu+GdZoyaY7GEzbIaroBS/ieiszWG9mP24yS
         2jCwmkpSbZuFmVSzCzbcBtNc6Vgpiit8i8++XhaCyBcLG2bScGVzWpL47nZf98/52ZmU
         hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387421; x=1768992221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SlByN8C1Eu2c9UjKXvt2bF4y//Mr04/U71i3Y158psI=;
        b=M7bDzcdvB5oSWRIKRVenS5OZ1cZ87vEkuATvuvxvpoh0QquWwFbtEOAh9/vxTeIT1Z
         boQ+b1Oks8da8X8cFYLbw+u46wPIqwt36Q1qBQ/9ysrhzJix+V11thTJyND93tW4wZko
         SEUg9okRFyH+R4RLm1zL2yDe6xsFxI+9diwgiJGfbreuMOlZuOBFZ2m90d2u9mot0iZL
         uNxo2FBv5OtJkElK99h5czUOfqECWrqZ/kZWJxZWTg9KVv5mHNMCzINdJVsyr7DvFLYq
         kzjOkMR7tl91KVudNVhZwaXy0aTadcBttkvT/IB7jxo1wXg3XW2l/+M0FtC5bOWtSUU9
         KK6g==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZpLT3Py33f2bBrDR2bWsZURQTLF3gJDvN3VUZhG6gv8vYUrEX0sGR1sqImZLaiSgOLr5IelyecTPneOY@lists.infradead.org
X-Gm-Message-State: AOJu0YzBwC6qgcAGV1bzT0XvuzDuZjII1cOt9ZNGkvWnN8tJJ/5nbRjJ
	GJEdwVAbHhSFVzqJPzf/4OMZAq9LSaRkRaxVXzjkGRQiJ1Y+iSdtI58xLsntcNiThRA=
X-Gm-Gg: AY/fxX5VMkT7NDO2he9dCVahQw8m1m6LdvzlcM20mzatsM/SqiA1oWfNysBCrjChucz
	JMdxggD1h951/GXIoBvPejEYYRY4fncl+xD7BX1KGg9oYNDhgw3rkJlc1Q2/rDt14SLFN+tqzpg
	9axUXk7eubbJzo2Fo3Mods29XeO9CLdz05mkQ9kQjfDMuXqeWoVN70iX1ZWek9zGYuEX9/aaQeW
	4M1wletbEz2CYyU3H1eoveI/hQd0ag6moHbwqMUCN4j+QpftJBN4TxrUkDB81ALPRWWfQZRjHzw
	Nrvw9Za5LpnwDLQ0E3ogrYKCBGB7yQP+yTvxDogbw08eSreH6BV4pm9pkTJXg3QbIkNBVWdkSqu
	2XHppV5w9afNmgFRrHV26v2Uv5Uxj7325erh1h08R5kCz9nag9Zp9NIHDacYjA0uXJNOoTgNBxH
	kbKsqbTBd1sw==
X-Received: by 2002:a05:600c:45c8:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-47ee3071491mr26145085e9.0.1768387420967;
        Wed, 14 Jan 2026 02:43:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee5613cfbsm21953065e9.0.2026.01.14.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 11:43:11 +0100
Subject: [PATCH v3 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
MIME-Version: 1.0
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-1-a4d3e136b3f2@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VYGCJTyLWyZeqxrYJqis+f8MCWkH4xGdHO1FKT2JVf8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NXDe1yYrYJvm7ef+o0HbQsBE36HBFvgGEFi
 3gDd6HBfxOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzVwAKCRDm/A8cN/La
 hcFYD/9Q8GfbO+oTJmQEoIph6QdmzFBAunlGYVNjY3ojIk+xGMpx4K8lcWBjqy1KR2o+tv4/0XB
 mOkxCqoU73aajqQG1Gtu/YjfrPOiz7CJX5LMd37ftHULi1G7bXOAqZ0ctJro+v71iLcAEOM5I74
 9Dn5u9+06E5fXfkVjEcyhPsx8wnkQxeeyY9lA1nV+qNH0qd1KSeqq5x/4vWdbmYPX6FQojk4cPP
 /DS7poKOJnn37qdQTGs0FPwzeoWq4R/w+WrgcmVWSFjigeMfdqQy6RiA1IFWZp5zG/M255ngOpo
 m5/JWAK4GOdNrCDZveD6tgTh/3wnGJa3c4esNQHRQwa/XlEO+pJlbSnSRZsJ5+QVdeg1padx9I8
 0FrGIODF2UxvRAeVcIwVgJ5iXE2XKI9VY5i0HELTE5mnenUeXL6u5+tKVHz+8HgYxyKKpYWPJtP
 TLMCwoKFRs3jA2Le/KPc/zHL5qdm/DKJxpetbX/F1lnaN5yHBnk2c4twSz8HgRhjxm0CJQeP/tm
 5k/RpETe/LiozsreIgoOgVyKy/i6EWPEspD7Y3YmtK1hSniiSp3aJVfMKcBDH5NZ4ON/Qb21RhT
 43LnwBcgOL61sSI7h8gOCcno/p18o6a+uqjLV9bBmCdM0wZRrNTko7tYefxSI+4/65EjsVWK9i7
 NhG7oRZ0RIkfLBw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024343_016147_7D549F1F 
X-CRM114-Status: GOOD (  11.30  )
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

This assumption did hold true until but it now, but it is apparently
not the case with s4. The clock has been reported to provide 1GHz
instead. This is most likely due to how the bootloader is using the MMC
clock on this platform.

Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
24MHz, the clock should be properly assigned, so assign it.

Reported-by: Nick Xie <nick@khadas.com>
Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..f314f07062ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -838,6 +838,9 @@ sd: mmc@fe08a000 {
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		emmc: mmc@fe08c000 {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
