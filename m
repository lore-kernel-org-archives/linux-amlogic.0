Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D83FC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APEh/G4rKvtxYUyKAuTTokunL2efcOg4mfiVIBfEbV4=; b=s9cfeLLcoYkHM8
	FI/z/dyKCZ2Kzh11vK+ZeABeGCPy/iXs+lu8OMsKvXAoCNarvimImm/JoBesiXS0eBC99C4PKZEgz
	szJQOwFzRH2r0InxQE4X8V5AvKcBkGTI2yWBhEA4ee1lXu1I+GAkk14GJch2BvQIpH/3LzJjSIql+
	sV5DsQbis+qEVvWVDfEYh/bXUx7dvwbYHa+Ez1dVHYMPhnU6/F00X8JnzaWcENtb41vPq5j6j3mhX
	hz96ITbMZ71x7Q6iAHO4unhybuiJofnw75yoZLbNa7jotSiggSPXaMYy0bfO/66v7X8/jrRrY/ZuL
	0zLKplsZG8i8stMYpGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8Qf-005o3q-0E; Mon, 21 Feb 2022 13:08:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uk-005Y6W-HU
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i19so9376365wmq.5
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WbusBDevTL0id1+rC6qLSGi8eX9Tec+0gEdUp6beE0=;
 b=D/T2RPldzgpWaePTaWvFPRInmTGPvf5JQV2GkaAY4ibltSxUGvo267U3iNBvxTTNVf
 oXgkIEryAs8WFCi8dNoB0wHLcM4GAuZ02L1fSj+7wu84dKzey4l7F/ctcAAC+8Tncay7
 2DXF7IOzXCF7JtZvr4rWoTOGYLmmotDBg/0Ij/PUQeZy86dO/RFVogFYAwxMuOQrAOjb
 FnDjxhbedsPEUBohewERqQvuUbkUKCqoQjT5JTMxy4ZbonuZwrfYj9TLXXW8yPeacSZd
 sOOx9U/UEXhXCV1h1mX+Mqz2OFFhsMbokU3w8p2zTaJOAngv0/lpFrKLeZ+Dg7U7rU3o
 LrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WbusBDevTL0id1+rC6qLSGi8eX9Tec+0gEdUp6beE0=;
 b=Gh1hcT6UGzPJFOtDZpR991iX0hEf5roCYkaskRzG4IFhInEp+Wz8QoC9+Rst3wqIla
 YsPqw1fw5IcLF6ZY8D+xIheSR6Kr8bY7hrrN94UKtfUh+rnT1Z8Ayf1rnF9qtp52n38R
 QzBeMSWahuJ/fDnbOIGitI4hCPpD4bYy//8T9HxUwNvjHuMX1C9Saz5WHGCIIe/tJ7Lp
 PAA8dELl02nwtJvl6mO1r/ZuEVylG5DzDGzhSkBCzGsZXdcdqJJ7xAWl0MuPnR5KxvCO
 566kwDmxJ+S4Q0h/uNeKTyhxj4yYEprjMK4A9PtO6mh6S+dtXWY4dkKqUHXppE8pLc+2
 cd/A==
X-Gm-Message-State: AOAM530EEf4d8jhuTtFr95uuNv/T2heorS3g6eXuU6xSZp0ZdaVGJZ/B
 MiUDsD07CtYqhwdyO4dqLKXTpg==
X-Google-Smtp-Source: ABdhPJyA8PlOfDHHxH/OqNVLLFns7QOhkyM6XRROGBV6oQogaZvQ9JL5vuO0S3f6KL+yexhcV87zBQ==
X-Received: by 2002:a1c:7c0d:0:b0:37d:1e29:5cc6 with SMTP id
 x13-20020a1c7c0d000000b0037d1e295cc6mr20767654wmc.31.1645445324664; 
 Mon, 21 Feb 2022 04:08:44 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:44 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] crypto: engine: check if BH is disabled during completion
Date: Mon, 21 Feb 2022 12:08:33 +0000
Message-Id: <20220221120833.2618733-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040846_700595_87AA2C1C 
X-CRM114-Status: UNSURE (   8.21  )
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

When doing iperf over ipsec with crypto hardware sun8i-ce, I hit some
spinlock recursion bug.

This is due to completion function called with enabled BH.

Add check a to detect this.

Fixes: 735d37b5424b ("crypto: engine - Introduce the block request crypto engine framework")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 crypto/crypto_engine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
index fb07da9920ee..6056a990c9f2 100644
--- a/crypto/crypto_engine.c
+++ b/crypto/crypto_engine.c
@@ -53,6 +53,7 @@ static void crypto_finalize_request(struct crypto_engine *engine,
 				dev_err(engine->dev, "failed to unprepare request\n");
 		}
 	}
+	lockdep_assert_in_softirq();
 	req->complete(req, err);
 
 	kthread_queue_work(engine->kworker, &engine->pump_requests);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
