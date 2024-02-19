Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12551C48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dp3Yn5mJHTkyOb04db9M1BT8cKPVfpR3NDrMLxRty/Y=; b=F4S/8w38MvZlOVGZY1Q2+x21LC
	flKHb8+ZUQEVNK23+W0TvgqflyT/AZ5OJO8D6q9qM/CdFZHerpTnWpQzAyuSVopDef0rYINLvk3ot
	tLy6XyKaW7TBnUbDH9UpuEOltCcY0didzltpzLbj8ddvwmaq3CRXdPS5hDC3m6X0UCImippr0VocH
	7/zSIhWKrg1XddqTQMZ1Ryu+JMmeulpflKPpB2Rb/yPzIb2JmT367hWVd3h4q95uCWPsRJidxV3op
	t9VzKXVvX0haOK2zOE/574sVfXmeIDhhQbXLd4uQkJTVyKGaqraGa9R5zgrZK/CKTDt704xmUf3j/
	tDTy8S8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzAQ-00000009cc0-0wuz;
	Mon, 19 Feb 2024 08:38:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzAO-00000009caX-1aPA
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:38:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41266ef4bc3so3476835e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331902; x=1708936702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/gqg7nuIRKFnzJZlko92QpBtCQ0yUQMkBiOuejqskw=;
        b=K+KWElo8/z/f7DwGBAhQAKcaHM/NapmHEwaGjFxXuRVuPvV8wQjVTZ/j12ZsvRYmVu
         T5ce5xl6GlkS7kNZS0gb9PjNEE2YTJc0m8JA3VYDVsPNsSW5k8Y0oVvUXuezIOR5atDh
         Mk8W1zhx+zoDAjiqNHFWfz6haC6TmOLzRmYjRKdpdlVreL+iW7sy2dYDOBpSil4SMP6b
         soZkVtuAMgqqgcwjuVmy/0aR1NS/5hq0nwOLaj7ZXwFZg+t4DHuprfwtovkBhO270lOT
         M+oqUasZPTgDpb7bmQWjH22ZFzvK6xOKR8nIbIxfUg41BzvvMTALtL5D5KZyYOpIF/Gg
         /3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331902; x=1708936702;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j/gqg7nuIRKFnzJZlko92QpBtCQ0yUQMkBiOuejqskw=;
        b=XZPMAY4IvBtqz5bMfJ2je1WzVQIT9OOd6a5Xzw6jI0vVhEa27BI61kz68MtNP+kaPd
         6feIaZi5IuHSfBW2290YV1gq3g/FHou5mkbpvgEo/wzegjTwPkDleZ985ryBH9KximaM
         oET+jedAUIRkldF+CUtmrW7BRADzRgPVrup4rvtfgK6JileLB7P5Ge64peajuCBRapd1
         pWc7EsSbHpWS5+xXhfLHg2bOuBDIjax6ku0jP4fmA9KqqpFl7PTQq5GChKUZMOZxhVDQ
         oQH9/svBNKg/nnDVdTgrnyaX0EJuy1JLCVWeWyA31lTdmO3I4wy+ksjjWK1O0r+0rpaB
         gE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqPWH7JY4AbywSCXMSXmo3+DZcihROqU/ODL0SocJ008ypx6tD7BcpojVIKXNwo2mz7ewC43350WBN2Xt8TQVkDNHdJ8TGsjr6G0e9kIHtaKw=
X-Gm-Message-State: AOJu0YwnGDw0dPTQM5KlnbZQbjBN4NG0EVv8nStagedYQDALqMVPeStM
	xjBAqi4w0f8W7iSuYNzBOkAHP37zR7ltCjaSwcXbK2LB2wPkkpgy+5vaqkfregk=
X-Google-Smtp-Source: AGHT+IEmvmfGnvNyZqQ5o1pPesUs/3Yee3WGXYqu8K0vph/uPsQUfTBZt6lBufosP4qiB2mUH+FyUw==
X-Received: by 2002:a05:600c:4a29:b0:412:f24:5732 with SMTP id c41-20020a05600c4a2900b004120f245732mr9022333wmp.37.1708331902490;
        Mon, 19 Feb 2024 00:38:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f? ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
        by smtp.gmail.com with ESMTPSA id g19-20020a7bc4d3000000b004126101915esm4868608wmk.4.2024.02.19.00.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:38:22 -0800 (PST)
Message-ID: <f2cde221-a779-486a-9073-44228c320d8a@linaro.org>
Date: Mon, 19 Feb 2024 09:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com, adrian.larumbe@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Steve Morvai <stevemorvai@hotmail.com>
References: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_003824_470535_17F12C0D 
X-CRM114-Status: GOOD (  19.37  )
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

On 15/02/2024 23:04, Martin Blumenstingl wrote:
> Stop calling drm_bridge_remove() for bridges allocated/managed by other
> drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
> drm_bridge_remove() unregisters the bridge so it cannot be used
> anymore. Doing so for bridges we don't own can lead to the video
> pipeline not being able to come up after -EPROBE_DEFER of the VPU
> because we're unregistering a bridge that's managed by another driver.
> The other driver doesn't know that we have unregistered it's bridge
> and on subsequent .probe() we're not able to find those bridges anymore
> (since nobody re-creates them).
> 
> This fixes probe errors on Meson8b boards with the CVBS outputs enabled.
> 
> Fixes: 09847723c12f ("drm/meson: remove drm bridges at aggregate driver unbind time")
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Cc: stable@vger.kernel.org
> Reported-by: Steve Morvai <stevemorvai@hotmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This issue was reported by Steve off-list to me (thanks again for your
> patience and sorry it took so long)!
> The Meson8b VPU driver is not upstream, but the problematic code is.
> Meaning: This issue can also appear on SoCs which are supported
> upstream if the meson DRM driver probe has to be re-tried (with
> -EPROBE_DEFER). That's why I chose to Cc the stable list.
> 
> 
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 -
>   drivers/gpu/drm/meson/meson_encoder_dsi.c  | 1 -
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 -
>   3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 3f73b211fa8e..3407450435e2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -294,6 +294,5 @@ void meson_encoder_cvbs_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_CVBS]) {
>   		meson_encoder_cvbs = priv->encoders[MESON_ENC_CVBS];
>   		drm_bridge_remove(&meson_encoder_cvbs->bridge);
> -		drm_bridge_remove(meson_encoder_cvbs->next_bridge);
>   	}
>   }
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 3f93c70488ca..311b91630fbe 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -168,6 +168,5 @@ void meson_encoder_dsi_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_DSI]) {
>   		meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
>   		drm_bridge_remove(&meson_encoder_dsi->bridge);
> -		drm_bridge_remove(meson_encoder_dsi->next_bridge);
>   	}
>   }
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 25ea76558690..c4686568c9ca 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -474,6 +474,5 @@ void meson_encoder_hdmi_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_HDMI]) {
>   		meson_encoder_hdmi = priv->encoders[MESON_ENC_HDMI];
>   		drm_bridge_remove(&meson_encoder_hdmi->bridge);
> -		drm_bridge_remove(meson_encoder_hdmi->next_bridge);
>   	}
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks a lot for the patch!

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
