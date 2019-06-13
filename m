Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3409FC31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004FD2173C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zhv0PnsP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aIGGQGLj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 004FD2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/FQKT2W9EzHY3wrw+KBofOfmFgoeXcIsW1qLuBzo3c=; b=Zhv0PnsPZ5u2AO
	jNj+QH/SZRmuKtTTB65sXzUTOpvilg1szZH+o+9T6vKMgT7qinRNbRuVccARLyeXlVP3jwbXa9YLb
	FKE2tE+dIW2MhTmcv3+hh1HA8w85YeN8j1Uzodyv1K2hNwvoblYegscA18msBqLrqCQ2FlVkxgvi1
	nMwjUN3H0Ui/80CaggXBBQbtiExvwAI6YtXGlbCWvnSH8UUm4GUXw9GTT4E4mDDd9bHiMoO+GEK7G
	k3t68ElnLD/4uyYZzLyIuQVOCCxOqH16cMQED2KZ5rpDCnmTMzNawxdT0ZacIjt23yOvYKqVefTzx
	blPUAils4U4mq/hcMeHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbO81-00006u-GX; Thu, 13 Jun 2019 11:42:49 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbO7u-0008Tt-Pa
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 11:42:44 +0000
Received: by mail-wm1-x342.google.com with SMTP id v19so9760735wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxfr2UqrJP7k7q7uBFspyYkIYB+P3tVp1PAw4xsHiNQ=;
 b=aIGGQGLj/J0XH6peWf/aEST4UK1CqwMrpUkQjobNWMtvBILe/l8TNhNg5Gzc41WnWL
 F4hhER2TzHu8OTkgAHyLHRi0LjDuY1KEpg2IqFxv/igN0L1QST+UPKkVOO+GzkHAd7sn
 e1cBnlrPNcVUOmgYhgm4ADGOlRHXukuC1YbQPIpd5si/3/GpQxqW8/lzKwooILMTP1gg
 Snh1Fa/jMuc54U8S27WXRam9qRpA8iIkVHWWGd00/2fyhA/4yJRJZ6wH7dcwSbw3b/PW
 QWEv9MpalZosI8UghJPlwZeX5KAmerfAuTq5rFurUSeyS/aRtX2aztvMj6zTHq/9r25V
 q4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxfr2UqrJP7k7q7uBFspyYkIYB+P3tVp1PAw4xsHiNQ=;
 b=QPplrZktErWbFP5pPaNRqVxMXms50UmyqcYPDA7qi3d7Em1Ma9ovQoWlwPwhZjAXeJ
 JtHYIh1c9AK2m3z+j/DClm/cHVPUqM37D7WJHkd4rZUqOZ9rEw+ewyIVEdcKoG5nECoX
 jaNT7uknmdPLX1c6zQtmqd/8mA845TAbGPCBQUUMo9wRHlzCKY8Zx4jljvbTaVxK5Rxb
 Dx0nr7/L12DtUoM+YeOLymem2oWQW31MwswHNELkv+3M9sGHLTFz0nEtkjBxmymKu4FK
 L3T2Iib18PQzRS07jcE2Py+x/0s/FoRwZslMRkncFzBVfoYnPqGefP6sZoQK5GKYGrpV
 H9ZQ==
X-Gm-Message-State: APjAAAUF6CRoCQbUMxxT8b8qBNtkaUgh/KHWFUrnKvrVChZodC7yCRZ2
 ltKoIWxZ6EvTpsyDw4hxtst+qA==
X-Google-Smtp-Source: APXvYqw3l8gXPruJhWBk60j/WsaoYnaNmb1Oiya7p9axR4/l3hNwB1waenTIOkkffv+68dM5m29SWw==
X-Received: by 2002:a1c:4956:: with SMTP id w83mr3327094wma.67.1560426161191; 
 Thu, 13 Jun 2019 04:42:41 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/4] ASoC: meson: axg-tdmout: right_j is not supported
Date: Thu, 13 Jun 2019 13:42:31 +0200
Message-Id: <20190613114233.21130-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613114233.21130-1-jbrunet@baylibre.com>
References: <20190613114233.21130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_044242_921944_32B425E2 
X-CRM114-Status: UNSURE (   7.88  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Right justified format is actually not supported by the amlogic tdm output
encoder.

Fixes: c41c2a355b86 ("ASoC: meson: add tdm output driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmout.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 527bfc4487e0..86537fc0ecb5 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -137,7 +137,6 @@ static int axg_tdmout_prepare(struct regmap *map,
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
-	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
 		skew += 1;
 		break;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
