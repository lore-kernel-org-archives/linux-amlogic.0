Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B864CECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Sep 2022 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZZS1hADpUH/Ex9ifeuStm2MHghyiInfGlz05QJf8h4=; b=k8n+/gQ/XF2fJ5d/IRog4mYQFR
	ZCC/bHDXfN4V7kipnCjlZ9Nffr80hfejF9gwo9luoOyoDFK2lQYinALWJstc+iXhju7oWHBoSHy6h
	OyY71T/Q9xgi0kMka47txcDypbuRlPSXJJRxa7BJo/1LwQ+rWqXaBksnsALZt47t31C86+7qwCD7J
	0eSthH/1/tSyNq3A01ZUccVbm4c5p53rOIrQSjXMSa+hF202H/FEW92ZNOii+I+Zn8ZjBGYUz0YS4
	wsu/gAbSmcmoIu0XbxkW3QxImG1qsivfT8tLm50gvJENQnlcEibl6qBjIZW1CYnOmEcfD3o7i5rgq
	NNGdhMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcDq-00Fjnx-Rc; Fri, 09 Sep 2022 11:30:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcDo-00Fjmf-K8
	for linux-amlogic@lists.infradead.org; Fri, 09 Sep 2022 11:30:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so1070643wmb.4
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Sep 2022 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sIASLX0R2P23+j8OeRBs0Bj5TUjyqw9EM4B0ZPGTtVs=;
        b=ZJBmHCv0f53AQHKe+rGmvzNG0HFlLBm8LmaLcJtQH1fuk/QUEIwjTEZHwO3toPEbqU
         lS/I8A9XbjNw4En/m5MzZf2Z5cp+EAj7vLa2TI4DylJm4JDsrCNZZX1tmtZ5TeLzkoBu
         EPAHO7R3Lzt5yfvX8sjecia1VoeMwl+vGNzPlFoQVmQwgwsV4HHyxD8Oqvtj80aBFow7
         bOlZEQZ/Io5xREDlwoMagLj8OaBKa9jbFRQ7hbkPnxRJxHIJC+LgxZDqYmDcIMiLxWVa
         Qz5FzwUOu29qxh2CNOmUnPQIzTxkswYrHSLvMsJIkhB2MxcspEWNkaVPtjw3VKbQ4sbi
         QFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sIASLX0R2P23+j8OeRBs0Bj5TUjyqw9EM4B0ZPGTtVs=;
        b=cESRLQxNwNajrNdhOt7j4BrjRh/iOvP6ISFK4NFy0KJ1h/Og/Ilr8emoHKHoGiT8Xm
         +DJ2cWocCRalzul+RyjN2+LoorTeuWMMZD1D8+G0zN8Nz3/sSm61ttTYB335BFT2AIm4
         OFEQSnalA9vhpGNqT0dkDwanG5uf6VK4x9BeBfYgiOEX4zKOHPm5hGbbCUZ8HKA3779j
         e1U0+xVI41XD1W3BL1mlBibbbXcd4wfgiX8fg5lTpqi/iqLPaaqaN7iDyuzWRJG6YbXx
         EXFP0FSrdD/DchOYLeMWsWJrx/PQNMdov226q/ALe4r+2LxdoKAqnD+p6n/1Hb2pjrJT
         p7hw==
X-Gm-Message-State: ACgBeo2/zS6/L5kNF9u9Sn4L0BHWj400hwPBGv4+oD8JzBXVWlpLokrg
	K1icUfnFeVZqy4oIsKmvUJjnntBbTWeY6mAm
X-Google-Smtp-Source: AA6agR6z2m0ul1bIB7gX6941qTm3iNigFl3vuOxonibB7cnEPzY+zddV4FHmw39XAXbj5dHUq1cq9Q==
X-Received: by 2002:a05:600c:35cc:b0:3a6:f08:9b1 with SMTP id r12-20020a05600c35cc00b003a60f0809b1mr5014747wmq.22.1662723052887;
        Fri, 09 Sep 2022 04:30:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab? ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
        by smtp.gmail.com with ESMTPSA id r2-20020adfda42000000b002286231f479sm305722wrl.50.2022.09.09.04.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 04:30:52 -0700 (PDT)
Message-ID: <326dedc2-0e83-55eb-fe74-84d10b7769ce@baylibre.com>
Date: Fri, 9 Sep 2022 13:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Content-Language: en-US
To: Stuart Menefy <stuart.menefy@mathembedded.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_043056_693698_A0B4E6D7 
X-CRM114-Status: GOOD (  19.11  )
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

Hi !

On 08/09/2022 17:52, Stuart Menefy wrote:
> VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
> not 16-28.

Thanks, Good catch !

> 
> Without this the output tends to have a pink hue, changing it results
> in better color accuracy.

Indeed, it was a regular issue reported.

> 
> The vendor kernel doesn't use this register. However the code which
> sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
> different style of registers for configuring some of the other matrices,
> which do use bits 16-28 for this coefficient, but those have names
> ending in MATRIX_COEF22_30, and this is not one of those.
> 

Fixes: 728883948b0d ("drm/meson: Add G12A Support for VIU setup")
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>   drivers/gpu/drm/meson/meson_viu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 51df4de..876ffe0 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -94,7 +94,7 @@ static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
>   		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
>   	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
>   		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
> -	writel((m[11] & 0x1fff) << 16,
> +	writel((m[11] & 0x1fff),
>   		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
>   
>   	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
