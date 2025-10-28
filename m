Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE1CCF9E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Oct 2025 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzm2w6vX4dYwtpv3KURzH6BObDhF0axes25TSQ3WRr4=; b=uSMrm1fvJHvfYRw72y4oZTFPQM
	gMlqLuf/wVR5ir6tjZrGNwIJinvWURN0AU6T31u3kmJ5y/+BNb4s9rXh6pXTkKcc3/cae2vpNf4Xj
	atRh00+Y2uTmC8hTBMFWkddgklNdCKmQ+hIAGzF787rqHbMHswDAfSsmSBb8J2vR9na62LlfIIlQE
	fcDhKW85dMjtBdf+l0QbRZEoEvz2qccB4auPnoCLLyceXboAMDA8FxjmOFJDtHcjEBOkYKKgj8Nkg
	KIGs4cuCaQCAbF/hQAXkTZ130D8XTEYOusEm3fwICPJ6UNKWzD7i7xGl/kMDCcDUnlY9rmmI849bD
	UTeDq+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgOp-0000000Fh27-0iTC;
	Tue, 28 Oct 2025 09:53:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgOm-0000000Fh0o-2X9F
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Oct 2025 09:53:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso20322105e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Oct 2025 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761645230; x=1762250030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I8yp/MiZ7ri17yJV9kzL93n+BFpQFCc+/QSsi4tVMs=;
        b=QR9U4wkmv3qFbE+hInG246EU7YabUXGU8O7n0pQVEPku1njVrZ9CnG78AD0ivwg8PI
         qhgwLA6YjII3W06/KqS3/Zpy0tPbRabAPsgSfHJm3QeBoyH3xQ517Iz84AduI8vT5h48
         kPkcSdT5X1xVyfNUJkiY50LCmirLV4l4HwEvFvdrpgZj2eM2i+GPPPqbsm0HngFkHjXk
         rm0NxXbQP0KnX/vm8V8Q5JkgbFkwMWGmpHqz2QhkbGd/UQUGupRwMm3NAQGGdNNdu2oW
         Mo7HvHahzs/VPxtr3uTkTDewvTfWDxVFlf1NgjTMCgJNVZZhXkJHYpYZbPQ0idrB2S+g
         eJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645230; x=1762250030;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8I8yp/MiZ7ri17yJV9kzL93n+BFpQFCc+/QSsi4tVMs=;
        b=XZ/T0//XjMF9bMT8JpOdJw/Jg+YUfvSHX2c5zHsImL9x6jHacZDpZQAX62caRcne+m
         Dvh3cSmnD09IkaGfIa5DYBfVK2F5PLPxzO9g+97EcY5soy/mWAtw3mMyNAW5d9y16lmP
         KelAZFv+429F7YxIsFoK2PwlawH3TdZx3UNxwtRZRE0VNWMIjoD40JuMp1dDCbHGmL2B
         JKdpmfVZeF9CfTzSGXpdLm7pVcnJC+/TCJ2HC/yGu3EUNOYC9wYHVuBVBwKwgy3GrINi
         rxVfWqKmfFXBOKXG6vUQi4txBfIoWWf6KQRYRDRoh11CDT94gsJzJQIitM1lZRZdgSU4
         EtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsObGUTkKsVO6dUEY4q26hW5NVm2emuVY32lHz2zMyxiofbRjtv7NQCBQlAUQIEqj/ilY34ewlvBUB+261@lists.infradead.org
X-Gm-Message-State: AOJu0YzuPIMBZ1rHlHS7n/4KWbo/bEaL63U0nimagftu79JmtdoXcyv/
	3JxQsfDfJfW81jdErNECB+YCf/Ok2bscbJu62SsEOdM64tAnD1yLhp/1hVWz5LnTXiU=
X-Gm-Gg: ASbGncvhF+35/BrmSRqUI7ZA1b8TsdgkGCzo/i7W9mdMX1GbyThEK6Rrp07vDMCrgLl
	iGM+kuIkEtCcSN478KqRnPqW8NrHH/UpB6EUJ7ULrOmbDMUJdH3FAaEGWdLDmJSFMvCNVUBLgy6
	rVd6PLDru7sDeflmpDo/fPejvmfX5eZKtFvP4rFsVRIYmQNraiG4RGxeaTau8Fb7Hx41OKbnGjq
	0+J8x8bWl2CrfV1BqkTWM8EmD8RRRmJUU69oZna2yNQtLJAj9jcDhrOaMKwY2EIbXdEzAq4Me/Z
	U7C36PMNk83PzGzUTQODNsnOrx23LEk98mwmjxwmfXWbG3rySbEiHX2D1Yr242dGswmVYJ5098Z
	+X4Al096WsnzrJ2BunOXecbrf38ReB0e+yvPO1NpA2XL9UXbcCFHyI+yeTyAbn2m9NC8Virl5y/
	8bvuvd+zdVRMBdtmujRlWn9b+aPbFrCO3ATUEMswrrswO2pHvNnA==
X-Google-Smtp-Source: AGHT+IEqG+78yGFGY+SL/zvW3Zf5gXKbhNU8p6clS9qReHpKKpmAUUwL60SMqhqOg8eCmjLjilEooQ==
X-Received: by 2002:a05:600c:4f0b:b0:476:4efc:8edc with SMTP id 5b1f17b1804b1-47717dfe1fdmr20085705e9.15.1761645230249;
        Tue, 28 Oct 2025 02:53:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd48942dsm189090425e9.4.2025.10.28.02.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:53:49 -0700 (PDT)
Message-ID: <fbc3237e-0185-4c06-a6ea-f061a2afbd64@linaro.org>
Date: Tue, 28 Oct 2025 10:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: Fix reference count leak in
 meson_encoder_dsi_probe
To: Miaoqian Lin <linmq006@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki
 <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251027084258.79180-1-linmq006@gmail.com>
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
In-Reply-To: <20251027084258.79180-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025352_665358_548FD857 
X-CRM114-Status: GOOD (  11.98  )
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

On 10/27/25 09:42, Miaoqian Lin wrote:
> The of_graph_get_remote_node() function returns a device node with its
> reference count incremented. The caller is responsible for calling
> of_node_put() to release this reference when done.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 6c6624f9ba24..01edf46e30d0 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -121,6 +121,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
>   	if (!meson_encoder_dsi->next_bridge)
>   		return dev_err_probe(priv->dev, -EPROBE_DEFER,
>   				     "Failed to find DSI transceiver bridge\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
