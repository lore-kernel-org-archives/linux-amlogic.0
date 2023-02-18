Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A2C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4b24tgvbN1QinFVtMVOHEOWiSE06Tqi3FeaazLP+j0=; b=JJI8VIHYZXR1ek
	eJfHECJIJLXvmQXrVPUDDDCJRsH+qhwNWEjln06etPL0EWsYUrXf0uBhUPOZyke+NAINQcs36M/0O
	0dzSDkL1bPzA5C7Vqk9X3HX827miGtg+3SU3MO+THQsD2O2IpziQhX+FObZ/eiMfIOl1PvgJ2KuDW
	7Rni+cABkUZSiduk41xnUa+3ua+u2hppGyWh32BW8zjeuszIp7mUzSQjUzArW8lgWbGrujg9MeaWC
	M9qEFuCvqXE5N/rqyZzLeGK6hIuJ1dEPILy8qCs0UrqY/c+Ne/3HWtLIlidAVXooQ1HjyVfLplYAT
	LZZIm2hXhk70F0qhw5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUJE-0006D3-ST; Sat, 18 Feb 2023 20:59:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUIt-00068C-9Y; Sat, 18 Feb 2023 20:59:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id fd2so5346181edb.2;
        Sat, 18 Feb 2023 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QTO9PpApH85uzwvnB99HB5hu6zu/FbxafdLqyL29Co=;
        b=d+ccR/0D22hSA5kCVrSjDpZIOSfgkYctT3r2H8LEPv5Sv5egD9jlKCfSt8ALY+6wPI
         Xi2vsWD0sHItyC48fZVquxpOUnsiRll6ZOBc/f/CMw+t4N0hX5TqqpDhPYSFh8eNfXnf
         evuZDeYi8/fgFpvN/fZCFfaIn5HBB+uNxmz/316Fb4g1jOvt7iSdxRoJncXjTTRtY55f
         0TL2uIMVHWzKa8I1qACp5dGDXBFvohIMcLnMDwjnOCeR3y/Vmrb1TweKvilO7B2PE67l
         Z+TnCG5yFHEIC0WnA0mL4W52T+7qniFvmpVdcD6Re+ziHouevcp8xbMQfp6CWtnT6Gja
         NHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QTO9PpApH85uzwvnB99HB5hu6zu/FbxafdLqyL29Co=;
        b=rJx4F3YbMFXfcwqQcYo9le4sklG2bWlWpkfKB9ifeQ+zeoqKlqSU2Lq1YhiKkw+BfY
         SK/8yOLC8dUlZ/2eK4BMekX97YExtQ7Hx5HgQGVMnCKiUMNP6w2bKPihNSzZmbFa1KgG
         y7MVXqlvgQ8S8XsRJyI6QTDi0Te4IclIwmvS/hwQQXgYenjKnkg7+mdy7RladNWpSiba
         lI5E8MHjArF2yguC/5Cqpd8wvAjLQCwbY157sWmiUA6pXAJJahqRAEWX+Lm3F1Ok/WwG
         pZAGoD5e4Hk1zRUahlP/o6KnzBUUhkt0rwnd3e13noN+JBOaiBLToX/aoqgcOnPehlK+
         DEqg==
X-Gm-Message-State: AO0yUKXndORgF1V2JTLzot/licapyihV4x/j3J6KjbrJ+v0GMHuQur7p
	wfhSV607mgguPzBJUtXxqPU=
X-Google-Smtp-Source: AK7set/dc9CZIosai3n1UIgyVUHTcMBDJdwpKTJKT2OsjIIjpXeznyAsfrrChlPzNtdR+d71IHx4pA==
X-Received: by 2002:aa7:c2d3:0:b0:4ad:7bd3:bb44 with SMTP id m19-20020aa7c2d3000000b004ad7bd3bb44mr6597778edp.35.1676753965050;
        Sat, 18 Feb 2023 12:59:25 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id f29-20020a50a6dd000000b004ad6e3e4a26sm3628583edc.84.2023.02.18.12.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:59:24 -0800 (PST)
Message-ID: <08fa1416-8786-b442-2a45-0ba669992639@gmail.com>
Date: Sat, 18 Feb 2023 21:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 1/5] hwrng: meson: remove unused member of struct
 meson_rng_data
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
X-CRM114-CacheID: sfid-20230218_125931_366753_D3F5486F 
X-CRM114-Status: UNSURE (   8.34  )
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

Member pdev isn't used, remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index 8bb30282c..e79069b6d 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -18,7 +18,6 @@
 
 struct meson_rng_data {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct hwrng rng;
 	struct clk *core_clk;
 };
@@ -48,8 +47,6 @@ static int meson_rng_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->pdev = pdev;
-
 	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
