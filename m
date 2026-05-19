Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE23CD4851
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rj5791hLElY9Tmod83Fb/7nJGDkmxoLcZ0BFA81D7k=; b=M6VqN3VB14NaFEnYhMZG49hj6P
	DxWRPbgI+/WEQ73Fm5Z+GswveyKBaOTTiFahiyHuZoLsQqwcMcDSTkxSzhOgZ9nZb2yxkylFcM8ss
	GnO8xndqcXq+OfG9/71hr0V84Wgs/9e2lU29K/EfzgLOzZ9Q8F0gnvSFwsGuYTPTHUHY7yVl/SkWm
	GTDIBuD6ALkoHijUxOrVSOmBpMXbM/0HcJsp1LDGJvczSYPthdIFGs4MCrX2BYxhvCKCww9TKpPW5
	PbGE2OF9o8qjUhqargxZcZLUTJe2ALtD9K+MsjLpo6nobuuv26eOGBM7TxZuihDBpQ7z3b6W7mFBC
	5OntIaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPErj-00000000Uli-26sz;
	Tue, 19 May 2026 07:27:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPErh-00000000Ujq-0W5O
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 07:27:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so37760375e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2026 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779175663; x=1779780463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zpUdooh7j5y1dGwvoNb/vpfm79eAZcPY2dZ8iHzeV8=;
        b=H8yr1F/PKbipzimUtt5OCHWwA38BZFWq/ZAkHhDZ0Z3yKvUAox/HNaiwIxxUTYHrqZ
         O2A10BAaDaRD3gqZ66OWPYZ7QhhuEKztEko3jyr73s1RWNfVW7TPGlyH8WPmJnscYD1p
         zRltxktprFvU491vOTLfz/Pz4RZG77wsD4oRTRSU3K/3QdgdEng27MbmLZk76PzqCieR
         K4iVOKULOMbAuJFxZWiUWnD51/kFvXPUM5/gmaT66T+E0EQS3bQo9CoGpWOU0b3jMn+X
         v74FfHgnM7RmNO/OkcNJgn5/OPiTYYKGQW1Ap7LkAyQ5m2aBprhIFTs/W13jv9y3fdnA
         KSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175663; x=1779780463;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zpUdooh7j5y1dGwvoNb/vpfm79eAZcPY2dZ8iHzeV8=;
        b=NCozdRpNVH4mg7gLbMricXgFeQ7UCb/LOmcASSASNNoy6CrP60QOOF1e0T/RPnWOhB
         MCP+5mkZS2+3X32GsJJfWRWUjvGC472A7LiDKKVuDoWPhGwqgaW73JOt0pkUXNPUDzct
         YTuZ2hzCZMTziswewV+mu5GDxGcheWRaa+8x31JALbDcjKTWd9Ca8rhh4hfw8XdrUGzb
         UxZCZoKHTIML1bC6i92tFxncitL14Zm9ZbAat84b+r7lpyLDhctjp1gD7FKs9X22bZqJ
         lQJdoZfeVXRKPaN6ckP6UEB6PAINqO339/DSORAKqIvDNIarKzDfny/A62OKLz3kE9Tj
         nyfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q5EApDzunBPKKAEq9Nj0IKhi5xFk/DJ77uFH0CpVsRSqlEsyTEVCGbZUAHYjn8H9mMdFrhPgvhrZeoT8f@lists.infradead.org
X-Gm-Message-State: AOJu0YyIp0GlDQlFOZA4el+x3+zTdYbkKBH8Q4BMi0OkRIZTmny5Qs6w
	hfQTUYo8VVB+IU1r03PECiO68ePhQvLISHzHQXZ5XRvaxmAWxsc37FFygzoIeVtHxa8=
X-Gm-Gg: Acq92OHTocDe89+f3t5rz7i2vBqBu1GYIW/oAXBGDOKpXKS7y0SnA/nmxWwxP1o3lJw
	TvOwrtuTCr8veDOKCZwLpqeJTa0ffYcdFwOqFAp7roqsoSK02ZDEjRaNf9wzFGfBUjj9HHhGUg2
	EJKYYWrPYnvArQjPevzZ73IXncorJL6MsajCtfahzEnRpZyXHyhFZIXOaZRS1AQtUAdFvtxTXpl
	xkz1jv2ZCOwVExwJeFgzC068Ry1+DsoqDD+iXdwV/TjlVLWKq499LBlRSfaWL1RRQ4NcIYBLNRA
	IdiToewWaYg9GoDEJK2qEJh9GQnnfqgndhjQ2cv+CXpt87FiUjwA5g03gw82jVDXRPnrLMarHuR
	i7PZRBH8exUAemomhuxr48TP6ajdP5jZ9KDt6EihHgI0exKS3dzcL5CKD32c44zHaGrKXm4Vyqt
	j9spHATn/9HpK0Fx29/UjBUj/n7FfXKKR4gfWs3p08eptZl26St5VgnZmnKBIZb0fCzM0psC05M
	aE0
X-Received: by 2002:a05:600c:a406:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48fe63297b9mr233398525e9.25.1779175663120;
        Tue, 19 May 2026 00:27:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm299805555e9.4.2026.05.19.00.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:27:42 -0700 (PDT)
Message-ID: <21609bd9-7a94-41cc-bbe2-2478278b0497@linaro.org>
Date: Tue, 19 May 2026 09:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/13] drm/meson: encoder_hdmi: Use CEC phys addr from
 display_info
To: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20260518194744.2483580-1-jonas@kwiboo.se>
 <20260518194744.2483580-6-jonas@kwiboo.se>
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
In-Reply-To: <20260518194744.2483580-6-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_002745_191738_3603C512 
X-CRM114-Status: GOOD (  18.08  )
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

On 5/18/26 21:47, Jonas Karlman wrote:
> The dw-hdmi bridge detect() func now updates EDID for the connector.
> Something that ensures that display_info.source_physical_address has an
> updated CEC phys addr when the hpd_notify() func is called.
> 
> Change to use display_info source_physical_address directly instead of
> re-reading EDID to set the CEC phys addr at HPD interrupt.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 26 ++++------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 55c0601df3c6..1b9a1d9ed3d3 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -330,28 +330,10 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>   	if (!encoder_hdmi->cec_notifier)
>   		return;
>   
> -	if (status == connector_status_connected) {
> -		const struct drm_edid *drm_edid;
> -		const struct edid *edid;
> -
> -		drm_edid = drm_bridge_edid_read(encoder_hdmi->bridge.next_bridge,
> -						encoder_hdmi->connector);
> -		if (!drm_edid)
> -			return;
> -
> -		/*
> -		 * FIXME: The CEC physical address should be set using
> -		 * cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> -		 * connector->display_info.source_physical_address) from a path
> -		 * that has read the EDID and called
> -		 * drm_edid_connector_update().
> -		 */
> -		edid = drm_edid_raw(drm_edid);
> -
> -		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
> -
> -		drm_edid_free(drm_edid);
> -	} else
> +	if (status == connector_status_connected)
> +		cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
> +					   connector->display_info.source_physical_address);
> +	else
>   		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
