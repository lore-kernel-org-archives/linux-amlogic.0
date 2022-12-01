Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9CAC43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1+bP1UCCQjBQETJwbVQjiIfMrqmc2DFI9yZJ/H7Uqs=; b=i0b/FwK8xRmDRXeSmQ5FCwLK5i
	kscuFTjaHNrbwC53zyqfUk3YUnHIu1EptSyjfGpn9UGEUnx/aCPvaCT1yf8NmHWQ7FHEbmSkJQ10s
	7RtAVZEy3XPnWDxTLEJwdxiA5qzZTKU9okEpq8uOPDg8u5kh3F67nQxLE9NseSzVeklpNE/qIECmQ
	u6yYYZalCnTzjrPkN9rMvD/XezaslyVDWB6s8sX23fFSNESve1zjvjbDk+nUs938schU1x73Dwako
	Y7ON/TsvX5zBkSXlUZ54ZsntEPqb7t02lKGzHmxCXyCG6FO6haMxzyWjUm/7hOPqLoOdmHp0NJQu/
	bQBCM6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0epx-005oHP-Jt; Thu, 01 Dec 2022 08:22:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0epv-005oG5-7n
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:22:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id h12so1415904wrv.10
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+mR6HUSlaN8hS5l8zD0LYEJ2uQHlTjpXSoGmhbGyVtU=;
        b=Ydc32BuKfcHbEu/s3Wdj0pwQgzomhNrDEZwenH9/myXzg2sDKOik9fkRVLQ3Gf1dnn
         mBfqLQa6KYIoR2ukVBonSyinhS25n3SggfHU+QWR145IFTXL8L93b41I3M53Zdg4lrwV
         e0A72zUXV+qdtHix4qAnz1MJH00yrWAqcte67TEdlkFEyMCNsb/AmFNFJnXHC0g6HAcN
         MbT+cf4Co3eWmrgi7gqXuchXFF2HGrWXbnA/mvEznOpseIKdEdnCOXXhzNsWeDqYFEHR
         ko+/fdN/gSnQndafH+ckBvQYBx/OhAgcwHqg91saR0tCRUMkdV8KXoCgUZOVo3B+rK61
         Oymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mR6HUSlaN8hS5l8zD0LYEJ2uQHlTjpXSoGmhbGyVtU=;
        b=KTaqkTCOhsBkHPamBvnKquRBXfi8lgYcqRS1KFVjckRRJU55j5WCTvgibHHhfyjR6Z
         ZQ7t2Zocaq0ZeVzIQMhX7lPhdpo+h3wzbbCPz3f41tbHGsV2LrpzoQP6DDgGspuyz4N2
         +1s6aOGp20KoIrNx3nsQDPCuSBZjSguzpTl4kL0wwKzXeqYdelUEivhv1QcuCZn7h3Mt
         /69XhvyrpBw0DQTA64k/+3PpOfDIFoWdhDQ4GlvuD0KpzJg2W2bXRVZyCZDJXn4wHwIG
         c7O3lz986gSBSqFHrW4jxzcgrZppRv4U9yBRpf5oaE/rxMkKkqLC2s+b5k+Ew9A482X1
         tNbw==
X-Gm-Message-State: ANoB5plK3lS3+dXAVBO/0+M0rLxYlDgGSHfcMIC2JKceUGsG05Gkm2ZK
	w2Rem4xmBPHoD1f7ODRGGlEATlWFEzvLEqjn
X-Google-Smtp-Source: AA0mqf7HvhClS0aU6onW65JDOt3qKaBnpN5003N6Ve6c6W9mj0StV4JjUryLKPoKEFz7+r6APCmviQ==
X-Received: by 2002:a5d:42d0:0:b0:241:d8e2:868d with SMTP id t16-20020a5d42d0000000b00241d8e2868dmr32627813wrr.671.1669882944447;
        Thu, 01 Dec 2022 00:22:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f? ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b003b50428cf66sm5089970wms.33.2022.12.01.00.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:22:24 -0800 (PST)
Message-ID: <16c2c7e6-20bb-7593-3197-8925b40d6d77@linaro.org>
Date: Thu, 1 Dec 2022 09:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: reset: meson-g12a: Add missing NNA
 reset
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
 <20221129085047.49813-2-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221129085047.49813-2-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_002227_326362_931A0B24 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Philipp,

On 29/11/2022 09:50, Tomeu Vizoso wrote:
> Doesn't appear in the TRM I have, but it is used by the downstream
> galcore driver.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> index 6d487c5eba2c..45f6b8a951d0 100644
> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h

<snip>

Will you mind if I take this patch so I can apply the whole
patchset at once and handle the bindings deps between my drivers and DT trees ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
