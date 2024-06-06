Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582C5C27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTKjcKQ+wd9GGF9I0hQKG+Vk6MrfKvYlDsVhzOqOuKc=; b=db8U3LfPzGOFHs
	O92AXZsV6ezOfYD5ZUQfJuZ/Jh7g0CyFF2D1cnABwDHo5ngC1yqJYyvN8XCfhSPWI8jGrH6wJzfR3
	2BCJ1jt1U6G9ISUvXSNOx4G+WKp1ZBOZVPEiy9TCv6Gd/TyDGvHqEWKUw7Yj0ZRHCss6zWGjea8uJ
	70I8f9NKSSQfYyTpFegHkb9sa0m9hmNIisl+JEcaraswUGCxJk1V9pG5C/D60+VwAbLaOjOVdwvRF
	CB+hVQMZa8xkFOKUYgiFbwV8Z4xb6QYAd6CdhxXLu81p4wtpWpq7OVg+TVOVnifcNxkgEctG6E3aP
	P4ahoG3xN4BkcG+TbVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nc-00000008ua7-0ytv;
	Thu, 06 Jun 2024 08:48:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nG-00000008uGu-01iZ
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so8942295e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663699; x=1718268499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I11GCmwbwTQWJnggMYRy+IvcpltjoVwOcfxWgF2WTsg=;
        b=ffCA24T1VpV9QawNgFo8NmUP4M63v+UJIjoaRuRNn6PmmLVKS3Oriqg6MIJklVfBpB
         u5+BLIDvPFqluho3v540lVLV0vAOl47UFqDHlUhOC0EzoPvV1xTmarGm0pzhfkpzCem6
         Kmo5ybD2PbE6XkdbL9rvP8GHcMfaSd+DbaZcDIURxLcPkqGfBMfPr1Qw/o9UweuA5Qjo
         K/qnUwVn8ch65V0xdJLJh9N8Y0D0AhJiiR1CWW6YCGkpJaW1LdaFPLzxJslo4JLCzOen
         Mn6xdp1uO+ynBAsqJ1kBH8G/bZdIQsxH4wq0R7J8DnZayKrCwAo94LnlL0Oe1RiJ2ceD
         sZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663699; x=1718268499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I11GCmwbwTQWJnggMYRy+IvcpltjoVwOcfxWgF2WTsg=;
        b=pmaWUxEE1rGseHMEnCWwi3uH5EVKHICaSGUSFs9jK+zdkByW5+AIoyr2ecfaZPD16L
         XKgIi2/LSKfuHOUjbj7fmuuv7HB2trLzNspAJussuf9dYTjMtdbQKjIjxMKWO3QcHhll
         eUyqP5t0QZk8ZrRAxGAoByqAqnPGHZq4NJzl9XvCeGUHYJnJUYjjRVMkRljXv5qNP54r
         on4tsrlt4Jg1gQnRsIeetAtpkS/vWyhFDYgDjrcHKHKbto4hvB1nORj2yDSjN0aBtln2
         bUEI1rE/QNUcK92m/mxWlBMDB1kTkpoak6HuJkJzhs1mn9RNzPCj/WZBLt9kvnYh0uJj
         W1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUvKeOQougPwNekP6XppI8fquCcT6JoFQ6j5qaOblosbllFC+73TOqGG806ju2wqW7Y8d19CLtMmvWWQu5M7vxqA3xoKs5iDMSTNNfZYvyATcg=
X-Gm-Message-State: AOJu0YyYy2ylu9QeRMz9O95SVwB2zUIujPjdZdSCgRrTrvv5r2yLuLTk
	ih2YfjTkEGptptT3KJ3xTUFCb133gXp9LZ3DfiAeV3I4tz2QszOGHDLEjB6STcs=
X-Google-Smtp-Source: AGHT+IHXNskKx96eAveDBrVtdYp/2X22ILbdY24ts/HP9hnKmVYhMiCzDPYXHNWBqE8KmW8CLvFx1Q==
X-Received: by 2002:a05:600c:b85:b0:421:2edb:d207 with SMTP id 5b1f17b1804b1-4215632eb27mr45552835e9.28.1717663699425;
        Thu, 06 Jun 2024 01:48:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:11 +0200
Subject: [PATCH 04/12] arm64: dts: amlogic: sm1: fix tdm audio-controller
 clock order
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-4-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZbE2vLa8S9lvPjkvME7nqfkOHEOptRs807yC/TclS54=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfLxLYrVWx88kK9rLfSbTE4DHKxGZePo9EX4BNc
 N8QPGlOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3ywAKCRB33NvayMhJ0TaFD/
 0VbGVTEtlallTWLLyKR/zCiWlQXmvjToJXlCheIxQSQKdLvSRWDv85LNyDUkPmOXq1gBwHNai3/is8
 tTgsWatCbxKm2V5r8Hwoy5Tm6zm6+P4V7uxCMP3W7TrdNRS7SKW/bqBvAtaSviLlKBRAjqOimEl7x1
 trIJfw86VACmLRWuRQx7RcQ5wChwIMu+DUy0ejeUFCUuZUk0PacElcQjxKy4i+TA9o/9Dm3/R/As10
 umrNj9LUtdfxio+TNIYY/ZT9K3MzkZZs1LlM+cYZB+vBd8UuEiHnaW26PnQOo5utjN233REotdKIyl
 tioawwMea5ZtMM3qO6/H2b+vR1mBosVpFrMqYoOatoaxJaJIdvB5eGO+qFPko4cMxD6CMNxZJmahBg
 Y25CKAppqTP19cFPExsKzsjLYCiRgirQQ2cDdcbvGmXHIIle7tctYQQVMBOil1YYapNaa3kGZBoSk3
 emnjlBFDWRYlfYrD/4O23UNsiP6R4v4yNK31kojoOYRWSOq9qDs446jXWY8MRxb/mDUugJtyeKoqwN
 pvZYppHURcF+4bP92sutL0C0ZkpJmnn81WlIfmw9VuNVifBbOroxVOZqL2Rn6MZI+38/vZMi2Rxtx6
 d/GGsFPQ5aDK2NBUKLqCBYpVEgArqtSuyCrcouu5KhuK8yLUWWpAPvPMORFQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014822_208951_FCE595A7 
X-CRM114-Status: UNSURE (   9.04  )
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

Fix the clock order in the tdm audio-controller nodes,
this fixes the following errors:

audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 643f94d9d08e..6822c2f3cfed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -17,10 +17,10 @@ tdmif_a: audio-controller-0 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_A";
-		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -28,10 +28,10 @@ tdmif_b: audio-controller-1 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_B";
-		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -39,10 +39,10 @@ tdmif_c: audio-controller-2 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_C";
-		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
