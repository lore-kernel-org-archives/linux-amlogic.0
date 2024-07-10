Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62597C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rg1aEhVBMrwHSzDHEDxHnhbNfdmS3svMMQgZWPv8bEE=; b=NAF7R4rJGKkcoK0vjN7wUGSFWM
	zLSrkYEzjBZ+ZNelJDTyoisJ6hQKhx5r3GadNXUD6LsldZbjAv7gQZyiI5O9+GD5KRLhKCVYp8PYS
	eg+p5vZTTok4XemIuFj0osgJ46m0iFkKCv+Ko0tS6iB2HSxYjcavfGLULmpx4VCVbkIAMTbrlzKyc
	7boSbxXwAm0CW5FvXLbNgtZWJnuyuyZ+8+rfsWdI4WzMJ9xNz5u+HG9ReCuPqpzGAKvRF0j6NVVPH
	YDI8CcvnoZljp8Y66qwGGxhAEkuQfvtkUY6DnzkHjk6ahlre4PccT7S+syP7gd2d/ACuhCrOoyx1l
	e81QAhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaLJ-0000000BC5t-3rBi;
	Wed, 10 Jul 2024 16:38:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaL2-0000000BC2N-34MS
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:38:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-367990aaef3so4378733f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720629518; x=1721234318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvGP3/2u4f5ZMtfChWtgDNo/AniA/bJwsSpquHCsSUo=;
        b=H7xkBbCxuwokVXE2jbsqtRO2vi11UNlk4EMfo9Cxy7AHi+8pdllSYOVJQ9i+HmCKZn
         5qv0MvEaXIsy6dLaUzFYK8m00VNO/rjhksvmyKn+ZTWWFtptbb3Y2nczMa2wOyQrG9Xi
         lBeffCjrWXLQBA6f8TrwBo5CS1RIFJ3D3StKJrNJSvbNd5kCI4EtU8cdHPrsHuoqX873
         2LogurBFcf6ZWzTQoJxVGio/C2OkXqJXlcl003qDKb3LCwThXx38B0U3ZaUvwKdElBfc
         J2GstOBb/1Q4vbC05eHGZ/qETV4jJ/uDPIChBVHh383CbTj0Mm8Ybs0t4pXqgcmf9mz9
         51OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720629518; x=1721234318;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvGP3/2u4f5ZMtfChWtgDNo/AniA/bJwsSpquHCsSUo=;
        b=VksW6Uy/T0DjHxI4g56dgDqexVp3NAsJnV3mppGNSQTdtxSYhXT7XuTNI+IbjNcUCL
         tsPmslduPxNI3TPW2wJp7VICci/c5paNaZZ8RMfSG8KfrYEL/VzDwZ0qiCgT7rTCHjKJ
         s7WcoQEtasQq7cXuS1RqjZFpXIhaHN9qw4imIb1sUpgXssHSaa5cKd6TA0EQxX10skPl
         PLR/x6AXEsOVbXVnJ/2XB/aTKXXkPh7BSBPUQ7JLLLY4RnYrnVdEJpcqpdfcASYRXNQZ
         V5Lufu6UtaWjJFEWIEAe1cB8MlsnTKx6uY/+21lELoFn4q+BwxyEQMG65kmAlEJe5xue
         uURg==
X-Forwarded-Encrypted: i=1; AJvYcCX5/vHjsnugdsnYfe8dhaunlIdvCgmhE8aCJzN4a0dRpIyEHnRv2mnJIh08ihOoMiuEmvhGiw8NBsD1HyQU6LD+W/EBshOtOFhJE/I2OSBAOPo=
X-Gm-Message-State: AOJu0YzOXlPR/ItfRbAlSVz7/vtCnkimd1E82oCmQ2MNWztHYp9xvodE
	LdWv0iDkavYCmjw9Ycl7H7/LHGgVHhuvOavxYYSNtPHWL3id8Re0qRWtuTyyU2o=
X-Google-Smtp-Source: AGHT+IH8cJ5hwT0TYoHdbx0fNaJwAeHXme01NPT2sNru05zKfBy3aVJqAuLdty9e6Fr/3eMVzKSnZg==
X-Received: by 2002:a5d:64c4:0:b0:367:9614:fb9f with SMTP id ffacd0b85a97d-367cea46f7dmr5982534f8f.2.1720629518070;
        Wed, 10 Jul 2024 09:38:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:7e2c:a18f:a783:5c6c? ([2a01:e0a:cad:2140:7e2c:a18f:a783:5c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84907sm5769245f8f.43.2024.07.10.09.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:38:37 -0700 (PDT)
Message-ID: <fde4a6be-6c6b-4275-a320-85e43f62bddd@linaro.org>
Date: Wed, 10 Jul 2024 18:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required
To: George Stark <gnstark@salutedevices.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, krzk+dt@kernel.org,
 hkallweit1@gmail.com, glaroque@baylibre.com, khilman@baylibre.com,
 broonie@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru,
 rui.zhang@intel.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@salutedevices.com, conor+dt@kernel.org
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
 <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
 <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
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
In-Reply-To: <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_093840_813371_747E3F2D 
X-CRM114-Status: GOOD (  17.64  )
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

On 10/07/2024 18:23, George Stark wrote:
> Hello Krzysztof, Neil, Rob
> 
> Thanks for your reviews.
> 
> I'd just like to clarify things a little on that matter. On A1 most of
> periphery has either dedicated power domain (ir, spifc, spi, cpu etc) or
> several peripheries share single PD e.g. pwm, temp sensor, i2c, adc
> share PD 12. Appropriate PD must be turned on before the periphery is
> touched and be on while periphery is used. Experiments confirm it. So
> power-domains property in dts nodes is really required. It makes kernel
> to control PDs when bound periphery is used.
> 
> If I understand bindings thing correctly we should make power-domains
> property required in bindings too in that case, at least for those
> peripheries which has *a1* compatibles (some peripheries use compatible
> from older SoCs without PDs).
> 
> What you think?

Yes, but if the compatible has already been defined without a required
power-domain, then it's too late to mark it as required since it's an ABI
break.

So next time a new compatible is added, it's the appropriate time to mark
it as required.

But in any case it's not a big deal because if the power-domain is not
specified it won't work, like if you use wrong register address or the
wrong interrupt line.

The fact power-domain can be specified is enough.

Neil

> 
> On 7/8/24 22:51, Krzysztof Kozlowski wrote:
>> On 08/07/2024 21:48, George Stark wrote:
>>> SPI Flash Controller has dedicated power domain so make the
>>> corresponding property required.
>>
>> That's an ABI break. Being part of power domain does not necessarily
>> mean it must be required, so your commit msg lacks rationale. Especially
>> on the ABI part.
>>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
