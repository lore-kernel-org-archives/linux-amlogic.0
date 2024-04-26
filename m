Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6D6C04FFE
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcLoz/asyGJ2yUhKocn7VwrkBO9WmGYJ2c8NNvmBbZ8=; b=Xf81pmzjsy4jHT
	9qS6udSDVBfJaxIo4f8t6TVLHQx2j2P3OxtO/g+Aira/geJr0AM4Y2hWGs5YPnZGcDkfSotN1EIaj
	tz9gANeScqUaZiJaRjWKd6e0RR8pb+FsltJNR2ccQbXR7Xpkf2b355/6ZK7ADH4LxJy7JVH/g/p2R
	ljKNkQd6z84/5u9DNrdKt48kxQLB3znHVaKWJ8zPgEhjfC0REeuwrRyFIl4ASC7eiDiotUt8DtWFj
	3BtUQhopiBjxfltV+uNveaNwvBR/tfYT9daJ+uXADZS5MO+4InOrsx1EqfuTGWfEUsttWgeB5lc/1
	cvmHNIuO1u53EwPxJVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWV-0000000D3HI-0l7b;
	Fri, 26 Apr 2024 15:30:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWQ-0000000D3Cr-2cTx
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 15:30:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41b79451145so8326485e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145396; x=1714750196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj88fGfTuV4/ceY0CRDNjfucEqH3NJ0Iz+8z4tgOcCE=;
        b=XgRgQepP+exdRu6Fzy9ZuGsdsLWS6JASKMF7pati5RkADOtfT6qe5pga7prR3nzWdn
         cJmQ/lrcs12v0hoFSqf6vNJ5g1w7fLP+4B49QcWjdac/KJHSHzRAIBWrywjopd1eFFQ8
         9hj8f7rQz3QefZv2r+l5lc2BOs3/jQYIuhh7e2COJ2wlx6dHQ5TwyUxrpJFnzX28zuZH
         R4eA4IaASIElBTsYpy54nlprfui4wGKvGv9uqRogrfPdCME7LL6yiHJ7w8EvTNzHmqQi
         orxN0gkOJXjD9x97SWtmsw6shRzk8HOpxDzwkr2z4LKX/K3Ss0B6+dET8dlSkhYpS+9U
         AIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145396; x=1714750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj88fGfTuV4/ceY0CRDNjfucEqH3NJ0Iz+8z4tgOcCE=;
        b=uC3qxICzejCs+2zuJXnLP6rIRghvGcMK+60GYoOXdSzLYCOjLzjMBqP2Wh4CT3KymO
         OlCJt+Y4PcExD3x8VmlDjG8R3l28DjGFJ4eQiCA+o4gZEOO5mFGyUClIsO3t61PVWafR
         QRe2ugUxDkHAZUbovqibplxWB23pPNtKvjssuAhl6w7wGPrMbxCptgq4jpxdazl2uloq
         TbgxsQADhhNEzsGLg8NjnBBWGZ9RBTcm0yuZEJxacmScuQx630hh/f1IDB3eCQwRd1UO
         ifwDQHNNp6euKhKtaUV7pgPb+4+FvKRpqBzB8l2X6oDjykAFlwAbwjQrkIzRavZq/Asa
         P86w==
X-Forwarded-Encrypted: i=1; AJvYcCWUsCJvEmM88onK/yl2HN2/ounQgYFmAIL6ENzF4Djk0atggKBvcPB6GYcl9JNiA/sB4JqkS+2WSxojTrKA9WNvEr1pWv5BAl0cqu9NMpTM+sU=
X-Gm-Message-State: AOJu0Yx1J3S13u2iLX4aIYG1Izgj8Tx+QB9M78NhLxFia5Yzy0yeKk4K
	I/fb0ofOY8RACFRQ/OHQq/I0cfpaLADF6l4s4veinS2IVEPziBiklh1no3NDye4=
X-Google-Smtp-Source: AGHT+IEJkZy/zcyYjS/mRx4ZV80tXFjeoyE7of0nB7BlzZ+4FKV/1yBAljbeQBu73IdnjR2X5uGAvA==
X-Received: by 2002:a05:600c:b88:b0:418:f991:8ad4 with SMTP id fl8-20020a05600c0b8800b00418f9918ad4mr113607wmb.6.1714145396564;
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/4] ASoC: meson: axg-card: make links nonatomic
Date: Fri, 26 Apr 2024 17:29:39 +0200
Message-ID: <20240426152946.3078805-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_082958_701772_1A88DFFF 
X-CRM114-Status: UNSURE (   9.00  )
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

Non atomic operations need to be performed in the trigger callback
of the TDM interfaces. Those are BEs but what matters is the nonatomic
flag of the FE in the DPCM context. Just set nonatomic for everything so,
at least, what is done is clear.

Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 3180aa4d3a15..8c5605c1e34e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -318,6 +318,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
+	dai_link->nonatomic = true;
 
 	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
