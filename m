Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C68AC54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 22:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fcMz0oFDdzOVnl/SdrsuR1QVIoIVhss+3nHSHpW+TIQ=; b=dCjf2SMHW/i9E7
	/dY93vlYgf6rxkFM8+fqGSiIxCPrAGL2gSixXoPHcZPiVN5Z6SSycFPtyG+ymHFvjQN4VWr3uHb1I
	OC2O5BSVuQ2gV/Iz8v8Wbu3yrGPMMf0+7qV93Qga+2qg+OCwCn8PdF+O/Xrv0CDPPllElY/KsZQUw
	oU1EXcTxSZXT1Ej9FRol66pRBAP9TqSAMNA+ItDgNrk/p9yRE5xVB5vCSO4OWD0HgDyf0ImCJBHUC
	vjRXp9brq3N0bfbR/jwUlLT2WG1qIwtrbe4w5czsGCsD2ZrqN4LKP4ADK9FAy17hHXVZ+yUnjiKmh
	BngjJzBe7pWvCVHIp5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMf5-008hbK-HA; Tue, 10 Jan 2023 22:00:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMf3-008ha3-0p; Tue, 10 Jan 2023 22:00:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id j16so19667773edw.11;
        Tue, 10 Jan 2023 13:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0A+/pPY0W2OxmXPlRQSeFoMNoHET+WW3usLT6qwTWY=;
        b=aIpvCIGAwOgQjufdkkd5GSNKjB+lf9wFH6o0d1WaYDrRosC5hOLLtnLqnfxO9KpnxX
         v8An28tZ4VLFpOuwxwNrK0l3IwNEmI//2nmOP7I9fyBBOk4F4GozRBb4duQnfjqcBq6b
         jvFuzxh4HJm5MiKcMsKWzOh9W0VZqQOk4ecAUVtHUpN92rHlGcl4ZDZCtOfOhLSxFRoO
         Ge/4NTaCTW1Vbo4uezonVtRcnr+o+De1aMqDs4hmAS61UDC3LehNtAWnl12G73hyFjQ0
         oviRoIDpTOWX1PmfjyBI9iZygUk+twQuHnAh1qbgjb4NVkYXQF5ms0puvfCvYtuwW+D0
         LMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0A+/pPY0W2OxmXPlRQSeFoMNoHET+WW3usLT6qwTWY=;
        b=G66aagUId2dbGIYjHuBhFLHoBdkev8krtkMzyA/tuLX4UtPqWieUveY5Uq7DSuGGI3
         KBJ3MsicAUPPV9Mi+Sj/G+JJaRT1aMMA1fs3Hrxrtdvlzan7iHBfk/gc07S7de/5JNoj
         Igp9wHdJp+tMbBmxJUJZHbr0vPYiDz4X3lITj4qgh5oEWtlIiB6rpYOsdqbgpIrtDpaS
         361DmpVrb3RIhs8wxFkaqMBhqOO2q2gFVxT0L1Ud1QIZdJWDB5g08XUvE9nu+ALNQUqA
         80Ewn+tifdtoPOjoPtb0aXDIMiZYJXM8adktZUTra3f957tSdnZbWAyE/qVwSHZxjl4M
         y3NA==
X-Gm-Message-State: AFqh2krwVrpfA1V7JRaSU48SyVUJasdKxV+WznsSjWMMb6LjwlCQuo1X
	X6X4W/hcJ+Dd024/j/PrT54uRjDLbRE=
X-Google-Smtp-Source: AMrXdXuRHK1VxAGfGdIkJTw+9270rhsZ6x/sWQPH/c4KLwONK8PwwroGF4w0l9X3gKmACLCMDfGoaQ==
X-Received: by 2002:a05:6402:1f89:b0:47b:16c7:492c with SMTP id c9-20020a0564021f8900b0047b16c7492cmr68452406edc.25.1673387998327;
        Tue, 10 Jan 2023 13:59:58 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-7880-b900-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:7880:b900::e63])
        by smtp.googlemail.com with ESMTPSA id cz26-20020a0564021cba00b0048ea96cb900sm5404408edb.23.2023.01.10.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:59:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	adeep@lexina.in,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC unit address
Date: Tue, 10 Jan 2023 22:59:26 +0100
Message-Id: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_140001_099510_F83C837B 
X-CRM114-Status: GOOD (  12.34  )
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

Unit addresses should be written using lower-case hex characters. Use
wifi_mac@c to fix a yaml schema validation error once the eFuse
dt-bindings have been converted to a yaml schema:
  efuse: Unevaluated properties are not allowed ('wifi_mac@C' was
  unexpected)

Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 6831137c5c10..4f742e1b9301 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -90,7 +90,7 @@ bt_mac: bt_mac@6 {
 		reg = <0x6 0x6>;
 	};
 
-	wifi_mac: wifi_mac@C {
+	wifi_mac: wifi_mac@c {
 		reg = <0xc 0x6>;
 	};
 };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
