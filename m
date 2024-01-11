Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F7FC47077
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jan 2024 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfamnmxowJrfzx0xVF+X9GlTO0KWhwQnktX1l3m2ylQ=; b=XsBtwypAWHX/Up
	v6MxrxL6dSwKVXGuwV/9gOgQ+oUpZ5wTAgGfDmq7Xc7WpkIv+FhO6IWNs92XFwQ8sIGhWa2zimBJk
	WfncTAwP1mTRgh05QY4GhW2WfGpTxsvVQ2AO1QlA5cGbfrmIy8xdGEE/qBAsIzQSrzZ+SulnL4F+T
	ty8gYDdLiztIwVkC/a1HfWBmjtIBYpJLffNG2da/ANrgkTw4sTWKELJh/NiWScCjFo8yKEPP76Da6
	IUJjZEYMnk4YL0lhouvmQU07mF3NZOUIopyepIUyS9wLL4AVPta7VLO1AifqnFU7IZNEvs+ln+bUo
	Wyq50pDAF4NQDYw7Nsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrPF-00GmM3-0d;
	Thu, 11 Jan 2024 09:31:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrPC-00GmIY-26
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jan 2024 09:31:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a29058bb2ceso555617766b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jan 2024 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704965474; x=1705570274; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eor6lImS7ySePlUmbye/lNdlPbDxWcSpzNk/0V1lmvk=;
        b=YC16cuN3/lRRUyW/1Dpl+DkZNcyMQw53LenOLUDFHR6pPCg5R+w73OIkJXPRFAW4n5
         1KA91uCunilJEsRDtkF+4OodJTU2pa7gbsfX0SO0DhVNU8LT82T8LSGaa8bDMHSyPuAo
         jUgjkX8YBMDJGD74PRekijURqpLQBJqUY7P+7hTy/ZEmtBMHw7Z7fJmxNj0/vEDaXPDv
         L7ENw0hGKVYqpW1Y4FU7x8PKvAOXWUqGYLlNg94x5CvDgwGd2emnMiQNGDcoLwd6f2WP
         BebM2ll8odK5ljT35oNagHzICi7tsFPYBTQuU2ECPYgOnH75DvyvpxhrxMXN2KV16hJV
         fnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704965474; x=1705570274;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eor6lImS7ySePlUmbye/lNdlPbDxWcSpzNk/0V1lmvk=;
        b=Ip/22JggG2f6MDdPYOsYkQ1AUBCzab8IytHk70X0Q74Jjw26kf6QKgi/1Ud8zg+BV+
         W9ytbwRem+U/NknB0NJFMr6YBYVsXZlENe/3q/rq6lIo7wcFxpFz7xcsjd6Ganow9oyJ
         OduxfxJ03MEq+YZPWq3+WrIYLH/U77AsIzjDLvjQLphRie03GAia8GsMH8FeVOWNZP+v
         OJhhcm0bcU30K1FjyreRcoXSMtqApqmMZlEzPVcBNj1wi3yOEaoNC0lvV5fJadzAGm9Z
         goFK2H7ELVB+LruMx45IoriqkIAwf7Nl09vAoz4cH7+i1lMs6HebpNQ8ihQ/LpfFCIF3
         /pMg==
X-Gm-Message-State: AOJu0Yxa0twV0uny8wC2wvRYeSGt+DAPjfiMnJUhUOADjI9ZMRVc1QTL
	MCazV2avJ58kH54JEkdkBXqI35s4RzH5Cw==
X-Google-Smtp-Source: AGHT+IGD9nTnB2PCUwRoN7P9hfHTaak6Rf6N5a7I+i6QTcDjkE0MZWvuwl97F/xmIbbqjFd1l3G8BA==
X-Received: by 2002:a17:906:2459:b0:a2b:643:322 with SMTP id a25-20020a170906245900b00a2b06430322mr243390ejb.138.1704965474275;
        Thu, 11 Jan 2024 01:31:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id b4-20020a170906150400b00a2a37f63216sm353336ejd.171.2024.01.11.01.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 01:31:13 -0800 (PST)
Message-ID: <039a4223-3412-415e-a5e6-c5dca53c96e1@linaro.org>
Date: Thu, 11 Jan 2024 10:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/24] Support more Amlogic SoC families in crypto
 driver
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Romanov <avromanov@salutedevices.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "clabbe@baylibre.com" <clabbe@baylibre.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "artin.blumenstingl@googlemail.com" <artin.blumenstingl@googlemail.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
References: <20240110201216.18016-1-avromanov@salutedevices.com>
 <ZZ8HP7dJgVaZLMw5@Red> <20240111091840.7fe4lqx225rdlwly@cab-wsm-0029881>
 <910736a3-069f-430c-ba6c-221777ddcda2@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <910736a3-069f-430c-ba6c-221777ddcda2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_013118_697270_FE01BCF8 
X-CRM114-Status: GOOD (  10.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/01/2024 10:29, Krzysztof Kozlowski wrote:
> On 11/01/2024 10:18, Alexey Romanov wrote:
>> Hello!
>>
>> On Wed, Jan 10, 2024 at 10:08:15PM +0100, Corentin Labbe wrote:
>>> Le Wed, Jan 10, 2024 at 11:11:16PM +0300, Alexey Romanov a 'ecrit :
>>>> Hello!
>>>>
>>>> This patchset expand the funcionality of the Amlogic
>>>> crypto driver by adding support for more SoC families: 
>>>> AXG, G12A, G12B, SM1, A1, S4.
>>>>
>>>> Also specify and enable crypto node in device tree
>>>> for reference Amlogic devices.
>>>>
>>>> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
>>>> custom tests and trcypt module.
>>>
>>> Hello
>>>
>>> Thanks for your patch series.
>>> Unfortunatly, I fail to apply it for testing on top of linux-next.
>>> On top of which tree did you have tested ?
>>
>> We use 6.5-rc3.
> 
> Don't develop on old trees... I mean, internally you can do whatever you
> wish, but don't work upstream on such trees.

Number of email bounces also prove the point: you did not Cc right
people due to work on some ancient files.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
