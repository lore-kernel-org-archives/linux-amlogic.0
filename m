Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D0BC55179
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2DB422243
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cHbfh+YW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4z3Fbwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DB422243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P9WJz5DTf/CW3k31UKkddU70BqWbUBifNAe6XT3mVxI=; b=cHbfh+YW5YoKMqLTXORGqLOlx
	Mp5+gFAHhjfSK4mbW69sRtj4KedvmUvk8Rb+5C8NB+kehZzpSFfpi8YlNnv6eQdqEnJpRUD+vIfTB
	F5aRIAZN+wpwAzNwoxxaMjB+N95qjNrFRvWaNvq5M3mLrOQnd6OS449Ad86a6mPtgfsebcLqVyaOq
	XqLKixAmP6IyfLJp+s/i+ObP3IRgS4Og+BRd9YcWMztQr/fRrdZZnOK7EPcSqbc7LOy4Rg2pW7/2b
	bCydXCqdM3MUGwJTHlyCN+DdtahU94+gnPLWd/uiy26cYyMOKluU98AIykjVluadvBPjpIjwicHc+
	71IdY7HVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZl6V-0000RW-PV; Tue, 03 Nov 2020 01:27:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkzf-0005Rm-EH; Tue, 03 Nov 2020 01:20:20 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2564223EA;
 Tue,  3 Nov 2020 01:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366413;
 bh=sLdD2WHhyZznq7z3KqCeqdwr5+xOdL5zrp3tEJEMszE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U4z3FbweP6ZigvdgS6MsbXOkCzTANY0acU1ECLFZmBlj93PAn9hTzIun3bVjecMws
 sftvN9u3dQdWXCHo045qFbKqPwBSVvgy2AOuZsAtPvDcuwDMIRT0iZjsIgn7xK19Bl
 ARpe2+GK55X1QtUsYfDX9e69IlA3Dza8njePyGW0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/24] arm64: dts: meson: add missing g12 rng clock
Date: Mon,  2 Nov 2020 20:19:47 -0500
Message-Id: <20201103012007.183429-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103012007.183429-1-sashal@kernel.org>
References: <20201103012007.183429-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_202015_826424_6580003A 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Scott K Logan <logans@cottsay.net>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Scott K Logan <logans@cottsay.net>

[ Upstream commit a1afbbb0285797e01313779c71287d936d069245 ]

This adds the missing perpheral clock for the RNG for Amlogic G12. As
stated in amlogic,meson-rng.yaml, this isn't always necessary for the
RNG to function, but is better to have in case the clock is disabled for
some reason prior to loading.

Signed-off-by: Scott K Logan <logans@cottsay.net>
Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Link: https://lore.kernel.org/r/520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1234bc7974294..354ef2f3eac67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -167,6 +167,8 @@ apb_efuse: bus@30000 {
 				hwrng: rng@218 {
 					compatible = "amlogic,meson-rng";
 					reg = <0x0 0x218 0x0 0x4>;
+					clocks = <&clkc CLKID_RNG0>;
+					clock-names = "core";
 				};
 			};
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
