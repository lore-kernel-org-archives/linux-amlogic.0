Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FD1C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0E9E60E74
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0E9E60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih2Vi8u4uUrMhd+tsC1SdqlblKwmh4ynzwjuyrTECJ8=; b=gi/dcWBuy0naj8
	6VUmGqDMzC4+nAjTg1TVb8RSN1dgaAU6vONL/lfUZfmLzEogJoGkQN0mxyQBQ2IuTiw/IZ60fWqFX
	Z9udsGhJjtViLmIhU/min5BF3YCrdjMZ05lG9W741gcn0MSV/hnnh33g6bEoDHJrEvGaZcLJXEkF0
	gDmfTi9mDFHXfjTlEdrpxfKAr1XHa3hmzYAKQUXf59x5dx6Q3kHJ+zG3xurSo/n5G+rn6Mh24Ecvp
	8w0vwIPKOgCWyprvQndH5Qul8n1nBtyGzPkTaruxUfiB6C2/TzVcL8RfPSyC0ATLhxc2tCJskjKQ2
	u8ENxQguko6NV7fiwiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOti-00DPVr-Ez; Sat, 23 Oct 2021 21:49:50 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOtK-00DPOa-Bs; Sat, 23 Oct 2021 21:49:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4HcFH448WtzQjx0;
 Sat, 23 Oct 2021 23:49:20 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635025758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRaUc/UwAjrxbie4yIFG+zP8rtWkGQNQmAlYTtHJbRA=;
 b=JxbdWPffchmgVLVz5pNwlv2DeS9RyWMRTzunEHDOKrI3mr8RbKY/f6dLYfm6zU+/pXt59y
 sViDjaLOddoIoYQ3ur7BSS7BNC3eJ6wVWas+ViX5okgFEMeh67mI2SEcvYKqwJOvd5xXMU
 StG+uAR80OWZbUzkn65J8HdO3c1814D5NDzZJpZo9vgFlE+DgIC2t1KuboKRSsQpFbgLFu
 ieXCgbzxPixAiB0M6x1/cZTCIIT9T7jOp1nM7RMp2azkGIPIaLPwqe5HNqruvWc1Z2/Jux
 dfvRANWJ9UyXzJNNsR7OuUQBFeEVjWsk1WpMw+GsECmyiBN+Lq8p3Emgj7DAsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1635025757; bh=+owcMitknp0Jyss49meAllAEWlZi6bdTi
 WqmNmF6mDI=; b=PE7km41oOJIBD803AJflXO5VSu8MJCxfkgEB3MBRLbvyiy0ad
 LvoKcCWi1QU/2c6Uz8uPrwrsLaL+93sa63kcWbmumxaxnBMWTueM3gnRaxU+eTWE
 72K/VDaNHwG5zAGoz9oBAUyJJN6CRTpNzQ4euKuxhKJBMH3C1mqh7OIDMXqouhvp
 fQ2Fg1OqM1lv0a3rRALrcVo2Uug44e0FuqCfKwnoJ7L+YDiNryow4BZLR8d7r0h5
 LY9wPZ3jkvgppfIfdc+ZchYjS3yz7mOM7JV2vIHbP0ZKGWgfyaICaGSfUyjeF2mv
 pMynp4EQXoen5LDwgnrqaF1NYl/eOSFLTr9rA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: amlogic: meson-g12: Fix GPU operating point
 table node name
Date: Sat, 23 Oct 2021 23:48:55 +0200
Message-Id: <20211023214856.30097-3-alexander.stein@mailbox.org>
In-Reply-To: <20211023214856.30097-1-alexander.stein@mailbox.org>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D57831313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_144926_599091_613D73B0 
X-CRM114-Status: GOOD (  13.66  )
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

Starting with commit 94274f20f6bf ("dt-bindings: opp: Convert to DT
schema") the opp node name has a mandatory pattern. This change
fixes the dtbs_check warning:
gpu-opp-table: $nodename:0: 'gpu-opp-table' does not match
'^opp-table(-[a-z0-9]+)?$'
Put the 'gpu' part at the end to match the pattern.

Fixes: 916a0edc43f0 ("arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Same as with patch 2/4 about the 'Fixes' tag: At the time when
gpu-opp-table was added there was no schema present. So there was no bug at
the time of writing. I'm ok either way.

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff987e7ccff2..517519e6e87f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -58,7 +58,7 @@ efuse: efuse {
 		secure-monitor = <&sm>;
 	};
 
-	gpu_opp_table: gpu-opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-124999998 {
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
