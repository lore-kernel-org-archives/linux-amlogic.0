Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5AAC07E99
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F36613C8
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F36613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8rgQ/czVlPakyJJNcphTUqkYysYF+HuL/6P16Tm3lk=; b=1BEwHwOaAfp5H/
	86IkYCHgsF1c+oA7YQ8+s+cpjgkqmc/3R6s+34UhBqQ9MkyvJFz5PLkDmgzQWYw5i5xWRBtGquaJ9
	w8BpbJXbdrbDrOQHM4PKJnJpJYGIMfPDuL9v4Gj5khF7bxINQ4EhvYIpX7zyZcDTlgXJ1vS7+7pS1
	2+60C/ZjRVX9rPaF6Pw8xG5hh9Gdclk/xFGhiSFSm8WYLqrJAWRvxBNkQNWQx/+HXVgdRHDBE+fqS
	SXGAKBGslv0TltPbnU+foyRJCg0M/tVEMX82Nv6MiDR0SrwZc5kF3z97o0+eQ4IIi9zoOfoJihOhf
	OG7EHvHKcvFM9kec+PJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Mjg-008l7n-4H; Mon, 05 Jul 2021 11:26:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Mj3-008krT-OO; Mon, 05 Jul 2021 11:25:23 +0000
Received: by mail-pg1-x52f.google.com with SMTP id h4so17995013pgp.5;
 Mon, 05 Jul 2021 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dSq+dy0O5oRMlKOqeW803Ui/JsbCcM2UdiN8eL+UmKE=;
 b=OqCNw1vrTFsjIkGqy9R+9e6WA9nh+JeqRratgb+SWJ6MYSc8ohKiBjes6UqYUqET6l
 9r9APc79PE3PoEYeeJasXQtSqthZABzXUgiOLhWwKFpsueIhOaAHzI2lnjispYOkCX1C
 7h3e97Y7fK8awMj/Fc0Gakm5zifZn+VwGaPHY+ycWLRlw2bC8/0lZkyk+K+1YNSWX+AW
 AhrgmIPlClpE/5ZuA0txEROEWWClT50PEIJ7WzFMYvqtqCzZVOIPwrafhn9Hlkfl+5rR
 ouGLpzoziEl052WRwx9xWwektOXH7KrZ2OGAJFvXTdS3hY5GD7V5mA6rjyuwI9aEi0mG
 pQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dSq+dy0O5oRMlKOqeW803Ui/JsbCcM2UdiN8eL+UmKE=;
 b=XMg4VdTfryE8Ju79kz+Uf/LquHcmnXJe3mDl6OweoLhvcFT3hCOLALJ8Xt5MQhXsQo
 7+aQwp32YRNfdo+n/P3RoFcR5mdY7MqtZ2hncEc0KlBoDG+6bk+mA+bO0Tq7dDByeEA/
 AkIc/JuSSXWCsRvMCpHIDLTKw2Rvc5zW3bdEWde0ShfPRTwXCpUJrTOkV9Ehu8LqcaW/
 42SINhIq3UXIoXrAobHS3m1lcauA92Tvn/jy8zgOVS1eoBTmJPw7rSmdZSFzC+z87m35
 RRl8E9h2ceyDR+rFLfoqWpPbuqIKQ90APSRvTOaQLrYMG9oXuEivmf7yTpQag0S7kjOo
 T4Bg==
X-Gm-Message-State: AOAM531zJ+D94tlvwGBnbQqciE31SOMez4IcjjQFSrQmbeYCB6Im3RWV
 LMWlmx2b8Jo+ILeA5auPF2mcU7abzME=
X-Google-Smtp-Source: ABdhPJwAk5MPlx6hiwAyy61Z2ms4m7rXtJFRdnmV9Ir0yLk3A9Eq1i8i4Al1J3Tsh6Q7tsUCQXRiAA==
X-Received: by 2002:a63:b60c:: with SMTP id j12mr15367319pgf.393.1625484320454; 
 Mon, 05 Jul 2021 04:25:20 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id gi20sm20976959pjb.20.2021.07.05.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 04:25:19 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv2 1/3] ARM: dts: meson8b: odroidc1: Fix the pwm regulator
 supply properties
Date: Mon,  5 Jul 2021 11:23:53 +0000
Message-Id: <20210705112358.3554-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705112358.3554-1-linux.amoon@gmail.com>
References: <20210705112358.3554-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_042521_858798_A179EAFA 
X-CRM114-Status: GOOD (  12.15  )
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

After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
instead of dummy regulator.

[    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
[    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
[    7.117184] VCCK: supplied by regulator-dummy
[    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
[    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
[    7.118498] VDDEE: will resolve supply early: pwm
[    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
[    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
[    7.118553] VDDEE: supplied by regulator-dummy
[    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT

Fixes: 524d96083b66 ("ARM: dts: meson8b: odroidc1: add the CPU voltage regulator")
Fixes: 8bdf38be712d ("ARM: dts: meson8b: odroidc1: add the VDDEE regulator")

Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V1 - Fix the commit subject and commit message
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index c440ef94e082..04356bc639fa 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -131,7 +131,7 @@ vcck: regulator-vcck {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		vin-supply = <&p5v0>;
+		pwm-supply = <&p5v0>;
 
 		pwms = <&pwm_cd 0 12218 0>;
 		pwm-dutycycle-range = <91 0>;
@@ -163,7 +163,7 @@ vddee: regulator-vddee {
 		regulator-min-microvolt = <860000>;
 		regulator-max-microvolt = <1140000>;
 
-		vin-supply = <&p5v0>;
+		pwm-supply = <&p5v0>;
 
 		pwms = <&pwm_cd 1 12218 0>;
 		pwm-dutycycle-range = <91 0>;
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
