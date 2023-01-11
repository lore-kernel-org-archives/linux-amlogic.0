Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A1FC54EBE
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 09:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15/ufR8XxLpDoZ8IKkb4BiotQ4DsxxZOe08tE1qRao0=; b=xTGVtlKuARYgUsGTi6InuwafID
	beu3qJk2SUpyQ5hNwpKfhT4d8fmEHtgUOto0N3O/YnxqYzf8BJFsCyMeYq5wAlxH8toYe/V8nXONM
	DVvxKtZRd/a4xozcK4NZojpxwlIpWIx0PTGWgUAPruFpfjqm91/qvDEY7eEcgRCUVUOwwBcBfmowH
	iuhaJeuluairL1swRMDH1y95oVR7t6chmC7scxMiX/4Obs9nsyt5kKEj01nTMQVUWu9NWujooiWH9
	A3Uf+uJo+TvPnp+qNy6e4ziXF5k2+3AMyhNs/ChyZikjp+HGawtQmuF41Yo/LP/A1WxJvTGfaDQue
	uv7uLESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWz4-00ARkr-IZ; Wed, 11 Jan 2023 09:01:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWyf-00ARVO-GK
	for linux-amlogic@lists.infradead.org; Wed, 11 Jan 2023 09:01:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso12084558wmq.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jan 2023 01:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UIgNk4h0ykNf4W9R10f+g8s9MtlXPDlZWGID0CLp804=;
        b=ACz2pUEAplUyKMwahar14IEYYnawh0ar2G+KL0+AdO+fXKDb6L1+7Aq1cR/JhRxMxF
         mptt0m7OE+hHLEPyv2GGxmbq78+4PKJIg2OU+Et0ss+4vM4s35EB+0jdnp7VOr0n3o4Y
         sVNrXDS1NCtl4llNRycijVOG7GqCqJE9sTXrkMnrFCkCNHARqK/VingD2ZFf2CaIyh5R
         BkUyz70LPfPlxaoLoSrL9Eyv1OPob/snhvTSgSee+4oBHoO28UzKBMYs7qZmo3PKc7Oj
         TZY7YEEZvny5IzPNF2MZFoR+8B8dExdbws1pT2JocEc7BXwbvR4fsYcDcyxTp6JjTglr
         yNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIgNk4h0ykNf4W9R10f+g8s9MtlXPDlZWGID0CLp804=;
        b=JZkX7M0HWPge2zuRIgx9uPGuVCnRGvdMq6ppAxdFmCoEllX+LTzxxNbj7dE6CiuNK5
         hAiK2qwCyOwr7yjVKQKa7X8+NUZMmWOL6qkn9OThVGuBKrcgIUtYFP1+AcKW3vOj9i5K
         B/3s/ktp2z5XNETo6SsxMEYgtBdUPUGKidwBLfvTNvHansJh92pXuXyH0aqhS3giDWpp
         5uooPRIlKOHfd5VIsrlQLeY76gE3QU4XEiGhYfGJ1rDxeuX/xRTI3CnSERTtf8oiEUqm
         fx2snQWIYZNFG6rCtBRjZnI3vPhus6/Gp5XxAvC+tZsnswpowW4HE75pxZtMak3ArsL1
         ePWA==
X-Gm-Message-State: AFqh2kpNlKIz7A3O2Rgw+le6yDqLB1NGcjjuFWZkPH0rJWVqNbvKpPwt
	QCGObK50ooEspoGBSzHq8J17RA==
X-Google-Smtp-Source: AMrXdXu50nuURvF/uZXf+xmLuSwesdnOY8E4IcaZoYRp8Au4jWUve2YDc0RJ8X2U2aelNYBfkHhv2g==
X-Received: by 2002:a05:600c:34d0:b0:3d6:b691:b80d with SMTP id d16-20020a05600c34d000b003d6b691b80dmr50949988wmq.21.1673427652953;
        Wed, 11 Jan 2023 01:00:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5? ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
        by smtp.gmail.com with ESMTPSA id o21-20020a1c7515000000b003d995a704fdsm17507540wmc.33.2023.01.11.01.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:00:52 -0800 (PST)
Message-ID: <08698c06-49b0-1cf7-efd3-1038104972cf@linaro.org>
Date: Wed, 11 Jan 2023 10:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/11] dt-bindings: first batch of dt-schema
 conversions for Amlogic Meson bindings
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20230110152324.1e19974d@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230110152324.1e19974d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_010057_562449_863C8A8C 
X-CRM114-Status: GOOD (  10.18  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 11/01/2023 00:23, Jakub Kicinski wrote:
> On Mon, 09 Jan 2023 13:53:25 +0100 Neil Armstrong wrote:
>> - patch 12: added reviewed-by
>> - Link to v1: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org
> 
> I'm guessing patch 12 is patch 11 in this posting.
> Should we take it via net-next? Looks acked & ready.

Exact it's ready to be taken

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
