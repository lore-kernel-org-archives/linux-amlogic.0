Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACE6C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnCQ5GLzxNzpdn1VfAXnDZ7CvfFUL0AiVsiBkRgvj5Q=; b=ddWpJK+39MuSoOupdsifCxrEef
	ptGFaLYCLy07Y3Q60Oyuo6cZdWqpfThsBhEaabn/QmUFluDQiDFt+qC1v/bbzZ9e4c+FL+MNadLTk
	fcEid0OkK2d5JrAwbLaIRDNnuiS0sYsG9VKVTovIEvKWVbZj9wwG0l0UvTT5rAJJB3n+Ynfrt6ZGK
	8ervj4ClxeEzNQUqovoMYjg6H+5qDZaiQBgLPqegsOeGPov3MZkN5OqVfr3aleMjH7BP864afZn4v
	+FuOsLBSXmHhwW7ywEe1+XAiYarBLLkCquRyM3YcmMgukp7CY1UR8ZVmXEyx/56MDuCSM97uMdnDO
	oKy6Yzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXM0l-00000007npJ-26GE;
	Tue, 06 Feb 2024 14:01:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXM0i-00000007nnP-17qT
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 14:01:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40ff0799f56so1966165e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707228074; x=1707832874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lxn5ppjmm76s05rtpg6sFq3Eh8QtCLp9cOdP6Vy6Ac=;
        b=w4dkqshHJ1pryNijSfY66HjJ1ajx1S1IlYrxazuNDALM6QgnKWnMfOsWrjciFctirZ
         jXDcBr7q/MhxH+0af/IgAKcctUwlLhwqPtRdpsTv9r7tXu3E6cIC0f8GYIQnzW8DGYtJ
         1hlbI4MQtkmuROJQwE0A7Upu+R9kR70shEtVNoD2Y/+9W9B1urWvejeXFd7/7Lsh9Yvn
         B98GnonjvKXTu4eZrr2K1riAxXVecdjN+F/F3QAGLrdlWU+I3eVgB/C/jZxLYt0T0ntt
         F9xXTzPx+REXngW/sw1iimzU3r5wTtVuY7ds03A29U94D5KF1EZAQrZYI+2+TWIcq7vV
         VePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707228074; x=1707832874;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6lxn5ppjmm76s05rtpg6sFq3Eh8QtCLp9cOdP6Vy6Ac=;
        b=jRnVtZWVFwovbhXG416QXFKt8fmQY4TNJl0rT1ihgR9gjKfPPjjwO31s0kkfQTtzeG
         zZ6raEho1xrklUSf3k8/dXxqiuqmnWrW0KXOtzvDltlw5GdvDHYUMeCraxwkFXifNlpj
         nzLop0DT2V0mIzYqRVXGQyRWUc1YhOmIfanedk1FKnGFv7gRlobkfrWGl2FiOT6UX1M5
         Y7ltklcCJ+NViQDvUkHAXUtcOdWrRUQUKYmuWSyqStBGUMgFiuHjLSosyi+4AuYQuTFH
         xnKSMLeynHDcD7UXRdbIMcpwdIvaiOhsv6kpVR3mus8PwAsMxOwVHTUC0Un/MryONVgZ
         RcHQ==
X-Gm-Message-State: AOJu0YwuBPNWu5eD7IvsKeACaz0wY5Sk4pbSLsQwrH2sw3nytqqcZnaq
	YavgHDTwNdARRpPJgLreVLX4CsD31KURB6/gp74GZAlgqr8520DvuMWGQu6cWLY=
X-Google-Smtp-Source: AGHT+IG92N8Wtnm4SjvEdq2MgTbyvlH4SnM0imHATZ/56b/4lcNlO3daG5aRAqQPJuLOvALLDjOz9w==
X-Received: by 2002:a05:600c:35cc:b0:40f:cb0d:4de6 with SMTP id r12-20020a05600c35cc00b0040fcb0d4de6mr6794859wmq.5.1707228074403;
        Tue, 06 Feb 2024 06:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUln28rRQq8eXt/f8B9dHukEv6uWMfzlaiW6MEpbQlOHK979mB2XqleARY4xLrniPud25+xHcCUrhumz1UUfsXqH4YU/csm+z427F2FgPOnM0z7g7ZsTBSQDAgrGc7kwkuXUu+uwMkuXR2z6Sa08acI8iL+hJsSieu3ykk2oZIVUnW/om6Q9P/nE7A3oB3ATs38ThQ9jxBw0OyDiqmPzLmzRw5sv0e19/hqhS4drsNODPnTXvcxxUHGYoZhOf0Fo9MByRcP6/meKYPUPFhMnimDcH0Wh5oRSuNJ4ymYaLU7IGgNqRBw6eZ6TgYmUHTGc6XBFo3VtiNLdedH1HXql40dnSrLBj4Ry7XN4p9+YFdyHQsHNRCnslr5FrgmB5fPfeFB6wYEYp39Jw==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id n29-20020a05600c3b9d00b0040ef2e7041esm2187243wms.6.2024.02.06.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:01:13 -0800 (PST)
Message-ID: <9ed9b458-33e6-46e7-8eed-87bf8737da76@linaro.org>
Date: Tue, 6 Feb 2024 15:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US, fr
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
 <59ef3824-13d3-40af-9a3a-9b1ec8add9d3@linaro.org>
 <ef146687-688a-4cf9-a11e-4034a50fb6b4@freebox.fr>
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
In-Reply-To: <ef146687-688a-4cf9-a11e-4034a50fb6b4@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_060116_355537_0099377E 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On 06/02/2024 14:55, Marc Gonzalez wrote:
> On 06/02/2024 14:30, Neil Armstrong wrote:
> 
>> I do have some dtbs_check errors, but those are expected since they are not specific to this patchset.
> 
> Wanted to mention those warnings as a follow-up.
> Are they easy to fix?

Yes it's only a matter of writing the missing yaml files and fixing the DT when needed.
I try to do some regular batches of conversion & fixes but I didn't for a few months now.

In my last conversion patchset (https://lore.kernel.org/all/20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org/), those were still missing:
  ['amlogic,axg-audio-clkc']
  ['amlogic,g12a-audio-clkc']
  ['amlogic,sm1-audio-clkc']
  ['amlogic,g12a-tohdmitx']
  ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
  ['everest,es7154']
  ['everest,es7241']
  ['ti,tas5707']
  ['linux,spdif-dir']

Neil

> 
> $ make dtbs_check
>    LINT    Documentation/devicetree/bindings
>    CHKDT   Documentation/devicetree/bindings/processed-schema.json
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> /home/mgonzalez/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>    DTC_CHK arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
> arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
> /home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
> /home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
> /home/mgonzalez/linux/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb: sound: 'anyOf' conditional failed, one must be fixed:
> 	'clocks' is a required property
> 	'#clock-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> 
> Regards
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
