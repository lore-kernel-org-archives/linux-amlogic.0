Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D5C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zcs5dsNftp+7yAxFW7RCyIvEs3xfi8EvAmw5htYERz0=; b=p9FkRbQsl90bL0
	ArodMqJiRXW0XHODY833h5Nqmxq5yYgJ+aaPQZhceGO4hPU6PtD3UlkprLQK+Yom+IsCDzV1WWZbq
	lq3e/8DA+hj5ccQt66CT4Z4Y8YfyFg1JVqdSun8yo+8h0Evuq1TeQPUDlQPKw//dVqfpRErKUnm7S
	HD2KpuL0Uvg/JridabEjaOvWuyB88yOeI5PQUzAgSlsrL8W21dn3EVskHSgQRSBmsBwKqNrPAgCk9
	fnzkD+rC8C4voss5SJY7j6gTo1xa2VN4SHIkNocLPT1Lok3iZhB+yfQQ25/9ilc3ZrZBaV73/n0pk
	nk4PRlLUjbgSloQBOplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Lq3-0000000CgPt-1P26;
	Fri, 26 Apr 2024 13:42:07 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Lpz-0000000CgP9-1kV4
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 13:42:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-518a56cdc03so2457105e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 06:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714138920; x=1714743720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZoPAqs/FsSRU0VmqAIyUDeL5k+oeAlm1vs0Pwv/KPc=;
        b=Lbv9WuM6VamcVXAq2gNKkcMv9Cvbq8XlA9fXLinLxpaSLbWlu2vqqNrN9szuCLPIa3
         YoiGIbJ8QOBt0zaR+f6iikyYJ0SUrvWxLHgRN8ZTMESK0Tw3jZWu9MM6ojTpI2X7beD5
         L1+S0F9Dr2y7Q/ulkecR/r12k4vOuIG8xtKZYR6Nn4sbbTAPAuo5MmlCZOYEhHHqymYj
         DXbiHl3UZbZp6q0LaxcnP+z2o4MW3hHK36nJieHmY9yFUF5oSEYKJmnoDOYCJvheN2kC
         Tdp+GT95yyGkoagOlXKV3tpfExBqGVHWDyMpzbYtZ94tZwH6lrtHD0KQPi87oS0xPLaF
         8zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138920; x=1714743720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZoPAqs/FsSRU0VmqAIyUDeL5k+oeAlm1vs0Pwv/KPc=;
        b=OX6DIYq6O7hDy4TzWo85zRUTdbPdUV+tLhDSih/t157FurPthW/dku7EuL9GNcVZc9
         M6bDqLG9sPf+BMePG6dTKZLb62sddVvRzRDJ97J+bhvOhvfvudckYL+8raeQjAejcw5t
         ayROS8lsf4O6u/6ar8cB52ZrcAeVGbTHzNExrYJ6hW72fp8FPIVWZj0C/vfeqQylgzz7
         QcTYngbpTfdBa6EHeBovOlEAQL7t1Epb/tHdF5hkM3qSOLOVEeINSV5m3qLI2V6wNtDC
         fLb2pErqro/uxNXfC1FGpWQmg3tt21Inc4szxX6/aveXKA9GwupGr5/QLqMDWfTj7bT0
         W9dg==
X-Forwarded-Encrypted: i=1; AJvYcCWcvWvF3JnYjN6PE2/A+w+cAmozaGjfA1sohMruTWewtCXQzkT2pNaYinUZUayk1X26iNdz2VCyVkSgA3KorUXgVDFNi/aHNF3MFFRXSaN5WQQ=
X-Gm-Message-State: AOJu0YxwtcdX6isxGHV1HxgZN9PBnz7jAWGxmdYn97I1Gx97MeTjf4Q3
	TyTSz4EJmBSDrWRnVbEh2pSx3m+jzRf+3VxzMhDf6Ozg/82san/QIJScW6A9yzE=
X-Google-Smtp-Source: AGHT+IGPLKZcerp3MvuJR5uN1npoHSmtLy+7WTMWioCuEvXXFNm30DQl5IWvmOoTb1lmO9LmLUtnzw==
X-Received: by 2002:a05:6512:3609:b0:51b:7c36:da61 with SMTP id f9-20020a056512360900b0051b7c36da61mr1513968lfs.56.1714138919541;
        Fri, 26 Apr 2024 06:41:59 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id jg1-20020a05600ca00100b0041b25a70a85sm7558852wmb.30.2024.04.26.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:41:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: cards: select SND_DYNAMIC_MINORS
Date: Fri, 26 Apr 2024 15:41:47 +0200
Message-ID: <20240426134150.3053741-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_064203_577182_EF5AE80F 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Amlogic sound cards do create a lot of pcm interfaces, possibly more than
8. Some pcm interfaces are internal (like DPCM backends and c2c) and not
exposed to userspace.

Those interfaces still increase the number passed to snd_find_free_minor(),
which eventually exceeds 8 causing -EBUSY error on card registration if
CONFIG_SND_DYNAMIC_MINORS=n and the interface is exposed to userspace.

select CONFIG_SND_DYNAMIC_MINORS for Amlogic cards to avoid the problem.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

NOTE: This problem was found while toying with a minimal configuration
which disabled CONFIG_SND_DYNAMIC_MINORS and DT overlays. Overlays
prepend nodes instead of doing append. This changes the order in which
the links are parsed by the card driver, which in turn changes the pcm
numbers. The userpace pcm number then got over 8 triggering the problem.

 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index b93ea33739f2..6458d5dc4902 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -99,6 +99,7 @@ config SND_MESON_AXG_PDM
 
 config SND_MESON_CARD_UTILS
 	tristate
+	select SND_DYNAMIC_MINORS
 
 config SND_MESON_CODEC_GLUE
 	tristate
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
