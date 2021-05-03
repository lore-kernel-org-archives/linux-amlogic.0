Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A52BC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:02:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7878F610A0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7878F610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nq74H5lW6EaghgudrYCJnL4E0d7dxH99WrBeNzGXgP4=; b=mvb3LnUX1zh0zZ2vpF5SzXwK/
	x6OlFCiku7dMEyQnvyP1fSgiJByRIr41aOjg/ko3ewwDn3XTQTj70MqQmw3nClP6wJk3YsQ0P4oZA
	j8DBUvbY11ycO1imQmVpBGb9WomSfEfUPE0sKKzPv6m+X58enrGFZKIgZ/6GnKVKjyiiw0tzv7TE3
	gM0aSV1gIV94ESYdhpT9naPW+Waig0PvxIxm3eA2IMTKcbC4YN6m3sUYNOD1GCpbcG9IghARJJpkN
	wvOBm+s9BBaLY14jb9Ic7rj7xsPapAKBpK32Ty+YjF8yRGTJjv9FZf2UduILqZUPEQH2DhR0I3FCh
	tf9YGMBRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda5T-00E9vk-FT; Mon, 03 May 2021 15:02:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda39-00E9HK-In; Mon, 03 May 2021 14:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=foGD+UCkz7Gx5A7kDlgCTKzfxYofNvrE9AjIykOb+dM=; b=ObtGJgV1EAYMiQFZcfbosKNA1x
 45BMPGcllzF9R8H0giy/WcAkqtJybxJ5C8L4JpkBkQhXo2OaMv0625vuFI99EMHQWxHGXtM06gqrZ
 R60xpHt6owGmngZnLuAUWNCK122w6Tc3izOCWAh/ys0FujWNtN0yHYUSUMO9prI/yCZnofDg+elOi
 bd5bKFOyJboxueIbDU4ZLxnuBvs+5tWTRrzDVkfJTADucQ3Z1Kh+G0IRA6sQCMIND5/JFalyhi1UY
 YEuITmNHQHyje08Sr/by9xlgq2x2isYHJz6UReJA9YbMqU35AzQS1AIgY8piCVX+26ScgFEb09jFz
 JSscHgDw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda36-0039N6-UP; Mon, 03 May 2021 14:59:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id n16so2881851plf.7;
 Mon, 03 May 2021 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=foGD+UCkz7Gx5A7kDlgCTKzfxYofNvrE9AjIykOb+dM=;
 b=gNB6h2Ap4hHvzBGd10AjeCOnogWQHcm3Aga62eNNzyajt/Gcf7MrukQXFhGU2SoDS3
 +1sDPlD+GKF/wC0a6UlAWGTytM270cBghOHzlvIKEUd7dzXcqO9Bp4iAfc2taG58R8Lk
 e2mYHg6qTdLGBu5kgfrXI2YDENFTOM7OaEmAeOJsieu4WtramW+a8XwdpsSroXDXv1PP
 KsWmDEr4FKwf1Kbb7duxeMaQEsHV+MXC4iKeZSdkymdWAAgL094T2aR6RGk8WWslC1Zh
 1r/iqOYr0KcxVozQTEihP7RlD88lksKzZbF6xbLpU7rL6oqnrBtlDV6R+PR0xNjdlujm
 K6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=foGD+UCkz7Gx5A7kDlgCTKzfxYofNvrE9AjIykOb+dM=;
 b=FlQU0OXJif7l1pslgQleOZ3fbB1URUnt6KMXBjmAnmhki1wsgpwUx6shM1ASBz10qG
 zIt31NgdyFSqARC9xSJdX4G8QUsrtGGVOV4Eyi4QNq4XpBaE6UcBoYcQdv5x7V7fI73v
 wQqkzxSd++0XYIZKmPPB+iMf0AIFp5E4LM7UNeU5gPrjXwo8EimgDXohtJgZ4Sx8Og/V
 P9P5/m83xNQffnSwv1tMwgMyH8ubQ1zN/sYaAA0ikPhqT79QiSc87oJI+6TX3W6eKqED
 uNHwLhCGSfNjjOEofe9tpbmNuwhAgrk++vVc7cbHl9jVswpVWTaZb2pt6YVkQfJwxJAi
 5Mrw==
X-Gm-Message-State: AOAM532yFB8bPWhkzqd345lu7Ty+EG8x1haU16gzj86bsDPvItdaFYMF
 +GPlracCa4P5IU3C8e6hbmg=
X-Google-Smtp-Source: ABdhPJxzKb+8mI0OgGltd9yXCBGE6i4s0TGA3Z151qYG33TBAevm0epGCSA66NDgtau+fg7ikxMw6Q==
X-Received: by 2002:a17:902:eb14:b029:ed:6fc3:a42c with SMTP id
 l20-20020a170902eb14b02900ed6fc3a42cmr20569864plb.26.1620053992519; 
 Mon, 03 May 2021 07:59:52 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:59:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 6/9] arm64: dts: amlogic: Add audio power domain for sm1 SoC
Date: Mon,  3 May 2021 14:54:39 +0000
Message-Id: <20210503145503.1477-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075953_001938_C6F35731 
X-CRM114-Status: GOOD (  10.91  )
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

Add audio power domain id for hdmi on sm1 sbc to enable
audio power domain via "pwrc" controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index d14716b3d0f1..b16a9a2b6cc4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -174,6 +174,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_SM1_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 2194a778973f..0ca72b000105 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -256,6 +256,7 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
+		power-domains = <&pwrc PWRC_SM1_AUDIO_ID>;
 		status = "okay";
 
 		dai-link-0 {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
