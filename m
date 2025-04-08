Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1357CC369A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Did8oPpiAw31fi5s92K+kQUvYCdb1VB32W2w6/WfP5M=; b=W0IV1uzBg37PrZE24vuxqn95Az
	RhK2yvFbmHTrgp+GapunoMNrocXSDIPiLhcV1ul/i9+XGC50rJERKSxFCmd0kgOc2ynqphyMO+xkg
	JcDXofOzNohUzHshJILeMP4TYcGjxd2K6qOKpxSy0OgJ3FCuvE4nW82K5joi69VuXDF10eLlph6gv
	pzg5u8O1bp1q/yAsgTlaeg4TaBPlQY2AVOoWz7p5Q/oYVe31etFcmVC0+IToSiiWrxmbjaytcHNy/
	EELmBGklps12Hri5wpRlwAqjJSur96k5axlN2Puq2+Sz3spSqG0YEq6WGJGsMs9x+X4eeQEUaSLeX
	IEDtI+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29zH-00000004OW2-2tmt;
	Tue, 08 Apr 2025 14:31:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vd-00000004Nb6-02Kx
	for linux-amlogic@bombadil.infradead.org;
	Tue, 08 Apr 2025 14:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=; b=Ll0XLe2L97pWVj5t6jkwcvMhU4
	KSfS6k4FLtqjpCTYeMgzGWjo3myNUMvAeC8A0eRew1EYFPWyy99O07XliPzhRY72kqFVpcbYDb75y
	x3mspOPdQR9Emm3vg6TQRJyKBY2+MOXXase6b5A1Kpcq8/VudBR2MOyisdvuTKDfzyIpH16YtOu9b
	qDkMIU2McpkdqsF1tE0mVpbrLqn38RQ5VFOAsxn9Vto5Zx1a2rqwTV3/fjs66lWpCT1hBdYdxwwuz
	wEFmLpS3NdzvMzf/d9oKKKYFdzAoWNouyW4nvac5i1B1dS5jT/PMtej28tWdxEYueCpDAq7WAHMfc
	3u7Vqr+w==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29va-00000008Jw2-0fKx
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-399749152b4so3017982f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122468; x=1744727268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=pWySzRZko8EwBW+fGLiXe36yid3b9Qx5r50vuD+xwl4wNLeM1H3Ot4jSQDUE0QmGrz
         M+af7ufhbr5nADwbZa/ArC4aukrfn3CZoxGZC9EfyOZgDt62bzBFll6dQTr9QUFsU875
         JcUU+jAqYe0gpQhguFehimTh19JJ9FLyW0UrLqegVmK+ttNoXcaBxs3SKoXtWr656zoA
         em2bjBzIKeplJ8+zMO/ag29aIRXTqL+c7kvspJHRlf54wF6WqHVKy6OR8eHxfH3V9cAe
         NOCsYc88vgvSqYsPwRAHsLYieEaP+lIw1rD8nmXSzzqLZyeQgGNU/T1L7+v1RqYiFCJM
         TIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122468; x=1744727268;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=FPfSpjJrVPLsp1yZJ/ddIO3dekgCd+HN2NWz1Yz4H5zpnUhSqbFWFZ9GnjECcBANAQ
         j8rMn7Kov0i5CwJNm76+fZoJcyTw/D5pU08Fa1nBXIMFxSSH//eTkUyoRBNuj+xhXQmx
         Ng9wDANSPA8KiZPExi5wjfhvYm2Rp/zul/S5NFVMSrpx+EfCsdc9v3SONEcOe+P1iT+Q
         zc2wq1vdFfe/FZl65KJ+lvcVfr9NVrE1UgphMmdiwIADcCqYjVCukVO2ByBznUHGmuze
         F2YpMBPqj/eIDR74C+/QdeNmbcnfJz9VYDzyEOVOFg+F3IJd5XcAbx+0IeNBczQaDcu+
         ZBkA==
X-Forwarded-Encrypted: i=1; AJvYcCVTL6SsP0W+LNR262Rb2ZXihhMIr1dXhvJDDSPFJPrPL+ut8DnykJb5x80Q2PhARKCcKp8yITMde1fVl0Kv@lists.infradead.org
X-Gm-Message-State: AOJu0YyCYKg3l68of4j91Oxj4FpM1las0JzNaO99iQWjSWCuxe4P/pRx
	rFMEJkClK+7izsvQJMpMEENjOsdcOshUPk4bbkWrrrIBwL0N5MOYGqsEhg9oowg=
X-Gm-Gg: ASbGncvTDgop+VaQvex2PHcQ1AKwVz0vE6iAmBeBC3HbM5Yo4ycqztfK0E11xVDyAXN
	NG1apRnQm/2k/mRANaqx3prGkhUfYw0qtYo0FX3+tqOgSFxQgG2SWM8Y5NSuvAgmVL6BPC/OQ8T
	kERlYwZ/TGzsGjtL45sCe1uWyqFRHuBCDd0P0oRXPVFhOUOstShymenqSFmjGh5mRVTsVumWb5o
	GyPg8W3mLwCJlsdpok49Astq6FMH0H+LeRgPcwkRUCIiWpkgUTLNHJuvGsXmAyI9LaNLTGws5FW
	mKgCIMpBBB9lhfrrmls+kY/mV4A5r3rDE/xVRguM8IvT0NWt5Yjjp0JD7C8ygKOu/NtGAzWf23N
	xv7+y03sTFDfI/w0jl0gKAQ==
X-Google-Smtp-Source: AGHT+IHOQl3NOqzgesmZMaye/+jS53HYFNcdFr4mTBR4HNItRvuMdvVuoVoOZXlrImVcJ2UxCZ7isA==
X-Received: by 2002:a05:6000:4011:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39cb35b2527mr16291235f8f.5.1744122467955;
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm161009595e9.19.2025.04.08.07.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Message-ID: <81d462fb-b118-4354-82b5-92c33d870b44@linaro.org>
Date: Tue, 8 Apr 2025 16:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_152750_321418_45A41F85 
X-CRM114-Status: GOOD (  12.46  )
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

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Increase the build coverage by enabling the sx150x modules with
> COMPILE_TEST=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 464cc9aca157..94eb41bb9cf2 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -541,7 +541,7 @@ config PINCTRL_STMFX
>   
>   config PINCTRL_SX150X
>   	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> -	depends on I2C=y
> +	depends on I2C=y || COMPILE_TEST
>   	select PINMUX
>   	select PINCONF
>   	select GENERIC_PINCONF
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
