Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A9CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIobIHw1WOW3f6AxpLXHyA8zw1kEBPTiLmo68hMISbY=; b=27DkJpBz93TcmzjyFP1PX8iIyG
	xTJj4F+rc6mJSpuXxmt9AlDHkXl5mugQlqPfiRm912h/FLFYYqsQJ8oRsZp1vahKCNlfQOnyQuaVE
	o/CLeBfBH3rJ/XrKOtzQ4WnDf9v8Jxpa2O2c8CY9uGi6wHec0qWb7h+j2bLzEDlZFhd2R16XDlykv
	A7HeN39jGyz/QeNadTVkAIIF7854sBSSwE0qOuRt9foTTZvYDbMmNHOnb+lZjKFmvsJ1yweYmj6kf
	tIO5Qm2j6Oqyw4e65sFeVCFkH9q7f7/RMND11ipmrVSD5QNv+/gugaKqhbaXLoaSKaQpA/TwRT9lq
	E8FtFmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCEd-0000000A2vQ-3wJe;
	Mon, 12 Oct 2026 09:22:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCEb-0000000A2tv-1cSb
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 09:22:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso13936805e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791796935; x=1792401735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLb0lJXlFmNtssjfM0yj8AimWlA+OyKOOXSxBmbtCKA=;
        b=ItR5QlEdUFDCDNsOKGFpt+sv7dfU0ykRDnZUEUn1hM4Nggo8zW51ijRDy7q6CKJrb9
         JQxXFtVVitGPlF+fc7bpsN5Vx5Ff2+ve26YalQztmmlADYkoROhXvNDFpYnEsDACoEBP
         pgojLSZ31FLDsXX+u7S42RLGkePpMPg9jYbVRI/EALL4hMC6lw4Oi5eu80irqmsQrRq6
         0q/pF6HJ48bdyt/2rpv6jyyWPP7U3HBJjktWU29L69zrsgFj8C/yE6V6nbLrMvKZoBY5
         KhqLyU3+Cni/36kQNaqGYU+onVNEJ5gCKu4RGZM/+O5uGzffTGuisaDrYFEmmHe3HC6B
         ZiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796935; x=1792401735;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLb0lJXlFmNtssjfM0yj8AimWlA+OyKOOXSxBmbtCKA=;
        b=auk0wxMP8HidsfiAZhGmuNRzgZGljv9PkFSdegyKrZnlBQVwnxUo4XKnT/InD0O0lW
         Tz6nCO/JsNJ00BmQDE3dJfXCASnDOe84VO3kbjcXkn9yEig8YF+Uv8E8IrIvzXuRh1wS
         D0CyRewTWCqqWdIjvaz5C4XSiOVupb8CIoVxSYRMHXU0f4YoMpgHrqWVIYmmhlJx/yH0
         s2sT+4tYte6Nzrv37232fLPlcg7xM3zjspPvHQVnFEsHnDmyHz/AjKPjAZZQVauRxMqo
         Avt8JfcgpScMVU2OO30MzYAQsIYfqgygZcN4bfhVHmNsaQxp6g0I0c7Edr/UBhoiEfuw
         Y3Og==
X-Forwarded-Encrypted: i=1; AKwUvBwVf/SXj/ENEUU+3O1g1OJcysnWaLBC+d3W56BOPP4GqNobLE7GfU+JOUYy/CQEX+ucAS6l2LaqlN47Bx+R@lists.infradead.org
X-Gm-Message-State: AFq9FYKM+EbW6RuQwgeS3zrRP6oiqJgTAgeSe5NhomHxlneyGrH4Q9X8
	YbI+c4g/vmu/otM2hdt6Axz3d5JYkplmKFmpqE5QeUIRDQrxYHHhI8VDJdjj9n+3Fec=
X-Gm-Gg: AYBFou3Y99WEo22GDWeRk351TXTW8V/xYRHkVuXmYreQfMd9lptW1L+0AxYtf1AGG9L
	mFWTer7xqgQm1YB68WlqJFT4Rqc8hwYcNQQG9JoSMrAyNOR+L7aVlmY6RRp7prdn7y+E5hS3XMS
	ccyH4DcVGW13zQeW3t+orkUhHizwZdXUNz/QLE0PuwW0DVI+n3GoEi5nMRzMC/kJRUpQ9t58i1g
	VjLEeZf7xpYVTv7VlgtWKmbFFNGrywjaKmElrpdXCJHKxfQPtWtQtcHgYXY+QErB7hRbxf/uNjO
	9mDoGimb1iyIegBIugzCqUDUzWCiFMVMTdSOT/Zy0zi/L2pkbp3NhYrW0Tt+WW4UWfk5NB1Ef8y
	elbLfoxlZhyajjiqt3lrRBdQVZVHBGuEyNvmPmnM0YEzQ1ZcYmSH6LUyHFyLJBOwLN5pOyluD0w
	xaLU134ImxxvXT1YSaJbRBr0X1nASSIAla4cbcdrwr/kVccLPVNgoyxc+P/cS+sqEWGEpkzwhDf
	1YTX1KzM+4tN9vVz2/kKOlALfHruEGVUNqbOAkN75gsFnB/v1g=
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr158264505e9.19.1791796934769;
        Mon, 12 Oct 2026 02:22:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b820asm19844601f8f.24.2026.10.12.02.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:22:14 -0700 (PDT)
Message-ID: <03223155-d632-464a-9be3-a11f9928d05b@linaro.org>
Date: Mon, 12 Oct 2026 11:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] irqchip/meson-gpio: Allow the GPIO interrupts to wake
 the system
To: iav@iav.lv, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
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
In-Reply-To: <20261010-meson-gpio-wake-v2-1-790ecc6df792@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022217_447115_66FEC54B 
X-CRM114-Status: GOOD (  18.63  )
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

On 10/10/26 20:20, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
> so enable_irq_wake() fails with -ENXIO for every interrupt routed through
> it, and such an interrupt never gets IRQD_WAKEUP_STATE.
> 
> That matters for suspend-to-idle. suspend_device_irqs() keeps only the
> wakeup interrupts enabled; the rest are suspended and masked by the flow
> handler when they first fire. A GPIO interrupt that fires during s2idle
> therefore brings a CPU out of idle once, gets masked, and the system
> sleeps on. For mem the firmware chooses the wakeup sources, and this
> flag changes nothing there.
> 
> Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
> GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
> would end there anyway.
> 
> Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
> controller: with the flag the alarm wakes the board from s2idle 4/4, and
> /sys/power/pm_wakeup_irq names it; without the flag the board stayed in
> s2idle past the alarm until a power cycle (0/5).
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Changes in v2:
> - Reworded, as Neil asked: say that the test and the effect are for
>    suspend-to-idle, describe how genirq handles the interrupt there, and
>    note that for mem the firmware picks the wakeup sources.
> - Repeated the run without the flag: 0/5 (v1 said 0/1).
> - Link to v1: https://lore.kernel.org/r/20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
