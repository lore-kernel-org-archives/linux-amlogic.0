Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5723C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ozn+QtXPZ+SpNK3O6u2F2X+/Mfp1574Hn8nzvlHSwY4=; b=qkX4wR1wwA3skn
	AL9HfbKPiZvV6f7xpW5AJWJhSN6mdNAW/KUgCT9oEX5K5bzKTqsLn49fk/O3huF2E3wiOnRSrHJMd
	mMpJOQcszLBPFKDquFyGOI6v8SNO3hK/b/OsK9jyQT8hAkvwnJ82b3qqdPtwjkvu98NMfxUJmCcWw
	5BXfEd1au19+BDEwtchQAiwJtjaeu3Wrao+XKSYrLT2N9EBkXojHJWiU0AA+RaSwK4Uj8JDDncmud
	RtLqw8bSEkGY9xlp0CIYtjdMZCLMYY9xG5h8haZqXpLNfl61cXDqMOBcmRr13zKzwWhq4fEreXP2o
	VCDTgnTaQ85rilK/q7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzv1-003M3L-P4; Tue, 15 Feb 2022 15:39:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzlB-003Gt1-RU; Tue, 15 Feb 2022 15:28:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72C7AB81B03;
 Tue, 15 Feb 2022 15:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0997BC340EB;
 Tue, 15 Feb 2022 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938935;
 bh=6+PrVQ3PLFy4OFhHLzKysvDD085jWO5fGKal4oKoCi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sZrfHxhb+f7Y8oOhd5Mhj5H+1lPcXrszMiCOml2sGfy9ZL822J0VGY7FZz1wTS5OL
 R0lbaxtLeDfnY4veDvqX6B2pZS8Xr30qWK31EhqZJ4YdTdNz+ZS2oP8C7CjDTDnI1a
 v5Bu+CK71gU3/zIMKLLHsjbtbynM/FcCdra3qXwvsK2FeljvVNRPywB41uQtqvHy8T
 HmOGz54IeqbbYIBW0Ti2cNelFuJgip+LEF934eyNihS1MV4QZ5sOjpZJiC5uyV2iUZ
 0vOx8UhVHA3Xhs7YFR5hcfn3oyz+HyRDJOxy57P8LHXLr3sDTixNWhGhSKVI2m8/r3
 IThgjQP5WHOAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Mateusz Krzak <kszaquitto@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 12/33] arm64: dts: meson-gx: add ATF BL32
 reserved-memory region
Date: Tue, 15 Feb 2022 10:28:10 -0500
Message-Id: <20220215152831.580780-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152831.580780-1-sashal@kernel.org>
References: <20220215152831.580780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072858_072339_07C05A94 
X-CRM114-Status: GOOD (  10.30  )
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

[ Upstream commit 76577c9137456febb05b0e17d244113196a98968 ]

Add an additional reserved memory region for the BL32 trusted firmware
present in many devices that boot from Amlogic vendor u-boot.

Suggested-by: Mateusz Krzak <kszaquitto@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20220126044954.19069-2-christianshewitt@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6b457b2c30a4b..aa14ea017a613 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -49,6 +49,12 @@ secmon_reserved_alt: secmon@5000000 {
 			no-map;
 		};
 
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
