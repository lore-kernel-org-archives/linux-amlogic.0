Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5E9C48286
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwtEncW5QOLYUBx3RYmNZCJN7p6c1P9qOsEi8WfWB3s=; b=nDoNTMhMSOOr+Zd+vUNlVAdSY9
	RhyvIXUpnyJPCTBpG73zaaE/WLj5Ix6Ev/qrCdc0j7660P1XXZ0GpdP0xPURNFJGtChdiMBbe1DVs
	+kb4xsng96bhReLD2VGMQyTKhUz1Z7uJQg2CPd2T2Jf4TeMfyCBp+yte3O2niXoMv/4p3sZqhJBHz
	dHa6bzufr5EcbwTBOe++YB8ahzQyT4Y56xbn2mV4q9sVhe2zI1bm/+iMqdxZ9kl3509fWVi2qS/Ax
	bnUYWVA2oSh5pyTRmGOBoaGGgECP0LCSBewKHjBxWvO/xxqn2fJxLndCqJuQ+ePaDNMUxfZvzS22j
	gnXv9zeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIFs-00000006rl6-2W67;
	Tue, 06 Feb 2024 10:00:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXH7R-00000006W1T-2MX2
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 08:47:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so5014555e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209272; x=1707814072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
        b=EghN6tZ2EH7/uWtRPkae/a5ZFCEDaX5pw/vbvmOqY4FcQ/3JN94xKs2Hs16y9lLde8
         4BCTKeEBGpHeZEe2w7XAfAIw+/tUXuA9hj+xQ8O1vDlB1YKaJDSMQnB30vHlOdjLU2M5
         qoYTG50lJ49WG+WQj8pzrC8SPio6452rKDsiBncKyVIIU6ofypRRGgErfYNURGXMeFzr
         b5cj/FGvkqZVyLBNIhFP7vGvv9pOAfVG9sjZivmAlmeq48x0nohtZqr2izQkOshZ3lCK
         coVgA+7BflyqDvsuu0n2rBpsKSBxV2V43/Q75vRRNlW/yWM9cAm7cJ+7inwP/FYk8mWq
         7CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209272; x=1707814072;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cgswh97JThtSZc+MWkKLL/sOqrjScM78TS+JiOIKCEY=;
        b=qZYQ95qZCOEF+kb/2ZuuPtoEwwU/9nRC2waJU4guT1verYk1n4ZBDnUmd4q19dhwYG
         vRIeJyI8FZgmLnVVPTl38n/Tx20hoADHtu5vv/ZsTQQPK7HZmEBVKl3rcN7qDIPwyfNf
         FWIz/RNgtL+uPPb/IArIC/meVFbRKJByVjGgzv1EpsfkNGi1Yg4aoswGvrK7wiAj4C8Z
         1flBAvjrozaVrgcoSsWg5eot670PS89j6BgPh0kcsvHvKBDkB9hnkZWI8pAl0RC/If0S
         TVa/WoSu5Su1lIqMgkzL4+Cw9vSQpkyWQm/crJr8Uf9FSfbqMOFC0R5evWYTmMUSSqls
         eSpA==
X-Gm-Message-State: AOJu0Yy3LPePbUxV1zbWU/CjrLJTg+uxaQOk2S6H1MQ3dNAHFCQnpOuj
	YNK+dt1AGaNgkQtZEbH7Pwlc7J1g9kM7p5uZVNh+szdD0a5/lB0LNKixNqrrMUs=
X-Google-Smtp-Source: AGHT+IGhYB7S/j7lcNzeBzGO6RKkAL5j0F4BGe7lMnfxVZSyyt0yaNgwR3CzP3SL1KkRGHmCS6IleQ==
X-Received: by 2002:a05:600c:5204:b0:40f:bdf3:3426 with SMTP id fb4-20020a05600c520400b0040fbdf33426mr2050471wmb.31.1707209271941;
        Tue, 06 Feb 2024 00:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX161gOqgvdRv10X26uunEqBIdx6lmer6jebnO8ie7WB84hoaVNdkmlbFSJ5LjujcMzuSzR/xphCn25giI+Q9UXCOpzU0SYElVmWIQHgdF1py1U6L8WklwZZ3QCMEX5nHAOzbJ9xizUKNmRG7qouRrbJUW2H0ChFld4lhcQ1KE9rJ+70wxfDZBjS2Kc0VxqLZOAGYnfch42/wyj5QYcH8ntahvUVFDmk41fpL5rXhGVE0BbfZWgTNwPSj9wZMcSWF77C2AruITJSKqyiP1Go4J5m1tT1or2ugXqOOxrXzTQ7YDRBGl1iKaBRVIiXD6ZaV+DyjcjKv5cvRVdxCt+od9xKcOV6F3/VQr3bdL2enneL+g0fOryGLlMbyAjDVZkC9jBg3EDHyoUXjj03kT0z561HwcXCTD6FBYlDJfH5VxhCQ7lVPLqsGVNUuEXexKOKhaEBxfYQHceEq7+1Ca4rKDHI5JfApLifcobxpRZNIZRb47N+wmvsTtdfZg4sc9kWkJD3GZshjCLZt+YeEjY/a3k8X4emne7fSNi6nAfvkxYgs12WG8iNGcsJjCA3i0mkA7UCH+6Wp8IcF80TAwq9ZrMZVn8Lmo9ggVYYDUb6g==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d5610000000b0033b3ca3a255sm1511899wrv.19.2024.02.06.00.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 00:47:51 -0800 (PST)
Message-ID: <0e47aa27-b28d-4672-a2eb-f906e0e6a5ac@linaro.org>
Date: Tue, 6 Feb 2024 09:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/18] mfd: khadas-mcu: convert to use maple tree register
 cache
Content-Language: en-US, fr
To: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
 marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-9-liubo03@inspur.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240206071314.8721-9-liubo03@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_004753_656431_00752FD9 
X-CRM114-Status: GOOD (  13.33  )
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

On 06/02/2024 08:13, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>   drivers/mfd/khadas-mcu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 61396d824f16..ba981a788692 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -72,7 +72,7 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>   	.volatile_reg	= khadas_mcu_reg_volatile,
>   	.writeable_reg	= khadas_mcu_reg_writeable,
> -	.cache_type	= REGCACHE_RBTREE,
> +	.cache_type	= REGCACHE_MAPLE,
>   };
>   
>   static struct mfd_cell khadas_mcu_fan_cells[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
