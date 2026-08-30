Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B56DC61DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2026 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW+wwgrPSqxzLwmM2X9SW1skIiOjrHRE1witJG04DoM=; b=f84hwMksl+ZiooYVg2SDUqm15k
	ls0CbANm+GfEqX56ncdfrtp2jOC+Nr4HXmsZdz9WVQ1DUun8/+uuqdDrGZRZVG6MbpjXzaeSPMDTD
	lzmKfwTFDGYY/+/+t2IiTQCKtLqVOl1dM/N6lZcQCnLrwZeuD1V1vZM75IqCFuX4ogPuA6Ro5YiRu
	xtde7Q0YjcAjObFlrgrHqAV7wev5dSsuNl/0a2hUnRyYH7OlALjqFOGoac9NJ6VsCm+0klDCa2vRj
	aBLWDSsqCeZlq5Q8kHhDrzd8+9UAUwHMG/BzHfHJrko2UkhBsbtYu/Ksdc88vWIH+1pLbUeCAzi0w
	Se84N6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fDL-00000007jD8-3tQ7;
	Sun, 30 Aug 2026 13:04:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fDJ-00000007jCF-0lhF
	for linux-amlogic@lists.infradead.org;
	Sun, 30 Aug 2026 13:04:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48433f36a21so600337f8f.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Aug 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095083; x=1788699883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=zAeJpZYoMeHOjkPngfoPlUrPuhfXMM7R5hcDH94DD8K6RsRiEwTwc2zZ5TBsrEU27B
         2LEJRV413BbLXgkLbEHHFHdds7RxobJCVoxO4PE9VBqoB0URVy5uXtRpi8SrHK7VFtui
         l1H1k214ZUDE8reVp2Tvh+vu9mr6jbx4AlHF3LyZjHJIQgXY8e7/c9qsgksJoKWtHS7B
         WsVoQ5Tu6OuMBljkEn2EvzeHXRViYEkJrJ9q2ntqiOwHoGkD33xt+dnA+LGDMLnAp/yb
         kC0O1H7+4stiIxhjqvuQHMIpJvubleJOvUcN1pwUh+Fg0Az62dz8TijVZZeRNgiLelDc
         Tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095083; x=1788699883;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=pVa5vV092X0Y50uXwDp1Ap4Yt7OYT8HG/qeQ2aVzEZhzqNuIHN3ramqlF9JBkQFL5h
         IEQ5NMRoudwj4ixlKmnTuB7pCWXOnV7uPvoPjged7bcCyLNDod072npsOLSuxlTJGNao
         qJlvIGCYrHB9VtaPelz7u1chbnQ7+AXpIxo4bFvpSiZTV1JADdglI9YbtsyLtrI+62fV
         sfX2DXFh3J/Y8EHajh7/8amt8psMXhO2ovZPjoWdnq99Aiudx+ETOyK2uDt6sIXMX2i6
         T6UF3MExZhhLBdpXZqOVIK7iPwi6GWjtkEP6I6B5JNxWZlD2P6V5ibshJxLZwdPOfVc9
         PeKw==
X-Forwarded-Encrypted: i=1; AHgh+RoijvuoBbCgDlkEi2LGZNJwQ+JYXxoFZ7AP8edehecNPFLLr8vT2UkwsENBY2c+p3PZLZxIgwgTu2xZym5U@lists.infradead.org
X-Gm-Message-State: AFuF++l2NAT9iLfwp/mPPochWmjQpsp2QWwKiqPglbCsYKvERz/KcFfa
	UmVKGPgptw1iOY7aIhPJ4u8fDG7QUc+b/aSNoj0Tlsf5vGW2sSS6pbSbaH8WWIRMycc=
X-Gm-Gg: AR+sD12vgE/4ZXv9uEGOhmsfbJUw4mnY96jqxkhX6JUaB1Gi2CzXa1oTElYXdOTGNbP
	R9n03ITKo7LcPzcj/xL+j2aHn8KGuz0m3XRgWAAWJdqF9+N9hjKFnj5XDzOk1yj62icJ660t/2i
	EsLxKxjZaPkbR7ERebUkT8meWM6H45qqHtyzV2EI3CY4CeChYVpJf+xPxphlRUkKfgGKqAozOhj
	kviFwWpGDcYiI94CtZXPunfRGE0QqVrT/qq6R/Nh4JnowKJ9W7bXuJX1LhbCrKgv0w3lxGajW6B
	YNPf0HPgAyRX8cRiV4vXM9mD/nOsX0mjFPBN4GFkwejKZbczb5bnnvdIGedhieyj26nG3ic8Da5
	Dc3pqbxwMV9NKNepOFon084LzW2yHV7FWk7vySWVZ9KV1Dhyx59yuR2N5WBeY6kKp6L1Z1odcbD
	YUVzkwQgHoIKocRDAKT8Y/N7AxRJFRkpaNVaUyHDB8J3qbTMNz3ebP99N7J/MlaFGO2OiMyrEE
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr35600565e9.8.1788095083121;
        Sun, 30 Aug 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95018ee8sm205342395e9.15.2026.08.30.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:04:42 -0700 (PDT)
Message-ID: <d4ba8298-fb80-4fed-b1ce-7fc5d0adf5a0@linaro.org>
Date: Sun, 30 Aug 2026 15:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the
 vsync PWM
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-5-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_060445_241089_9B7B133B 
X-CRM114-Status: GOOD (  13.92  )
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

On 8/29/26 11:47, Lucas Tanure wrote:
> The vsync PWM output can appear on either of two pins, but the
> description named a single group that does not exist, so anything using
> it would refuse to start.
> 
> Name the real groups instead, one entry per pin. No board describes this
> output yet, so nothing changes today.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 8c4bd683cce0..719e111bc3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -546,9 +546,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_vs_pins: pwm-vs {
> +				pwm_vs_y_pins: pwm-vs-y {
>   					mux {
> -						groups = "pwm_vs";
> +						groups = "pwm_vs_y";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_h_pins: pwm-vs-h {
> +					mux {
> +						groups = "pwm_vs_h";
>   						function = "pwm_vs";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
