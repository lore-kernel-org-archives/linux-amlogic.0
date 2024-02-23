Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89148C5478C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nb1+KS01X6ssM7aa2+1KsVDeb5c8FICQTL8djrw4iNM=; b=DreQuXjxj/toAq
	r0Ov9cgDBaxAmKOuNcLWlhUfhYBydRiQ/jmnAZ54Ls9NPtsfpW0oq0xyheChgVQ5uY7uEn8mKStQ4
	LLCY1La6GZFdqJrp7Za2z4NLN1hAFdBiXkTKlrSu5Q89rGW5FyjtpCS9mwfvrFtJhFv2mu04l0pAS
	PMH3qkrRqpWJ2Oo0shCeYLj1RCuRvIHqF6wk77Ua7z977CX8amFZ7A8eSkuBMoUjuVed2HZveDNth
	tUl1SShhLGLRY09noGca5fCL15n8ILWFtIRxGaAVrxnAIySyMf8L2T5Jn4G3+XkRKMlAqx6WHzGZ0
	8H6N+c0lMmnBj7pRMhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZiC-0000000Adt3-1pkQ;
	Fri, 23 Feb 2024 17:52:07 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhu-0000000AdfW-05Vi
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:38 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412934b98b8so6318725e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710684; x=1709315484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeCmmTR4nL1DWlLTvSXW5V8GjozKprjftrRX3BjbH5I=;
        b=X1x6pqDStYFozuoS9T+Xc8LCpR/MFFHDBeLSy6i+cLpDecAeIeEPr6kkjliEmu2KM/
         hwsjxW4LHLh1VquhQNqwisOaHn3FO8RTv0PWvn4lZ1apKGjmYD3o6+mchqROpy25Sz9r
         xp+JSal7JaTPAncn6McaYY/HYTHjoxQ7sD9KsQFPVvoeW9W/I1WDRwN2pQT30yuObWgW
         UEnMlIb6HhJr6QpHOkqHnIRLL7oZQ5spvFTZkpK6My1v5XrWcJ8F4E+uQjKuC00xrN7A
         zfHsLEnhHngcDjPsgdJ4zRZJSJl7Y15/f6C2ijLpYp0hmrKuiGv35N9WGedr10L1qKaE
         TdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710684; x=1709315484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeCmmTR4nL1DWlLTvSXW5V8GjozKprjftrRX3BjbH5I=;
        b=IEIT2nYCP6K/VIHvVkpn6/NTvWxGD7VaZxkBmbpjS+A10I8ZBS8BAwyEdkp2CVwx5R
         l2O8lwcLryDjydmu/X0hVky5ajhhbbimYJgo+Fb4LRlE0w/YtRlBBiG1Hgh3aOHpqki7
         ZNs6Q5qbR5bdUBJotnbRtqVxK/EHyiPYgce7HUxQ87zQCkLm1AfIHrpVAw1nE0EHV5+b
         krzrr2H4jCECh1LDoIyJ4oWS4OISox02bM5nrhBS7hdfGgxVQUoWlcZ1UyGXy2+NvhU9
         ZV0VmNq/Phpb8rRfhc1WNK9YcReQSqSdg78HCKti8K+GUAg1g7aDIUtcj0lzDuIVeoyh
         dfhw==
X-Forwarded-Encrypted: i=1; AJvYcCWdfbyCQfUAsiRLQAEv3HayNUGbsbcoKMLPfERmKdciz7Ee1/XVFvcVe/S+kGpaxfNxLNTw8qVqz0q7UBs+ceT+DZw7r48/dAXU3frQIzbZMao=
X-Gm-Message-State: AOJu0Yz9ydANCxzqUdnrtZ0zhIJSAxTHkuN5OzD/VY6fRLf+dSEByoQR
	T1+OB8d6a6vSIhMcoewSbqwTYxXAZzIBKoKQN9XbWuzsHfNpxv4FjRI2KActxeVeRRyiwXONcsk
	k
X-Google-Smtp-Source: AGHT+IFFxDXAmiB4835JX0wNsSNqu2+o3xJ9l2em0tk9z8iXrduKI7NKlIlcZPE8y6hU/3jd20iOCA==
X-Received: by 2002:a05:600c:4f53:b0:412:96f2:2df9 with SMTP id m19-20020a05600c4f5300b0041296f22df9mr323815wmq.26.1708710684136;
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/6] ASoC: meson: axg-tdm-interface: update error format error traces
Date: Fri, 23 Feb 2024 18:51:09 +0100
Message-ID: <20240223175116.2005407-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

ASoC stopped using CBS_CFS and CBM_CFM a few years ago but the traces in
the amlogic tdm interface driver did not follow.

Update this to match the new format names

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 2cedbce73837..bf708717635b 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -133,7 +133,7 @@ static int axg_tdm_iface_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	case SND_SOC_DAIFMT_BP_FC:
 	case SND_SOC_DAIFMT_BC_FP:
-		dev_err(dai->dev, "only CBS_CFS and CBM_CFM are supported\n");
+		dev_err(dai->dev, "only BP_FP and BC_FC are supported\n");
 		fallthrough;
 	default:
 		return -EINVAL;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
