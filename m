Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED5AC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keIWh1liqnutAZZ4LHTOj/CK6dfDy/Er7OiGEbjc8Xg=; b=Fif4vaZZm47hEQ
	wjcCpNl3rVlPBrn01qVVg8cqQrn7TYQOelUQpp50NbjGWUMi8kJTwZI4m4QuVUOlRc3TrmDSgvmPY
	k1k4g7+ARmDARBUUVH4A9NZMa56RoUhJlVXYC61GgeC9AFqM+GjrUnqOAF0u27GvpoDFqmvJ95Acx
	znFsxJf2uC7cgoq9Cvila/jZXH5bX+H6YbYpF+kLSJpVZvGd4S92jqASZL6rsQtfXLixO/D0ayPvu
	Zv+wW1b2A2YpS2Sr/4JcABW+UKDCJS7BXePIOFKu5jUDjQy+FY2/2stlSaL390rWUysswvltynUdw
	svwUXe7+hHMaABp7LF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0AP-003TUc-E6; Tue, 15 Feb 2022 15:55:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzn2-003Hss-LS; Tue, 15 Feb 2022 15:30:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4071EB81A9A;
 Tue, 15 Feb 2022 15:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B68C340F1;
 Tue, 15 Feb 2022 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939050;
 bh=ymV2XseOhFjRwS9+FDwFbtdim0AxXpdLshMresWy9zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aPsZX/xiz2lgk2lUlgpRHRx15Ge9ep3x32G0ZzfCiuf608mmsj9LGWzSolOTrxnnm
 J7KCj8wSDnSEQGd65eLTiGSRs36tjys4aGQgnhQu32ZUackRdjkK06O5FI6fVD1gqo
 39SCHWcbAl7qkqzTCnoVsv5lHlbF/oYA6bLFv6uQyZ2L1ASripvKZrNz4PonVDu8PB
 BrUNzx+sDuHlEHF/XPP3BxkAS5V+7h1csDMuIyyqKY/o6rOfh9z0C/J2Le5SRYkQ5f
 yUE5YbGFjnW5PIx7B4xegtNSwuku2gebKdT1/G/6xEQWpGII0ZoFU7bYZ0bkQ/yIgc
 akRLvG3Cvg5Zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 07/17] arm64: dts: meson-g12: add ATF BL32
 reserved-memory region
Date: Tue, 15 Feb 2022 10:30:27 -0500
Message-Id: <20220215153037.581579-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215153037.581579-1-sashal@kernel.org>
References: <20220215153037.581579-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073052_926403_023935FF 
X-CRM114-Status: GOOD (  10.32  )
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
index 9533c85fb0a30..d2d255a988a81 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -76,6 +76,12 @@ secmon_reserved: secmon@5000000 {
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
