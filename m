Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18709C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1xyXLo9iKaL65i+W7QGp1OJhQ/wh8LuoaCpI+d5LWd0=; b=HF2MXS5b/3iU94
	0AqAsRr4LEblFOc8HpGgBlW+6rFSYQA+qy14WkUGCtdS5q0GBkCyN6MNLmOrq44rE6Ytyj+QZDmT9
	9oxOFinUim3irfs5gQYKitLgt5o8IJ+dyvI/u0oLMbI3t77Bh/duIGJrLo1uqr2DiWGS3zxaxwtgS
	qgujI4t+4Cgl+FzSA8HqjAjiyPsfUzW4rFDp2UTKNud3/SuFnNR1jSJJb3eY+nuCHRSzXKiW7U8P1
	8OfA908IxMts8+2yPu+fn5himhWoD6PMZpn/DUS1YogXw6g0ql1vZzwEOBzH2kC7qYuViAUnJsWzJ
	y3VHW0JjfTRh7PcrNq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHe9-003Ttv-SZ; Tue, 24 Jan 2023 11:39:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHdz-003Toh-Bu
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 11:39:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id r9so13576816wrw.4
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pO0gnmqvMi8936RpUesIY7OLCwa7UX2sbv4nhIVFZOo=;
        b=qrraxzm55ZKdMTAZAllssEM+P/T7uUUYIArvwS0NOTYcEbnttpPOODv55uihgxbUpl
         vfe57htQgJFyoaldmcIqg7GYdvDhb2IDwH9rraMn2iy9wP8rPlUiVmIz4TEENGmHndIQ
         RE0G6xQcpSShL4ncExiHb9xKzaMSNgm+QxqV8Si8xauzbtQVgBIzUiI4HZmBl2xp5VRL
         UG0QUuAtnkDG/YCHMbp1lkKya28onrwDEqDrnDJmN+Rve2R4Sk2vk5qz9VGZ3C9UcHcv
         0qmxFdYYBULW1NcuKBeTxFmZPKuU76FEcRFlZKDzYj6xEv50CGm/EjpFSDRX5hQATVmQ
         WK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO0gnmqvMi8936RpUesIY7OLCwa7UX2sbv4nhIVFZOo=;
        b=Ygq6fqfHLXNiBavthM34qvV7LcSjPjpRFwqvR8HpkKIOmBfLuoj3cYAMb26q1LxH9q
         ooVchlRCKoAiAaQ7JCnDrROeU+mh9R7/rxuHIbPTBUm75pTGJe4vbE9yy+a50BtpibEx
         tE8tHMyK5/5fLnEPxvuPUr/YrwFDKAui2Vbu7dHSUf7i+KQ6YxX4NvV9Q1AE3XG7I1hc
         Vu3L4f11PRqdjeEukR/1PqYNiZPAWDc350Efp23JW9niwNKAj2zO3SVft72LE1+T+UT9
         pTgipg4yLh6s0Ww42W6muUIRR/+iEJl6xJ6ZFRoWTpYW5Z5AsuU0+4HfgEHg6OuHjXnf
         hQkQ==
X-Gm-Message-State: AO0yUKUohwps98pzDqi4ZE9AEsTjT0TXhBQ710JoLTt4SKg/u3V3h+/K
	ayN7I6NaI0DIAaxlTQK5WIJ05g==
X-Google-Smtp-Source: AK7set8MJPdBctzje+F7wc+VYwjJ28N0Us/KhM9TGGZSY0l7Zl1LQJhfGgUFqg/uPmMzuFP/eaWrwg==
X-Received: by 2002:adf:f345:0:b0:2bf:aee3:394b with SMTP id e5-20020adff345000000b002bfaee3394bmr1935520wrp.50.1674560349695;
        Tue, 24 Jan 2023 03:39:09 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d5849000000b002bddac15b3dsm1006482wrf.33.2023.01.24.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 03:39:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 12:39:08 +0100
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active fan
 thermal trip
MIME-Version: 1.0
Message-Id: <20230124-topic-odroid-hc4-upstream-fix-fan-trip-v1-1-b0c6aa355d93@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFvDz2MC/x2NQQrDIBBFrxJcd0BNuulVShc6TupAqjKaUAi5e
 4cu34P//mk6CVM3j+k0Qgd3rkXB3SaDOZQ3ASdl462frfMLjNoYoSapnCDjAnvrQyh8YOUvrKH
 AEG5gnb1HdIhz9EZjMXSCKKFg1lzZt01lE9LR//35uq4fJRsyfo0AAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_033915_435172_FF57414E 
X-CRM114-Status: GOOD (  10.52  )
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

Add an active trip tied to the on-board fan cooling device, which is better
than describing it along the passive cooling maps.

Fixes: 33b14f663df8 ("arm64: dts: meson: add initial device-tree for ODROID-HC4")
Reported-by: Ricardo Pardini <ricardo@pardini.net>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index a1f0c38ccadd..74088e7280fe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -76,9 +76,17 @@ sound {
 };
 
 &cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
 	cooling-maps {
 		map {
-			trip = <&cpu_passive>;
+			trip = <&cpu_active>;
 			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 		};
 	};

---
base-commit: 7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
change-id: 20230124-topic-odroid-hc4-upstream-fix-fan-trip-0105bc1cc3b2

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
