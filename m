Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6EFC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUQC7PnHfuUnXKM1rnpV2LzMEuuAuICK/tycBirKsZ4=; b=XHLITM9JBJnjuu
	L2ApdpiQVQf7vYZITTQSwhvwoIooUjXYMRygDgbevkGg/P2Cw4q5hrXBXIPrbIeTCqTzimEfSlxEC
	bIIe8IhuVD7USUW+brS9T/sPnP7NhItJi48ii3BgWDZSCevhrE0bBpglCM1oLxay9hlZpKuOU3058
	2tcPGTTVB3ctDGIZAvFgeuaCQ2ZbT3/D2krN1ZwJt07D8ofTX6X5gMLxtqsM+zDlIRM4OeYWYNEVY
	ycCD4IkEnQsWr9UEYScXaQzXL9i/EwngotA0PrzmlU3Sx2lIFIFRFH/sNEKEzOAjBzhAcgtLGnowH
	te1xZBZa6QyW/wDQKx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK03x-003QPS-9a; Tue, 15 Feb 2022 15:48:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzmP-003HYU-L0; Tue, 15 Feb 2022 15:30:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26FD96167D;
 Tue, 15 Feb 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3416C340ED;
 Tue, 15 Feb 2022 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939013;
 bh=uwYT2Vz1tLZIqhzxa8RyFvVFuyKaZ4zlvcPpdrD74a0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ipJKShTcqh/+0xJF1Xp6KpbLUTAJF29oyCViGjclU3QWkcxKBgvH0yQ4wPutDgcPc
 /bOPYaqNXdZZU2sca+mnwBijeupkq5CKUTqvJvojCDok/v4jPUSU9wabah7clDWAYt
 mGJD1ROPH/XpEMfWd2sCokHNHyeUiFDYTf+FIjCaVky+0HgKFqAKNfq+qVfbLNJEU1
 fvlg8QOLV/02rUImo77PEcB1D7lXCKTEX1dRy3tuZ0ZwYVvSyn6NorFjhLyZbY+jcf
 1l/MLfscxgcakmsGDHVaWTyLZmneoYZeRiwGxRfI3wPx3J7GJWEUxLXXrMTWGI+Sbb
 HRF5X0Vi9CcKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 09/23] arm64: dts: meson-g12: drop BL32 region
 from SEI510/SEI610
Date: Tue, 15 Feb 2022 10:29:43 -0500
Message-Id: <20220215152957.581303-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152957.581303-1-sashal@kernel.org>
References: <20220215152957.581303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073013_775526_3FB4AD09 
X-CRM114-Status: GOOD (  10.07  )
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

From: Christian Hewitt <christianshewitt@gmail.com>

[ Upstream commit f26573e2bc9dfd551a0d5c6971f18cc546543312 ]

The BL32/TEE reserved-memory region is now inherited from the common
family dtsi (meson-g12-common) so we can drop it from board files.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20220126044954.19069-4-christianshewitt@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 8 --------
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 8 --------
 2 files changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 4d5b3e514b514..71f91e31c1818 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -157,14 +157,6 @@ vddio_ao1v8: regulator-vddio_ao1v8 {
 		regulator-always-on;
 	};
 
-	reserved-memory {
-		/* TEE Reserved Memory */
-		bl32_reserved: bl32@5000000 {
-			reg = <0x0 0x05300000 0x0 0x2000000>;
-			no-map;
-		};
-	};
-
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5ab139a34c018..c21178e9c6064 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -203,14 +203,6 @@ vddio_ao1v8: regulator-vddio_ao1v8 {
 		regulator-always-on;
 	};
 
-	reserved-memory {
-		/* TEE Reserved Memory */
-		bl32_reserved: bl32@5000000 {
-			reg = <0x0 0x05300000 0x0 0x2000000>;
-			no-map;
-		};
-	};
-
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
