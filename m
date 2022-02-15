Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F14C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWkDByv4yiJEKv81wSOE+b/v1YdFG2iVirLNK7k4liQ=; b=DtQtQUKEwSnok2
	29Mqvm8VkUYlSgZXK2qk/qjnVYkApdlqwHm24dSwWtg6spFvehmIMPORmphSzkHF+IPSz6E/sI7Ww
	TBOLlvJGH5bzla7YQhZyuur8Pu3eZHfMu7km8KMAJZ+2sxnuBtf3gnNixJopaNIJ/ZIx7ZQHTPqkA
	8tc6r5ocpcrMZF23CnH6vphdfC3M0IL5mwtcuBF14MrKj+MZ7CKyvrB2tjgPwiYYUx7MQFXXVCbs6
	whRmDVBGF7SYPA367q83zuL5ACl6fAaV9u5RaDj7cocoymFvkzU7I/jVYJyswe3UVSufsE4PvFJM4
	xjjaOF9Q0ii4/hkdURdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzv5-003M5q-Kg; Tue, 15 Feb 2022 15:39:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzlD-003Gus-Bq; Tue, 15 Feb 2022 15:29:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D065E614C2;
 Tue, 15 Feb 2022 15:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37709C340F1;
 Tue, 15 Feb 2022 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938938;
 bh=BYt9citSXOz0UnRst2j9rf/R7XfHPUHgwQp3sxEVeCE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ErvaERF1+K8wt6qIqxLDl+nZd+rchDAmYolxVn1S172/5f1P7w4H5Lg7jvrVOHOD6
 vjrQGXoLMxkYKgwCSSkuChD9bks0YiV3abe46AeMrQeJtXirFWif2wUCK3lQQgkmyy
 T1Xjd2RlI2+Bxp6hFLNVuBZn4m379a2a8HoIdu6FY23CxDhTnTUDCwD8oUtAIjzJnO
 5E3e1spYZeqMJ5BpxIoCS4NiCjjtDwAcG1plTiKvU5vsj8sp/p0QyUSMYSdQEw2Zi7
 MYA55TR5Rngg2OdlSELtaFkfpryKLwnVdb2LxKlIa9NC3rafEhGQDDTuJNI4JwZoNE
 swRb+Ev6eFIEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 14/33] arm64: dts: meson-g12: drop BL32 region
 from SEI510/SEI610
Date: Tue, 15 Feb 2022 10:28:12 -0500
Message-Id: <20220215152831.580780-14-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152831.580780-1-sashal@kernel.org>
References: <20220215152831.580780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072859_490677_38F552FA 
X-CRM114-Status: GOOD (  10.09  )
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
index d8838dde0f0f4..4fb31c2ba31c4 100644
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
index 427475846fc70..a5d79f2f7c196 100644
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
