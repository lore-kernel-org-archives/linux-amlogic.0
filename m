Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81600C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NahUavweR9ej3Kw2kQwreBUJCfKeyZhSTx7JBDmQlRc=; b=vnb9ZPsU95Xp6ckRRFeVDmIUlu
	i/1vEhmlE/CHPX9iHR7ewIMKNtHavfVv/6S1qZOS5H4FYSmORQ8SuXVrhzwKeKo1A//NAXZaDCwEL
	L18yGwc87Hu0+n97/C/v0r6o8JBO3ZpsmU8blZxCrVRQ/JQ2biPjZrOrfI3oqv/GcXBvG9s5PC8z0
	02KXu7XPkAnRD9988ZohAok4DOwixEVX7Tt1LW9HYAkD1PHO7HgpXbKvJ9jU+hyVf2f9CsqoBdoaH
	qPCCSvdoXPUI9kKQ5V+rL1IJej9iLD1k3KQEl9x2RbMfFbQhWvVOvjw4uEv6JYQYraSb1rw7y7wxe
	xJxjrg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeP2-0047UE-0a;
	Fri, 24 Mar 2023 10:12:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeP0-0047TN-0B
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Mar 2023 10:12:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o40-20020a05600c512800b003eddedc47aeso2811747wms.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Mar 2023 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679652724;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SPH4mUwrMOscuf6tp1URuXqKk1vAT8I56zMeO2kHP6A=;
        b=ScVo7VrB621s3bVxksud99veEU0e+ZB6wdSl+A6LXnVuLZeGxas+hx64ic1+FLbroR
         6wKIVSg0P3gcyQSfUWCTF6zYQvnYz6aX+8W5oCmLsG2+AN5j6NkCi9oiAiBB5Zs/AqdR
         yAXRfHpB3aegqKdqFO0wPNq6Jxz0Lojh34ih43NcqeDEWl64NEyVl8wbMD+v01V5+Xss
         vKR2P1UsF+jtD4oicwCpN8PcHW88ScxZRuCbQIlzkNp16oM30Yqnq+l1rrygpK2zqnCm
         Eht9f8cUjFigkScfypH0XvzPxFP2t23KWxwXyDR1ZYfoUIbYpk7LKW5Hao4oEJ83ib1n
         uQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679652724;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPH4mUwrMOscuf6tp1URuXqKk1vAT8I56zMeO2kHP6A=;
        b=eRkUKHdxfypwEagNL0367m7aJFGBRCnq8z6vYSUEY9Kf18B7hpvpOGYYkCrNyIlB0+
         R+Yj+LlMNXm4AN+4/bl0WZ6kzW9ZMiuMDYhtZwMQ7W6Ofze/eMk7xd0dK6yCuKVxJnp3
         5Vvmcu+IOktLiuhLYsAFGtHb+kklrp+uFdFLS5N9j6Sh+uNRp/psyc1P5+/0mCpwll9d
         ENfJjm0Yb8fRSyhV20WmqjHQ5RGCwHwuTO7YIBOjdqWPm0llQUiYNG1amncoC5MiOqEy
         S6uZXtpkK6UPHZt32iNKEwR2LhvdSeGtuqy3xLPGubZNpw6mQ/AU47UpD6DICabbDWVR
         BM2w==
X-Gm-Message-State: AO0yUKVrOPGhpi5bcso1+r+ZtiJKnZJYrjs2AYtb153yiULgc427pqcu
	YFAtA8M6f3VHVRr39DrV7umYmvj9HJPWlJQWwsMVVg==
X-Google-Smtp-Source: AK7set8IR6Q6Kilnl52WGIRlbWm3xbvS1BES24oina4LDglaBRJJ/DsWqT5cs2NM3gcARp+LzcMOdQ==
X-Received: by 2002:a05:600c:d5:b0:3ed:2eb5:c2dd with SMTP id u21-20020a05600c00d500b003ed2eb5c2ddmr1862205wmm.39.1679652724674;
        Fri, 24 Mar 2023 03:12:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0? ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c19ca00b003ee5fa61f45sm4630286wmq.3.2023.03.24.03.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 03:12:04 -0700 (PDT)
Message-ID: <33c039ff-2702-e058-262a-829199fefa21@linaro.org>
Date: Fri, 24 Mar 2023 11:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: amlogic: meson-pwrc: Use dev_err_probe()
Content-Language: en-US
To: ye.xingchen@zte.com.cn
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202303241016261854322@zte.com.cn>
Organization: Linaro Developer Services
In-Reply-To: <202303241016261854322@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031206_096551_492CB930 
X-CRM114-Status: GOOD (  15.57  )
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

On 24/03/2023 03:16, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 312fd9afccb0..5d4f12800d93 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -308,11 +308,9 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
>   	}
> 
>   	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
> -	if (IS_ERR(rstc)) {
> -		if (PTR_ERR(rstc) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "failed to get reset lines\n");
> -		return PTR_ERR(rstc);
> -	}
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
> +				     "failed to get reset lines\n");
> 
>   	vpu_clk = devm_clk_get(&pdev->dev, "vpu");
>   	if (IS_ERR(vpu_clk)) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
