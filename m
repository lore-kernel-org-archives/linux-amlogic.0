Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E407C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKlYlt89P0oxfDNnXOKbIFeIRItW18SX4rVcyL7nVCU=; b=JrxDxO6mCShZs5pewx81hkcLon
	VgiwFAurZkZ9sV/uItRmI2WUeKUzxFk7g25VE7+JftlnN7FlCLPflzuopR8w2BxFoyspcCItUc0j5
	XOYG4L964Qc1xak02eRpwGD4XayOuM4m+z0r2BmCoVe8PF9Le8QHmRvkQc8bs7+bMPFa3oSZpTf6g
	YIvY57J3M8+jc/Adi/NQSBKoEnfj9ytPTlKqwzATI3xSoffsGj8WXYddTI+kkW1sTwaWtUa2ch1oY
	9qj6p7tS5eAY2bc3YnBz/DJvDpYGDgDzRuGHJh7i+e/TjCMVXiEVsJagx+HQ2tJL04TuVLitfeg5g
	C+plr5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfH0B-001ODH-20;
	Thu, 23 Mar 2023 09:12:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfH08-001OB0-31
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 09:12:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id l37so22181wms.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679562771;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pcJdmtSJI8n1Nq4yaF0gcqHdFoOGhaeQhrSp6datg7Q=;
        b=tezoRFywjrJYM2cPo82G+050C9EqrtNYasjj5H1ILpRj5RBay2nsOggrjKWGe4qLj8
         lIgP+6tc/tjRto2YBQA7h0jgpS45PvUqdAwymVi+STSGo4kXR6KH9yc7ksik6lxNsHh6
         tCLHi+TcF4zPCwUv6nabo08VTbBxbc5ZFx62ZnnJ2ywW5X4LAClQVPutjWPNXZw45KPi
         Cqb8PJYuZULxR7ybkuPi63oRqbNubnOZ18U8agVCoNDsO8gcG2Ffq2tFtTzLXM0SYgfU
         MfI+rqF7pUpmdyczAq8YmFBKAsP1w7y+IjM1qUu/zPxSe6o84oAgyRpOwjTL4aTHDoHI
         yt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562771;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcJdmtSJI8n1Nq4yaF0gcqHdFoOGhaeQhrSp6datg7Q=;
        b=yCkvVcmhIXcVcHE4y9hEVp265+7mtr422Vy6mw5OT9pntJvhFgwfhTuq09EP532rxd
         ab32Jvc19k4PaYnCJYqRqwIJ8y6q61xTOibRKXPbZjHfA8Q45g7vzf9s6+JicAs6yjFv
         wgb/X5krxugufuwL9gRyG2S2F5K84gfDAU8DUyIqxJMB37RFxQNlqnXy+Dz0LxcHcfG/
         N1kiQ08H1nhqVH/8tTayZzA/PRCTsgfSOgRO4Ajmy/Ux3RXpV5C8uFt6H+/aVRBsl7rM
         dHiffdn5QOaZwm0BM5xz3vici91pSWb37/++eTz5nv0qTjxEB5370vcP6FiZPuqCH9zv
         qVsw==
X-Gm-Message-State: AO0yUKVQniOHy2xJ9Y9mMeN1+/5CcMAiuIF1oe4GYcLTHJURen38dPWa
	IixuZQe+0VWP44T0TLes3zp7pw==
X-Google-Smtp-Source: AK7set+qyjI4dIR56davAs0GyezEM9aqtToFTFnrHhfYp3ZawBnpARGrcbNhyJtgjLQ9swrPeOYQ9A==
X-Received: by 2002:a7b:c4d1:0:b0:3e2:662:ade6 with SMTP id g17-20020a7bc4d1000000b003e20662ade6mr1757659wmk.26.1679562771430;
        Thu, 23 Mar 2023 02:12:51 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c198800b003ede03e4369sm1264366wmq.33.2023.03.23.02.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:12:51 -0700 (PDT)
Message-ID: <f4a85c43-a4d3-c1b4-de12-76e7781d8d76@linaro.org>
Date: Thu, 23 Mar 2023 10:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH -next] phy: dphy: Use devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: khilman@baylibre.com, vkoul@kernel.org, kishon@kernel.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230323073534.75037-1-yang.lee@linux.alibaba.com>
Organization: Linaro Developer Services
In-Reply-To: <20230323073534.75037-1-yang.lee@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_021252_973718_40C85D65 
X-CRM114-Status: GOOD (  16.15  )
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

On 23/03/2023 08:35, Yang Li wrote:
> According to commit 7945f929f1a7 ("drivers: provide
> devm_platform_ioremap_resource()"), convert platform_get_resource(),
> devm_ioremap_resource() to a single call to use
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> index 32d1ff09befb..6e9af79e152c 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> @@ -335,7 +335,6 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct phy_provider *phy_provider;
> -	struct resource *res;
>   	struct phy_meson_axg_mipi_dphy_priv *priv;
>   	struct phy *phy;
>   	void __iomem *base;
> @@ -348,8 +347,7 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
>   	priv->dev = dev;
>   	platform_set_drvdata(pdev, priv);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
