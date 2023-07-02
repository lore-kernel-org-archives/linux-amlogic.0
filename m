Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B992EB64D9
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jul 2023 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FiB6I4dDnfyu2BxewOzutDB0E6G3lx2ilspcti7CDZU=; b=BBmOSLkC0NP5oC
	2ZLEt6jcVV2KgYh+Lm7nOD1aBid77KkCOaDRx5u9CYs5WjbMT+quN0PDOPHg6OKuun7+mOgcr+3W/
	nP3Fhwr+DXV+7oTCsVTS2HndxTJbugXxTGzz8LiiKobJmR337sp5O+CgAREYks8EG6IHyYLTa2LkM
	FslAEwOgkWazvKw43q33zw63HXOZ9hODDkXWKOaWdExxUcO7z/pd4AOZEnJxZlKZZZfk7NabUSsU0
	wKYNLZF6bqmibEHvFIoUrUJ4DxFa6IznxV0FwtOelczWT3Aef2b1tHLvO84yQkOD2QbkMYvSVLpVU
	k74wWzfElmlkA4/5iMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2CV-008Oxr-0c;
	Sun, 02 Jul 2023 18:53:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2CS-008OvQ-0m
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Jul 2023 18:53:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51dd0205b2cso6532591a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 02 Jul 2023 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688324010; x=1690916010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr057d23zYvecpNmrqhCxLjU9O8Fn3+fuNRTaa2YGv0=;
        b=iiODBNn2jqns3pOHhYdgkUKeuJz8oqa/oBgcWNN1RJIXDHMv0yzgP2L00vBZuPdQkx
         aGQHTBbh4f2tfcRqLMvd8wSe+BNUxR8RRF7vY8eaLDs6Z9UQgsEv7wulLHbh9lxmOAjT
         xNwx6LNa7VAUlK/HDp8Ss0uHFqo0gPrQZ7BwGITbn7h79bAvh/lt0ReFttaEr74yzJUF
         8J7BjBEZTqarQGK3DPq5HABan6phPfrC6qO7w8jbYNRreko1NV53WFjmRp1lNnY7Wz/o
         iZtUG4xbov1Tdx9ACnUegUmhbYiLdNv03Ug+WB9urcPMZq10J7FWsbDhhY7d1pIml/Ul
         873Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688324010; x=1690916010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yr057d23zYvecpNmrqhCxLjU9O8Fn3+fuNRTaa2YGv0=;
        b=OxY5Lkb0ffDFphGID5yjHJhSU3loz5F78EYzbuCPAd8hDMztRZaY6ZUzmdDaqUt2xf
         GYcmlQ4c961yWFWqzHOOBeXxPq2ReQqZr/3YXYg3jfyg5v7rbZf3VwDehaFqXcdOxuZS
         a0DBEpouwfKaKi0V5sEv06bb7K5SEFDWwRDI7ApUoe1NeJpkAbeiKJ3wbS2X2cWQqVkh
         vConP74rGLn3m0LQY36XI55z+57nUjRiq7Onb+FVZDJ27YSfL0MykTgn9ALxnNDdR7pv
         lcTptcW//gyHhEMp3kLozVgRjtZw42P33QKvIa9Fuj29YPHEZKXD6wSeLklnyt5xq3k1
         zRUA==
X-Gm-Message-State: AC+VfDy86ltcAjzHKJiElo6g/NXY10Z9kUN+kHNhk3mgdt0KsiPHQFNu
	Lgz//2IOzi9i7yh4tXkgSCxMJQ==
X-Google-Smtp-Source: ACHHUZ5GDNPNpJjP3txGq0+7mKAIPHM88cY8tFCVfX6obT+NvDBq6J8WWl0W0W27MHZVG5pj8mv/lA==
X-Received: by 2002:a17:907:6e1b:b0:98e:1c4b:10e2 with SMTP id sd27-20020a1709076e1b00b0098e1c4b10e2mr9679391ejc.20.1688324010372;
        Sun, 02 Jul 2023 11:53:30 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id bf13-20020a0564021a4d00b0051dfa140947sm2436582edb.61.2023.07.02.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:53:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: minor whitespace cleanup around '='
Date: Sun,  2 Jul 2023 20:53:27 +0200
Message-Id: <20230702185327.44625-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115332_282336_92C02165 
X-CRM114-Status: GOOD (  10.05  )
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

Use space after '=' sign to match DTS coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
index 1b0c3881c6a1..13d478f9c891 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
@@ -65,7 +65,7 @@ sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "BPI-CM4IO";
 		audio-aux-devs = <&tdmout_b>;
-		audio-routing =	"TDMOUT_B IN 0", "FRDDR_A OUT 1",
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 29d642e746d4..276e95b34022 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -221,7 +221,7 @@ sound {
 				"Headphone", "Headphones",
 				"Speaker", "Internal Speakers";
 		audio-aux-devs = <&tdmout_b>, <&tdmin_b>, <&speaker_amp>;
-		audio-routing =	"TDMOUT_B IN 0", "FRDDR_A OUT 1",
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDM_B Playback", "TDMOUT_B OUT",
 				"TDMIN_B IN 1", "TDM_B Capture",
 				"TDMIN_B IN 4", "TDM_B Loopback",
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
