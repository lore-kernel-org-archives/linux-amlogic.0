Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CB5C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9z05HIUqHl4d4gcJnifHOvwxYxuwQSGHxrDQNJUEWE=; b=xTvx0Y9Z8o7M3nPx20JfWEFewQ
	HTDsL0Wa+3NNcR8jAG/aFFr8Aa587WVI4K/alycFlchU9ocYaRSrx/Bff/coKp0eRh6V4RCIcBzf4
	JOSRgj2XGCGshRiH/q+TYAIr/ATV+MaqFpJeJhyzOCY+2De1pV94t+db5BglDwEz9eLuyJYuf+Oz+
	/74m1piXY2WLcbfoWSbfwEJ40YQOcGneR8XS/ErLweCShRM37HJGs5wSZXQK/lTUI3L2tkotcV1yh
	iLXO7jC4GEG25SenvSK3fssuhfHKyqVLqYMOuMdkhWbBuxxtgYfJ4f6zPi4xjxODctM9A9I9sI+zy
	KIKLIRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4uU-000000025j0-1V3Z;
	Mon, 19 Aug 2024 16:07:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4uR-000000025ho-43V0
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:07:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42809d6e719so37770555e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724083626; x=1724688426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LNqeb3ZgALy4xdwAEcRE9nVauPSurOEFzQxg2hY7+Y=;
        b=cbw7wy/huDw0Z30KJXxMHHbWflQO0GbOR5OHBmVWRDZe5tbXZcXWnEb1poZiHJ2MBX
         Y3N0DClp160eJTCXlB82O9UkXURneslcrjEySqPAkBocHbwdreWdkQKE0q2MTbDY2xBA
         wZ/oSl7OaDTuHxB+eoC7NFVMgbuowvEBE4SdsZBVqrN/t5loMp3lqYU0l/YUKj5bM/bN
         zh4R2xma8HO8w10Qw+8Chso/rN3/CFTZJNE+84xnzUlUplOQP1o7zgsZIbFpjLohkLR6
         yYFW5/qZZsnpDE33t+8r88GflRCG7KirJQKqIU6ldVLYbRIe0fobTzJm+tc92mc8BXBW
         gf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724083626; x=1724688426;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5LNqeb3ZgALy4xdwAEcRE9nVauPSurOEFzQxg2hY7+Y=;
        b=H9i+BNawo9D8g1QMy977QwvsY0cAnPjaqHoPt00mxhn1hAJ/KSUoTHIoY9aMD6BSlw
         eB5lbHgP2cOq1GR6kqlQPnQvARqbkQzLwn6ebRmqyqcXcb+o3f+nv34rWMGgfaKH6Wzq
         zLawWug92PuNA1NlR5Urz9jH4BIvXszH8W/1h9WYhPYUW6j3zFjkbdwQBQlfECazhYwv
         kcBz1AMmQe35mkt0poW57Ye0qTIZG6RAhnoYum1C/MRajevfuEdroBGW5a5sJTXPsIfr
         MdioQIRn9fE8MvPtu80U/XIix7GW8tEsBcdQigZksX73v1rszesjkhY/tnd4MFPfVt3x
         MmiA==
X-Forwarded-Encrypted: i=1; AJvYcCV3k3yM2iT2HQsf50qSdKJX6wVg5VEdNR2nyYH4A7d8GRY/Tb5gRWTCEkNTTO5fLu3Vl1DBEPgoPgYDV9lrWk4oGZ7I6CykX/Y7+sIwFEln9IM=
X-Gm-Message-State: AOJu0YyFJLxuF3IdbhaiwZNnlgKrEvOOdVPgwiXoq3rcKvFa/AUe16tN
	e/ImC+xchy+1rDu0xiDC3WdaITl1K3Olf4K8HlzmIPqB8/GRJF+apEqFpvM+0eg=
X-Google-Smtp-Source: AGHT+IEQR4t87/P6PagiJISQ0jKse0XEojnisMOIM3YVNy+F7eNVyZm87ufA5Y7uQKmtDCtIpWVusQ==
X-Received: by 2002:a05:600c:548c:b0:426:55a3:71af with SMTP id 5b1f17b1804b1-42aa8275ea7mr49659035e9.33.1724083625240;
        Mon, 19 Aug 2024 09:07:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d780ba5dsm222433555e9.0.2024.08.19.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:07:04 -0700 (PDT)
Message-ID: <004156e5-8dde-45a7-a291-425486e20696@linaro.org>
Date: Mon, 19 Aug 2024 18:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-5-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-5-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_090708_039607_84837481 
X-CRM114-Status: GOOD (  17.25  )
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> Comment in suspend says TOP is put in suspend, but the register
> poke following is actually de-asserting the reset, like in init.
> 
> It is doing the opposite of what the comment says.
> 
> Align the comment with what the code is doing for now and add
> a FIXME note to sort this out later
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2890796f9d49..5cd3264ab874 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -751,7 +751,7 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
>   	if (!meson_dw_hdmi)
>   		return 0;
>   
> -	/* Reset TOP */
> +	/* FIXME: This actually bring top out reset on suspend, why ? */
>   	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>   				       HDMITX_TOP_SW_RESET, 0);
>   

Yes, this is probably useless and should:
meson_dw_hdmi->data->top_write(meson_dw_hdmi,
			       HDMITX_TOP_SW_RESET, 0xffff);

but I think it can be safely removed.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
