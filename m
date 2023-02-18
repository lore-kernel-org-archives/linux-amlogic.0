Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60658C636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4vL2dG5Rcuo1xdKAOJWVtQRwsLU2PrQ0L+ClUCicZ/I=; b=K5+5cad3PwjCNJ
	5PR3/vxtZGvVxAFR7QCmY8Y9AWWFMKsGvuCDBDQYmRCszPCCgNSTW4C6GTLcSjk3yICV6+ORu8Hdz
	7JEGaZFDIaxEXjSyJAKbhqRWWrKyA60JtwSuLkMijQQJoayp9zE+tSw7Sk6KFTeK5BuTA/YrwzJ+D
	rpRjAyAGrQK9KBnH7ritU6IhXvfRKezxRf+WlO3ruTzD2X5B4XjRIdM9LTcYXlkK50p2cBoNuPumD
	zru16US7HQgVsSXSiAdxQ4hXX4+4AHY93m024VkS8qoXDdVGoTJwgWSkwslVhCmgAHF2HkjYLiIT7
	kU4sGJdR+W+WNbR8JzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUEQ-0005dp-HC; Sat, 18 Feb 2023 20:54:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUEG-0005cO-7i; Sat, 18 Feb 2023 20:54:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id k5so6362818edo.3;
        Sat, 18 Feb 2023 12:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK5XEETTVTrrZxEXTasy9N6PvKUYlU5HJFHeLYnilDY=;
        b=bgN1ZBgDxVMQ74YqYyLeejoJGAfXJWiG6E1QljPwIK37cc6Ks0jInr/6GMjvsz/vRN
         fuiDPSLEQ0KEZVhZDv8Yy3YUOgOQrFplESDSa9rO3B4LYrk1FTFmJvy+q2RJ9cJZHrD/
         x3K3BC8QXwK638msOAT05CKBcwMrBiTbAtuBrkXDmBon9PihpI3JKGLlRRPay/KZk6ua
         ZxphAjzcG+9r6de0njRaecCez4K4Kb/1aX5KG55oQUlpwkQr5erurZLKHJyK33LTYyjC
         dMolSFSf6AqlRrMiJWTnUlV+U3lH597tZZE77P5XmH7J/nglxU7ppdQnJWMZyZgoO7eZ
         QG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DK5XEETTVTrrZxEXTasy9N6PvKUYlU5HJFHeLYnilDY=;
        b=KZvAI52XRcLPi80u9/wgQQo/e7anTufZDocGIugXqtkLQOG0j8/PD5IUOkIHbIcs6e
         MznseZ0pCmhvNrgz3dsmRQbx3wPt0rSXKMH1lTKYHBUpgC91b//inz98KvBz9KMph2Y2
         GACRZSC1taRFWyHQkH+E7R7e7CpQPIfXZhzVLXaYz/H99FZPRwy/wcUFC6JuStRCao/9
         JA7axB+J+ASMlXK/H3Fgqps0LUITRZ8FlURHTTgAHOuIEvCvha78ceSjMPrP/KdkVWds
         HWg7dleizrvs0DhBD+zbaunUA3PeapSgFxjX9Ax11b3Lvl4aPAsAYpj3rymdWXnjvCFX
         366A==
X-Gm-Message-State: AO0yUKVPYs9mZFPQkbfNQdRaR81gY6dMrXJveki5jcrfp6NzCetqed/8
	alWDQwTFvj2nLkBjrZb8s2c=
X-Google-Smtp-Source: AK7set9TVw3NKqj7ql+AjA4l5ud4fcePLJrEyibhkJI49/wU6gke2X2p9ZpVBXzPNT8A8c93MhkoDQ==
X-Received: by 2002:a17:907:d305:b0:8ad:d366:54ca with SMTP id vg5-20020a170907d30500b008add36654camr9917600ejc.23.1676753680736;
        Sat, 18 Feb 2023 12:54:40 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b82:af00:2955:cfd1:cf55:9ea? (dynamic-2a01-0c22-7b82-af00-2955-cfd1-cf55-09ea.c22.pool.telefonica.de. [2a01:c22:7b82:af00:2955:cfd1:cf55:9ea])
        by smtp.googlemail.com with ESMTPSA id 23-20020a508e57000000b004ad7abf007asm584765edx.74.2023.02.18.12.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 12:54:40 -0800 (PST)
Message-ID: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
Date: Sat, 18 Feb 2023 21:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
Subject: [PATCH 0/5] hwrng: meson: simplify driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_125444_308398_85BB2419 
X-CRM114-Status: UNSURE (   4.44  )
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

This series simplifies the driver. No functional change intended.

Heiner Kallweit (5):
  hwrng: meson: remove unused member of struct meson_rng_data
  hwrng: meson: use devm_clk_get_optional_enabled
  hwrng: meson: remove not needed call to platform_set_drvdata
  hwrng: meson: use struct hw_random priv data
  hwrng: meson: remove struct meson_rng_data

 drivers/char/hw_random/meson-rng.c | 59 +++++++++---------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
