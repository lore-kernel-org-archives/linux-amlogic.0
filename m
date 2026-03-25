Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4AFFEA82E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2026 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOwUEu6I0LnxqQJCaig+NwyTI3S9Tluxl1nY8u442hU=; b=ONKoPCxOQoABOV30kBAPhuRviK
	hFsbh1HGueiSqNUM/vOpFXyBpX7szv+RmaivOjmw8qQ2ZtMFG+mTTpjdMmUPL6QXrR8j7PJVMPZXv
	RdXwPd67sfjEfFIh1TdL04LYlJ58Y5JVSJI8oeUa6Qq3s/7onKN3j3apH9zx9BuwBsIZXnXFbVyDn
	134JAS2DIM7In1ok4j2BpMKo8y1wnpUpktkKymZgyGc5OP3jEXAI2Y59gxzoQkRF04/kXjg1l524R
	vSqzaH5wiqft1Z/qfb3doWcAxXV7wGPbJ7kpHYIurX+bAwCPo7oNxeoifrbgv5tc9AaHGUfPk2kNF
	mE/aQg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JIF-00000002udL-1riR;
	Wed, 25 Mar 2026 08:08:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JID-00000002ucR-0i1q
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Mar 2026 08:08:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b871dd06eso643728f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2026 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774426122; x=1775030922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGtfZugx6qGzB9L9OH7bygfJL7iwyyf8p4sO411xjfg=;
        b=uz9kmDSz4RQlrUKPwy0ZG+mI1Kd6fOk8L593o6MGKdpfKfIUmvbedRqfyUVGGWf6CC
         CdJNeIqvN6VmVPKiV1XrifOYc9DIhYqSs2Lv2ZbefaTVehKfZuY94AFfpD9IkYNlvJbt
         I1sgxgDnqcNVVU7LWQ5QJev0xuMkuhczrk3wEEQWERUdSiB0f/tcTbp858WqT5pfI5wV
         DPw4NAPfm4TVc0n5rgG8JPzYnsoJWY8gseL2sieFYoG3hPfZT+k7ZTiQsCQEoFvUbkS3
         5iGv+fXKKesE0ct2H+fUeEDjoo8DqATBYLy2MJK77CHdkaOrtjJl2DqzFaigs7mytJll
         k+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426122; x=1775030922;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGtfZugx6qGzB9L9OH7bygfJL7iwyyf8p4sO411xjfg=;
        b=cVIJBxQjbSPIo4haZ4ljGj5yLE7chli81HC0B8AHw59NaUuXxi0E00WrgPt7zqjQjO
         JDG7l4cZgK2qd76sKU9rCdQED2P8pZzvtWg54HY5i8BoLW56Fh3rNJbU5OYdIIDKZAmS
         NDN1VRp3IfOp5mDmClMUDm/j1Kz0VyktNAs9eBJstfBMhOliH7k8CRT79O6SwJiRFXe5
         BPWfQDXU4BTJTc/u+6hunmeargUM/j8hy51x7eS7goMM26iaz6g131OjkBLD3n5sFxGx
         JU+iWnUIejykospgNe17r3xD/dpBJQcV0pSdqRmZ7CzSNyE4CxFkw5vp4OPZ6W6C8d+q
         NNoA==
X-Forwarded-Encrypted: i=1; AJvYcCU/sl9es/OAqD+fs3lH8OvcDTzdcxJOX/yVtgIeF9XHuS1WnNxkXOmFfzSBHE8VSxpCBYUXL9dTqkPLA/Vr@lists.infradead.org
X-Gm-Message-State: AOJu0YwVH6ylWnrzfRYp1KJ00PBlloY5jwPaU7LVP1ctRnzfaz7lqcJ1
	AZF7pd1Sqs1Z/JphtlGtDTomdHt/O2c9ycYPTP2NBi8RO1k0qqrt3ZvPYSf1oge+rC4=
X-Gm-Gg: ATEYQzxrhOXrCv5PDdIE1pSuyHdB4yMffWv+xMYivYQXYl8vk2io+OZeiJjCy8L9Tcw
	mlelpECwIFly0KnMZCWbdpZTU+9h0kK3Tzk0d8wEe+yVIhSYKbdSAYPmxylJynelMYzXa/sSuAq
	aKOyawEIRZdf+UEHYOzYPyixB/T8K6n8iXbLa/NUZLIqSonGhWzCHyPRVVAXmXj0Su0beMOQSUU
	7da0oCPBS7lfVfAR6J9JlQRPKnq4mfUEjxnarZCaMuBqAxn/7N309nuI7h71O6TtW/lmaHzT7ST
	SHCmVcZ587lBcfF00+pAMoSdHbYJFgu+hZOwSPx0AziCJiicu7TYAWpojB2ZL5SLn2D1uDlmyEN
	GyTc89s6G2sM/nEYFpYf+EaoafzVIE/d1gALDuB1ZzjNA1aWjz1avuxDG1xJsqKOWe8FM/4zDfF
	EVyduskQYq05fL1yVdVlmtykbLVdmYpY6NBdjQSs4wbL2fn+goGyol0cnDlEB3cmlNa5Hc2F4WB
	Ajt2wY=
X-Received: by 2002:a05:6000:3112:b0:439:c1ca:82be with SMTP id ffacd0b85a97d-43b88a2171emr3257849f8f.28.1774426122254;
        Wed, 25 Mar 2026 01:08:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c160:8cc2:c60a:b843? ([2a01:e0a:106d:1080:c160:8cc2:c60a:b843])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6cdfdfa9sm36075748f8f.9.2026.03.25.01.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:08:40 -0700 (PDT)
Message-ID: <15674376-21c4-4403-8e0f-bcb80985743b@linaro.org>
Date: Wed, 25 Mar 2026 09:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/5] drm/meson: use default case for unsupported DSI
 pixel formats
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
 <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
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
In-Reply-To: <20260324-dsi-rgb101010-support-v5-2-ff6afc904115@pm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_010845_256513_E91E572B 
X-CRM114-Status: GOOD (  12.84  )
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

On 3/24/26 12:48, Alexander Koskovich wrote:
> Use default instead of listing unsupported formats explicitly, so the
> switch statements don't need updating each time a new pixel format is
> added.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..4412bd678108 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,8 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>   		venc_data_width = VENC_IN_COLOR_18B;
>   		break;
> -	case MIPI_DSI_FMT_RGB666_PACKED:
> -	case MIPI_DSI_FMT_RGB565:
> +	default:
>   		return -EINVAL;
>   	}
>   
> @@ -232,8 +231,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   		break;
>   	case MIPI_DSI_FMT_RGB666:
>   		break;
> -	case MIPI_DSI_FMT_RGB666_PACKED:
> -	case MIPI_DSI_FMT_RGB565:
> +	default:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
>   		return -EINVAL;
>   	}
> 

Feel free to merge it in msm-next or other drm branch:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
