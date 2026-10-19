Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A35CCF2DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2026 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9x36ZNDypyM2SQI51JDDvRMWiR7VXXJ1WPJHFAAMss=; b=GkP+DBLMkcJ7Jn4EZCYfTRcmD/
	2QeIa9eMsrLt6wnColPN+WfkQO9Z5oqTTuf7NlNEYVKzJNZqVKg6pMSVks2nsDvoV9RN37G1hifnH
	5G2lOkumtxm/G5qriQdxfyBVoFuQA3lj5KALMIzHkYPh4VmROUN13hER1EThg+qCeHclEBejaQhgj
	Y84ev+x46gg/o23eRihc15RZbAjHkiQokwEGQrBQDE85OukgVUP+5xLXqCgTc1dFg/v5p5iUQyXog
	a3JKUG+rOfXqYnzXegFvipKnjYRrvoxSRq8SyFfwh3VGgFguwzzfsTAVVSuwG47c4mhdoClhMgquq
	eSpLSt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIho1-00000006lL1-3kIP;
	Mon, 19 Oct 2026 07:29:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhnz-00000006lKF-3eAO
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Oct 2026 07:29:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1360841f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2026 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792394948; x=1792999748; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=UhmIn8YqsF6ZBnInjtnEf6e2e6ARo/kGQIU3AjYbZv17H7l2lHqtFFHLavA98RceKW
         9/iFKyCGOsLRF7qjdC+09vwSyzlZjtVyRVwgeRaP0IJ+22kQRTigEwNXjT6zHOej0qj3
         Z8AFFzu40HA8ynSRJctp6d4/YynMcHQbg2b2YnXILwUsnYC6+fCru4VXeI9/LFiVQG7T
         u2Yb6PjUJ6V1qR4rjXOWwy4OXdYBvw0yRTDeg9hP67kWMNauoaImzVfgJe6modEBnmZR
         oDldZ02xMNkm9dfhDXkasT6QG2LyCVgjOTC3YTS7HkUu1AyAQfZ4/B+ly74vQgzgTw2N
         NKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394948; x=1792999748;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=yhHklBTgdW1FF/9UNveVm4kY4EYV0C/9h9RFou5Ui+L3pWU8uH+MYShnJsVeUIza0R
         3yCVHXyhNDJtaiHVKU2lLFvKMrYpizaLmHF1nUtP1uxjGzjsh46qojVe4pY8Y8NmXpO+
         Jz2Eoum0H71P9uI50EwiFg5utYvi1qI3VnPx0KJibT+LyevWljQ+UXJP96LD7+t+BnHT
         b9GHfscCbXzsL3dp3VXfmQ1WEl1ZAK/0lpB8Oa0xJF0N0E6Iksh+micQm4wtdeDH5LmV
         2CAL0fwIENlGquqsJDn5wEceu0mKO+bPHqw+GKB6qhvMsBOCZeTjKP1V/tMykUdmB4PQ
         o/5Q==
X-Forwarded-Encrypted: i=1; AKwUvByhAZjEEGkSJ8+pnSeyg+IVF8K86jBPrLu7gVRUzWIXz3FjQcD9U1xvlDKQtJrXic0U4O3NzeNgITijGjLa@lists.infradead.org
X-Gm-Message-State: AFq9FYKr58dJ+u2aRLR1BQi2/APRpR1/wNMFT4GDFVbvYQ1HDD/Swj8E
	GmUWKPGyXlYou4zNEsm9XMzlPRLvzCP+nW03tWBVVwr6JTJ9BHL7sNrmRY1qEDMwYG4=
X-Gm-Gg: AYBFou0A/Uj+Pdz+ouzNwcK1LQv7kYCBKhwCDWzK0qcxHXGw0pVq1UXhqaDiZTAOg/D
	2ak2Hjf3eSlTisjakrAbIwjL3xjbnbYTfI29XSE8ArV1RdQWQ46m8+CtbDuU+ujX+6eF1CqbD6e
	0FXZ/4ef4SkrCNIG5sngzu71FqeZ0ZCUUOt48SR4t7wMoFjRlgrW6lyGwQj9iZ7FRDclubbhVIX
	3r4ot9ddF2MNwAzEI0uZBbk5Y23101twJ32sKgz2nMZirluAfkouA7fYcG5Mjiwrg1zINof89as
	PsnaGEaQRu5UfImXjwe99n0tD1Arzr8M1lUaK5dWmEzAA0F4yWi2q0Ws3Riw/ewyyZzLHMCGPwk
	hCi+Bon1Q0yb5SUpUlxzv6VnoXh62xHFCq1tZb+xs8PE+5hxPPCAnefnIIN8ZCQ0iwj6Ye2RXx3
	nhNDqGChEQNRqb0zxwWq/yO2nRvvkjl9TQMzSLrWicSPHX7QP1qd7YsRUhghwWQt6Z4DmyQRgLm
	0s+PeoEFbszEin45BkimEVDztzx0J58eG1CkcRBvRGU+KB0HXDAzw==
X-Received: by 2002:a5d:414d:0:b0:487:219e:5e20 with SMTP id ffacd0b85a97d-48e07fa8ce2mr9406189f8f.51.1792394948485;
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm21249024f8f.45.2026.10.19.00.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Message-ID: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Date: Mon, 19 Oct 2026 09:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC
 as rtc0
To: Shigeaki Asai <y-asai.0816@docomonet.jp>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
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
In-Reply-To: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_002911_927977_CD4B2450 
X-CRM114-Status: GOOD (  19.86  )
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

Hi,

On 10/17/26 13:07, Shigeaki Asai wrote:
> The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
> and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.
> 
> An RTC without an alias takes the lowest free number, and the RK817
> RTC registers early, so it usually becomes rtc0, the RTC the system
> time is set from at boot. The RK817 RTC seems to run without a 32kHz
> crystal on this board: it ran about 1.5% fast while the board was on
> and 14-17% slow while it was off. The RK818 RTC keeps time well:
> with it as rtc0, the clock was off by less than a second after the
> board was off, with no charger connected, for 12 hours 40 minutes.
> 
> Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
> well, so that the numbering does not depend on probe order.
> 
> Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 348baa4e6d84..86902f68d7d4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -18,7 +18,9 @@ / {
>   
>   	aliases {
>   		serial0 = &uart_AO;
> -		rtc0 = &vrtc;
> +		rtc0 = &rk818;
> +		rtc1 = &vrtc;
> +		rtc2 = &rk817;

The vrtc was used as rtc0 because it's the defaut wakeup rtc,
can the rk818 and rk817 wakeup the system when in system suspend ?

Neil

>   	};
>   
>   	adc-joystick-left {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
