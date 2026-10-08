Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01B1CA600A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiBOxlTTnPfjMflkMVbdxQmYniTJetkj35CQfZDr+5M=; b=WE3+Iip3UZy/3bY4fa35+ZKhAN
	iHlUlYTwki+FZIYYz1phIfv3ysb375jABdhhyUWtyNmnKtddno2dZCGsBNuGEGY9t6gANxseQUrib
	KpfAw1wWBNcZfHr8zQT/mAtD2mfo1jMkJbbjihbvlfSRDjj7SfCXwjB0utzwZ9rssgIuLBKwPYB2e
	fzDYJ71JkTEyAMQRKBmMxyqrAp7ioFLgoOlewRA+VZQVl/Ucb4OwXIcy2QJYbXbZxGqGB4x4obvxw
	Wnj2+vaQ+DBIzSupZs+QiBb7PqDcHh17EX20IpPV5Ul0p4uOtYS6Rh9cXAYPPrcB5d9C6TGu54tB9
	0/z0kd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjbq-00000003teI-3tPL;
	Thu, 08 Oct 2026 08:36:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjbn-00000003tcw-36A6
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 08:36:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b060ec084so1938546f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448570; x=1792053370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE/Cngz9PMWY1Nl5Izdbki/JG7Hmrq/g2In+zB6gKG0=;
        b=N2gohmUWQxf6LQHuchnUFMX1M69sjXcmxSL6h+vhEuNUQZM3rphYwm4Ea8cSluMd40
         HlcQ4iZrTiSyQJ5Mbib++nm+BCzsRqpNsLeNrK/eZtWIri4fABWyPg0ieDKppY+QHAYk
         McZtwSfXH+dVALFkiXNqU7KPzGqzY7McvhJTxxmDpBWX5L4usN3JoBacx5qbYawgH877
         LsWw1MoM0b0EAtUqVdYY2wAARJVwJP2FgB6WnvxO4VLj05Cbmt2eyZviCMpRCVWQKKLv
         KvfvmIR/7ak4iffyoKvmD64nHNavn2IwLAlU2czUVQu3LeSG7dbEO1niO7S3QSRn8xl2
         Cbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448570; x=1792053370;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE/Cngz9PMWY1Nl5Izdbki/JG7Hmrq/g2In+zB6gKG0=;
        b=2DIO9dgN54Oq8kC3NkUuoPXEosOMHy23GmOz3ql0uLRnYwJpnQIy7Fvkxy2dkBrkpp
         GHNz502H7kUwa0pO1pCUV9OWKaQETXP87VVTdLLY5337TYHpKoK6jkqDHEv+ld4Lgf3X
         a7d/tJY81l/HM19TVjLrr329KB7wflQn0bG6DqTcxuHGKqWMLZHC3vCRF8HM8F1lDMfZ
         m/kT4s2HlTxXsQeO3w8aNh+VPqswnfQLkmzDqg93Jh/BZnqtu5mD80XQvCTqY8hGCscO
         bpbonajhJ1Pwls5O6Kke3ZXX2jSpu5xbCR+Y+R2uxfRpkcIBi4fXADi9YX3S7zRhex7F
         kIbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz0wths4MHp4jmJ1gckVtYWAusrDBhrLj6QNpu9GmZssBIrw9BRxBHbXZmv1WQWUd+GFGKihvCSLTrzANR@lists.infradead.org
X-Gm-Message-State: AFq9FYJHEEg4StlChaRarsXGNfdf8fV1FAgBoQ+8yYxdXtUeyadVLnt9
	CmptCjUkk8zQnmA193sugh+eRDu7qSTQVwen9051zU3zx64G64/kDyuYdFeK6SuXYrM=
X-Gm-Gg: AYBFou25SfTC4DCPuYhY90Rgh9HGTiCq9GRA+TzBKxEvgUvzoizawWpuhcLMMX1BSk5
	jgDXFT3mdxc1u0j7dPYv7XMnP8IROCLGT5ggK6seZy8QXVZsuO0l5XjPBJs22KjP6NA5HlAo3+m
	UxGo4Tr7EC34WLRgQm9R3bH58wuqE1SqrtjXVAO+jXElvymraSRY+Q8jpzW7PHX4quXFxCUnKh/
	xd+WTnGjJsouvkEQhuBSMY4EWX2uoct8XDXAsLI9CjXB8F4aQrTiAzTUW6rV732a//keNqZ88RI
	jGyEQbrCEN/1QikTIBmDyWkXtqLDIZgUvbxd01nrFVFry+ib5ArbS54EmPByCg8+sG49wOKbdhl
	j2sp6rdsr7g3L9EZbiEwcM5fd50qX2gNYyUqLZbhuNj5m1Y4VEFvj1LPsR5ud24LAuk8oJ/58nj
	b/ph7vfezUNGJP9RSFPo9UcPs01xgTk2+NULmkik1hJjh8YjCJWyPgKrwIekyFmPXXpz13xGqS0
	dAMW+OSgTHLikjy4GVZGir3mMZjYKk=
X-Received: by 2002:a05:6000:1846:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48c728858b5mr9232891f8f.51.1791448569688;
        Thu, 08 Oct 2026 01:36:09 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ca8e2e627sm1605811f8f.20.2026.10.08.01.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:36:09 -0700 (PDT)
Message-ID: <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
Date: Thu, 8 Oct 2026 10:36:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the
 system
To: iav@iav.lv, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
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
In-Reply-To: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013611_813429_F36E627F 
X-CRM114-Status: GOOD (  18.54  )
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

On 10/7/26 23:55, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
> so enable_irq_wake() fails with -ENXIO for every interrupt routed through
> it. Such an interrupt cannot wake the system from suspend.
> 
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
> would end there anyway.
> 
> Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
> controller: the alarm wakes the board from s2idle 4/4, and 0/1 without
> this change.
> 

The code sound valid but the this paragraph means nothing, adding or removing
IRQCHIP_SKIP_SET_WAKE should not change the fact PCF8563 would wake up the ODROID-HC4
since the BL301 firmware hardcodes which gpio can wakeup.

I guess this flag simply removes an error when setting the gpio as wakeup source
which means nothing in this platform anyway. So please rephrase.

Neil

> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   drivers/irqchip/irq-meson-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index 91a9c337fe6d..e0329ef5e4a2 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip = {
>   #ifdef CONFIG_SMP
>   	.irq_set_affinity	= irq_chip_set_affinity_parent,
>   #endif
> -	.flags			= IRQCHIP_SET_TYPE_MASKED,
> +	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
>   };
>   
>   static int meson_gpio_irq_domain_translate(struct irq_domain *domain,
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261008-meson-gpio-wake-f3bfa3bb2e5a
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
