Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F38C5478C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeqMotOJY1Crar3sigj0Ip4yXp+Cschcd+a+Jy/IPRM=; b=fqDavFRHik+4ni
	llG/gw+33t13icgtZzTBHF5gsNUcUzEMBnBUkFCUCKHO115qfmW5zcFEmhpw/G3j73V2hrLIbb9s4
	dgI3FMQ6KPwNn8ewuFs2gSZNTPkA4Etf0EhowoQ3SG4AWqyBo4MU2yzaAyjq2HKUOqBMnh9CS17LQ
	gIyIEN/5HJDbjSjLp9OaUHthLZ0Jg9c4bUKbxLwM8KRfuQM/+6KU5Cu+fakUd6E1dg++5AB6vr1dR
	3DCf0jJhAullFZIBSDScMVF71dNTYlZBLQaGNnuev0fEciEMq4aRJdftNqHsW5Or1rcT7JOwMBekz
	eXTq0Dc1WdgH22hahWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdatN-0000000AxT0-3wVo;
	Fri, 23 Feb 2024 19:07:29 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZht-0000000AdfV-3tjh
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:38 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4125e435b38so4654375e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710683; x=1709315483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2ahiTP/lW6MiTpxUmavX+y9bbyFd7JEgWLGkKtHM5s=;
        b=RGuBGixiHUbBEEI6Lf0IXZnPDXn62RpknWn2RkWignUqrFCgTKbv6duzuFA4NR36v4
         ow+cJEYsM3P4TfqsCh4OzZYoFUzLzS0WctRuxmp7ZDvhCne9KO1vFG90a4ZdPszTvl7c
         dL4VUou8OljDa/eCuspNNpdUutI3XKMopgJCZcrHCvk9+KK3NaTTQfSMk8UpChFuQgnZ
         /jgpCysadeyuRrHR1hxgO9ViRZCgvl3HHJDzDyFxTC00emOyjumoEpiBt4SI02RdufA2
         aaRTvt4uXdFFkkLpcxpCh5Dtx5pE6NjELXO9j6FtTSnObf0qCIG1ur6m0RaYB+O5hv9+
         oxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710683; x=1709315483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2ahiTP/lW6MiTpxUmavX+y9bbyFd7JEgWLGkKtHM5s=;
        b=rmeeTxhLDi7EEHKmjOfTEtz6mGf+noTn6+7iqOuQ1LO99xB9R0AvC5YzG+N9ciqWHt
         pbMaUJZy4DvYwfK+TsjXKXjW3/zDLLs4ACmEFFM4gW5VfM+tQ5S7PXpsm20wMYWd+QTN
         yPFkZfxxaUs5AtdLi2i0ChpwQYu4i0kuV8UU6KyI07o8y4eiaBjV9iuGDtg+Yjf0qZ5V
         SKSiSxILqukN5KiMXf89BWOnSioNsML5DCu3LS3Pf0P43Gslmo/7IiN3k16Crjh8vm7E
         KwJNzrvffogaEzw3pHvLP7rQNkRPAFgP/sMtAqP6M+CfQF8E8gNgVGmPToQ7cUOXMQbN
         dHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQU42WRDHNFGz6KosSdptxDvTGo5lWD/8JSRwOAbgPpP61qR03y38bYImm9SO1TskXJNJuWsCy/6wryRGWWTjZFZzSai+uBzvU4HvicHlyTn4=
X-Gm-Message-State: AOJu0YwiTvP0SHmjebzgQ0J8+CnPsSvCSx8dtoxVNiVJHmdZns6rNj1s
	R8OoVS+JOMBXB6fx5v57wdmJuEL2rEVLercLRB0giQKL+Uf9t1QFMkwg/ow5E+k=
X-Google-Smtp-Source: AGHT+IGqnoqMSxnWyvarUuiuXtt8jg0EPFcrolAZQBwRrHQk3pPFoxvi/xtJ821ZsNJVMnK4y5tzhw==
X-Received: by 2002:a05:600c:5114:b0:412:9830:a259 with SMTP id o20-20020a05600c511400b004129830a259mr383837wms.25.1708710683406;
        Fri, 23 Feb 2024 09:51:23 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/6] ASoC: meson: axg-tdm-interface: add frame rate constraint
Date: Fri, 23 Feb 2024 18:51:08 +0100
Message-ID: <20240223175116.2005407-3-jbrunet@baylibre.com>
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

According to Amlogic datasheets for the SoCs supported by this driver, the
maximum bit clock rate is 100MHz.

The tdm interface allows the rates listed by the DAI driver, regardless of
the number slots or their width. However, these will impact the bit clock
rate.

Hitting the 100MHz limit is very unlikely for most use cases but it is
possible.

For example with 32 slots / 32 bits wide, the maximum rate is no longer
384kHz but ~96kHz.

Add the constraint accordingly if the component is not already active.
If it is active, the rate is already constrained by the first stream rate.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index cd5168e826df..2cedbce73837 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -12,6 +12,9 @@
 
 #include "axg-tdm.h"
 
+/* Maximum bit clock frequency according the datasheets */
+#define MAX_SCLK 100000000 /* Hz */
+
 enum {
 	TDM_IFACE_PAD,
 	TDM_IFACE_LOOPBACK,
@@ -153,19 +156,27 @@ static int axg_tdm_iface_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* Apply component wide rate symmetry */
 	if (snd_soc_component_active(dai->component)) {
+		/* Apply component wide rate symmetry */
 		ret = snd_pcm_hw_constraint_single(substream->runtime,
 						   SNDRV_PCM_HW_PARAM_RATE,
 						   iface->rate);
-		if (ret < 0) {
-			dev_err(dai->dev,
-				"can't set iface rate constraint\n");
-			return ret;
-		}
+
+	} else {
+		/* Limit rate according to the slot number and width */
+		unsigned int max_rate =
+			MAX_SCLK / (iface->slots * iface->slot_width);
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_RATE,
+						   0, max_rate);
 	}
 
-	return 0;
+	if (ret < 0)
+		dev_err(dai->dev, "can't set iface rate constraint\n");
+	else
+		ret = 0;
+
+	return ret;
 }
 
 static int axg_tdm_iface_set_stream(struct snd_pcm_substream *substream,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
