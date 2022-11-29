Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812B7C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJIQeTF7rGbX+Sed1MqHjz3hsJH7f1PbHKleSGMMRC0=; b=EXzwWeAIvzlQD3xTOIXGqsKzhL
	g1K7DVFZCtrYjMH1EsgHO+JqFpBAUv55aoPD87n38LkEEt+10WAKGt/I/LamSCalmncBKLVc5yxEL
	ea1iJVSXjso1++c20mtUgxgvMWeBcioxeE845gB/zGrlKU9xiyEH8q+qXM70UrH+O9K439d3Z+4rm
	6aM9MQiRQs5dRsGS3ndFzTIT0L+D6bIEQuUhVCTTKKtg/uDj0pcWUN4IL1Aet/grk6JfvVcnP7GES
	6GfyWAKmO1HjMYGcjKSdL/P56EyDShkV0Ci3CygL5DMD+G+pg/P9o1egogIMNH94ODLLa3KocXf1S
	S+zIRjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwB0-007S3K-N1; Tue, 29 Nov 2022 08:41:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwAy-007S1e-CZ
	for linux-amlogic@lists.infradead.org; Tue, 29 Nov 2022 08:41:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so10246812wms.0
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Nov 2022 00:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b8jAZNW2iOrLRrd89DhxXzx+Yq1CmREwG3nJKgbZlYM=;
        b=HgRHogOxcbeptq7RdOpeE8mcOwl1JyZNgPIEwFYHa49N2cJBwZIixiVeHMT3EPsacS
         00qm3C6yORFC3DBXXt9z2ncLXW0RJR0QPQjYp0WdlQKDr9Aw59PCAXHPKFSh8IPzmXgs
         yI2qU/PgLouCiwpBMTTUz2jvWaueGSPp2rRFb+LSiG9tPW5mKcMQEYHLpkwbBMlnaieZ
         TXc1+eBaRrceP3qTGERv4lbbMHtHVNINkN96Xr+JNgIg9jMXPMlZbyJdgGPOwmNiUyGd
         edtXf1ZHIaWKLWXTs68cklQv3HWJiR6oyO9pxSwuT3H1CYecI1Xee97h3gEwzqhULQSx
         Y48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8jAZNW2iOrLRrd89DhxXzx+Yq1CmREwG3nJKgbZlYM=;
        b=X9b0gSmV4F+ZiVwC8yPUwyAdwYL9YYgg67cphb2T1LW5yd+DhmLhOu7Jo/PMuwvWhJ
         lOPZdhyuS0ll/vGrroUJrrqQl0kUvMWVgOER3El/QUWUu8KRKniQA5Gp5Kn+Rm+TofqU
         Jbi9QW9l/OBT4yH/eTLIgJVxXpZ7m7sG0MYmGsr3tnnFavwnJ4ahvgVntRK9e0TL8llX
         O5kx7ymSqEpzUG35/kKkI2i/jO5gm57QIA4qU11bjnA9Xz3OK0BnQic0MDIrCRTFWVr9
         YXWVgILSepNvX0AYb3NA6sXvGlwU4+kmvip/C6OmRa4k/PJ1d8WYOs+TYXqDeVP2IL7D
         IzuQ==
X-Gm-Message-State: ANoB5pmNlJVyX2l45oC+ZRPIQy84YfEQXZzTKXqUVbe9CKl91aGpF+N/
	58RSvZwvjF9jChP/doIyXvstPg==
X-Google-Smtp-Source: AA0mqf7YTNMTlGF7UPjXTQ7a9Xy432X20Jg5O2T11AKVzsSOE9h3KXWpsSiHCxHF5JkDuBZpndPs4w==
X-Received: by 2002:a05:600c:3d1b:b0:3cf:670e:63cc with SMTP id bh27-20020a05600c3d1b00b003cf670e63ccmr45587752wmb.150.1669711270809;
        Tue, 29 Nov 2022 00:41:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2? ([2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d5645000000b00225307f43fbsm13038696wrw.44.2022.11.29.00.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:41:10 -0800 (PST)
Message-ID: <81e5bd05-b081-8072-b09d-30e32834163e@linaro.org>
Date: Tue, 29 Nov 2022 09:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
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
 <20221116-s905x_spi_ili9486-v2-2-084c6e3cd930@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v2-2-084c6e3cd930@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_004112_458351_4EFD210C 
X-CRM114-Status: GOOD (  30.52  )
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
> The pixel data for the ILI9486 is always 16-bits wide and it must be
> sent over the SPI bus. When the controller is only able to deal with
> 8-bit transfers, this 16-bits data needs to be swapped before the
> sending to account for the big endian bus, this is on the contrary not
> needed when the SPI controller already supports 16-bits transfers.
> 
> The decision about swapping the pixel data or not is taken in the MIPI
> DBI code by probing the controller capabilities: if the controller only
> suppors 8-bit transfers the data is swapped, otherwise it is not.
> 
> This swapping/non-swapping is relying on the assumption that when the
> controller does support 16-bit transactions then the data is sent
> unswapped in 16-bits-per-word over SPI.
> 
> The problem with the ILI9486 driver is that it is forcing 8-bit
> transactions also for controllers supporting 16-bits, violating the
> assumption and corrupting the pixel data.
> 
> Align the driver to what is done in the MIPI DBI code by adjusting the
> tranfer size to the maximum allowed by the SPI controller.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/gpu/drm/tiny/ili9486.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index bd37dfe8dd05..4d80a413338f 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -43,6 +43,7 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
>   			     size_t num)
>   {
>   	struct spi_device *spi = mipi->spi;
> +	unsigned int bpw = 8;
>   	void *data = par;
>   	u32 speed_hz;
>   	int i, ret;
> @@ -56,8 +57,6 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
>   	 * The displays are Raspberry Pi HATs and connected to the 8-bit only
>   	 * SPI controller, so 16-bit command and parameters need byte swapping
>   	 * before being transferred as 8-bit on the big endian SPI bus.
> -	 * Pixel data bytes have already been swapped before this function is
> -	 * called.
>   	 */
>   	buf[0] = cpu_to_be16(*cmd);
>   	gpiod_set_value_cansleep(mipi->dc, 0);
> @@ -71,12 +70,18 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
>   		for (i = 0; i < num; i++)
>   			buf[i] = cpu_to_be16(par[i]);
>   		num *= 2;
> -		speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
>   		data = buf;
>   	}
>   
> +	/*
> +	 * Check whether pixel data bytes needs to be swapped or not
> +	 */
> +	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
> +		bpw = 16;
> +
>   	gpiod_set_value_cansleep(mipi->dc, 1);
> -	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, data, num);
> +	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
> +	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, data, num);
>    free:
>   	kfree(buf);
>   
> Looks fine, but should somehow be tested on an RPi first
to check if the 8bit fallback still works.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
