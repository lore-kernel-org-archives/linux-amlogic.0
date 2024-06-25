Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8D4C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SkBSYVsK129MxZLvugh1ZN1GVNY0J5iy5qSBMmcRXH0=; b=Pz42wF6JhohTN/
	gmgMyS3iqmgxZahQIgnx/sAJG7OEgyVojU7aozeqvNmC6KzVqpLPGB9LFGuYmIZcWOaDtuTkj2Etg
	9H+kLkl54JAKWiP9SMqI+jTChuJaVp1H2pB7SvawRd/83E+Wl9fEU92tl2rlAf7T8X8rZ9tl2eKE9
	ERsGI0fD39cgr+nurobig/k5znQenRZx/7hgtSOXUAX0izGTANhIxAjYBAoIc1d+QZs8s+HrFx/Y7
	vXIAy470/KeAHjRV6V4dPdyB+/hkE5I9M0Clv8fx/Th+b5VAnpTiD0xTAd8Oz01WG/Q6JrujNTe46
	0sa7xNZ3CdazVg2n28mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4D1-00000002W9K-1wRL;
	Tue, 25 Jun 2024 11:19:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM4Cy-00000002W8W-0HUH
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 11:19:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-36532d177a0so3515033f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719314369; x=1719919169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo/YdeJtYas2lqY2ggRIqkSo6l044/lTXCgw0Xo9+1Y=;
        b=AHUMwzp2pzuI9BX76vsOsSrrQJXnOhB9l7fLBPg0KyixzYj8bFc4xC1ifdHRovmo05
         59MYLEMIF/R+q8q29I7cUb00uUnFadL9b/kr46A/3+1fexruTZy6QOD4Bl70iYimWLHH
         5lHi4unKcgmFe4e2Efs8+YT/deI5mGlNOcTqLexruFEZlBidvmoixWHjiLTuSJfkjcWY
         +CguyXGO1V5lbGuX6Zfj2ZBoH1iGY1tkTfcnRC4yepVr6x5xr+HtnMtjIahfn1oBLZKj
         7qhmTp2HOPzsQ9sXEIJ9XRbBLwOMgcU/vrByEptuM40Osj+SLiAddPvdNwZ5twkwKvMi
         q5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719314369; x=1719919169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo/YdeJtYas2lqY2ggRIqkSo6l044/lTXCgw0Xo9+1Y=;
        b=NjP0eu6j1XxIwXMfvmc3vtKOOOtyGwbpychhuvl/O/v4Gl16A/W7KHea501g+VtRuK
         IDJtZXLiq/Zso3QrOc6NckCU2y1ZoLOHxSJlPmbSh3Hqyqw/JFRvAKFC6PmKgFnJCaag
         DTlGI2omwPVk7GhEUVoUltKEJW9W+9MQ7IGFmWOrlhDHOvBofuu8iiwEv+6Sl+mN8HCu
         zUE3ht+RWFHx8xSBJKKtEhXn9Ynv7SjFr2W/UgrFiHAezBy6QUPuLj/2upWtJiX+GEM5
         Kfy4gImX7KUJlcCBTFAJnjSlsp/2lgEUGult8mnrfSrxQm1TiJjNEvRNfl2Cw7gr5G0N
         mGow==
X-Forwarded-Encrypted: i=1; AJvYcCUDbWoO9V3j98h5bt/OsTsteJsPsNnA/Xkh2J+/GGfpEmoshh7ZoltWc+4IWmY4pKTac4sNr2UtZc0wkw44YDJOJWYTa2qYHyoYnN8ipAfZAnw=
X-Gm-Message-State: AOJu0YyytoLLmqLS0TVsKIrzQEQIfcsriqbxpSHBHEJSrUy3cXEw2MMK
	hqqrc5EzolzWaegKnYKXFixAOdnlL/Uxj7tRvUUWQ6KlVL7ahM42u8BH+ksj2+Q=
X-Google-Smtp-Source: AGHT+IHia/dXcMfF56czcOAxmNTQqh1jTWwgjJHeOv+ujGlppvG6UAN+tlaLOohOVx9yKWBwzhmzOQ==
X-Received: by 2002:a5d:610c:0:b0:35f:261a:dd8f with SMTP id ffacd0b85a97d-366e4ed2eaamr5110021f8f.20.1719314368678;
        Tue, 25 Jun 2024 04:19:28 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b57:b4a1:3d50:32a2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f6717sm12807366f8f.9.2024.06.25.04.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:19:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: amlogic: sm1: fix spdif compatibles
Date: Tue, 25 Jun 2024 13:18:43 +0200
Message-ID: <20240625111845.928192-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_041932_212250_E844C0BA 
X-CRM114-Status: GOOD (  10.16  )
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

The spdif input and output of g12 and sm1 are compatible but
sm1 should use the related compatible since it exists.

Fixes: 86f2159468d5 ("arm64: dts: meson-sm1: add spdifin and pdifout nodes")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index d13cf5b4aac7..75c8aa815eff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -335,7 +335,7 @@ tdmin_lb: audio-controller@3c0 {
 		};
 
 		spdifin: audio-controller@400 {
-			compatible = "amlogic,g12a-spdifin",
+			compatible = "amlogic,sm1-spdifin",
 				     "amlogic,axg-spdifin";
 			reg = <0x0 0x400 0x0 0x30>;
 			#sound-dai-cells = <0>;
@@ -349,7 +349,7 @@ spdifin: audio-controller@400 {
 		};
 
 		spdifout_a: audio-controller@480 {
-			compatible = "amlogic,g12a-spdifout",
+			compatible = "amlogic,sm1-spdifout",
 				     "amlogic,axg-spdifout";
 			reg = <0x0 0x480 0x0 0x50>;
 			#sound-dai-cells = <0>;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
