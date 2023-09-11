Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED98EE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HT6Iu/YtO178t/dEAOSgyc0ZCiBsRqGYMptt50yNdc=; b=QUuC1AHTpKJZeh
	8IApWhDdQSM7ejieVC4YzRCgVIqLv5lQoNM0gAin9Kc3XZcmNDLHonpJr01dANQ1eb9rqqF/3iU9E
	Zmp4txn7c1/IoS/rFDB74Gu8wUe2uyCH7MfJNI2omyQwC4eTKg9J6C33ZrkQ8DgFN7vyJ7HzphWVG
	xRnRxy4NRa4+WuHNxe+dmP91nLD2g+/SExMd64n5hRm+T2pFofiiHFFB6kPHQki7JMu+oLMcnc8yh
	eYNVX56nJtv6A5QvqzBtQTnQS1Y1kLZbrjbCqGWFNHaNgEHae7qWbaLXVGgyKuUKMpqdBi9xvgiJV
	N59aJwpEmOAQjcSjsIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6v-000vgL-0M;
	Mon, 11 Sep 2023 15:46:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6r-000vdg-0m
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso48897795e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447156; x=1695051956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8GmnivYIya/kXsBEnAOi5/Fi2lHPHk3tyJN33w5ic4=;
        b=YW7tnrKGCOV4rVTS5gvdfouDq4zrgPjFplyddXoUu+W5z4UZKdSwCliQ+exa9x57JG
         0Lxtf4jH8BLGc4RmH9XBEy6QYJG8pQULJkpcUGI11suTpTfC6xDemvm6G0E3N2HlslDw
         a8Pb7REAquZrGkwp2IUETO2oQJyW24HM2n53K8XoqlBqAUgbCTnc6U7Op3oWU3dQgoFr
         UdKeagY/CLscpkubeC7uMAbnYDgKUNVkEdtgcQho4w9FM3kjJYw8HNAc1X9LhZZpaCFM
         Uhmb0l16MERz621lk904r4ExtqFJZPsJam5Ag4JN3VeU5jYUzbbtoNgqcN1gDEOkcRQk
         3mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447156; x=1695051956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8GmnivYIya/kXsBEnAOi5/Fi2lHPHk3tyJN33w5ic4=;
        b=hsV9P+iVteBkY5u21YWmwflXXulg94ocRk0pgXpmZtcwHPrvuG6phudlicn7F0ZEOt
         +MVs/Lw4Dn/sjUY93FeOVNILmjrrDx8xLc/Elx4e+2LJtq9KU7snaoyu+0VxIjw2CvpR
         Wts/oFHA4IodPnyQ9XW0TkXVHaiC403VPQUIGP17mM1UHRomsEh4A867dlPL7xxJh+YI
         D2VgVbOWynJrSN/AnTQngMc8m35Sv+lOcPsz19Hh/3m2f3nObWYctJRkPAP710LN9xmN
         fVA3HZwiXiS1Q8P2KOamAnQrhbJrVvKQUy0UWJXC4bJAknQM0K9Ittqk082wKw2LuZVL
         Ys+A==
X-Gm-Message-State: AOJu0Yxk5jVDcCWbbwwfu/EFz61iga3cEDS/gvOa788ZDHAb2+6iNzaa
	Z0xQpqSAqP3pmE2h5cYf8XXmvA==
X-Google-Smtp-Source: AGHT+IEOdC6N4yffuUJH7WsfrdAEJ+HeWUa6KJ6KGJQUIHAReIzAkUYcbtQ2ckSxfrRuPEHZZd+3aQ==
X-Received: by 2002:a05:600c:2294:b0:401:b204:3b98 with SMTP id 20-20020a05600c229400b00401b2043b98mr8950146wmf.19.1694447155928;
        Mon, 11 Sep 2023 08:45:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 4/5] arm64: dts: meson: u200: use TDM C for HDMI
Date: Mon, 11 Sep 2023 17:45:40 +0200
Message-Id: <20230911154541.471484-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084557_274714_D306A324 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the u200, TDM B is wired to the onboard AD82584F i2c speaker codec.
This makes TDM B a poor choice for the interface dedicated to HDMI which
uses 4 i2s lanes.

TDM A is not a good choice either as it is connected to the SDIO wifi/bt
chip.

TDM C is not used externally by default, which makes it a better choice for
the HDMI interface.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 921b62c5ab33..da66e2e1dffb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -159,10 +159,10 @@ vddcpu: regulator-vddcpu {
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "U200";
-		audio-aux-devs = <&tdmout_b>;
-		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
-				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+		audio-aux-devs = <&tdmout_c>;
+		audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
+				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
+				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
 				"TDM_B Playback", "TDMOUT_B OUT",
 				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
 				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
@@ -193,7 +193,7 @@ dai-link-2 {
 
 		/* 8ch hdmi interface */
 		dai-link-3 {
-			sound-dai = <&tdmif_b>;
+			sound-dai = <&tdmif_c>;
 			dai-format = "i2s";
 			dai-tdm-slot-tx-mask-0 = <1 1>;
 			dai-tdm-slot-tx-mask-1 = <1 1>;
@@ -202,7 +202,7 @@ dai-link-3 {
 			mclk-fs = <256>;
 
 			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
 			};
 		};
 
@@ -412,11 +412,11 @@ &spdifout_b {
 	status = "okay";
 };
 
-&tdmif_b {
+&tdmif_c {
 	status = "okay";
 };
 
-&tdmout_b {
+&tdmout_c {
 	status = "okay";
 };
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
