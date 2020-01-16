Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3C9C33CB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 17:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DE5246B2
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 17:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3YHt9DK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmBvMS89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DE5246B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0Tkd5h+1bELzIJ925juodLIRPm8erhMnzNp++PDoeE=; b=p3YHt9DKH/UO48
	Lbn/wvwF6EGCH0XUfqFMs3J+4AnXrBiW483+V8rLLsUKYwzgMb0BCKu2uXCmAExPwmrQRsYc3cpzq
	2y4qf/jqyomqd67rsCsWTtNPmsRH11FE06LkfzM4/advNghMb5vaEnLFO+aHHS/HiV0KqgsSgtvPa
	DrfndcGZS9ATkghJGgwTq5Gk4xhkHmMdQ6/n8TGFB6KoU7fZS2oh4OewvKvEfHtPMqztbf6P+COIn
	94Ps4JXJpZV01aZigpb5m55vZ6zCPGCmTCCxFV5bmBBQTSuzmSCPNxt/cVmlwZ4Ysb9m8fLVpqAQi
	xLy5b1q3Sfv3cV9yW8ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8yx-0000gy-Ck; Thu, 16 Jan 2020 17:30:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8dM-0001Y0-D9; Thu, 16 Jan 2020 17:08:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BFC8206D9;
 Thu, 16 Jan 2020 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194519;
 bh=sT3KDcw/wc551YaCyJ5Nu5sFuDODu+pXhos+pJR1tjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZmBvMS89LGHR3ObDdlk9DC193sFJugueb6Fp3LID1KNDmocRLv+UK1PIyzVwMAVp1
 Ec3ncba9aQVenPVUr7oxdLQv7l/wfn/FzHt2JriYo0MS1T+TshWlrh+Hw/qXvOEZzY
 Hmu722oOwdj5sNBf2j/dYrIAU5j+sKSrZc3hpRU0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 411/671] ASoC: meson: axg-tdmout: right_j is not
 supported
Date: Thu, 16 Jan 2020 12:00:49 -0500
Message-Id: <20200116170509.12787-148-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090840_574162_615DC4EC 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 7e0d7d0fbd06af0507611f85dba8daf24832abd9 ]

Right justified format is actually not supported by the amlogic tdm output
encoder.

Fixes: c41c2a355b86 ("ASoC: meson: add tdm output driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/meson/axg-tdmout.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index f73368ee1088..d11acb3cc696 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -136,7 +136,6 @@ static int axg_tdmout_prepare(struct regmap *map, struct axg_tdm_stream *ts)
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
 		val |= TDMOUT_CTRL0_INIT_BITNUM(2);
 		break;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
