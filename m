Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD14BC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7861121D95
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vh6J6xdX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO768NCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7861121D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AjwIOQ8RRKS3z2NAN16qhIRpZzROOguF4/vNt+WGl04=; b=Vh6J6xdXPMKzKY92ck60I4fTx
	qlhnAd9dQ5QKiVYYntbAZBIORT42fTDKpByl2u9LJ4h4+KClHRP15SP93b1f8hJN8Uam2xqfR39Tb
	YDkr3P2JkPVTK2JI2LapwXkwv5DeIktXqwfCpGbc5kGMKVkOWjOYboh5PVd59JVCaktobIkLvXQOQ
	wjQK6dw/MZSfzTWWdO8YAR52NHLvQDSrrrhiGfrFfnWpjBlPYvh4QTuyKD6soggLpXqkgDFVvsUmp
	yIDW0LYgS129XzKUr6GKHL9Lupg8KffWZxWTTZtXNSVcvwRuxqm7GJf6griEEqHvb/cWxaeQXqmbb
	wdMu5Vvcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMpQf-0005ro-SG; Mon, 28 Sep 2020 09:26:41 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMpQX-0005pB-HE; Mon, 28 Sep 2020 09:26:34 +0000
Received: by mail-pf1-x441.google.com with SMTP id b124so404504pfg.13;
 Mon, 28 Sep 2020 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZrt3Fm5XKUtoI9fFOTZ8f2A2zRfVtH0JANKYInl63s=;
 b=dO768NCrvQk0DFPnwUtOzpNp8oFZb+sEms26ZzN4aQaQPSyB9Ayr0BlmtT1pcINN+9
 gEmlKeZMm0Ef1XDms6JcfOh6M3OPc5SUImriHMOxaEgi5JBKfSUuYxxo6dOLrvRorBcK
 TfNODYuneBvEk+0zrl2AS80D+xQ0kt/nx31J3fqszi1D+k7G7lkOCW1Xwie4VyHECBKO
 ClfTadPmhvXl8OQpOOysiluV1+Pl+Qhr9Qddou7aAfwdgc4InGi4ZMoK6lf5+9/6wIq2
 0LgE9oP3PO276G9bYiS2PkmUzZaPsKClAE8heX5xDFx2N1k45ckhrYV5bL8o76fVR7bW
 VPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZrt3Fm5XKUtoI9fFOTZ8f2A2zRfVtH0JANKYInl63s=;
 b=NzCfasvBs5kZ9y/mnzajtIW0NleVlN0uENciPOb8SCWFlGEWhD3rK2nTgJvCTiKyuf
 NziXjJ/BJIv5Y5jP2EViAYUkSOhe2u1F7X9IHF78wPINeyAt3UeVepdhfNMWFbvhXk+E
 mZzRBP7hXUPf+UY6+BYOqCTD9dAOYI4QaoZxxBl5HwFgjLCCxdXuRLgM5QeFppmlbP+a
 KQ8P6OI7qaTB7qzFwYqrQmcyHc0OnRLDgRF2UFOUu1Lh9fnlem7Ta7vA+zFoSs1qQZ5S
 sL3Hhs1k9sR8M9zmAvy9XJ+kaK/gZWr+VDEQ/5dI18TC5Q2FMoGSsodNLsKgcrwte7DU
 SMCQ==
X-Gm-Message-State: AOAM532oprsST6ANbA4l/ml+hVpZdblU2Ak5AsZ22hxlCrYXg7uJR87N
 hS2qB6KXQ9XhP4k1scdOpDM=
X-Google-Smtp-Source: ABdhPJymHFV4oe/iHvShHYc4kpMWoMpmZZeo3j2yWlJH737z2UpPvUEZIDdzcgCqPjWiP4hwhHSXIQ==
X-Received: by 2002:a17:902:a987:b029:d2:8a38:5bbe with SMTP id
 bh7-20020a170902a987b02900d28a385bbemr757044plb.60.1601285191204; 
 Mon, 28 Sep 2020 02:26:31 -0700 (PDT)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id mt8sm638606pjb.17.2020.09.28.02.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:26:30 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson: rename led name on Khadas VIM2
 meson-gxm-khadas-vim2
Date: Mon, 28 Sep 2020 17:26:12 +0800
Message-Id: <20200928092613.273998-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928092613.273998-1-art@khadas.com>
References: <20200928092613.273998-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_052633_624353_066624B4 
X-CRM114-Status: GOOD (  12.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

rename led name on Khadas VIM2 meson-gxm-khadas-vim2
rename vim:red:power to vim2:white:sys

becouse this led is white system led its not power led

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c7..624632f06b5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -84,8 +84,8 @@ hdmi_connector_in: endpoint {
 	pwmleds {
 		compatible = "pwm-leds";
 
-		power {
-			label = "vim:red:power";
+		system {
+			label = "vim2:white:sys";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
