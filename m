Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BECDC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:00:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D4961166
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D4961166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+VddIlA9exOjjm56CJ/KG9jll801I3N/RTMJ7GTNwIU=; b=lkCAhOv4G0Rhb5F8XFXRsHRkp
	/EmSBYefSqoJMAW+AyvJ6ndHB3r+TnOH2Kf5daDvyE+iqygGpPEikBe/dbQGqd+kdqSgbNZ/qCHy6
	osNvT4jyGOXDfpDh6gqWKzuVmNw5Yol2eucAaQ5WdAlGxNpjJKf2NBEYy2wJ2TOeXzsaBG7gFp3wk
	YE2trAefC71RdRIdeKyK26koQOC5BoCjZz4msXMQfJeOKoPGgteMATpWsqUXfxsg8jwb+PzWnZ07H
	WVKNvuG97kV1eiRSnVhn1SY2dqIW6jnRWHeYp+ya+8CQMS2LLtuBC64KHwUhWc6RzxdCqdzAohn2Q
	WTJvzvxbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda37-00E9GY-Lu; Mon, 03 May 2021 14:59:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda1Y-00E8uH-EW; Mon, 03 May 2021 14:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vRW0z6o62j2Rv6stuOnNguxxqbJxgi3ojoBSOT6id5I=; b=wdilrH0FeMa7HcDft5buNmpRTT
 VuZ7QO5DTpUR5ArV112IkL1fC68uOZgalnEWWz2HhWW9cscJkgmqNr9FpNZghkLe+yVrqDyKkDsju
 N7F8l3KWEoRpTHHFh2H/wOKHzeFjx09xsH0c1dv+x6vKzqsUIzPM8dji01geJ3EFn/b89d56ba6Kg
 8aJ9l+HPMtxW8XEmy3CGfkoWP/tGQvJyIOsGBx08sYWbrQWi3k3UvV+xaQcFuPAOIUOM+J/PEFKNO
 +OV7ZWVodKXAoOObYOWc1APSSxKjLASVTuKRxoIBHJ95ScSvyBNNRe+vH7k+VLphCq/ksp7AryUE4
 7Q6BfG8w==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda1V-0039HA-MK; Mon, 03 May 2021 14:58:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so3502939pjb.4; 
 Mon, 03 May 2021 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vRW0z6o62j2Rv6stuOnNguxxqbJxgi3ojoBSOT6id5I=;
 b=E1l7I2OZq0m5k+wR5en1GXGQ2k//0/zMXkQLeNcSvDD9aHIxK7wFsBnKW8S/GqOthq
 kpwPW1LjF2lRY3MCn+YFKZwlvr5sxz+njK7hftSHv8imbbdPLa9hqPr8TvoubIDHP8uD
 3Edela3tN5gualI+5lLw/MoU1XdzNb1U36/7mmwkN+1Cr8dFlsLvEqrv8ITtTQP+sCeV
 O71OFTc91ECUatQkrfnli8Er2/0KmzgVjThRNg+j4wAnbFqY1ipDVZAmEjolhEV9LKkE
 qLZ4t91A0Ix5GCBgXNKa47rfq7AKeU9EwCkYwQKAssi7CfcSAv+gptmMsm2AsO1zyRfg
 814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRW0z6o62j2Rv6stuOnNguxxqbJxgi3ojoBSOT6id5I=;
 b=Rb6lEfF54TLEqt1zaXFkuqZyCbfU8vYtsBd6rJnCCSrfKjqv+Kz+DCOHlDvuSJO/YT
 q4zBrxDuRiKMwiEUmYTlH2AkzbtciFIf981vuX2DXAZVIyjvjXaOAtU7IpZdKKe7OQsG
 n/T0CZBX/LmVpdh8g9yEfwh8naNXnf7eOPA6+7swdpWGXLdR75VX2a7TSuSLNokDKwWw
 MX+qPYb+og0UJLIAyMdVE1m6kOAVpL66zWyqAZt15Z8kyLkZHYptkmYx9k3bwMDha0w2
 EHfcnXHMfwe8/lb5ng29tMD5bnIlMOHOsDeve+Q4tNNEMbDlWrDPtpU86S5o0Gx0lzgp
 sGAg==
X-Gm-Message-State: AOAM531/yHTdIzNBosIhpGIB9bl0OA52H0bhF+qyW+CnNfaXdqTqvjm0
 AHcXLqPT1WHfxwZ99tDAHwA=
X-Google-Smtp-Source: ABdhPJxdH8shFvNDWBfe4hBmSWExpR/lT3D5XRXibkmmvQaUQvlFlgIk4vF6l7dDVeQwG2M+l87IrQ==
X-Received: by 2002:a17:90a:e005:: with SMTP id
 u5mr22338268pjy.127.1620053892697; 
 Mon, 03 May 2021 07:58:12 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:58:11 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 2/9] arm64: dts: amlogic: Add audio power domain for g12a
 and g12b
Date: Mon,  3 May 2021 14:54:35 +0000
Message-Id: <20210503145503.1477-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075813_748571_A5F6B48C 
X-CRM114-Status: GOOD (  10.87  )
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

Add audio power domain id for sound on g12a and g12b sbc
to enable audio power domain via "pwrc" controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts   | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts  | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 81269ccc2496..24599f448564 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -217,6 +217,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 579f3d02d613..1c821800514a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -167,6 +167,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 6c7bfacbad78..99ed165a41c9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -49,6 +49,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index 707daf92787b..6bcc4685e65b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -58,6 +58,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index 5d96c1449050..555524cd50f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -45,6 +45,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 344573e157a7..e99533dd64c2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -258,6 +258,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 0c7892600d56..4b12685af1ad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -40,6 +40,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_G12A_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
