Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D4AC79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qG6aVtqdE50rFV9G6LApQvhgNh5CIkAosKKltpk2pK8=; b=ScoyJiPllgrAsEPELPpjeDHlMv
	cSZ1ZZaPcLdChlJiHf7e0o3Z+/Yaa7ElYwTAL9fPIMa0BDmAlnGPkBrpRJXGlzVlwxsGq07vmZLj0
	shHkiz/rf5OUpK46vnlnhqFya4nSdK7uO0p3K7IWPEaI6VygxOtZ/5aOoaJqV9xJ2aplt4NouQefy
	jomrWxXGyV/Ly7dsEJ6D3icEvoQQTWe1FFh5wJBehrVldNoYykSsjDwCTeHbDxLpecRzNIdxVPoIZ
	eprM6Ysx4oefmyC01LMWjV0gfB/uhAxslWTob7fHUkWTdnofVTPPJlAP2y1beuBy+LEQvm76lYzX2
	hcqJ/H5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8V-0000000DcRg-1BYY;
	Thu, 10 Sep 2026 07:23:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8S-0000000DcQj-3OYe
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:23:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso897791f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789025031; x=1789629831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=SbFwrCyhrOx8MtTpZFnMLag8/nVz+z3He+lCieupSkcwrSRiICqa89tvsuG2C5eiFC
         EXQsEamIQGATJWONAuSYB4GJWBOvJpTTpjqUAR2efUBcygkuqf1SZlJmKk4VYAjrNmyX
         MPyQ/wrjWUoZLWQKBKmLqSdYGZ8Q7xmXZCTxGoJ3YVry3bQbow2zO/q+p8ljYys2j/ll
         Z2xXIz51TFZHSJCYfox5S6IDFoefxlDnDSQLMtDswxnTj8dy58CtDckJHSYusS9yiiXC
         Kc2u8LD0nAPZu369YhrpLYUt8d9iM0xGO0eUTzaxWfCNj8c1aeNE9NhME0LkMdbt+SSN
         rNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025031; x=1789629831;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=RONnUxuEhWXTwCTBkAXveHnjTzgPCgNIUdbXS4Iu6x15oXRsiTBx9v0i+EO2nOhJkE
         xQMgqIIHuYK1Ey1VN+GZldaV/U+8RnKl6w3u3aZgwFQ4pdRyKhtuex8tjv0ty+o4T8z5
         HSZijREY0W91qdnvJfazRq3s/tb8fUNJ7JpgTepUZIz0AWmajtya0hBywHBO8St+iyfY
         ONwN6sMSJltS2MSuJw2lOQGynRFI41jODSo74A3O3Sv66MYapiaYQJmaYkOUwD7WxFRU
         qWl2sjT1j5djdg5bKTKt0c10mhx9BUb9SqfpcZ9hbsK1+RqyEX7EURSY6RwJH4bwukDZ
         K6+g==
X-Forwarded-Encrypted: i=1; AKwUvBwWVpV2hmevjsehDFeBz3t6TuUagzjdWQUGpa9hlRWrzdPlodKvSQKypFHSEKYbiDqCuspRRJlx7pa60kb6@lists.infradead.org
X-Gm-Message-State: AFuF++kZC1VZbBTJTx6lZVebIBZHf/8YsV0UvcV7UgXdeo8EfpS/zcI/
	mNM8Rj8e2fbJbsivxqSN4RY5+B4xIDoCvIyQ4/hYzKbTSI4cf5rmAEFlZZW6ZNG7WeQ=
X-Gm-Gg: AYBFou2HCWWDcINetb+GXNR8Dqcrw1pi1W2ToY3L96Ek4H0UfSgeD5/aIa6T97/RUot
	r7BG9OpFya5CZTFN7SBNbYvOXBvo0UGkSM6NWtL1RC1YjsD5K+Fq9xtWpq1HyzywMUgTLNRQXpV
	1a9v80Id8YHGAYF0S6y4GhZv8M8lcdxoxhJ4V3F9Uf8DYtnDxe/y3D5GHRxdiT53bSxEJcHGM3C
	jJ6oUMHStX1FMFC3sLT1TBJOfPzebgGluMQEpVNnYxszm87jZIvtAjRr7Bm80CiVK5KnjRYr0io
	MOy3RFsg+T0clT+hTC6MPrju9a+YfiSI1oSMgBoogBy274NQu/W12sNq53QbVTyoDJ1CJr68SI3
	LFMvyusiSPM6fpy3MbL6rFG4ipSBcqiNlsdsaSYERBDfAxCpVWIn+M7OACPbsAKpLYl3v4vD1eY
	8tHdDpijuK3T1Wd610kUiK8ziDvdgdDzD3R4pDqL1QNmEkVfDI/8M4Wu4EIXq5XfwdctaOggZPc
	IcEwqF0AbAB59mTwwuhmh423unx/eQ1C9g4JLKg/0tm6vYFYiZeMWAoFZsG+CY2
X-Received: by 2002:a05:6000:2dc5:b0:485:afd8:3e42 with SMTP id ffacd0b85a97d-485c23ec07cmr11470084f8f.22.1789025030483;
        Thu, 10 Sep 2026 00:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm51488978f8f.30.2026.09.10.00.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:23:41 -0700 (PDT)
Message-ID: <ca31e73c-09be-43fe-8904-8a813152c3ca@linaro.org>
Date: Thu, 10 Sep 2026 09:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
To: mileskrause5200@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
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
In-Reply-To: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002352_882567_C15DF7B2 
X-CRM114-Status: GOOD (  17.31  )
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

On 9/6/26 21:43, Miles Krause via B4 Relay wrote:
> From: Miles Krause <mileskrause5200@gmail.com>
> 
> meson_encoder_dsi_probe() looks up the DSI transceiver's device node
> with of_graph_get_remote_node() and hands it to
> of_drm_find_and_get_bridge(), but never drops the reference that the
> lookup returned.
> 
> of_graph_get_remote_node() returns the node with its refcount
> incremented, and of_drm_find_and_get_bridge() takes its own reference
> on the bridge it finds, so 'remote' is leaked on every path once the
> lookup succeeds: on the -EPROBE_DEFER return taken when no bridge is
> found, and on a fully successful probe alike.
> 
> The two sibling encoders in this driver already handle this correctly.
> meson_encoder_cvbs_probe() calls of_node_put(remote) immediately after
> of_drm_find_and_get_bridge(), and meson_encoder_hdmi_probe() releases
> the node both on its error path and after of_find_device_by_node().
> 
> Release the reference in the same place meson_encoder_cvbs_probe()
> does, which covers both the error and the success path.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 3e422b612f74..3fe604496294 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -120,6 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);
>   	if (!meson_encoder_dsi->bridge.next_bridge)
>   		return dev_err_probe(priv->dev, -EPROBE_DEFER,
>   				     "Failed to find DSI transceiver bridge\n");
> 
> ---
> base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
> change-id: 20260906-meson-dsi-of-node-leak-744899da5712
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
