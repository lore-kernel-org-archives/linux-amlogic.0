Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F526C197A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PNLj3polXbjmbHtaRvUOr+Z9WJ4o7fuP6LycJOBb+c=; b=f75sr1++xIKtH1Eeb4mj2ZBQRy
	Wwk/Wv1Q+ptttUoj1l/PY23onp94pXSEA54BqLozLQ3XX+M68vqT3lpqJrAQj6mheBmrPnYNtTNLy
	/5vfsa7rXmmGMNS+Smjt3dma8lPWKBpcDgDNlqYH+Z4RyimezVa8m0ZPX3d6Mqoh8G5SL0XXbBOge
	Wt6ITmTjWoHYr5PLVHsRc/xsQeGRy+XXB19Acon4ex4KXQfP7k5YmLaWkyqD6yR3HysNNGVbCRjbI
	mwBFP6ujM5dML7kwLN3Se392Dy2OspREXgwNMBZBMKafghZHZldrfyNYPiuhhURZGw7W88PbGRoMG
	1awarK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zdU-00BVQL-2T;
	Mon, 20 Nov 2023 08:28:04 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zdR-00BVP3-0A
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Nov 2023 08:28:02 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so24027491fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Nov 2023 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700468866; x=1701073666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zUGH0c4GY6lD98Q6lqE8V3ux67qaNFVeyeN6TZqzhM=;
        b=VNViBbxwcFfg5tjw0sUPEPwNkuPt4IpV2M5uxJB+eg1bRUpFL07BdQQzludg4Hw0VS
         gbIPp5BiLs/3RwnowV/Y6YblB6oZSr45MTx8NQZVlbTaTPbobvtY2HNxyg/pgrOOxClh
         Mpjkri2WG/RB4YT/Md7MyR8s1c4e0d7ykeJ7zwtqGgnXLb978xTFvUvjPy9KAbejCPCa
         kDzawV8rvG/B6y/TlvH8QiFtf6mE1viQIneuGAywhiXw2YjlwtG4T7+Dkydo1d95VkcR
         q2D/GDYii9Vu6zd10ST2NDyl0ivZIocxeOzm7rMVL/WXKmDXQgKqlsFzwDU9qDnh0GPS
         wcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700468866; x=1701073666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3zUGH0c4GY6lD98Q6lqE8V3ux67qaNFVeyeN6TZqzhM=;
        b=UcPSwGRSdlzjIThgMvJ3I/ujrc/eHRLy22GBOdvZCMzho4sR26Lf9oOF53JFQPTgz0
         F/hZokM8KjpHayEbaPjNZO2Nv/gwAiQAVY1k+eSFJt9Q533uLWSezvssFXV5SjEWqKzs
         dgFVjhEvoucDvuL5R5+LHV7Lcxho/9mpEsBCB3t2ceM4yd7/GeEoMPICM4l5LHdkmLeJ
         VIqlFN5KMlxVIl6oS5npO1VS4GMNlJkKgDGgX3rdugciVTxscjCKUK2bti5xBZAPqdpH
         xhYD6mrMQ8RfYqUjpYT9pOX5mC+1A8Dm3Z8nbrDFwvE7qG9/Un8q5/BHbal+sj6qD+T1
         v2Mw==
X-Gm-Message-State: AOJu0YxdRxX+K0NjWFtM1mEYQDQ96oJqLRwmJugSc2HxZxNHdLIih9B/
	uXUjTGgsPTTMPZ3i4n9PeLq89g==
X-Google-Smtp-Source: AGHT+IEyiy5b3nZjrxUqCLi8UtuOkrr6suPn1vwp5RodoSz2UKg8GWMKoGwtKyNFwtH6O+JddbUpwQ==
X-Received: by 2002:a2e:86d5:0:b0:2c5:183d:42bf with SMTP id n21-20020a2e86d5000000b002c5183d42bfmr3998771ljj.45.1700468866186;
        Mon, 20 Nov 2023 00:27:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06? ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
        by smtp.gmail.com with ESMTPSA id je12-20020a05600c1f8c00b0040839fcb217sm12641000wmb.8.2023.11.20.00.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 00:27:45 -0800 (PST)
Message-ID: <4608012c-059f-4d6a-914b-e85ad0c32ff0@linaro.org>
Date: Mon, 20 Nov 2023 09:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US, fr
To: Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: JunYi Zhao <junyi.zhao@amlogic.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-3-jbrunet@baylibre.com>
 <170040994064.269288.960284011884896046.robh@kernel.org>
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
In-Reply-To: <170040994064.269288.960284011884896046.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_002801_110981_C5B608AA 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Rob,

On 19/11/2023 17:05, Rob Herring wrote:
> 
> On Fri, 17 Nov 2023 13:59:12 +0100, Jerome Brunet wrote:
>> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs.
>>
>> The previous clock bindings for these SoCs described the driver and not the
>> HW itself. The clock provided was used to set the parent of the input clock
>> mux among the possible parents hard-coded in the driver.
>>
>> The new bindings allows to describe the actual clock inputs of the PWM in
>> DT, like most bindings do, instead of relying of hard-coded data.
>>
>> The new bindings make the old one deprecated.
>>
>> There is enough experience on this HW to know that the PWM is exactly the
>> same all the supported SoCs. There is no need for a per-SoC compatible.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 36 +++++++++++++++++--
>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

I'm puzzled, isn't it recommended to have a per-soc compatible now ?

I thought something like:
- items:
     - enum:
         - amlogic,gxbb-pwm
         - amlogic,axg-pwm
         - amlogic,g12a-pwm
     - const: amlogic,pwm-v1

should be preferred instead of a single amlogic,meson8-pwm-v2 ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
