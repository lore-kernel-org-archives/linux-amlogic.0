Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E16C11F66
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 12:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D498B61D86
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 12:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D498B61D86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yzr/KkImPe43aJIpJic6jjh3QkxvnL95eY4dAcvgWcQ=; b=Ppxp465+nCpQZ0
	JEityk1NZaZD1CyOql2obEjxBgUClYgQPe+6c0qmUGix+5dkca0P7ggxk9B6tYNEKm806ac+F/gPe
	OZRj7nije62pDkfzo+YZcbRVytg3yTtvwyw4ytfeRk6fWNPCg0gviG/dBEzFG77pG1BArS9v7A5BL
	48I3q2fcjUw1vmM1gH0K/ZvHW/OBgun+bQ4pe/EBnCQTUiTRY0BXIUNpemytC5GsX+aCOykUE7dC1
	JDcUJFUtnQhQA0ddec58nofZE6Yc642BSD/LQ3Wyfdtx26webcc6P9XicJYZfM/Tf/batNqu3vzfg
	PtwscfubNkq9oUPMOfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyCeC-00An8n-IR; Tue, 29 Jun 2021 12:15:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyCdz-00An76-B2; Tue, 29 Jun 2021 12:15:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id a127so16974566pfa.10;
 Tue, 29 Jun 2021 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlqRgdeiXEIYSrXLcXViAJxLAnONyVn/mV1IwG0OAbE=;
 b=bW4owkmj3xr8ZQb2A3aCyS1AqXdnbfAz+x61VdR5tSaFnD63cXTpQcNTncWTzlN9br
 tNFPYFdKrf3Bjk27qeG7cToVRSa05Bd+3PEoqrEkteRvtNCuhzMZFAxWwpaPsXm0twNH
 6CgIpdWqKtuFc3iUB2XrG1lMo42gtZUGGXEfEnvx9l5fdGjuA5Qo7/74rsBV0ncizrV4
 Q1c9UluMJphyGuDqTcjk7sR/er2Arn11/U89bKnIFWLuYiotCYC0QqpP6X60VqVd655q
 z38GSrCaIa4J+E7u1WGG6StfOodcFetaBCob5/vrLzxhXpILKBQJbgRFydcXVKomWc8W
 SFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mlqRgdeiXEIYSrXLcXViAJxLAnONyVn/mV1IwG0OAbE=;
 b=sRTuzogLKJ9EjZ+SRovHXjSHvcVVY7TnkB1rQk4AHefK6eGpTV+/7zdfJI9o2KCWPI
 4ge1H/j/AiRuJewiCMTFPlisVEZ3IH3DbKMrovMEs76mvWln7DH7J2UUOcQXUffBkjdm
 TESu3JjPBklL7ujjxLRw0uh5V9VpCkg0G31gRllU2wQIfHAyYREu8WIqd2TOipGf/FI0
 mu0mdI7dUwk04Tp3Zdq82n6905QhC5ZwAF/vVjWqRrxo9o+JZf5yfFrjRSzi8bS511GX
 3hZgHof+9H1BNb4sc//CeOVs9KVXUsA3f+b5OlZrtudOcEiMLS2RdGkYtvWv6SeHBHFl
 6SRQ==
X-Gm-Message-State: AOAM530zl+AkRG2QgCkNH3F7AXqNXJ5ZJXgU6rBDJYUf3Q/I1pUU1qpT
 EP0nhyIGGoFvyj+1K1z2IKdc3ae6GWM=
X-Google-Smtp-Source: ABdhPJz6IDnmzNNrr0eZ/jlPZz8aRmiSr1TQxpE+yHlMpP7iqM9Uea0AslVBxgA0SSdA1DVWiu5LZA==
X-Received: by 2002:a63:234a:: with SMTP id u10mr6507856pgm.322.1624968908431; 
 Tue, 29 Jun 2021 05:15:08 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.37])
 by smtp.gmail.com with ESMTPSA id j79sm19324714pfd.172.2021.06.29.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:15:07 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv1] arm: dts: meson: Fix the pwm regulator supply property in
 node
Date: Tue, 29 Jun 2021 12:14:58 +0000
Message-Id: <20210629121459.6341-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_051511_419773_CBABAEB1 
X-CRM114-Status: GOOD (  11.75  )
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

On enable CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
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

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
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
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
