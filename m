Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1F3C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:24:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A315A20855
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:24:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uXr/JuKH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NFxvcrQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A315A20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Qmr31y5biWgV9u12OA8V8pHQY9e09HB5dBlyrvIO0o=; b=uXr/JuKHuPWsroqHdEjAV8gWc5
	Ui6AvfGyuLnoA4lSflC/Tc59sd3hMD/j9R+QOL3JrbiuC5fttT2oTCGwbruo0CuJOVIwwfNICivVU
	dB3yi3o0Slib8gNc/tLZc7POyDw9/eOrGs2mRtrgppGwyK6lofNN893FrAUQuSvG8hVlebzZ0X3J3
	cOmXeVT25dfWxn3wlDFgLHIBfmy1ZLVCGOjf3owLKWsB3u3yjvsOHFjAfLlYZ+dH1IOmPjx5D8die
	l2o4ZPtta5RkAn144GA07nA6zyAvlJhSw3jQNJi2hwHF0tpDER8bkSRnhJ6k2Z8Q8g7jdBoJkyXDI
	9qiCwDsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiF4-00082M-Hp; Mon, 16 Nov 2020 17:24:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiEz-000800-SE
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 17:24:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id a3so24336972wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtMD9HUNCd7ZhC138zP7kvjxUP0uAPHZgUTaa91+Qcc=;
 b=NFxvcrQEPFkb93g/IBtJ/uRqBozR3l3vlNfcc3pD1YOP/jYIgX5hH75BkC3XJiPcKV
 GNPWB1vBbrQWhHeC+i/oychqXkOU/ddKdJPT3K5aug5fayuGyLFhdjnoEJ8LJztn+qeI
 9OTSt8sfTbVjrybvdp4TcZ2vCj3BfcutkR69qe0iHDFlqQZwMbKPVFuWhsPMKe/udgAM
 zbb0tSAxaj8ReqS+miXkzIhNk7yNw6a4R/k8U2xe5GeAnvdfbMEHlIn0EhC/T/rru/00
 UMzvzcmarWLLB1ErQmgrsr7RznPI4XAnbs47fCRvlMOk8RwzmYr6MZu/w4MIBjTFkPdi
 jkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WtMD9HUNCd7ZhC138zP7kvjxUP0uAPHZgUTaa91+Qcc=;
 b=o6rDi6Jmrl3y+ZLiP49berN0Q6y3UMuaHeD380z5ZJd2r8Hk3z6IPVnFOaS4LXU4PX
 jin+3rDQbHIyNKn5LllWINpTZY6Vnrb2b9AwusUFZ6cXAGPZcVJhTA/zLWvLajeoHOgf
 g98yzfKd8JvWWJ1iBp45JeFbuM2KB8tMnmLJQn7qLpJycYjsuLViaNFX8ETRk043ibcT
 2fDaWw2p84SFXrd7qRwbDqhXzS0svAVJNwNN15XkVerCrOo136KGeSNchLbqxBU3pmXw
 680jHhiO1jjfyOYBgHZqT5fHBYoZCAVXD9rjKy9xCVtoWqjcs3mORvKqm8Or3SEknU/W
 j+lQ==
X-Gm-Message-State: AOAM5306iJzwgjhZY5b2xZqo0waYSYszYfbuEmk08mupSpyhuCjuVJ3t
 yd66fVbGPJRV2SDYepvHjqHFLg==
X-Google-Smtp-Source: ABdhPJzR+k3v4Mwybe0vCGdYqAqSGoEIjkYxAtsoASKSWzdNHfe23t1SJRHTenco765aUJ4maCS1dQ==
X-Received: by 2002:a05:600c:209:: with SMTP id
 9mr16522232wmi.89.1605547472634; 
 Mon, 16 Nov 2020 09:24:32 -0800 (PST)
Received: from starbuck.lan (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.googlemail.com with ESMTPSA id 34sm24128949wrq.27.2020.11.16.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:24:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: fix COMPILE_TEST error
Date: Mon, 16 Nov 2020 18:24:23 +0100
Message-Id: <20201116172423.546855-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_122434_029358_25E55E67 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When compiled with CONFIG_HAVE_CLK, the kernel need to get provider for the
clock API. This is usually selected by the platform and the sound drivers
should not really care about this. However COMPILE_TEST is special and the
platform required may not have been selected, leading to this type of
error:

> aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'

Since we need a sane provider of the API with COMPILE_TEST, depends on
COMMON_CLK.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 363dc3b1bbe4..ce0cbdc69b2e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "ASoC support for Amlogic platforms"
-	depends on ARCH_MESON || COMPILE_TEST
+	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
