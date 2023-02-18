Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C9C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL75Ef8MueFukvvt0Tj8hlAl8mw0Mxvv8aYd6y66GCc=; b=LL8Z3RmQLjNxS9
	ZOMfM/ctmzm8CgJf6JAcv2KXExSyRpfab5JDu34lWfkaBgrX8eE2jTnWSeBPQLCe1rgMrstpYcWBc
	31brkYqkX1PQeJr1pc0HAR6umtMZY/ELhGlwL1A8SWPhSj3OnTv27lrNB1imAXdb1AmwUYfItPgGj
	aamIHbH0+5kKs/0VBM4Dapv9al6or3J0sfKsqOVeReApHucgCZFSeyEWlUVtkGHn2Oe49KoPK7zhF
	2l2QYObxlQYKdRsymMWU5QhZrjjgIYtZ0mmt0zDAQbV2FnRV/3r6fIHLoW1MCg0IgqRd1l3mD+97N
	Ve4J5OFw4V5uQKmnJgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUJu-0006WS-Aa; Sat, 18 Feb 2023 21:00:34 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUIv-00068N-OI; Sat, 18 Feb 2023 20:59:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id fd2so5346459edb.2;
        Sat, 18 Feb 2023 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CdgShzJsLfglTo1Xd8hw9nnwHbg4uyqhCM3K/USB0M=;
        b=J5nWCaZqzX/ZvFVcvj2Aiyl/2tE3nKuC6Cu1p4AccJHRmqBjypVHdWoXGMN3bU/WL3
         Dz5ZUwBPcqm7BJhvP1pJvWcjckmmTYrwSP4RZyACmiam65fA4utvDdcYuFUpC46nKSf5
         5nZ0DdBF7LMKduLKy9vVUZDADy1w+CPcM457qH2SzJompaBGiMEewf2vPD1BVqEmygQN
         E9B6RQ80LbJwLS5MVgl//+XaEgJGCcjZ6tQHO/HDdKTEJyP2y/KOTD9g2ft+k4I2H5fG
         JvVPoQGrBSy3xNjakAjnsh2jNwvVMBacVnv+B0Rgmck66c8EXb90n1tg7bNYXw9KzHss
         RESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CdgShzJsLfglTo1Xd8hw9nnwHbg4uyqhCM3K/USB0M=;
        b=znjFVMDYFnbmqUZ97rF1aJwkyfZl9DIEr0Xxc4G5J7FxStB+vuogCKqgxIp9OLTvpM
         wnpPC6eA86XlwFNRI6jGzP/SwCkFh0fph+dXqopdhOQBEkn67HI4UUP2uqAwS5LcckXn
         voJPEVBvJf8mM+Cykp8OJBLE0BEOzEQXGHhnD5rm/cvp2enQOauflb4AWFVdaBT5QEgZ
         N9cF25cbkJ0VO9TNlwQHJzYM0bfCFF9BbhkgJZShLJokcfF3qr7o2NEfz6DOO1OzAUjX
         1fVg7E0YDEafMzBIQvqNMdHS2JL06pSXxmLR7hdZ2moJ+b+vKML9hTCj5jOPgZW8myis
         zczw==
X-Gm-Message-State: AO0yUKXEolFhESP5ZbaDPDdUr72TNmQrtNQZnLb2yq5rxTFpZin/Ma/1
	1tPrMYY5erEhTWoN9VjeE5X0Ver6qss=
X-Google-Smtp-Source: AK7set+pVqKO0qtR2rjMhz2whJ4ZFXhhPKg0n2vy/N4o4SSV+VoJpI48u988WW+cuxwn7blOgg6xFA==
X-Received: by 2002:a05:6402:18:b0:4ab:4011:ff3d with SMTP id d24-20020a056402001800b004ab4011ff3dmr4876606edu.0.1676753968290;
        Sat, 18 Feb 2023 12:59:28 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id h11-20020a50cdcb000000b004aaa4da918fsm3983907edj.45.2023.02.18.12.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:59:27 -0800 (PST)
Message-ID: <7d1fc713-850d-d9cd-3fe2-60fd690f406a@gmail.com>
Date: Sat, 18 Feb 2023 21:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 3/5] hwrng: meson: remove not needed call to
 platform_set_drvdata
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
In-Reply-To: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_125933_819490_28526125 
X-CRM114-Status: UNSURE (   7.43  )
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

drvdata isn't used, therefore remove this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index 22e3dcc6f..a4eb8e35f 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -53,8 +53,6 @@ static int meson_rng_probe(struct platform_device *pdev)
 	data->rng.name = pdev->name;
 	data->rng.read = meson_rng_read;
 
-	platform_set_drvdata(pdev, data);
-
 	return devm_hwrng_register(dev, &data->rng);
 }
 
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
