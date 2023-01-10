Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443C5C54EBE
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhbJppIt1Us4jIORmAdbKXsRsPFFBln8S24z2FRwIKU=; b=SmK3rn3C+zQUlbA6awsmm8RZ7D
	D3RGHrYlnCUjdeOCEocoIOCihAGkMuQw614roGeB9e7doon3LK+wI9RPU0hk9Dh7jHTSo2RSubvv9
	PdtfUCx4frUPED3RWDEcroahhIXllXqyj/vYjvEToD9yFOTPVENTUEauewEpw8CUlvKSw/7KPCl+U
	1C11qxV7lDSk6Ez/OsfkoocLa7fXhwA+3Rp9b29J3sveV2jRaxD2d7/GaK28aBwax6gwS7EhrNkCO
	6M4wfpe8kprR6VipbbhBhIlPrGGBjtDKDmtdcwQEo6+3vpOk6mwu9899bmJG50iCRYwTFCjWYqBZJ
	A0orOmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9xu-005nWS-V0; Tue, 10 Jan 2023 08:26:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9xr-005nUH-S7
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 08:26:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m3so8195187wmq.0
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xdQwcImRyUjKYYTm5SoHXvQfKv/r00nti1RsG4mwEb4=;
        b=E3UE49FdnABecUo2IS6pY76NJt4MrCIYofmLUvNQEMpZy5M8o6oe0pQvqCM4cPDzxb
         vVjzoKtXpc+gYjcQghn58n3m+ygmal1vYnsZQZEHzRjL5pf+bke3H93APU7Cs7d9B4R6
         oLW53gxQUbPKqtcvuxzyOtg2eNVrDvrkxSFfM3o4tNkop7D64oo1QxxQos5hFsVBRtRv
         JDoHDZNwlZi4aLmr2mniDq5NE4iJEoYgwKJudFBJFx4h3n/t8yvKFiyP8P6A/bdfqVZj
         r0eCmc7ZVcgz6TnSRraAEq7dTP+aJBTbtedmsBgBbDtb5B7UKvvs0M5CEGinQMUqKvVH
         1BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdQwcImRyUjKYYTm5SoHXvQfKv/r00nti1RsG4mwEb4=;
        b=3OiUOIU+unly3DUtjJo5Ae8COi1YEpEWs1xAXs4PG/sckxF0kYMe8ovQkdRRp8dfsR
         4/JWnpnEmpu/e7hlBBGZnQymq2sHztMNjLqgjZ6pD/2UzvcXCKoKVl3su95F6MQK4L/O
         frcZMLJoPCApKrYi5Tm8sfMGBU3fT19nTIfod5Q+5FVDOmNo0MtfGNMoQKz7tz2oDd0O
         ZyQhAiXbQtz9unqIuFNu6v5i4ONSANOCie01tTuNpFG1J30c+kiv0VSEfyAOJ76WuPGQ
         OXOzdPAAgo+zEkm/7Q4KksDLyFAcTJT1HzKC2Bz6OzphIp/hlk3sG9go6ZtT7pTYHzzn
         D1bQ==
X-Gm-Message-State: AFqh2kovw0XoZlH0dsQKiDsLffbXRMoV48LtXpVzNkZFOuuxSevr7WtV
	yHYfXVZP8qAa2KzXON8cGbpllw==
X-Google-Smtp-Source: AMrXdXvb23jIXo1TjFZZKj9eNVGzFoIe1B+xqOkr7rnwshvPbRV08OtOu0wqUFcWh/bSxiIBBN84ug==
X-Received: by 2002:a05:600c:1c20:b0:3d2:2f48:9443 with SMTP id j32-20020a05600c1c2000b003d22f489443mr47863084wms.15.1673339193664;
        Tue, 10 Jan 2023 00:26:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:26cc:e5e1:3044:b226? ([2a01:e0a:982:cbb0:26cc:e5e1:3044:b226])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0ad200b003d9c97d82f2sm13858017wmr.8.2023.01.10.00.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:26:33 -0800 (PST)
Message-ID: <ffc69ded-5c42-355c-0326-3a34189b0cbe@linaro.org>
Date: Tue, 10 Jan 2023 09:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
 <20230109220033.31202-1-m.szyprowski@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <20230109220033.31202-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_002635_933991_567FCA27 
X-CRM114-Status: GOOD (  15.04  )
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

On 09/01/2023 23:00, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() function returns 0 on success, so
> use it for the check if function succeded instead of the -ENODEV value.
> 
> Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7642f740272b..534621a13a34 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
>   	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> -	if (ret != -ENODEV)
> +	if (ret < 0)
>   		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
