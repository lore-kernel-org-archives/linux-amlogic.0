Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB72C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5jwMoXMpsAXkFa5gYFZk3x2jRPe7NTa/N7h4Cti95s=; b=HLmMP3eEnir9bC+2/pchQEbf9w
	bjRqj0EUhFSCOqskeDA5guVGKkjlhR8i+XOuSajndh09u3APZigokTYYKS0BWtGvfb8LpzciAON4N
	WfQ+KvStZ3vShnMV9F2txHh9Lc1rkNdZYIA1RP8wSXYmmJqvcJehWE18FQEZwBxtlYu61nRYXSJvL
	6kZ2X/S8UbuuNmObQcQAPwvh79QCLMsy9CkHLUhRdyZl8IixjPuZFdFuiTbWqmTVnryyAOa1BaCth
	twfPfkXPooieRKd1PIeh5XpeC8Iw898rl1+LwV7Fga3nV49PdNH0r6+kD7kfX3H/4eejRx8ruFL7E
	5vlm+OMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw8c-007QmJ-Ab; Tue, 29 Nov 2022 08:38:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw8Z-007Qj2-IG
	for linux-amlogic@lists.infradead.org; Tue, 29 Nov 2022 08:38:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so13742353wma.1
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Nov 2022 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XgU2Me36pWpv5WapeJ4LPJ3zFhHMt8NlKreZ17SiFYI=;
        b=eSdL13nPAAE9KfbRzj2fCIepGM6/yyMJRSpSbtV+qTcW929EIa4OABn8vS5yE4KwVN
         dhRF4IKu30cR5LMLlmnwFaoBLqN6SL02TGXbzQ2W5eSrWzlbUg6YlFcsxI9lNfHS/059
         DZ0ZaUVAH7k73aSGu7vA0WjbHCO04rV1d4G6qVx6TAu1tcGB1lDkzpb8Ie3s2i5OUilh
         H+NL5OQ7fZAfnVi55MvfEYE8R+DjKIxT//YNB2CU6jdZ8SAnvQ2mY4+OlXalRpVC3gKm
         xyOx2am5t9bgULDwET1sl91wGzsVBZ4U2AUWsm8RyNtTa+xfK1h0uQa6JROUKj9i6fjJ
         jhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgU2Me36pWpv5WapeJ4LPJ3zFhHMt8NlKreZ17SiFYI=;
        b=Ucahhtm9RwReYwIPuYNgpWMNMhvC2PN2x2kw1kfhUsvmHrtv94VNALAzjY4Ai8VUcr
         zJ1vZNGoAyeg9hvwYtcnqLcaoPDl9B96RzZ6hzQUmzHfiUrg9TNWN8yY2che7F+FNqRF
         cDC9d9E0lnfahHaX/uy4wiHJvVLz5/BzgjRrFc6iApWlgQtPZooR56iJ8f/6mCHoKxGl
         OPUhEYTLfWEn6tjUcPeds9GtManSmQgn2l9ky87yKRQHNh+56Z9dWhEAgZ0/R12Uz+3q
         xhm60pxWsh8g3bvNRKTlBmfsCrDus2aFua5F9hR4BfWJ+GqNGhBngWteIFxxf7l+Vuc5
         8fhw==
X-Gm-Message-State: ANoB5pkRp6SI/5dfnSvztFiV2cyTopTrflqBpYneRy1jaOFP9NOFu5c+
	Z5b6lp2IRiHe9egDp4Eu25O0NQ==
X-Google-Smtp-Source: AA0mqf6OAhXAHg9j5+BXVKjL+Xc8gtMngAEKoiv4eF9a4BzThu69gyqxyX8YzEQPD1iPsmDy+DbTAg==
X-Received: by 2002:a7b:c00a:0:b0:3cf:e8f0:ad11 with SMTP id c10-20020a7bc00a000000b003cfe8f0ad11mr44668145wmb.65.1669711120927;
        Tue, 29 Nov 2022 00:38:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2? ([2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4587000000b0022ae0965a8asm12835842wrq.24.2022.11.29.00.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:38:40 -0800 (PST)
Message-ID: <fbe945cb-036f-b405-901f-0d625e8bfcbd@linaro.org>
Date: Tue, 29 Nov 2022 09:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/tiny: rpi-lcd-35: Enable driver module
 autoloading
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
 <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_003843_642707_99FCA8ED 
X-CRM114-Status: GOOD (  14.44  )
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

On 21/11/2022 10:42, Carlo Caione wrote:
> SPI devices use the spi_device_id for module autoloading even on
> systems using device tree.
> 
> Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
> Display (rpi-lcd-35).
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/gpu/drm/tiny/ili9486.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index 1bb847466b10..bd37dfe8dd05 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
>   
>   static const struct spi_device_id ili9486_id[] = {
>   	{ "ili9486", 0 },
> +	{ "rpi-lcd-35", 0 },

It should also contain "piscreen" then.

Anyway:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(spi, ili9486_id);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
