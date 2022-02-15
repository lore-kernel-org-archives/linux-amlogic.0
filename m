Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D8C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHbowWP+54ydnBG7EAe8XrvobMf6WciInCFEd9XWYK4=; b=yrAs5asR3Ckyo4
	0QeqBoncJVm308s6QP3a1FCVKreHAVsoNrA3rNFFANFmCfD7bMolHw5duKPIpUckaxIEZaLe4vyP8
	Dxgn9V7DxAvXFdZZ8tb0Vz4C9N7c7Jx+AByiaDM9oZ5sbp4xax1K+tvLnxEiKVUikJWSOxJp7RuhV
	KaNKThNTacsCGUrlCNmXIYlymrIMiFOIiBJ8dK1UVdtFd26jPnwhCQIu8ECHiyKLMhonAAZyiI53c
	uxH6FVw7e/vto6hJ7QV05ZCjd0Z/14lmVpyByzODubDurzb7bz1piDP7Ex7xXsRq/5wkjiDNgvIG3
	nmqZQyMP0f+Zlt1iKvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJznz-003IJX-EV; Tue, 15 Feb 2022 15:31:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzjj-003G4j-4o; Tue, 15 Feb 2022 15:27:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78C7DB81B04;
 Tue, 15 Feb 2022 15:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3307C340F3;
 Tue, 15 Feb 2022 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938845;
 bh=7hOEkmOdFcPMWsDZ5uOzQI1f6dptk069feEkQxuJFmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIN1TxxzCPHwTUCul4tDQtpFUH0iUhyPF79VHTJH9GuAwzYVqI050kBkys7eSpoNQ
 tARRhLQKFR8tnbdHpNpUx7SZoQhGkcGOE2d2oTe4eCvjzjYUmuzbX4CIRzW2Qa015Y
 x5HPzz6Cb5tRp2C4MJT3Pjuatntd4yoj8/b1TJMdXDqM6i6OGiryaIn0uAeDgGWOkv
 HQ+vpOxIh+I1PzN0ZrJ1IM+5LQXMSm8Tm4RwXfTzXImb3MOoLALRiLiJvbQ3i8DUVx
 I65fmbjVv5Zd3HkJ8af7h142j7+RKOGGrjmF0topmey9InCfGFTYHcsR03OyOXwMET
 RZt3zmSETXdAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 13/34] arm64: dts: meson-g12: add ATF BL32
 reserved-memory region
Date: Tue, 15 Feb 2022 10:26:36 -0500
Message-Id: <20220215152657.580200-13-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152657.580200-1-sashal@kernel.org>
References: <20220215152657.580200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072727_415516_BAAB32D7 
X-CRM114-Status: GOOD (  10.22  )
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

[ Upstream commit 08982a1b3aa2611c9c711d24825c9002d28536f4 ]

Add an additional reserved memory region for the BL32 trusted firmware
present in many devices that boot from Amlogic vendor u-boot.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20220126044954.19069-3-christianshewitt@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 428449d98c0ae..a3a1ea0f21340 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -107,6 +107,12 @@ secmon_reserved: secmon@5000000 {
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
