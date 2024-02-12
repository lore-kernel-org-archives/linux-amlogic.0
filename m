Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3317FC4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHsW9anfWJSoHiVoGs8QC0P9uObMiQ+IKDA3CUykpt4=; b=f7LLXye+fkvlPynOKXjr2LhL7W
	VZGJ1e9oDlvqU6Q9el0YjWB5igCHVKGxcStg7dGXTMLhJbWSzCjgd0Mha8k7OnLwycDPr/IFFYuy1
	aYuii9gnN5UFXd03tISowQ3Lor+dP6zp8YzgotBsH9g4ng+4895dzfJIf3cyX1r0nF3+DouFxPwGF
	rP2O0imH/DclcFvkgSiHe6jMbi/RdA/dj8qUvk2BLTlthlY+sGz35bYrHg9RGo3m6vz3uG19m0Ufu
	skZyUOhXU7hN4RolxLL6mAUc+N2rwH6e95fooDb9SNkFfEke3VUdVcbmGSrVH9463jIl+weBW/26z
	TW7V8apQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjo-00000006KU3-2J9g;
	Mon, 12 Feb 2024 17:05:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZjj-00000006KOR-3grd
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:04:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-410cb93185dso9888165e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757494; x=1708362294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnlFcYYxV+8xVptqetGlSMvuarTqWvNDzjxOKjAUqOg=;
        b=IbLneJAtDgqdW+HKcc00x1HhbpiWsT9OoUSRt8d0YVHf8sUIEdDiQl37UJF+4Q6GvA
         AsEZkM8iRqIivghUFjP9CdDYG4wxk0ocDFG8e0pWBZxqIF+2wfyQ/ce3sKmvCXDqfWFt
         8b0nDa0Hfr1gemUYyyzNLkDMr7CbIqEBWeHfjWt63hqeyu1qGazSzPNRGqua96IgUt9O
         cboMmdQs5Cr/yQQJd8ELFvSTD5B9gm+KMFYC6hdol4orHjnajCKUwfkdp84GfGh0uab1
         sSPhX1D7N6F8BfttuZ+DexqceErpb97c2CUdVuk4ahyei3JhENCPTPUT5PoMN/e1V9pr
         xNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757494; x=1708362294;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tnlFcYYxV+8xVptqetGlSMvuarTqWvNDzjxOKjAUqOg=;
        b=biFMKn8HrBbtEYwKTOxPe5y6/KiVuZs5XpVITtHaSmYTlgUtCs+htygRDK5PSOzY2K
         3zrzfqCb2/WuQfKiKnWHY7s69rUyaFjfPSllPaFupaE8ibzXW+yUvmIltYhKhaTOjjhb
         pK5P3Qr7MYZQ+nNWKbo0YHjeqnBYqbWm/96gvsigSV0N3ju7E/ahaK8YniCwLMjFXScm
         MELL+f3ohOVT/QUFln2qpDTy40eaNNjEi4CH2e8QVT3ysRYZNAT4hiNkOf1hJng7E/zO
         C1eFm9+TC+TLwQ2GzQUKMXJ7QQRI6JwWt+V05TapoNLZMek9GnpHetckSkdsp1WZy7ma
         peyg==
X-Gm-Message-State: AOJu0Yw7HT/CX5Q8/yi/YDn3azskOqzXrKLdBk7gUjTraXqoy22F+MUA
	fYHjDgfL4Tols8A+v7KVGYeCzGNgAEYW5vhLCLYrGAs4LVlfGHNoKHM5pGphkxg=
X-Google-Smtp-Source: AGHT+IH9qGmw9nwphxghFf7cRSEenHYCVSiFyoQOsKn8U3/wxIxpBARqwzxrILU0T+G/X8nzi8kAcA==
X-Received: by 2002:a05:600c:a386:b0:410:c148:2a4b with SMTP id hn6-20020a05600ca38600b00410c1482a4bmr3682640wmb.37.1707757493845;
        Mon, 12 Feb 2024 09:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbhtiBWLx71foFqG/Mrmg/AENgTBrjlVZ+U5sFZ7wJ7UWRYzAVg+dLvpvbtXgr2kTvNVY9NWwSKWheJjknZ0joEq0Syyr+s0NKjU4ZGFzscd7wgIjMLzzVo8TSarRChYloisONs/iAnOYYi8IwMqoqRg1HmesUfJy57mr62lqEGaMXXdmqm4SEkNBbVBP3KHF2qPEWvPnpDwZLfXkVvjFci4rAgCUC0/jWNIQt518bNJ9eVxKOwJD5aBvZ5DyAHP36ClLFak1a9lpNWDsrpFBnhJsO66PgohmT58dW2S+lE8LGmqQ4BcbTPuWKJOoONZH+jRCHdEqJv9MGGLk9cBKrZPFgntPZO1JZZudgkVuh5vkBfttYgGbnWIHCTnHhba1WqXFKyaVFwfyj3++DcLzgEiPDS47Rg8A0tDAovOURSg74/WAI7ZNmmKKcN4SMTmmaGP5ulJLAH/sOVfWUXtWvAU78GqvV1zb45mjwzvjg87l9gG8QZI46Ih7THA/zO4UQFjKXk6aZR4BYDzEkb+xxZDIcg5+wQDmeDOGYnIZfp0jeHRYCIgwL8Y8JU1K4GjkeX5rsEtCcR8LlXNrlzHAGtViJiLz3XdNj
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00410e6a6403esm2462229wmq.34.2024.02.12.09.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:04:53 -0800 (PST)
Message-ID: <ecf86b35-a53a-4570-8ef1-377759422dcf@linaro.org>
Date: Mon, 12 Feb 2024 18:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 20/20] arch: arm64: dts: meson: axg: add crypto node
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-21-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-21-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090456_066277_249DE271 
X-CRM114-Status: GOOD (  12.27  )
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

On 12/02/2024 14:51, Alexey Romanov wrote:
> This patch adds a crypto node declaration. With the
> Amlogic crypto driver we can use HW implementation
> of SHA1/224/256 and AES algo.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 6d12b760b90f..b19be72abdd6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -294,6 +294,12 @@ ethmac: ethernet@ff3f0000 {
>   			status = "disabled";
>   		};
>   
> +		crypto: crypto@ff63e000 {
> +			compatible = "amlogic,axg-crypto";
> +			reg = <0x0 0xff63e000 0x0 0x48>;
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>   		pcie_phy: phy@ff644000 {
>   			compatible = "amlogic,axg-pcie-phy";
>   			reg = <0x0 0xff644000 0x0 0x1c>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
