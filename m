Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9711C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2x0OFKjwwZdK6Lq1aYF+Vbg81UQyPdz8EQlpYlrTR0=; b=CcxqOkN61BhwgqIOffXPIBMe28
	LxG5ktcnuPJZ5J4X2VlU4iYIOCziKN24t6U//WixWQpxpii1YAPzppe31uNpuAmqmBvVeRmTRdSeY
	F36LZvBXCdL590RFiCu2whDRvT+781QLPa7RECPQPzMnIC4Zr/5vypCWwDv/2chTHHjYavH8cue34
	NM8tolW1yn2EfldNgEb212LrQmx1Zhs6ibiw3HMVSMgINMXFhiCqkx8FBihVXGKUJSeRHOK/SBzoK
	ufoKs8K6oSV9k81f6YgDatbV/lWgl47JW/pQRvYcAuU4oAOTuc0HyuWnzwvCKrHWxJqOTY4mqoZtj
	Noi5NPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGhR-0000000HFo5-3HY1;
	Fri, 12 Apr 2024 13:12:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGhL-0000000HFja-2fyN
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:12:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-343e096965bso518932f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927522; x=1713532322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ0L1lTlp0VaxEc/hCXJVTS/lOCsBpaPDpagV2ZMnic=;
        b=wQzMlC39dwihFzQnzG7CIXhMI7tsAxJoSS1gZVQCYJXlrUAth2/4s4hQUQWCVlKWGW
         ZGaqsD5ADwxPVXu+ogenn+Nzr0xg594NoLuZkXO5EOJSeb8EHw9P81rhOKwpHyLzkD4p
         hujZlBzbU65RSaz8TNFOUEPfybtmOu2CZT/uKnpI1ND4o6cJa5hf32EJ6BTwZ7oqgNgo
         7wK8VoDN4DAGkXjkF9QFkxBebJeWouyPlhdm81f7VeTUpba1cGji/BDnxvVlSkJBpMCO
         VQs+LsTxPSA720+VHIsiGWGUUNHkSqYbHNWvLlNqAVHba9gfEMpdv5KrAFCG5UPWjrQA
         Rvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927522; x=1713532322;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HQ0L1lTlp0VaxEc/hCXJVTS/lOCsBpaPDpagV2ZMnic=;
        b=bJRl6765u3pcHM+9b54mM+mwAJb2t1VgzwmIZkEpD7mFr6whzAH/nPiLku0tHxrvwx
         ITelZ40ST5eFM9nGRtuNgX0nmGwT+SeZ+OpDKlRbY/eR99/a70sUBf++/q9NjpKrF0eP
         SeU31zfWOLWHWXOSh5lW70NBKVq9U0IhjTEykhGvFg/2icqrCmhzFcCJzr7lTepik1Jd
         ZmLJfISx+2NrSNEhfKfwJ18IvtGodZPHZsBVN6X0+wj/aTtFRq2lwXZIUpyFfL3mZgb1
         fvY1Di/sADYzk13LVSRBZZYy5hatFPssgP3E1uIe+xz2LWsgt1JAZL6oCokE/yoFHrJf
         9Ccg==
X-Forwarded-Encrypted: i=1; AJvYcCWrk8zb5YUbfk5yPPj3dN+w0bZI8PAZR5HuxWd7Dbatmf8olwEfEhxQe9PWgAPcURuosZiPZvmhEjwUz79mRF/+RuJrTXhtkW2Y4yXEFHqJ5Jo=
X-Gm-Message-State: AOJu0Yw+ddIFSh59gHgui6XQhpSNiNfjbAXeekOnywN7BRiPohkqTK//
	zXZVZq7hor/4yHGdQ6IHPqfR/KXbkgGmKPU0qh0yBcZzI2YTuzl7DV7CR5NoboN5AugxwD3JWKu
	E98nmjg==
X-Google-Smtp-Source: AGHT+IE5Zi7ZrlXGaEdi53dt4XiFi3zXa53JxDtMekuN6h8VpfwL+rzY9QfseJ9e4XvEwbI3EVbvvA==
X-Received: by 2002:adf:e5c5:0:b0:347:ced:c7c7 with SMTP id a5-20020adfe5c5000000b003470cedc7c7mr1491393wrn.9.1712927522091;
        Fri, 12 Apr 2024 06:12:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121? ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d5046000000b00346df659e7dsm2857058wrt.17.2024.04.12.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:12:01 -0700 (PDT)
Message-ID: <10650c59-96f2-4234-b5fd-aa8efec90e5b@linaro.org>
Date: Fri, 12 Apr 2024 15:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Amlogic T7 Reset Controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-1-4c6e2e68359e@amlogic.com>
 <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
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
In-Reply-To: <927ad2cb-3b41-4eda-b930-856be64ae9ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_061207_915131_EEC39027 
X-CRM114-Status: GOOD (  18.39  )
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

Hi,

On 29/03/2024 20:39, Krzysztof Kozlowski wrote:
> On 29/03/2024 10:17, Kelvin Zhang via B4 Relay wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Add a new compatible and the related header file
>> for Amlogic T7 Reset Controller.
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
>> ---
>>   .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
>>   include/dt-bindings/reset/amlogic,t7-reset.h       | 197 +++++++++++++++++++++
>>   2 files changed, 198 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> index f0c6c0df0ce3..fefe343e5afe 100644
>> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> @@ -19,6 +19,7 @@ properties:
>>         - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>         - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
>>         - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
>> +      - amlogic,t7-reset # Reset Controller on T7 and compatible SoCs
>>   
> 
> If there is going to be any resend, please drop the comment. It's not
> really helpful and makes it trickier to read.
> 
>>     reg:
>>       maxItems: 1
>> diff --git a/include/dt-bindings/reset/amlogic,t7-reset.h b/include/dt-bindings/reset/amlogic,t7-reset.h
>> new file mode 100644
>> index 000000000000..ca4a832eeeec
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,t7-reset.h
>> @@ -0,0 +1,197 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_T7_RESET_H
>> +#define _DT_BINDINGS_AMLOGIC_T7_RESET_H
>> +
>> +/* RESET0 */
>> +/*					0-3	*/
> 
> I assume this matches existing drivers which do not use IDs but map the
> binding to hardware value? I remember we talked about changing it, so if
> something happened about this and it could be changed: please change.

I'm not aware of such discussion, and I don't really see the issue...
thoses are IDs, and yes they match the Hardware offsets, and ?

> 
> Otherwise, it's fine:
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,
Neil

> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
