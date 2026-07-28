Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ECAC54EFC
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dq/Us1j6RotKBPbMZG8BFkDyhdV0lhnplNjO9oKVWcg=; b=hvTjWg8W510HmamgR0sqOiaJqd
	W3AR5OWzYlVYrCyzrh0yVBS1Q9i+BIgKP845rexIbGAxZZrOdajOYhC8WgW3NLu8Z8nnnW86fZ/ly
	ki+Lrb25bViA45TYqpg7E4BFwIka+ud9Nk2Z8FeEokiERWCxk+xLfqJIVUrUm+YfAIH9e6wKO5jjU
	keojEh5cP7FCAUpwJUP1zCRRVKlwq5TmkNegshn29G/ixzLIJUw2he7IH770x7WFjnO75Ho3vEiKz
	uNIaxgfx37Bcm+IJFBOjbdtiv3lV4XoJfw0JTcrNCi6QvyLiRuUgu5ejZBLdr4cIDyVTK5FbBZkuH
	PQChZSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodDA-00000004ifO-3c8t;
	Tue, 28 Jul 2026 08:30:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodD8-00000004iee-3Dkh
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 08:30:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so38554905e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227448; x=1785832248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXOP4XN0PqhQT+v4jXW4sP+aBgVsrUPoLsPqH/lHN1Y=;
        b=ctIJb+rkJp8+w8+XioSmx+Xc7WrLTzd41rzUrT5LWinGtl1wWoad3e+LQVuxCCXL0n
         Arzg7Vm4/oVS1FHUn/c7tAIoU1gcVKK+xEN/XVmLQRmJznEcLF3gioOt65e/Cbb0aL+S
         5ZmVBhJ44RLzxi1QxZ7HBntZBcPanPxM4ZAOXErSeyGZX2K+LDx8rxI8AxaSZxQnF+ty
         KiqqeTsdc1mnzZWqew4O/yhDIieIjpUW/5xVUGPP9tuAvWgl8sTGLtGLRBu4Vq4RLo4V
         nRq5io1b7msjdJmcggbiw8jBAvyP8u9wF+/F5Ccp8O4E0+1UrXpyXKsAawKEEJCfm4gp
         iWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227448; x=1785832248;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXOP4XN0PqhQT+v4jXW4sP+aBgVsrUPoLsPqH/lHN1Y=;
        b=DQ8DeUd/WLgrz4esUxSYAOa2Q1qggYDOASLkFhjws9F450l/VWkmzBcKKDzs6wgrSG
         Lb5qdaGWBNpn6ftmXWygpdY5sBI5aR2KF9bXjv5zwNVorqbavlsupR69Nny38TtRDCKp
         6RyKpyimKJja643HB+OY4YaHBMcIYFiXI3qGdvByRtSFvQ+30yGoVauZ2D3I2xqWRtAF
         gMWnZ3++eO1m9KwiaDhQiVsSW25onNJ1UtKt4Cwp3nSf19DtXVO3zZ8sjH5NRnBg6VeH
         0WTWnOfvxsUlMH+/5K5is1mUfL260ST6tL6imDBkvtQj8CtJQ9PktrXUXIc9IB0y4V0K
         3ftA==
X-Forwarded-Encrypted: i=1; AHgh+RqMpS06SAaueVDEtQuedOtKt1d/OezoPYUX2hr7x7wxPDsg2RatDYfTFm7J+enbmCH4QExfCm2i1wiWlBSf@lists.infradead.org
X-Gm-Message-State: AOJu0YxbrXYeFdpYHMyvaHYT36/Av+fCTmt52JnTMEzr55x/t+ypadhD
	5tPny7+n+Vd91039vnrXHDEBhkKfhbY9EWY1z/rCBb8gjJAOZKZb7qipdiMfEJ3Rbgg=
X-Gm-Gg: AR+sD12OkTGL5S5AQqgH5H2rAZkcLn+60gUmOP++nfvcf+pjmtI3R8Z91KTwpambrvq
	ZJtGOfEUwMrMAuBRERP663cJHKPRI15zKE3IrYWi8ZyPu2w0vB8oz7lD9OnpkFOZ3G8e4vw4Pub
	b8A8P+FYUiNVIV4TRqxq7tjfTiuVO01T/Ukm3ZEEN2VNisaVS4MEnpLZLoFE26wdWYNChw8Mc4q
	UQEL1wS7d/fEpfIwpApNTmRmWtsgnsGByYCn8oo7pzU4m+oEQtd02fDcj7Gg5FRBpydRTyGTd6V
	peKOKmR+firEzNt+pW98sj9+ZUXZ00vzeAihiQul/lFU79+vfdYT/I1ugl+jGfUD2/GW4t7OV1/
	NGGVIePwY2EtXD27mwMbealCGcsKX7PnZYHIA7usIGlr3mlcH9GsikoMu0pMM4j5vlyp8TcwI1W
	m3Rx0my1I5sI54AUKteZVbYnPOe7NVaeIB3COx26IKf4ANBKPjI+FNSJBBVg==
X-Received: by 2002:a05:600c:3b13:b0:495:3c6d:f294 with SMTP id 5b1f17b1804b1-496c6571db3mr16805925e9.23.1785227448036;
        Tue, 28 Jul 2026 01:30:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44afaecsm68281745e9.2.2026.07.28.01.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:30:47 -0700 (PDT)
Message-ID: <e73bf1bc-aab5-4786-b97b-803c3e118a46@linaro.org>
Date: Tue, 28 Jul 2026 10:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 08/15] media: meson-ir-tx: Ensure rc_free_device() is
 called on unbind
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785158244.git.sean@mess.org>
 <4674de80dfb7ab8c4a66282be26260ce4e7c9055.1785158244.git.sean@mess.org>
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
In-Reply-To: <4674de80dfb7ab8c4a66282be26260ce4e7c9055.1785158244.git.sean@mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013050_848379_008E33B0 
X-CRM114-Status: GOOD (  14.10  )
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

On 7/27/26 15:18, Sean Young wrote:
> Make rc_dev devm managed.
> 
> Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
> Signed-off-by: Sean Young <sean@mess.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/media/rc/meson-ir-tx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
> index e7bb107e6a84..abb107d19e8c 100644
> --- a/drivers/media/rc/meson-ir-tx.c
> +++ b/drivers/media/rc/meson-ir-tx.c
> @@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "irq request failed\n");
>   
> -	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
> +	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
>   	if (!rc)
>   		return -ENOMEM;
>   
> @@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
>   	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
>   
>   	ret = devm_rc_register_device(dev, rc);
> -	if (ret < 0) {
> -		rc_free_device(rc);
> +	if (ret < 0)
>   		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
> -	}
>   
>   	return 0;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
