Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E8FC636D6
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOwvggMSQFmROjmcrThgv0CeXP9cpAAyPxvyNRb0wwg=; b=JHlQqD2av0QtF1
	tCMsNLZUg++irndLcz5PFzQSPbHGPm91fbNyTGCJgPRp1YFg8giAYrMBSw8xBlKnAYIbTAsQlk8wf
	HO9knMv4tzGPPkVQvs9X2WBcCbr+hEWhcUDkSsm2TH9dAN7nmvlzaHWfpKtkHrH/sM/4zFxY+Mumc
	v28X1WI4arp7P//KeaNMHDhaS/4q9/xU12gQLW2SEGx6ct7s5R7t87Do0EMkzQrnnD7Yv30lgaGpv
	JhZkXpw/AKREGmDJ6oB54syQY+mVtlTtEqEzVNJi7muSk3mdESL7+xg1et/DDGLPha760e2ilEkiG
	OfsglaHAPIcOcaR+xOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPaR-00CcuK-Be; Tue, 07 Feb 2023 15:08:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPZz-00Ccdz-3M
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id u10so8197287wmj.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJHI3+tzcBtJVa9SUKbRsBZR0Yb4Ib5Z35Bs0YBTugg=;
        b=Lp80Jj1JkvrJJw8jZtJ9MI0KG/cilTe812kcTc73Mr69D0oS+csHSdc3WNMfqdgZFX
         Pax9E7A6lWboirgMrf68ekPLyPm2+/ZCDJU/5bzA9tt990PH1RatfKCgKDsABHXSKeWI
         s6atEjLASbSqIum66BXw3yN4o+dHGo9if68DbTYiMXUfUtjjdmUPvmwGocUifCpY9OgE
         Rp69uIoTwTTsLd40+ONXB6gnxXASak2pDyzyiVHlL86BY+Yrs7vjbsjghWvt8yMAgqzp
         a7lG3OFzJxhealVkZlNzrDKisoV3mFp66ljNRFY6nN7GaBNtXCYGY6dHPegdb5QT4fj1
         p6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJHI3+tzcBtJVa9SUKbRsBZR0Yb4Ib5Z35Bs0YBTugg=;
        b=lTCyCd3zueMgbLR23NIPRi97NndLV4dvuJvX4J7iRBIbH4qO8Qv1+BDqnzVOTUVS8d
         RfIFbKQXlC8K1yKEb+f5e9NuS/cnMZFyDZpic6fUIf2+6vVvMp/ouaKh1oYfCpNfeLGL
         J8q1SkWUqiQ8l3JkacgC3LQGlvU/PNjWAOrV5UpoGfem9uDL+cjzGFTdaSGR4VV6Qe4i
         V+nwUNC8uO9GswNKgFg7Nx8v2sCv8YdQRBRxhbixj4iCT17RWAhFMeCBlgs8L4sSVtD4
         zITROs3ZI5BouCwYNGnzfbXalZVcRsb3SH05+ZZux6h305u3cs0iIxkv1379QiXWT6Ps
         fTyg==
X-Gm-Message-State: AO0yUKWVyiWs0GmIFQaBYPuDf5AQn8rrD2o06BlwKHQPOkwVto0uS4pU
	/kVXxqqY2r+E5GKCRHRJfWIv/A==
X-Google-Smtp-Source: AK7set+vRmQtpopOfJ+0T5HMPbP02wvOfqk/B5wo/6PEyuk0BJKU9w0CoY+gPy/vEHuQPOBIbh54PQ==
X-Received: by 2002:a05:600c:706:b0:3dc:5ad1:583d with SMTP id i6-20020a05600c070600b003dc5ad1583dmr3320455wmn.18.1675782497610;
        Tue, 07 Feb 2023 07:08:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:56 +0100
Subject: [PATCH 3/8] arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx:
 remove invalid #gpio-cells in onewire node
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-3-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070819_196423_2003FFEC 
X-CRM114-Status: UNSURE (   9.55  )
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

Fixes the following bindings check errors:
 - #gpio-cells: [[1]] is not of type 'object'
 - 'gpio-controller' is a dependency of '#gpio-cells'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index e1605a9b0a13..db605f3a22b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -159,7 +159,6 @@ map1 {
 	onewire {
 		compatible = "w1-gpio";
 		gpios = <&gpio GPIOA_14 GPIO_ACTIVE_HIGH>;
-		#gpio-cells = <1>;
 	};
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
