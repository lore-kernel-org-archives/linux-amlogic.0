Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F307C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jTBYxSpxvFxCNkURtMWhw+tV8MGZuxtBEJnPkZTri8w=; b=0XZHT0Dc4REKR5
	wVeA07ptlcqT7OtADxf6lAE0KSQaXZMwaLwHr/Sd1bjzIatWqQPsx//NayTVvVPWvPmwK+FwXCHBY
	/RYYjFrpl6/D2/+W0NEmAArt5QqNwbfbatvaBJFbcShtc7Bpbfjuqq2pNI3Z0u4DHKKZqAVsYzdEa
	cvxfnZN2HkjOZDh66JiIzxDlKA5Sm2XYid1TPJ6GuD3/hq/OvTXY6GgYquY+uBuSPVbKdoOuLu+ay
	O1vo09fGka941SkyN4LPtExHwt3O2ySfXgRXnPbmKpKiX3bc4cF8jD+vZB4xy8U4w34scCLYAD64I
	jNCWjGtoJexU9n3i1QzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nduf5-009HUO-45; Mon, 11 Apr 2022 14:04:59 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduep-009HLb-2I
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 14:04:44 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id kd21so13294450qvb.6
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prism19-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuS4NjENNZyOi0TdSjKIhrtOrxyukLSc/60jZJBAYhg=;
 b=bZaOFiWvWozs6rAmx9Rehdei3ZVcQSOMezzhPtvzQ55BcPqKxNSPPB5eJV4bUudjM/
 XQxs0m4AUpjY/1E9By826HLqhnJDS40xQjGEl/EX88LH8rAmbYefXX6Bd4TtcKf8lj6Q
 llzdtl2SOfpNlnBNDSm//RhjqdWYNITtFKgvfrr0jOJTYq+CmkfEUrWThSR0X5LEue1U
 5RGao015u3iiAiuGmVg2iyJ8h/NDW22U2E/PptBVDg/t4alWZFLhD5/h28at/rkf6tJF
 7eVDcgQMeAv9fr48R+apcGnYdhyQFWATPqPh6VoSqp01c535plie4ZUBZBAPRdnLWYEo
 gWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuS4NjENNZyOi0TdSjKIhrtOrxyukLSc/60jZJBAYhg=;
 b=paHanl3DMCUGebUWQ58dylH4CaG3WDjpAwd31IYhoKAtgK/CP1yp149GtZCgq0XPuu
 jWyELO7+PXAT3zErvaf0h0DLcJWcmZQ89uDKktFj3RKm1QKRi/jKkSK0t41IR4+LgV4v
 Ms9+JvPdSIz782KYcmZqrkk8O+pSo48zEFGCIfV5A3Qahpqjxa8NFvlkWY60744WppkA
 ErprRIF3exj25La/uPtxBj64chCkZrZSy4qalpK5Be+3rwws5UN8b8ynFLnErgy73Z7p
 EtrmC38HtqTwzSMMMgQ7GuBpYmtV+JdukTVQwXL+ovGRGG9oSWWePR9DxDqvuoKt9HOp
 NR+w==
X-Gm-Message-State: AOAM533VazZi4cY+Fo+l+fdNKUdwkK4iUPTZ/5l6+1mWp/6flZMA9bni
 fxg3128j6pUDPisf4nZHp0KP/w==
X-Google-Smtp-Source: ABdhPJxcJkfnTI8XP7q8uXyN/Q/OVYCG4hOjfqR773QCchY4BI97Dthg44tw5mELirvjxvO2cnp+ng==
X-Received: by 2002:a05:6214:76d:b0:443:6801:6d0f with SMTP id
 f13-20020a056214076d00b0044368016d0fmr26549037qvz.60.1649685879766; 
 Mon, 11 Apr 2022 07:04:39 -0700 (PDT)
Received: from RADIUM.localdomain
 (bras-base-mtrlpq2718w-grc-02-76-67-205-66.dsl.bell.ca. [76.67.205.66])
 by smtp.googlemail.com with ESMTPSA id
 a200-20020a3766d1000000b0069c1125b7bbsm2896549qkc.57.2022.04.11.07.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:04:39 -0700 (PDT)
From: Guillaume Giraudon <ggiraudon@prism19.com>
To: kernel-dev@prism19.com
Cc: ggiraudon@prism19.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Date: Mon, 11 Apr 2022 10:04:02 -0400
Message-Id: <20220411140401.450-1-ggiraudon@prism19.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_070443_429376_B61CA48F 
X-CRM114-Status: GOOD (  10.86  )
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

The labels for lines 61 through 84 on the periphs-banks were offset by 2.
Realigned them to match the Banana Pi M5 schematics.

Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")

Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 5751c48620ed..754c3d43ef0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -448,7 +448,7 @@
 		"",
 		/* GPIOA */
 		"", "", "", "", "", "", "", "",
-		"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
 		"CON1-P27", /* GPIOA_14 */
 		"CON1-P28", /* GPIOA_15 */
 		/* GPIOX */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
