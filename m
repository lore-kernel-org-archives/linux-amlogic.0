Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E27C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 13:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D0120673
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 13:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JuKOAzdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D0120673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=thzBWpHyh0y1Ul2J8TZfJoV2bkqClCNJrLH/V77opyA=; b=JuK
	OAzdfcX/elmbvYZpy4LBflx5CL3w227q0gKX9rl9iagYROsgv+dJgqM3LfOfGoV8PTlumjtTaqDcd
	nTVW0QdOYv9WakjP6JefG+lH6BDE96G65fgdOh8SLlPGf9oQWsMvmNndHma//Awq2Oa/rgIBFqNAd
	YSu1hdP3rCzQ6a65wah6X4nWb8LVrkZYamG2bhFIMaxvwPH3B0RUFqa0PfqnTh42NF/o7NNCwspZi
	ZrsG5OhpVC/7kagI+mYkbXckunKExeWq1YA/njsT3BaU0OfF9ul0RCc4xD19OkJ1ofwM7JW24laS7
	M/BayZPeITENMf3JYaiT1VF8AyTBSlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i03yF-0006y6-Fx; Tue, 20 Aug 2019 13:14:43 +0000
Received: from mail-wm1-f97.google.com ([209.85.128.97])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i03xv-0006sb-GK
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 13:14:25 +0000
Received: by mail-wm1-f97.google.com with SMTP id v19so2604451wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 06:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=cXZ1tHQdDxSofQjcKdrjJTywasB4IlhStZwyyxo9TFM=;
 b=DujL/RRVOtIs9hDm8kxlPzD+0eiYdTupVAbT20aPBU+0Z10SMJjGvicYzMhrQROP1l
 xpiuDULQmmSvULuxx8QT+t1kGKPkrSN90ltGJz5Nxt7iGkdpnpWBOZryQD5VGUH4V6v7
 J9sVuo572rd/Ul/e+lmoYZWOw599v4lOhMuiE36C30p/QnfLnX7FclE+ohd7Dahg5w2N
 c2mfoOVUBydc/aEjKD6QaVY6KoR09H7dDLn6HmV0/1TkB8a3KoJ9ahqOTkRKljnNRs84
 +XlDK2e71Y653Pt17kaP36TP7t7FlIR34etBvlTs72sJFkZYPlG0czmU6tVBBmcnSFJd
 Fy/A==
X-Gm-Message-State: APjAAAWpZkk6nbRBJg+66bfHzHj65Oxxrkb+ZJ6vTG5TNcQEbYIBVkpM
 tuZOAGM5JMZisxcxo4eUvIe1YWFidHlIRdrpyF3p8nYBQg0Ih16SoIINpleyBHUGzw==
X-Google-Smtp-Source: APXvYqxbIWlIIY6vy6Hz/M5p3K6g8eUuS/jQgXheRopkkCtxO9zXJuYdqyXbbvWI7Lk8cz3eUMoOjQivwHMY
X-Received: by 2002:a1c:be15:: with SMTP id o21mr25428618wmf.140.1566306861563; 
 Tue, 20 Aug 2019 06:14:21 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id j11sm372426wrb.64.2019.08.20.06.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 06:14:21 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i03xt-0002LW-7M; Tue, 20 Aug 2019 13:14:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8F31F274314E; Tue, 20 Aug 2019 14:14:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-tdm-formatter: free reset on device
 removal" to the asoc tree
In-Reply-To: <20190820123413.22249-1-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820131420.8F31F274314E@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 14:14:20 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_061423_808100_D2722C84 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: axg-tdm-formatter: free reset on device removal

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 18dd62ae3bc31baa0473e4a09e46c02e0bdc57a0 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 20 Aug 2019 14:34:13 +0200
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: free reset on device removal

Use the devm variant to get the formatter reset so it is properly freed
on device removal

Fixes: 751bd5db5260 ("ASoC: meson: axg-tdm-formatter: add reset")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190820123413.22249-1-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-tdm-formatter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 2e498201139f..1a0bf9d3836d 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -327,7 +327,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	}
 
 	/* Formatter dedicated reset line */
-	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
 		if (ret != -EPROBE_DEFER)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
