Return-Path: <SRS0=YxYw=JJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BA1C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 13:23:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53CF861288
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 13:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53CF861288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nAf5mj9WNquw7Q/f2ptNMvX0n7Q1aPp7qiWEPob0hIQ=; b=b12pFC/w+AvUrKM+sQ1wdSMwgn
	JG4fkeooqTbP4lBry9iB+nETd8p0evSmIrA2hhFJS4WX2ApNAGnun3gdSaM/U1fPjevhn8cdukSpL
	DuPA85GKPo7EBw5pZr2fB8UjWDD10zFBLWbxxcF7dJVT8APFpAJGHr8Q6eWb/1j5+Q9q5Tu2LI2b+
	YL3o9bVEaH/IvGigUe0GOkmk1KnMDFZy/bqbVUVBDsDVMwsOzcgV0a5JzY/Z3CMT5xKOeXESJVLM0
	hUA4Ok2JhJZJ1GAHEGiDwAIEpWwdGTI17bLsb/vx2ej+bBaA+tf1QJnlIwDuTF7s6GIdeT9zmj7DE
	UXZbhVOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVwX4-006piP-QG; Mon, 12 Apr 2021 13:23:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwX2-006phy-Nh
 for linux-amlogic@desiato.infradead.org; Mon, 12 Apr 2021 13:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6RMmYYuU+0a6526L101Df6MPF+9Ne8jsB4VHTPjDRzM=; b=bUi+A9Wca8AywemX6K8dPXhwKt
 u+roE71GtNya90h5AiFJGBsnzYprq7Om9TvBXxzS6/IpV6whm3HasWKhP7da+5O4sSi7bf29soqBZ
 wtvcwfJGi8zvpTfj9hXXcdsJsRT0uDqwKJFK8ApyQJxTXP4KJIi+Yids77E1i1zhBmZBgu1PA7oap
 WOiSozY4luLgW6HioF46HtvujyO7wI8YXA1vDRuAU4M9JVLS0js0pj+N2fWvInboh+AjrN6wfEopd
 Xm9YdhCXF/XPeiRW9WRawneezm3DPNjPLQlYFTCQ99BXfpDLuYImcETUFEQSaWSvChKTJLLYPOB9A
 dj7+4sBw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwWz-006GIv-GY
 for linux-amlogic@lists.infradead.org; Mon, 12 Apr 2021 13:23:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id k128so6805474wmk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Apr 2021 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RMmYYuU+0a6526L101Df6MPF+9Ne8jsB4VHTPjDRzM=;
 b=leYZC5OwyHfO+RaQtnO/IKGmFzshm9oxi3w2NmGmISXC7k2l1T62GS4Bx/F8ZaLMVZ
 3JNoFy3P1JTddEIe4Strnc4tmO1uDoHo8175fq6gvRdxkUGbirbrl6f31CrrsIxY6+RK
 ijPqP27AxPt2vFD2Dc9ixPtj5vvWliqTUvGXeC+SgZQdkyPMl3JxmETIpwJfzSFcPzRI
 YKFVU2QROjlhjB0z84C2N6svOqF746FuPS4yIATzwziTj5OJx4tOUm2v6yfDtsfbhIGr
 nvbvVaAvtJ8HP0wrPV4WuT8o/SUKNqwAcIywHCL/89AJWC3o2a43FhwGpVVLhNqza5HP
 JyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RMmYYuU+0a6526L101Df6MPF+9Ne8jsB4VHTPjDRzM=;
 b=DvYZbAQ6WD8Bd93F/yI5ZBT49IL4tIREDkmDJ7tjG/+MC13gHnW4Fn9akP/gjLZDjK
 RIqUzmy61LVxFfyVELyvH2enf5cEfgVprvnZe/xtNhU1WTWS5FAc+hBCUMG4drQBBpws
 P3Jmza9LYqbyMrXBEsvhXVK7zpusb750H8IH+Wgou3ATtXW7/D6FibJHjM7S6OcjAAXX
 U1SSqHk/a+OATS1uChdzRnEaK0cQ2f5UIX17I+6WmyHKOE5ZpXkJDJHUGVJNSDyX73mi
 Q+E24ei6S19sDtG4hkqy1V1Rx/LUw7ZYu4rBsaJTghzGoQXLyVjXRMkXrLLh1S5UqUzB
 cVaQ==
X-Gm-Message-State: AOAM531+1Hk3YqGPMwCCNSDHrNKK1P+ofsVnIrFGId2sm1f2JzBMjxZD
 Ts771MZ2H2jcRFwpzKmXKN2a7IIZa+LWi+7p
X-Google-Smtp-Source: ABdhPJzNv3NwebTHH2w3RT/SGRTxA+8oIWytylSgXkx7m6KWVzab7qUkugTYfCASOXGAQqhsy3VDAA==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr8576793wmh.63.1618233787571;
 Mon, 12 Apr 2021 06:23:07 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id a4sm16624761wrx.86.2021.04.12.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:23:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
Date: Mon, 12 Apr 2021 15:22:56 +0200
Message-Id: <20210412132256.89920-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_062309_634415_5E38540A 
X-CRM114-Status: GOOD (  10.12  )
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

Previous fifo depth patch was only tested on axg, not g12 or sm1.
Of course, while adding hw_params dai callback for the axg, I forgot to do
the same for g12 and sm1, leaving the depth unset and breaking playback on
these SoCs.

Add hw_params callback to the g12 dai_ops to fix the problem.

Fixes: 6f68accaa864 ("ASoC: meson: axg-frddr: set fifo depth according to the period")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 8ed114de0bdf..37f4bb3469b5 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -171,6 +171,7 @@ static const struct axg_fifo_match_data axg_frddr_match_data = {
 
 static const struct snd_soc_dai_ops g12a_frddr_ops = {
 	.prepare	= g12a_frddr_dai_prepare,
+	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
 };
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
