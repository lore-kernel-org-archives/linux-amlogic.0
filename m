Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27BDCE7AF9
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Sep 2023 04:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djB06edWfy8zMhiHxSDboCKAcvdeXuvUh3NGxD/s9Zs=; b=GFQqOQ/LY8CfG1
	yJ2SEdBchTIHU+Q3eaU9KPSR7Ntp8NE7trUOYR9nuiXYlwMrEdl18hwLRCCMtB479bRKeqgcCzkS7
	/BCfcqClxb7I/iVjGX3wId5xukH/hTu1LvPsODXs6oHysTvE9I2xSrpnf8IiduMyXbdogOUGS/vka
	OWKJUiZT6kFSwIDmikwOqylgIPAhFLlaIFk4Mjh1lruW6M0YqXiDdNShgq6/t7QETQiIaQQMJzoBD
	fmpPm3SmyOYQzgQKzGI2eSIteqsly9cxe39Gmy0858KAowKORP0YeDMbl0kLeILXZWJBNGtwITNef
	WdXU8PmVe79cghpz4BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlj4k-002HBx-1p;
	Thu, 28 Sep 2023 04:56:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlj4h-002HB6-31
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Sep 2023 04:56:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso7760332a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 21:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695876989; x=1696481789; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4iB1nWfdkplR5rehtoms0dHBmNKDO/VCIkn0MwaJ4k=;
        b=CB8MhVOoqZmlJHoPlK3wR3kjfhvnsfmuCrOpoLNbGd/b2wPWpV/U3Qf44SHY/B5pJb
         TomrS49ByBCFU9VVA4p72hxhh0tfU/Ny6DAnXIn6iWKRDAsWC55A81rIvAbbUf41P+qL
         HRscWCuV2CvhH4+Xsklk5tHzQxRFdVIBjn9wPSMmBvixeIOzCbmPsQDRhv4DZfZFrLD1
         ZhCgyixPbbUgQYsEJk+NMshQzUM4FNF50W8qzzSH5D4KIbI6S0TigbE+663U/OOp9xXe
         M/0cLOcRRTHkxJCzBFzs8r2AQt7w7x6NmF9zWbvHybIwgRAh+IB/J0AM0z+QUXTmrivF
         m9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695876989; x=1696481789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4iB1nWfdkplR5rehtoms0dHBmNKDO/VCIkn0MwaJ4k=;
        b=L7HD25p14RxHmxowjF+Sn5PiuasYfwpWyXG3i+XXDDoZrkkOf66aAdoxxkS3zXtRHN
         NJTr823/V3N6FYXyIiAcJBanEP5U8r2PF+GXREj7zwPPpR5gEO/bnn3UeIMrY/b5J8N/
         dk3L+bHK0vYofn1U+0uUTuubC1SuRFlCN+TBR8eNNjsuGck93Sjdd9jGwrULWGkmWBDs
         7l3RZmFaDRH59+5J0TCUJtqeFpVfTB1UAMnP4+KsKnvv/9kCoYfuAu2+mURTCZd1lInA
         0lGGbhKBa9ORe/DvY/pzwkj2meOavUVszJ86bpRnGLzw29CERtXQJWHQwoM4XDSqZZex
         gYXQ==
X-Gm-Message-State: AOJu0YyATZ6ZpQBqYsr6Aml4vUi6+rwOa2E9HkbyzghbA9Ud/G0GhuJT
	I70/d6qJLx1Sus8iz0l4u32O+w==
X-Google-Smtp-Source: AGHT+IGBNcWBnssmUYK1CVxXXzPy5SGtc5layIFYw2T+7vdDrI0iDtAYykd2rupwlwEhj3HMCFjZeA==
X-Received: by 2002:a17:906:cc14:b0:9ad:cf30:10c with SMTP id ml20-20020a170906cc1400b009adcf30010cmr162908ejb.46.1695876989019;
        Wed, 27 Sep 2023 21:56:29 -0700 (PDT)
Received: from [192.168.1.231] (host-87-4-82-94.retail.telecomitalia.it. [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm10082708ejo.118.2023.09.27.21.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 21:56:28 -0700 (PDT)
Message-ID: <3c2a0e56-7e94-4497-9577-eb24922ff8c6@linaro.org>
Date: Thu, 28 Sep 2023 06:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: pinctrl: Add support for Amlogic T7
 SoCs
Content-Language: en-US
To: tanure@linux.com
Cc: Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
 <20230922094342.637251-2-huqiang.qin@amlogic.com>
 <ff2c6d41-7c9a-4633-8343-eb94404de6e8@linux.com>
 <2d7eac30-480c-49a4-903c-d4f2b3cdfc8d@linaro.org>
 <CAJX_Q+2vpMM78DA_Q1YLddwogW_vHLDLQbO_mnBk_zMNg7V8KA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <CAJX_Q+2vpMM78DA_Q1YLddwogW_vHLDLQbO_mnBk_zMNg7V8KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_215631_977715_191BCB9C 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjcvMDkvMjAyMyAxMjo1NCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDI3
LCAyMDIzIGF0IDg6NDjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDI3LzA5LzIwMjMgMDg6MDgsIEx1Y2Fz
IFRhbnVyZSB3cm90ZToKPj4+IE9uIDIyLTA5LTIwMjMgMTA6NDMsIEh1cWlhbmcgUWluIHdyb3Rl
Ogo+Pj4+IEFkZCBhIG5ldyBjb21wYXRpYmxlIG5hbWUgZm9yIEFtbG9naWMgVDcgcGluIGNvbnRy
b2xsZXIsIGFuZCBhZGQKPj4+PiBhIG5ldyBkdC1iaW5kaW5nIGhlYWRlciBmaWxlIHdoaWNoIGRv
Y3VtZW50IHRoZSBkZXRhaWwgcGluIG5hbWVzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSHVx
aWFuZyBRaW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29tPgo+Pj4+IEFja2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gVjEg
LT4gVjI6IFJlbmFtZSBhbWxvZ2ljLXQ3LWdwaW8uaCB0byBhbWxvZ2ljLHQ3LXBlcmlwaHMtcGlu
Y3RybC5oCj4+Pj4gICAgICAgICAgICBDb3JyZWN0ZWQgaW5kZW50YXRpb24gZm9ybWF0Lgo+Pj4+
IFYyIC0+IFYzOiBVcGRhdGVkIHN1YmplY3QuCj4+Pj4KPj4+PiAgIC4uLi9waW5jdHJsL2FtbG9n
aWMsbWVzb24tcGluY3RybC1hMS55YW1sICAgICB8ICAgMSArCj4+Pj4gICAuLi4vZ3Bpby9hbWxv
Z2ljLHQ3LXBlcmlwaHMtcGluY3RybC5oICAgICAgICAgfCAxNzkgKysrKysrKysrKysrKysrKysr
Cj4+Cj4+IC4uLgo+Pgo+Pj4+ICsjZGVmaW5lIEdQSU9IXzAgICAgICAgICAgICAgMTQ4Cj4+Pj4g
KyNkZWZpbmUgR1BJT0hfMSAgICAgICAgICAgICAxNDkKPj4+PiArI2RlZmluZSBHUElPSF8yICAg
ICAgICAgICAgIDE1MAo+Pj4+ICsjZGVmaW5lIEdQSU9IXzMgICAgICAgICAgICAgMTUxCj4+Pj4g
KyNkZWZpbmUgR1BJT0hfNCAgICAgICAgICAgICAxNTIKPj4+PiArI2RlZmluZSBHUElPSF81ICAg
ICAgICAgICAgIDE1Mwo+Pj4+ICsjZGVmaW5lIEdQSU9IXzYgICAgICAgICAgICAgMTU0Cj4+Pj4g
KyNkZWZpbmUgR1BJT0hfNyAgICAgICAgICAgICAxNTUKPj4+PiArCj4+Pj4gKyNkZWZpbmUgR1BJ
T19URVNUX04gMTU2Cj4+Pj4gKwo+Pj4+ICsjZW5kaWYgLyogX0RUX0JJTkRJTkdTX0FNTE9HSUNf
VDdfR1BJT19IICovCj4+PiBUZXN0ZWQtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNv
bT4KPj4KPj4gSG93IGNhbiB5b3UgdGVzdCBiaW5kaW5ncz8KPj4KPj4gQmVzdCByZWdhcmRzLAo+
PiBLcnp5c3p0b2YKPj4KPiBTdXJlIQo+IG1ha2UgZHRfYmluZGluZ19jaGVjayAgZHRic19jaGVj
ayBkb24ndCBmbGFnIGFueSBpc3N1ZXMgd2l0aCBUNyBiaW5kaW5ncy4KClJvYidzIGJvdCBkb2Vz
IGl0Li4uIGFueXdheSB0aGlzIGlzIGVoaWNoIGlzIGVxdWl2YWxlbnQgdG8gY29tcGlsZQp0ZXN0
aW5nIG9mIEMuIFRoaXMgaXMgbm90IHRlc3RpbmcgYW5kIHdlIGRvIG5vIGNyZWRpdCBjb21waWxl
IHRlc3RzIHdpdGgKIlRlc3RlZC1ieSIuIE90aGVyd2lzZSBkb3plbnMgb2YgYnVpbGQtYm90cyB3
b3VsZCBoYWQgdG8gcmVjZWl2ZSBpdC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
