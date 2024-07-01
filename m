Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC31C3065A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W0DtNIjP7gXTM0hDhH6kltwA5mMx4IU/vmNHn1ZQSp0=; b=ONoDxAPp3aGkK2
	wxLqDEsbB5UT6AIccYr+xkRO061t/jD/SR/CU9LkxQGxyd1WP29RDBXPgU5f7TFBx+zOjsDJRVkRw
	/OrXeWA7nQlPlGR7Q1yXFrp9TrKOxOkpwQ1XuEF2z+JsaUpYSQIOr1SKLSiyVZke+u36MMRcQArF7
	nxbxrQek72SWqsTEI3oYsYN8bTCMnMkGGPohgli2v2hRtTpfglGoBZmY/kJY94TNCE5MCw1p+izmh
	osuXTr5ob5xlfWrZef+UrkyctkrIASZIWNmDsBTN5rivZ/GO9ksozC8MdsLvKFP4cVBbkfN3IhCDR
	oCRNtHUXAqdQ1hIArvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKGS-00000004BZZ-0EJ2;
	Mon, 01 Jul 2024 16:52:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKGF-00000004BWK-2G23
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 16:52:16 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52e743307a2so3697343e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719852733; x=1720457533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DLhKao11vlhFu7Ijyxr0/p1XMO5cSa7m3wOhNIHXok=;
        b=FkL99dv16pLag8TFjFHVVRAAUJD3zl/GeERZ2kMA/b7ySFZPTEU7/FMUpTsyHvSG57
         NW9QFXeXcZvqXMMDLfkyc7FhaqQaeeG8dYjYcxxRoJrJ05afoOzFXtyErNPPuOZNLgIl
         2KH75kVjwkHzv44qVeAVhVX7sX8falWQu8CIFKqOG9oi1QL7g1hrCuh32MXeLJMCBbRY
         yHevvgzqXuTlxgNp85MJOtbnlP3n+bPPoe3tJi0YO1GIeMAhIgVtTJqYh60GY6TNaxdm
         jtbaCTamQzgufwrzAfoF94sepsKz5yeng4RKIxI8EJ+1BLnU+DY5qPqq76ToiDJ43xJC
         79lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719852733; x=1720457533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DLhKao11vlhFu7Ijyxr0/p1XMO5cSa7m3wOhNIHXok=;
        b=fznVME075EpvnyD0sXmqqXtkZQgkvZPvJIgmiYTDZXEoI/ZozMj1vQj0Mp1QOAFrSq
         wCDJr9AhUC+fTNHoPy3kxZVT0P9RuFquMnOInozaLHhuhKURE13LDVYjNtuqfHWt7876
         0YC2TF2+5ribKSo3Eclu7o56pMz4VWzwFDbM3OJrufQZKj6eQVqhO9nQYjQbixH7LWTK
         QCSFQUrTwiRuWkrfhdogpUYYtxwhZe5xWZBFpDkC+aYfKp5AQJYMaX8y+9FPwHod/FnL
         Ow2nkPR8YRdj6c3+/Cuc5xSUWTQ2e9p9JJGi4ewYM4RoRaRoCrNGSpKHxVNKFxR+CESn
         uxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpBmzUD1PG/F7vM0a31/Qwr7gEdbpa//MTq9ZeGwR1GYN5QnnogeZdF2/WJeZ/QS4f+l9hodzvywxvPihdcmkGWGF74MuPkA9xPwnXRVy3UR0=
X-Gm-Message-State: AOJu0YzSSd2m530VhfduYz1AAsj/X5LBeVcHfZ8WSTbebgTh8oLxaC0Q
	eGneSVjfJFKuVqrIXqF2KUl/7p40LD4mKX0OIU2RkTbWS/iqSbl5CkACet/K8mHn/10V+6Dv2Zg
	/
X-Google-Smtp-Source: AGHT+IGVBd6ahqPkvFTNsvNE96KHbGOgCNIg9WAbHWQs5hu1T95sXrHepxbEMFbdl7cMP3EZjHaqhg==
X-Received: by 2002:a05:6512:3409:b0:52c:dd8c:a481 with SMTP id 2adb3069b0e04-52e82747fe1mr5513062e87.59.1719852733550;
        Mon, 01 Jul 2024 09:52:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e0b7csm10528456f8f.49.2024.07.01.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:52:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH] ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings
Date: Mon,  1 Jul 2024 18:52:10 +0200
Message-ID: <20240701165210.578817-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_095215_582254_C7F68EFA 
X-CRM114-Status: UNSURE (   8.80  )
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

Bindings expect the GPIO keys node names to follow certain pattern, see
dtbs_check warnings:

  meson8b-ec100.dtb: gpio-keys: '#address-cells', '#size-cells' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 3da47349eaaf..49890eb12781 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -34,8 +34,6 @@ emmc_pwrseq: emmc-pwrseq {
 
 	gpio-keys {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
 		pal-switch {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
