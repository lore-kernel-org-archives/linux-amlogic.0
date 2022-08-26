Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26242ECAAA6
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27u263+0C6wLJWqCwTfm38c3tBpGEwntQuIO+z1kxYg=; b=0tC/SFLVkWJ9m7
	5ayChETzmsG55gPETohgbdpTv0+gEGoD16ru7e8MgsyB6DTiJJqe1bKgloX0TOgy06Jt9UJJJBpql
	STYKq4bMEXHdf2aSpe6bWM+Mkob9Hb9K+CAAD6AT/GCMCxxbZ47LgLPU8ltiejPe4Zt9HhHOumJ6G
	UTw4OcwlKaxZb9EI1V9MzSctWKRJ1tk/bZZvvrI0tF2CivRBj4txAcoCOWnULEkoDQsdya+sCkgnn
	VEYxlo+o2zyIZCplVLPKemojueBU3Kks02MjfSf/dKjqkx+IJfs8pTpCtsv3m0fVybinUYmtT+2qi
	lEQJT8n/yMeJhZLHuerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdJf-009FdR-LB; Fri, 26 Aug 2022 17:40:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdJc-009FXT-HY
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 17:40:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z6so2885054lfu.9
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OTdc27ee6jSrb6BUWefWgtonG87QJUY3qmhGjbQcM9o=;
        b=RXmV26SRp6JLrCtA+SI6m7ulgY5sVdkzCAeNCuwfF+qmPjgknJENdubUmhtapnYta+
         P4aEeukQwfu2z6s2CP+hHyAE+ft4N9uWPhv1Ta84x/KsOCv2WYmyf/B0E1PsBMuBw0xZ
         Ci1aPK9D7DPbsAczrbVCmb/2govUqFOBsZl3pnsa0f2tgsUYsBD5PtDBMCBg31Mq9B5o
         DjgFFcKZxBq7D8nA9vk5bPvVgCexttrcbYrEqa8UEiRDtn+SLA8kS+O5m6utB1NZqYqx
         rvuAWtnj2uZkTETPDZ5G8G9uuCaxFfW9vRm2XAH+uTPfCWPY8Zrvwvl2ilH/uJn+yBhk
         yJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OTdc27ee6jSrb6BUWefWgtonG87QJUY3qmhGjbQcM9o=;
        b=d9Ekt/Ond1we/88D7ft7rV3/LB4GjNu4cewRzljgthGQ8x2meq70ztjqZh3m13BeGp
         xIaRWCUeOiNtoZeiDCLU9Wc1ngDmtLQb72V2V7VIVjF6cCOHu/iU8ESzyK0FBDyin5SC
         crOYlu9mRVyEcIq43sYWaPDWo1SNKE1Dw43mVbbUzokRToAPKgnNok48y9rHYOwEK/18
         wqSROhq8sB2775Q++AyPIaJrtSMeJYpkARBf4r6Z0NmPGUQHbd/Sy7C5DmGCOGjTeunF
         w16svKg6KXvRhj0D8AjeDbgHQhHTpXxZtPmKgHtrkhrgJLUrueLtS+IDF+XiVuMTj+tJ
         WdNw==
X-Gm-Message-State: ACgBeo07rnDNuXInoIzYbMfHIppQxxtY141L52zv7exBNebNhSwZw8uK
	HP2PS+pstWKxIo77jTTvjGKH9w==
X-Google-Smtp-Source: AA6agR7LN4RGaM5qPxnsCAzc7OIKFH1FnfWKbhbLHWggszDp6UWrWAHHSAubsHoPD0z7IhpDHQRdpg==
X-Received: by 2002:a19:9149:0:b0:492:cb89:ecc4 with SMTP id y9-20020a199149000000b00492cb89ecc4mr2619171lfj.447.1661535614991;
        Fri, 26 Aug 2022 10:40:14 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24e8a000000b0048b08124139sm431721lfr.177.2022.08.26.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 10:40:14 -0700 (PDT)
Message-ID: <fd2c9ca1-5ff6-3c45-fc10-90167c413061@linaro.org>
Date: Fri, 26 Aug 2022 20:40:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] arm64: dts: meson-s4: include meson-s4-gpio.h
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220826122338.2452433-1-huqiang.qin@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826122338.2452433-1-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_104020_647843_39A2E550 
X-CRM114-Status: UNSURE (   8.16  )
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

On 26/08/2022 15:23, Huqiang Qin wrote:
> In the future, meson-s4.dtsi will have some nodes that need
> to use the meson-s4-gpio.h file.
> 
> e.g.
>   * Bluetooth enable pin:
>     bt_en-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
>   * Audio mute pin:
>     spk_mute-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_LOW>;
>   * ...

Then the header should be added when the need is implemented. Do not add
unused headers to files.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
