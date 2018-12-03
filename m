Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAB9C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31ADA20851
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHTdsQsr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O/1zWnvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31ADA20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onmaj73U7FbYc3jqZD2+0nPr+zPCqWy78z1wgrq3l00=; b=FHTdsQsrFr7dFE
	WdrB5ORkmOcwJ/iSsilYdDMYazFKWwtjp2Zzn9rI6NiJ4u8JM9/84urfDeRKHoaBPm4CN059BLROz
	R46PwsAqtu56m1OiDvlB37brbvKGGsa4vC2RcnghaJ5QqfR+7Y0Q+CqqCTo9RUMmhLfdTGnLJ6Hbp
	eBJqSiOtW9uB6GnDsmv2u3xPCn1dab+aRh/UPZayWD7opkdERIQYbWjZ1Gz1jPoSWEQe6K8Cr6dqo
	e0K3Y5uUtVVVgnLNN/okbuJF37LYsV680ctqhqtKv6NUzgLV9unfZt1djQaudj+V/vWo0kGVioU55
	ISi+d7wmI9Kmz4spr4ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTlSh-0007FO-9I; Mon, 03 Dec 2018 10:28:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTlSW-00072U-GR
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 10:28:14 +0000
Received: by mail-wm1-x341.google.com with SMTP id n190so2702108wmd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 02:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xprQwO15Pl+kMGjgdlsakTgCnnDKnJLpuxbSBTWWBdk=;
 b=O/1zWnvOdTc2fq2vJFO0/cfbGdzyf/Wheg5xcnKZK+AtO9d0tWKdesKX7CPybO/el2
 nmOXgZIU0m+eR8KhnmWL16PVzXp9A+MWM5DoruC42lGO+ZXdfDgWrmtr2BTTX/3gd7RP
 hPNR4qBjcMUJk796w1h3Srh1LLzCHZiN4YLF8F6rU7RC3TvvJnnpnws1DPLVWoGnZ6qz
 GQ+sM+W9WC6FjiBBNI5wnCMCrHyJcg9Yt/z6hLM9VGD0BlxvnfPbsqFA319R2iKJlCwm
 xWmoUO5Mz+JizlRXlPqNH7EqTALs6z9SLwQF+5h3EIkd+ZY8WkzM02i9K1yX47CEfEw1
 n34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xprQwO15Pl+kMGjgdlsakTgCnnDKnJLpuxbSBTWWBdk=;
 b=KE0ttQihiI2duEMfOhIHGeYjrpcGFwdsxZDj8ASNeG1QE0faA8hiNKks8n76ZPmRq3
 yo7/38CUEq3pYI45+CnvCsDz1uodjU287yMicSidIKs7C4onAs+6wA2x1u1u1+zfsyTc
 i+Vq7IV9Ig62GQRyfnlDde0DD4yG2j6Ce6E8ZHqePDSsX8X8nT2PXkl7FO3aJCYCAcZs
 OXBKnd+Upa4HNAOFOUsktv8zo8T7F3EdGUKCjRFzkwZIdRW2tmaZ7nONq0UPpGrzhBCg
 I9UHnFak4hgtZnJrgX8JZNTera7Fkw6PXwiEs/JEc60qqvRT75Nv4G0Eq9Ow03wO92O9
 rSJw==
X-Gm-Message-State: AA+aEWa+aTw/VRJvm+j2eH3N2RLYG7mpqa+Qqq/oubQQChVJgW7CcOoQ
 VMsyYKEAPxtqjuBzLNK39s9Cfg==
X-Google-Smtp-Source: AFSGD/Wa7wFTmv/ehHEXWEXOTz/l/V1P7mwmd6CNFZ4xvNtHe6OCU7ngC1s0PtEVgs/FGd4psj9l9w==
X-Received: by 2002:a1c:d988:: with SMTP id q130mr8126268wmg.41.1543832880513; 
 Mon, 03 Dec 2018 02:28:00 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r77sm6683671wmd.22.2018.12.03.02.27.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 02:27:59 -0800 (PST)
Subject: Re: [PATCH] pinctrl: meson: fix G12A ao pull registers base address
To: Xingyu Chen <xingyu.chen@amlogic.com>, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org
References: <20181203030533.10989-1-xingyu.chen@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <a240773f-7b05-d950-e5e9-23d7983c7f35@baylibre.com>
Date: Mon, 3 Dec 2018 11:27:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181203030533.10989-1-xingyu.chen@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_022812_741661_633FC12F 
X-CRM114-Status: GOOD (  23.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, jianxin.pan@amlogic.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, carlo@caione.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Xingyu,


On 03/12/2018 04:05, Xingyu Chen wrote:
> Since Meson G12A SoC, Introduce new ao registers AO_RTI_PULL_UP_EN_REG
> and AO_GPIO_O.
> 
> These bits of controlling output level are remapped to the new register
> AO_GPIO_O, and the AO_GPIO_O_EN_N support only controlling output enable.
> 
> These bits of controlling pull enable are remapped to the new register
> AO_RTI_PULL_UP_EN_REG, and the AO_RTI_PULL_UP_REG support only controlling
> pull type(up/down).
> 
> The new layout of ao gpio/pull registers is as follows:
> - AO_GPIO_O_EN_N        [offset: 0x9 << 2]
> - AO_GPIO_I             [offset: 0xa << 2]
> - AO_RTI_PULL_UP_REG    [offset: 0xb << 2]
> - AO_RTI_PULL_UP_EN_REG [offset: 0xc << 2]
> - AO_GPIO_O             [offset: 0xd << 2]
> 
> From above, we can see ao GPIO registers region has been separated by the
> ao pull registers. In order to ensure the continuity of the region on
> software, the ao GPIO and ao pull registers use the same base address, but
> can be identified by the offset.
> 
> Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 53d449076dee..7ff40cd7a0cb 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -31,6 +31,9 @@
>   * In some cases the register ranges for pull enable and pull
>   * direction are the same and thus there are only 3 register ranges.
>   *
> + * Since Meson G12A SoC, the ao register ranges for gpio, pull enable
> + * and pull direction are the same, so there are only 2 register ranges.
> + *
>   * For the pull and GPIO configuration every bank uses a contiguous
>   * set of bits in the register sets described above; the same register
>   * can be shared by more banks with different offsets.
> @@ -487,23 +490,22 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  		return PTR_ERR(pc->reg_mux);
>  	}
>  
> -	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
> -	if (IS_ERR(pc->reg_pull)) {
> -		dev_err(pc->dev, "pull registers not found\n");
> -		return PTR_ERR(pc->reg_pull);
> +	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
> +	if (IS_ERR(pc->reg_gpio)) {
> +		dev_err(pc->dev, "gpio registers not found\n");
> +		return PTR_ERR(pc->reg_gpio);
>  	}
>  
> +	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
> +	/* Use gpio region if pull one is not present */
> +	if (IS_ERR(pc->reg_pull))
> +		pc->reg_pull = pc->reg_gpio;
> +
>  	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
>  	/* Use pull region if pull-enable one is not present */
>  	if (IS_ERR(pc->reg_pullen))
>  		pc->reg_pullen = pc->reg_pull;
>  
> -	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
> -	if (IS_ERR(pc->reg_gpio)) {
> -		dev_err(pc->dev, "gpio registers not found\n");
> -		return PTR_ERR(pc->reg_gpio);
> -	}
> -
>  	return 0;
>  }
>  
> 
Doesn't it need an update of the bindings ?

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
