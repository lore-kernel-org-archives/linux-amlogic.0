Return-Path: <SRS0=UgfX=A7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83581C433F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 21:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5040E22BEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2020 21:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AMy5KDrG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAZX/G7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5040E22BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DItnsPfk15yRTrv/KH2SprsxTjQqHUEfCp8a9731ywM=; b=AMy5KDrGoyvS6sC00A98N8PsG
	2wIK2kraH7a8s+evX0kd3luKU0XF7QtJP7ITciBZUIxi3YdA178hzkOk6BgnlnW/sr6zQj+v59vGB
	XJPtFjyLO78hnuB9MCFqeeq2bAYQKk5hNWp6PSNDq0+6yHCICcrTQZUHVTXEqlZvR4903u3ZLj84z
	K7Xza/FTVbJResdW509rOoTQSJgH8sjIMVG8D4e9C420DZn+j9GTSEtm6wN4VjzzoYEzIl6Aflevd
	8j2adA/k5n4w2KxkMAxxsW1QGgCOYctIwC5PJVUaFnSVffwZdr95IfXs1Lfo7wo97Mr9BudQBci1q
	It97vbq7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxdTY-0001gI-Po; Mon, 20 Jul 2020 21:37:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxdTW-0001fT-Fv; Mon, 20 Jul 2020 21:37:31 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AA48207FC;
 Mon, 20 Jul 2020 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595281048;
 bh=iwmpauxY7ye7TKgOjmLPiQNamZ32rwVmIfVlNHkDXnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AAZX/G7k4YG3ujL80kyLtvCW38isZ0JZ8HFoBypubi9Z5vOqO6zBfzhStCK251k4J
 MLfVlTp7pRuHwPNcbeP+F+R6GlWw1cDBBuxJV+yzF2ZVG28931ej3DRT62WbZEucMq
 b/xZM0fBUaz8uQfRbm0zZIDnWDPbQm1yJKV3BhtA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 10/40] soc: amlogic: meson-gx-socinfo: Fix S905X3
 and S905D3 ID's
Date: Mon, 20 Jul 2020 17:36:45 -0400
Message-Id: <20200720213715.406997-10-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_173730_646133_4FFD4E56 
X-CRM114-Status: GOOD (  10.84  )
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

[ Upstream commit d16d0481e6bab5a916450e4ef0e1c958b550880c ]

Correct the SoC revision and package bits/mask values for S905D3/X3 to detect
a wider range of observed SoC IDs, and tweak sort order for A311D/S922X.

S905X3 05 0000 0101  (SEI610 initial devices)
S905X3 10 0001 0000  (ODROID-C4 and recent Android boxes)
S905X3 50 0101 0000  (SEI610 later revisions)
S905D3 04 0000 0100  (VIM3L devices in kernelci)
S905D3 b0 1011 0000  (VIM3L initial production)

Fixes commit c9cc9bec36d0 ("soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs")

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20200609081318.28023-1-christianshewitt@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 01fc0d20a70db..6f54bd832c8b8 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -66,10 +66,12 @@ static const struct meson_gx_package_id {
 	{ "A113D", 0x25, 0x22, 0xff },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
 	{ "S905X2", 0x28, 0x40, 0xf0 },
-	{ "S922X", 0x29, 0x40, 0xf0 },
 	{ "A311D", 0x29, 0x10, 0xf0 },
-	{ "S905X3", 0x2b, 0x5, 0xf },
-	{ "S905D3", 0x2b, 0xb0, 0xf0 },
+	{ "S922X", 0x29, 0x40, 0xf0 },
+	{ "S905D3", 0x2b, 0x4, 0xf5 },
+	{ "S905X3", 0x2b, 0x5, 0xf5 },
+	{ "S905X3", 0x2b, 0x10, 0x3f },
+	{ "S905D3", 0x2b, 0x30, 0x3f },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
