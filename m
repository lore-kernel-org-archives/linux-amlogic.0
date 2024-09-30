Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0DCCE835C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4WNsgmGn64M7SgqVlhg2WikjdY2uxbX1hiNzy1/HkI=; b=trUimSErbDHbFwVWTwXJPYJiuw
	P9q7h9jfMYRkVHB4pu90ZqrmO4+s/jcdLrB9LyLMwLOW9JATsqUiawz/5xDNSFUmdwqlUDUtxHkPK
	pmbQGRolREO8DARUo+5txnVmZrdR0qqjZA7fcfPk/hUBwpPJXGAmEc+Js6hHZU4y02/mOM2wd/lJz
	ijEOTHMaHQDrmhLcvlXy/QiG0SRSG3YzLeqMSdQT8A6fjRAPS4fc3yUZAqLxMRZsok1C2dsNW4cDb
	4Qs1UM4cksDtej3Qy7fpGKlF6p7xmVlmqYT21vP1q3aouB1BUukdC3VmWkbF54siV9Iw24z6+RPYJ
	pNJvaYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svIaU-000000007xc-05U4;
	Mon, 30 Sep 2024 15:45:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svHO7-0000000HVPw-2aOq
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 14:28:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37cc84c12c2so2287925f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727706513; x=1728311313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qs9fqcM4y/62FZTYV45HZ7IoYxEq/8eoOWfouR/4iR0=;
        b=ftdA4BdGRvRlU2M8ySNsKGzYD/yL6WfigFCMecPTYC3zfTplWGkwzdr4N3867FS13s
         ORFpTpVsNQF/irFrZKsjdC5J5ssOAMB46Hb2CJl4sJX81rP8XG+7zXvZsWV7+b1A5p3/
         N+pZGy3nwaKVcmLlwV+FVQ8GvHWcLTOff4pJkKqwQ9GPy5VJjt05i+Ye7VZkFlOWL92X
         7vCJq59NRjPX8sAJrb9UWhy6fsY8c6Oh9MA9LelLKEvDdcipFg5o1wjwUMWPPERJKo+Z
         Fzipb4PJiggW+us6gFvdpnqr5Vhe7DIUWa0/Pb8saMDmq/mchmqOHRVgqI9gzAgdxg31
         RTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706513; x=1728311313;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qs9fqcM4y/62FZTYV45HZ7IoYxEq/8eoOWfouR/4iR0=;
        b=QE+v/gVBsZEkKtc0ZP5Cc8fo6JX1F9FWVTjmboeZizCtD4UEE4usErTtI++Pmlb83Y
         sW+dXVNJkcijYN7dBFfuEQwP6H+34psgxJMde8Xht0voOQdMYOtcSEwg1oynvmKDb0JO
         j3Udu53rWpD6OdsAOKAqewuRzyMfJ9S7nn9DlVGbOSOP4oEHME9emlHgphf9oKxTNUXE
         lBIJmhb1uZIhDdl8WMZtrQsxhVDEammyaxz7XiQ5p4m57lH9WalcdR9UJMS3bInTcbRl
         Wk+Kg+wPM1BVwkmpum7RYx0tc+xt1vFUWNn78xlo1vESHu7/iD0bLeCWHq5GQlk66En6
         YJfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPcoPiT83n9ghrW+QTXTtynfPuRDTFExCR7bE2HQLq0N43xUHAxUu6OTXK2UsyMBrL1hBtmR8RiiXQ0EF0@lists.infradead.org
X-Gm-Message-State: AOJu0YwzJxi1wHWTsrCnHjNZIjirzfqrTAbzBNHrP7WJh1S0XVfsaT76
	/SEw1+MjzYYUPmyfrZXZ6kYJlztJeDZdMQ8KwWYAMCq09/7XdRnSGv3mDwjfwEg=
X-Google-Smtp-Source: AGHT+IEM2DcMunLEXQ0MqIlR8/rqi0iScdiX8I6h2sTZyeX/CjsYANv0QIzwmOhRTVKq9xpqbrx7lw==
X-Received: by 2002:adf:edc9:0:b0:37c:c5d6:b2d2 with SMTP id ffacd0b85a97d-37cd59df35amr7661374f8f.0.1727706513467;
        Mon, 30 Sep 2024 07:28:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828? ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd57427fbsm9123453f8f.100.2024.09.30.07.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:28:32 -0700 (PDT)
Message-ID: <76f38f99-79af-4015-b07b-6ff3ec070cdb@linaro.org>
Date: Mon, 30 Sep 2024 16:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/panel: ili9322: Constify struct regmap_bus
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
 <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
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
In-Reply-To: <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_072835_730090_3F0D38D9 
X-CRM114-Status: GOOD (  13.79  )
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

On 25/09/2024 17:42, Javier Carrasco wrote:
> `ili9322_regmap_bus` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 4a6dcfd781e8..94b7dfef3b5e 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -318,7 +318,7 @@ static int ili9322_regmap_spi_read(void *context, const void *reg,
>   	return spi_write_then_read(spi, buf, 1, val, 1);
>   }
>   
> -static struct regmap_bus ili9322_regmap_bus = {
> +static const struct regmap_bus ili9322_regmap_bus = {
>   	.write = ili9322_regmap_spi_write,
>   	.read = ili9322_regmap_spi_read,
>   	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
