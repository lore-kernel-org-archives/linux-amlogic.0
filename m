Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E37C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ask/UtYgDh9+OzbObucJ0oIFSjWOiH17HMQihCE5E9g=; b=IEfPKyU0jmx2p9
	Xb4/WeR2ExR59oGlzdQnzqgeoIbEa27y4Z9APVt+NzeTNj/MLWmw9sZ8UbmEl3aGy3aFza8wccBds
	xBmbpSyc0TnEiYouDksLtWqnmWMT/vGbNHOtAx1Zt2QumNLNAGlDUdZPL1PvjUmQsAOE3LH4zXldL
	VqOo6s6wMw5Ao9o9Hn4egXBZpCn4L8TEEYMuc7ZKO3BLb2RcAtWTWqHlkBuRIvRD9RoHNGFXFTPtz
	QSkn4odrbk6V8BlGnMk9pgO0nZRmOw90y7B3hhuRA2QBssStBOxy0z0Z+41dieOZ6Jz6ZSdO/VQG8
	iQcJ+IsgkFviQrisLYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTgR-00Cw6r-3O; Thu, 21 Apr 2022 10:05:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTgG-00Cw3q-NV
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 10:04:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id w4so5897890wrg.12
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3F324L+2J98n+Lan1RyT/eWUeM6GkGX/RXQR6LB0/4k=;
 b=oZScCh8tKhUHn5IqyR7GetNckEnYLsAay36jS+dQX5N4WkKbSHqHnAUndORk3Wdv21
 c0tVl1PkJXKqOwZJYB6taoPSsfczNdpWaRAUKLP5jTWp0kLb7jpPHwje5iZSLWVQ78Wa
 aUETFfwp2F58i5av3tKbzNeF14/0N04ld0d/IEgEANj3DWimHAasAU2Mab1fm9WL/RvY
 g4uSoxn4RwesXTnD6Dd2wicyrLmQViYv5zU/11EeXnJjbwCw9QkmlESsvKTRkZ5hh/gm
 gwL8AYVVYMUlnlX0mXVn6Fz1bABeGyyr31dYdeVy9SQPLHdbO7acyEqccGtX7seQAspK
 kdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3F324L+2J98n+Lan1RyT/eWUeM6GkGX/RXQR6LB0/4k=;
 b=ARIqO9oRoeHJ9JFdac+GIkPnbPcIh6OR9VhxondLfkb03ocMPU2dSoQfUYyX2rVvoi
 pIaOxZSG5XumlUCTIEHO0a/ok4hN8Qlw2TkLJScPWZEM2+SoAoqGI3zb3Qiq6c6Lq6Xi
 /DIErEKI46DvPKAIczqo9kr00Gd+cJ5xPIZZD1vnXpfjGetcK5xHOH8j2wmvpL7XjryH
 BTMBmZ0kNmpPSnah6zVz0yGgAL4fNIInrPu4oUCdFOEgI4mYvgFoxmSF4o89taDZMvTV
 b3RiKLtx3sz5Yn2k7l+xV2L0iJKVzvQo3UmUeXWv1bTbQa+nkPBwFrmDrbzswmBthuDg
 SNdg==
X-Gm-Message-State: AOAM532w8tQ8ugPwpfPqkFPOccofkNr0gwDp5psWoxg301U/WNVEBShQ
 yS+8jR5KcNGDqRc/QCbavddz7v9ByvVaJMGS
X-Google-Smtp-Source: ABdhPJzPcTNEggQIdZUTB+ITMSuLWsBKyApCBNUoQNpjDvesu8eXr2DyijjlfhOx5peSt7JVHgLyQA==
X-Received: by 2002:a05:6000:178a:b0:20a:b841:e245 with SMTP id
 e10-20020a056000178a00b0020ab841e245mr2445214wrg.480.1650535492968; 
 Thu, 21 Apr 2022 03:04:52 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d?
 ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c19d400b003929c4bf23asm1770295wmq.44.2022.04.21.03.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 03:04:52 -0700 (PDT)
Message-ID: <e524328e-5e91-a550-45a6-053ac73cc8e5@baylibre.com>
Date: Thu, 21 Apr 2022 12:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] i2c: meson: fix missing clk_disable_unprepare() on
 error in meson_i2c_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Cc: wsa@kernel.org, tanure@linux.com
References: <20220421090042.2278081-1-yangyingliang@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220421090042.2278081-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_030456_790784_C32CC7D9 
X-CRM114-Status: GOOD (  15.48  )
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

On 21/04/2022 11:00, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from meson_i2c_probe() in the error handling case.
> 
> Fixes: a57f9b4dd6f5 ("i2c: meson: Use 50% duty cycle for I2C clock")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 50dab123380a..195a9716da31 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -520,8 +520,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
>   			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
> -	if (!i2c->data->set_clk_div)
> +	if (!i2c->data->set_clk_div) {
> +		clk_disable_unprepare(i2c->clk);
>   		return -EINVAL;
> +	}
>   	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
>   
>   	ret = i2c_add_adapter(&i2c->adap);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
