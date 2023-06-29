Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C510EEB64D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lO4kxfV7VfHQzsPhvzra5qYfY0URGnL6+Y3P/eJU2Cw=; b=1OsLwew1ZjhSJq
	Memsypp5IsSuOVlJya2ThaycehyuaT+QHjSEB5ApeF1z1UYdw6AWn/KRNoZRoU1NYA6COIKCcwPgn
	400jitvGjIQM8NvYlbHYqixfiHCoqeCnF/mjpionXtnovlShyVvLf3P4NY6GYtuseLOS1RX8DuUX5
	IwnuQOvJHbmh8xUfgtO6agPbqsKN4Cejm3gz6o6kC8//AHC6YdfKUcWlOKDzCBO1uE6JgS+7cXMLB
	20kOOQV8MNTiMXal6AARipzJB11/Lao6lDbMZOd9ADp+PMH4HP1w4zZEsbjJ0pDHIqtq9ufgMQKfw
	RjwrfStR3aAjZRrasIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEgga-00HGKD-1P;
	Thu, 29 Jun 2023 01:43:04 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEggX-00HGJP-1t;
	Thu, 29 Jun 2023 01:43:02 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-765942d497fso18287285a.1;
        Wed, 28 Jun 2023 18:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688002979; x=1690594979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgxYvAPdy6cyYY8LJa7G8IIHJkOD0bja0wPM1W6sg8I=;
        b=kYRdRF781JvgnGIHMt7HYd+5MaL1yKxgHkiBDnqeZFA6wF29CnpwbiUV3clBpaloO7
         drEIGPBxQVuSJYm19tWtqVFQZ+VClwZuNrMBQeSR+R4OAiQTCQBIbHc9iQmV8D5Gzl8Q
         kGPvDWcnzS5bByXw5pxflYLR4aEsZzAtX7MX06i3neVT/BwVd5SX9IFmwkSI1hvPR80j
         ZZMLPPHVruwyb6mjIROG6FwMwQGzKnKGUO4DgenASJKjZQqDzrx6F5f020/gR8vkkquK
         /URnBdpsP+opzzeHXKKyPYhkksRkTfDrUvoUtv1AQpQyt9LOWUsOMG4eYpkLfFvxOgDk
         v9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688002979; x=1690594979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgxYvAPdy6cyYY8LJa7G8IIHJkOD0bja0wPM1W6sg8I=;
        b=UWAMTdpIn2VbzlTVfCLR7mTenF+bAu94esaLp6vkslTU0sSwALpYW9M+bfp9Ed4ygk
         C12K1HxPfrtpED56SaSCx/CDY+q4fywYrcCe2KrvOdM3oqx/0fEl1aKeKeW9YInva/fu
         8QWf96MLHydMaw4DMmEEch5UDQRBEcR7DM0tMDGgw92OTY46w/MW6a/FzYvKQrxk6uGM
         tYvTQlGrT5FYIbtuD/0B7FpPaOxxgfy9Ko+Olk1byV5t+Yi+PmXgeGv+2hWEX9TWJDkA
         R0V/ergoxc6mUON8xNDb5pBOotHxHQ3EqZiGryWN8QQn24V7XcF7R/p1uRAKWBzhyJwk
         eQGA==
X-Gm-Message-State: AC+VfDwcJU4pm3092aMVX+i3N41dJeCPjUML67sb9EbYEtAyk5lVkYfR
	1Lq07NbYc80zj8nX8tzaK60=
X-Google-Smtp-Source: ACHHUZ4IiaFAB5haGGNU3e6va9vsg0mwQnLalhUUzD8uL9LkFN+/FfZ/TFb9itQHpEDCNyYCXOF/Pw==
X-Received: by 2002:a05:620a:2785:b0:765:9c07:18ea with SMTP id g5-20020a05620a278500b007659c0718eamr12515394qkp.64.1688002979313;
        Wed, 28 Jun 2023 18:42:59 -0700 (PDT)
Received: from anyang.. ([106.250.177.234])
        by smtp.googlemail.com with ESMTPSA id m7-20020a17090a414700b00262d368b220sm7707123pjg.40.2023.06.28.18.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 18:42:58 -0700 (PDT)
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: meson-sm1: reorder device aliases
Date: Thu, 29 Jun 2023 10:42:51 +0900
Message-Id: <20230629014253.2007625-1-tobetter@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_184301_655946_A9BE57DA 
X-CRM114-Status: GOOD (  10.63  )
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

This patch is simply to reoder the device aliases.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi    | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index 46a34731f7e2..c63edf3e43af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -15,8 +15,8 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 17045ff81c69..7c01e6995bfb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -24,8 +24,8 @@ button-sw3 {
 	};
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 2fce44939f45..ddac04ac60ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -10,8 +10,8 @@
 
 / {
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 9068a334ea57..7d490e1b56f0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -16,8 +16,8 @@ / {
 	model = "SEI Robotics SEI610";
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
 	};
 
 	mono_dac: audio-codec-0 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
