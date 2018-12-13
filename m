Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C5AC65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 15:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA2420879
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 15:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IyFOVKDn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qJn2AdAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA2420879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CJq1uUTOIUABkgiPdZzOUh3Nkmq486CM5U6VGwVtrAw=; b=IyFOVKDnGqOqby
	3ZDeSEm6JSpgy0LrqJPRTV6UjecZ2uUBpFnA17/7W6OC5eZJffYJWRSI3nrDG45FX+rPa/kqbLMmj
	XgTYz7DODRrY2C0IlZMiVjVw6HhCOqmJxmvBaKCyc3+/BXx12aYWaxQ+7K3p4B9UrEdVI1EbZh9hm
	wqD2WkJRGMrmL4o15akKVcx690PDulmKaS3hLico4GMaegbQHaPfUMlg3vVebbUYhF6X0Xykx7mO0
	pGbKGwHO1Yb2k5MEunD6d0M3Pr3RBIEOxyoQ0jxLqG5UcBQ2d7rmWTr75h5awxPSPt0yE9yxIAnBw
	1YSvTZDKslUPzuLZCR1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXTAj-0001VY-8q; Thu, 13 Dec 2018 15:45:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXTAP-0000rO-79
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 15:45:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so2867400wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDJIH6gC/LNEwkSD74Pi8XnlAWHkZTuEbFylymG13pc=;
 b=qJn2AdAoxREYaQcjOjhR0DorWHhTmDoJwyrJh7qxs77uuI68vkmSDOp4z0ns/JDqfP
 lHNNsFGdoGW8MaZ2R8AVvHunq/zvcZ3q7RkEZH9Qj4es3g07JfXfesyAh0GNvmtO/u4L
 Fw7V7+wQWroZP0JdrwQn+hOXP5n+ahtmo4XNztElalfp1ytXV6Jq8jTwvb781FcsivWk
 /QcdK3g15KHA7DCYrPA9e0Jyz4neLkVKsN611yl57kJdSZdyzZmOVVFqGpx3+fDPDej/
 uUHyx1ZaFxsKyW8ZYr1+CPkIrkaoWpapBJErTimxBO556QgzXn8ovvgJtBvPyMIESo4F
 Aa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDJIH6gC/LNEwkSD74Pi8XnlAWHkZTuEbFylymG13pc=;
 b=t0lX2EgEInRKYhOu6tzGMey4SOiJmaGLkqaWvw0QWWRl0gi5O5ByVithpWcJcvnkSk
 SNmH1dsn/jE/8rwEUDF9WJCMPGFmCx+A6slGdbI2Uti6CPGKL0frWaqfkRWK9Mcqsazy
 ZjCEFfcJpW1NLXiZs2eoccfvG15Vj+HWBVMiOd2SyLp2CYUdmc8oF0mqf9vLUWTvChn/
 5sQ07T9WvO/LcaAsYoXOCCxhoCUqts0Lq/cFCZLqPc2d8hf5jL1U7qkApaYT2Tylqe9i
 vZ3ITxJ8pyuIRZLrXots3wRdPbSHQM3QH5AneEvkG45fcTscna2I5miOt/BJk7brB+sq
 NZbw==
X-Gm-Message-State: AA+aEWZ80brxRAmUy/GqbibTH/+0OsP7OBhEKOIkWnPDNGEsZIAVyW1c
 B1oa+qKiwf8oOVOUPQgw+agkWA==
X-Google-Smtp-Source: AFSGD/XYCmymPdAeC9TKrmdi1jaA4dlFVsYV7KIEFvLN4C6tUH0Vy7ajHx1wHgIP2DuHQHuW4oRiog==
X-Received: by 2002:a1c:8acd:: with SMTP id
 m196mr10910274wmd.120.1544715877324; 
 Thu, 13 Dec 2018 07:44:37 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p74sm3118235wmd.29.2018.12.13.07.44.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 07:44:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH] ASoC: meson: fix do_div warning in spdifin
Date: Thu, 13 Dec 2018 16:44:28 +0100
Message-Id: <20181213154428.6070-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_074449_552211_D5C4DC5E 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Even if this spdif input driver is only supposed to be used on 64bits
platform, there is possible problem with 32bits and do_div, as reported
by the kbuild robot. Just fix it.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi Mark,

 This fixes the problem reported by kbuild robot [0].
 Sorry for not catching this earlier.

 Regards
 Jerome

 [0]: https://lkml.kernel.org/r/201812132245.lBYydcs3%fengguang.wu@intel.com

 sound/soc/meson/axg-spdifin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index 09f385a2bbba..01b2035fa841 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -146,8 +146,8 @@ static void axg_spdifin_write_mode_param(struct regmap *map, int mode,
 					 unsigned int base_reg,
 					 unsigned int width)
 {
-	unsigned int offset = mode, rem;
-	unsigned int reg, shift;
+	uint64_t offset = mode;
+	unsigned int reg, shift, rem;
 
 	rem = do_div(offset, num_per_reg);
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
