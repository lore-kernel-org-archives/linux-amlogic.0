Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F82C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Feb 2022 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL/LfYCJp6Vx9ebh13Acrt7NqSrk+SVIHi2FrsTpKoA=; b=RGKreMpIEi7F/T
	o17exjnySyDwxqwbdjWwHVqcHRi7vsCH3wja3hrYuJXQPshMStgNHcguvn+pnJ5DUQxEDOOrQ9YDE
	VKaZ65zxr5aAglWCca74TOp5uHVB0ZrLATSFzP/91YABWBGDlzdh+NRpG3bIbWrJLX3mvWASGN6vs
	PqDbR84lF5/mbL9JQsZGiDXV8nW+yTmgcCcTZVrL1+PrmIWe2DMC90Xx/M5SszH1AP2T9emP6U7vD
	QZMmDVgqbzUxw/UyA6ctUjs3JioMPZB1Wwk9oN4XNy2Vmep00toVsflkqG/cuOyBWF+onyG9dkh9N
	Dfaed2ofrdgNR7/+nfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK040-003QR5-9z; Tue, 15 Feb 2022 15:48:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzmM-003HWW-V6; Tue, 15 Feb 2022 15:30:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B78E614C2;
 Tue, 15 Feb 2022 15:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6E5C340EB;
 Tue, 15 Feb 2022 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939009;
 bh=PEnE8QAlQXJpAHUZzpmdlvhbtU4CfXXCOZjWN1uIufM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nFmX4C9anYkzNXnQb6KJ56DQD98NrMyDFZvmGl358TGenjLMPaSHXFhYIm+RXGOrb
 /Ev2iB9oZuogUuB6pA19+ccbGjEzjT1ocC8ZNhKxDCCGieICMq0T1dDsGttXysjUia
 jTCkMaRZm2HQkaWfeiVJAysgOZqVzcpBWZGY/R6ESI7vQiidFg9fAN+U3YHV4tWEKD
 OLWJesJ/2MeIxy35woMiNhCSV2IkpE92gSRbQFAeqefWvh8q4d//aAZte5aRnylRJQ
 8Kv25+uLj6+wWfW+FLZ5yKm23xxUhqqRTDIAiBvtICqvS2gajL1D7Zpk/agGXyaHnZ
 ivwrxgrVqzJEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Mateusz Krzak <kszaquitto@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 07/23] arm64: dts: meson-gx: add ATF BL32
 reserved-memory region
Date: Tue, 15 Feb 2022 10:29:41 -0500
Message-Id: <20220215152957.581303-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152957.581303-1-sashal@kernel.org>
References: <20220215152957.581303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073011_081267_914591E0 
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
index 0edd137151f89..47cbb0a1eb183 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -43,6 +43,12 @@ secmon_reserved_alt: secmon@5000000 {
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
