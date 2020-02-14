Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0994C3B1A1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C4524684
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXxhlcU2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k77pRCSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C4524684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRobkjbpIv+qZMx8mKXnuRlWRRZnWdSotTrJl5YHu+Y=; b=EXxhlcU2arwSsP
	u34ZY0kr8OCBAkTvz5pFFauKHmGMwZoHgdRYM9Op8WBtWelDvtTiGA+ngbMWhQdbfpN66Hbk4i2hl
	NLqYED8MLiiXwg3t+Fm5PEyfNSnEcsBkCvmnnSH+vDqE4XvnzMYkZCekzTwvz6TNNHEux1XExKkas
	67WIEcCET4yc78sJMWpyGgRdirBHUZPYtmNCrfEeFU68otnAuFyv0n0XG3RANRpv2+mkhZlibjD/w
	ncYQhL7+L55LC6F/TK/JokLYCE15ik7HtAiFTWw9A1pkELzNKgQ3NMeZv+QEo30ZKXjPDce83VF/Q
	pBveFMRjk2iKk9UBvRRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dDx-0001sV-9V; Fri, 14 Feb 2020 15:49:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dDV-0001So-Vy; Fri, 14 Feb 2020 15:49:23 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E44624680;
 Fri, 14 Feb 2020 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695361;
 bh=ml9s32sxFxF2khA9u9Gzm/r5nsPwJ65bZbYiix3UbLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k77pRCSO6Wk+ImLk39hjqGMo/jxgbGR9Ur1PU7w/hJUj1eY9h/2eNfABPV95xbibm
 q2pE0Y9dp9t+mYttDKhA4WEJ9MJua5gxKVivUYK6IszEIDy3ugvVCvAgwEbnk285rc
 I/Q6ZnylGCicBbb5TkjbjYS8ZV9LVwBCUwEGeo3g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 020/542] clk: meson: g12a: fix missing uart2 in
 regmap table
Date: Fri, 14 Feb 2020 10:40:12 -0500
Message-Id: <20200214154854.6746-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_074922_077085_C509AA1A 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, Dmitry Shmidt <dimitrysh@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit b1b3f0622a9d52ac19a63619911823c89a4d85a4 ]

UART2 peripheral is missing from the regmap fixup table of the g12a family
clock controller. As it is, any access to this clock would Oops, which is
not great.

Add the clock to the table to fix the problem.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Tested-by: Dmitry Shmidt <dimitrysh@google.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b3af61cc6fb94..d2760a021301d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4692,6 +4692,7 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_bt656,
 	&g12a_usb1_to_ddr,
 	&g12a_mmc_pclk,
+	&g12a_uart2,
 	&g12a_vpu_intr,
 	&g12a_gic,
 	&g12a_sd_emmc_a_clk0,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
