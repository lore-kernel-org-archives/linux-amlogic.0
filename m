Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C91CD8CA8
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 06:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekpoF2nKg9CBUE0MLN8TV5csn87UbHRgR9dfXQezv/0=; b=sS7a8qtqEA/SvPYDlPuViV+vJw
	iBYp0wqmOjnaIV1KPwoCv7SHOoiq6kTOqtHVrI8+WzQsojxlI59omnmhSg5tagvbtpbeut26E6TUd
	Qi1vnjYxWWYZjXXUekQ71l+B74l15qWFJWKfFBK8NmV6liasfoImn1U0yxNDHTNY8++jg2UtMQCcL
	yrsujr7eulOggtMiGBcvuzHhrtVGM6/T75rn4UvIYL8U7lj4nSux4VlS+I6VfB/nTC4gh24bDAxrF
	lBUp5dRv7Nek54AJywO739jbvhPXouv8LiK1/uUWOAhB/LvEQp80hmRXIruKc2KTO3pI9+wdFQZJJ
	G3lEd+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMxM-0000000FHsm-32K3;
	Tue, 16 Jun 2026 06:07:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMxK-0000000FHsA-1Vdi
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 06:07:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso29577825e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781590044; x=1782194844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoHHKRKukzaKnREbzwd66CB8l6NREbEWNDgRAiNx0fE=;
        b=AWQt8jZ5HFoxBK7WFitxPKPN1/gaIVeH/41VdT6/d1lD9RT0WAboeeRVN6wPLQf/cq
         xzSHZdx00db4Hd0fXQa1wDiI6qWjUhBwrX0/5m6OrMn/2JUtIq+XDEGL7dW0CExmveNc
         At4KO53u023RolfxkSIb88L2+kqj/c347JgKXZt5tsbveLKnYqDrMnTls6KFBmNLYEM7
         gqCFucSuEogp1Bd2M1R3mtrnewB1K1V6WUnjkwY8H/Ka47mEgU11PhBQsVt5Ri+3qB27
         JA/fmyoe5OseXw9p0YG8A9XQclIwFIfSFPd7GK4P1I7mjDX2g65OTkRf/2Ds1nQGZvWe
         nyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590044; x=1782194844;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoHHKRKukzaKnREbzwd66CB8l6NREbEWNDgRAiNx0fE=;
        b=TgdnIKxzZHZzHEdiqbGf12MWUKtP2zW/yjQvmSCnQohZi0M7xc24/7CnIMABSuHfcE
         oPEiARFfEJP+YZp/7BJlqycalINL5uNMA65xs1xIoNCyFWq8Ph3OC3LtYVot3dXn+XfR
         /q+7WvOK0Ef2Z1hze2Tl0Nz8dk3fHL9DxOhpQiaGUMbMMWfZqJcXi6c3nHqJe7lxJIRa
         JKOaIlS7h7rchp44aZnNGBVxivISg6AwjoT4JGn9CxUFg7THg9o2AFi8b4+PUneUmN6W
         uwcW652wgJLfy5nWvDiu31rG+urHDbRIVCuwOwvOYB0gUL8TKSb7XaIs6sLBqJLh1XTB
         /C3A==
X-Gm-Message-State: AOJu0Yz/8NJWbJoz31x+luJPD2gP73Dj1B9dWTg7uZeGE0MzpVjbaHej
	tGiSh2E4TpYY1Vwpo3mbMjRf+Td18iPa0Ycv1lgMubpg/SXy3P9GK22g1KJLZHcNEDI=
X-Gm-Gg: Acq92OHHBshz4NZpK1rDpAX9Xv5K7baRoUmR2Q9/3e0Gsu1iN5weVrshxfSFXPYm6d/
	+g/gYYonjt6FhD2tXJB4NkASyg+UTO4qXat5kZ0vB/z7r1nKcOStaYam5SAc6T+vEZkf/RKnnd0
	kaDIsMctazTYg4aD/zogCay6sBboDOb9ptDFF0vyBYt+VKhbn0gPSjUYycw6S/RCM++qoolaOvb
	V/X2CIvPvZ/XGTYtA48aQaanzCfhdL5YmK5EoUkbOMYgao4yP/mS0+scjXsswuG4qJC0tI2G37b
	JSZerS3EEyEawc1zXBayrzLWZ7UVZYlevJXdafpdMczHfPLPvD6x+tYEoKEq8tXSayc+Ekm1LMW
	njX5Y5w/K63HKRHiXcSvkA7V0adJoGFtdYcVRL4dXxVn57MN/wovKO6p7CB5cFnuAGpgwlcwDPn
	uQ5D1Cw7GYdtCf1lubohykYF9bVNgqL60ZQuJc43IUpqU=
X-Received: by 2002:a05:600d:640f:20b0:490:e180:2ed with SMTP id 5b1f17b1804b1-4922ff92614mr21627735e9.4.1781590043973;
        Mon, 15 Jun 2026 23:07:23 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.117.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm53085415e9.12.2026.06.15.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:07:23 -0700 (PDT)
Message-ID: <1539e5d5-7c58-4def-ad07-4c29b58ccb62@linaro.org>
Date: Tue, 16 Jun 2026 08:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: amlogic: meson-clk-measure: remove debugfs tree
To: sashiko-reviews@lists.linux.dev, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org
References: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
 <20260615092437.671C31F000E9@smtp.kernel.org>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20260615092437.671C31F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230726_443722_3DF03711 
X-CRM114-Status: GOOD (  17.28  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/15/26 11:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Exposing the `measure_summary` debugfs file before initializing the `priv` pointers in the `msr_table` leads to a potential NULL pointer dereference.
> --
> 
> commit cf66aebca628dec91393028bc843130a21da66ad
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
> Subject: soc: amlogic: meson-clk-measure: remove debugfs tree
> 
> This commit adds a remove callback to the driver to properly clean up the
> debugfs tree created during probe. By storing the debugfs root and removing
> it on driver unbind, it prevents leftover entries from referencing freed
> private data.
> 
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>> index d862e30a244ed..7ca43bcb622a2 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> [ ... ]
>> @@ -952,6 +954,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>>   	       sizeof(struct msr_reg_offset));
>>   
>>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>> +	priv->debugfs_root = root;
>>   	clks = debugfs_create_dir("clks", root);
>>   
>>   	debugfs_create_file("measure_summary", 0444, root,
>>   			    priv->data.msr_table, &clk_msr_summary_fops);
>>   
>>   	for (i = 0 ; i < priv->data.msr_count ; ++i) {
>>   		if (!priv->data.msr_table[i].name)
>>   			continue;
>>   
>>   		priv->data.msr_table[i].priv = priv;
> 
> [Severity: High]
> This is a pre-existing issue, but does creating the measure_summary debugfs
> file here expose it to userspace before the priv pointers in msr_table are
> initialized?
> 
> If a user-space process reads measure_summary concurrently while the loop
> below is still executing, clk_msr_summary_show() could dereference a NULL
> pointer via msr_table->priv:
> 
> clk_msr_summary_show() {
>      struct meson_msr_id *msr_table = s->private;
>      unsigned int msr_count = msr_table->priv->data.msr_count;
>      ...
> }
> 
> Could the measure_summary debugfs file be created after the priv fields are
> fully initialized in the loop to avoid this race?

Impossible the driver is initialized way before userspace starts.

> 
>>   		debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
>>   				    &priv->data.msr_table[i], &clk_msr_fops);
>>   	}
>>   
>> +	platform_set_drvdata(pdev, priv);
>> +
>>   	return 0;
>>   }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
