Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7953CC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrYbVAkLaDcD/uaA6aFNVKKQ6xwDByiogIvy4+5rRkM=; b=UV5tu/+GeWv7lY
	ZlG4EYd14cdf2tAwtxc1JBigVocvGsPxcibzJDK/CZ14jGQyRRDBS6nVVijrDvcC/IWN1TWsOEhpq
	NatT0rny7/8CtuXlDLlneGORqUdIGfqu4f90ybxc4rbrJY+ooeSGhuJxg6E5b4ggiO1Dv+bUlMXUi
	NFg2pKD123zsWD9wM1nMz55wQhF3L3occWGcRTP8m+aGnxZ9XP43NB/0Y5YlHRLEuJzGwCpS7fKNp
	hpawHM0F3sU8bOUetsWkeCAnld7pXNw2qYiQcmcuaxckp+EomnWYXGGxTn1HToHURsVaEy6OWuM08
	rMLf0Tp3xpZTJC+qVPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR8lL-00GSq3-Bg; Mon, 07 Mar 2022 08:30:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8l9-00GSn7-1y
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:30:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q14so6359950wrc.4
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rx8yLAgwRWd5HxxwxNM22XOGHWHvMO2UWDFHTxYRPbY=;
 b=PzxsUr8GCskd/ha2XcgDg2QL4P+bOwFIly3XBO/Xt9YzrrwjfIAQ4g14SPqNycRmtF
 coDdMoft9V5Xcra7GNPqyIhV61IfFJmB0VF0WY3P5NHsaNu/XApWteGTv41D7x33HcKC
 YFB74IGzfnd550j4pufrL3MtFsKRa8NiWeZJ9hYtYsopK8NbRbhySPUqlrm8sEoLXqun
 gTTl1y6LWuJLVuZmfEyuDHNe9iSRaEaSVi5WMxoo/6Ol6a2HAEPAQRHSVmXmqWsWMQgy
 lrwkhIs/0M0CAzxmDamIj7PXC64Mrn1AZC7QbygUj0QeS8SRMDGfVcXGhEpX8/BXaduY
 z5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rx8yLAgwRWd5HxxwxNM22XOGHWHvMO2UWDFHTxYRPbY=;
 b=jxSi26DHcg2Hsfx5V9ypQ7HW69h+pZB1StKA8hwCeer+RT3Jongalbg3iOJEf3x1Vf
 6PFPJGJvFAaGs0OR0hxO72Shy2qo6JLSGhTGhDM6Mj3/VgB8VWbWGIi5CGGQkBC9gSI0
 dwb0Umnfx91F6MTB3fIBpdaKjhxSFiCeZ7SEj0UXDRQRLyFp9ffdfFVP0KNGRc+849Bb
 HGp32c+giuHJ7ey014dwgPIFVz262/UHiLHw6wG2vwipeY6eLZsol7sTy0BsgIgPyhR5
 2VPi8BGbhP+digNqYE9zUkz0Ocj0TfqPz83YHxxIH0+G3GuXwZ4ahdbaMvwOe0WPhJKy
 I16g==
X-Gm-Message-State: AOAM530+x90H9s+j1golXwh3jnilaFx3alAoHIB1W33m6iIUW8Qs6X6J
 P/pSDBhclmKqbo8psxBg5zr+MA==
X-Google-Smtp-Source: ABdhPJzvPc5TFTjp2S5kZK8I2dRki97feHPUxjcD/hGdln5ABt4ZLetFTLKJr6PSASZR3EMjTSh7gQ==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id
 i7-20020a0560001ac700b001f1f9ee7c57mr1730287wry.52.1646641825489; 
 Mon, 07 Mar 2022 00:30:25 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 r187-20020a1c44c4000000b0038377fb18f8sm21189154wma.5.2022.03.07.00.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:30:25 -0800 (PST)
Message-ID: <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
Date: Mon, 7 Mar 2022 09:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_003027_108864_A2054372 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/03/2022 13:44, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c  | 2 +-
>   drivers/gpu/drm/meson/meson_drv.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 5abb5ec3de467458..846df1ee7a2888cb 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1151,7 +1151,7 @@ MODULE_DEVICE_TABLE(of, nwl_dsi_dt_ids);
>   static const struct soc_device_attribute nwl_dsi_quirks_match[] = {
>   	{ .soc_id = "i.MX8MQ", .revision = "2.0",
>   	  .data = (void *)E11418_HS_MODE_QUIRK },
> -	{ /* sentinel. */ },
> +	{ /* sentinel. */ }
>   };
>   
>   static int nwl_dsi_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 26aeaf0ab86ef932..35eaa669e8fe0c2a 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -167,7 +167,7 @@ static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
>   		},
>   		.attrs = (const struct soc_device_attribute []) {
>   			{ .soc_id = "GXL (S805*)", },
> -			{ /* sentinel */ },
> +			{ /* sentinel */ }
>   		}
>   	},
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Tell me if you want me to apply it to drm-misc-next.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
