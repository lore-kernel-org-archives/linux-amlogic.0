Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7FEC48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOSrR3nKRtHh3v/pLStC5sDRdfcITZDlUerWsPKuLuA=; b=urr4cl01dDmhWB
	A0hZjWf/xuraj7nhO2dvk7OwVLL+ibnUFyNlP+2qXGZu+j1RjXcqHXIBDPcGS8xYjqrGXtXiEsilk
	wqXBlw984/0jOczEO3nnZ4jZw98pNV4xFZWj7ma+zf+AQX6SFdHq9WjgoE1V3L9rkPiD/eWWzTv5m
	HYPMKk9/4ImJfQTdDJOU29CnIW+TuHLezgVST5oT10qw8qChL2qh+dlcU7p+U3/5nZfeMpGxqLJjS
	2agEv9RXq+qCDGiTs5x8NVVIfy0xet16cvnxnq2MOclIUSR7WDmjrraxjxVIMlfDB2N2o6yK3JfIc
	G1GMo/RGm54e2mjqFHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzaH-00000009its-0W9a;
	Mon, 19 Feb 2024 09:05:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzaE-00000009iqJ-0gdN
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 09:05:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33d4c11bd34so609138f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 01:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708333504; x=1708938304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtWSvwFIbUDq8P/mK3Xub7gf1TnGsxMbiHIph7i1MUQ=;
        b=fiyYCMJlVwhftBGSgTuJv3/YzZLk7+Et+Wd97cyniFTccU5yDb1nsdqjnlusHpQDby
         bNaMkUu6aJhQ74dPadgmw2ajlzrV/D/9ga57gC2trIvVRH5uiHZQGH8xbl+UvxAsJ4K3
         mrtPNLeYLnyT15P75QefNk0/nZTayfbmvHiGrQntl1qBNtBs42jTM2IxVuWgLjlwLXv1
         0qQG5Ts9ysOlxpfy/dMRtEFgfHzMQdOdHRSBMPjc6p3xpeVUZEsKszJQPmqjUSNkyjRY
         ekYJ3/D6g/fo6gaFtehC8Jth2s9BT2NvoX+51zm0fhQRYaKFjK4CZL2yF90a8z454Sml
         BtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333504; x=1708938304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtWSvwFIbUDq8P/mK3Xub7gf1TnGsxMbiHIph7i1MUQ=;
        b=nPKMCYNJ5owa0zUodoLewaB6eNoTuv2UmNn7wtXXNu5B88APaFHb3h+W3L9tHeQo/y
         MaN1PX4w+q7bAwUtwnAQmmxHC1/ftN624ty/x1bxeBDNe835kszGr1zSME5H560DQE0A
         Q0HO1vn8JvQneV9qBljfIOrFTpcAr9kzZE04wjniYz1YcIH+3e/g6H5yMjVH4Nj89ggy
         S5U/RwUHdsHmKf5b1dWR5oNSfM7SgxEW3FfVx9aysvwj0ITZjRnLgDbN6lPJJIfhls3t
         9tUp8TNj/Q43CD9jUGYSeZZMBNPAoAGFm5Nqg41NUGS012iGGb5pq/YIW9axm6lwNOXz
         QMsg==
X-Forwarded-Encrypted: i=1; AJvYcCWNVaA6RSLXLKa4xk1xJ9vA4N0YFWPPuSI5tqh9BD5VTOYRvPsQbko7g5BGrjKrOAWn5KoIuTcoqHIQrAAroZZTgXAWXVXwTN2l7CYYUNbbWKg=
X-Gm-Message-State: AOJu0YyYKJqjQzPFqF3z7AVuxXSe6208AIyuiRtHPoefqnrF5ksyguTv
	hMDi6bPhy3AfQemobxh4u46dAqig7+lrHgFYVt9IUa/nTMMAZ0QAeoQ8WHn0LuLbN2b/axE8w1t
	W
X-Google-Smtp-Source: AGHT+IG70f1WwbydxLUZZi2Zn5wDhTYKIBtl8AnSmblhBQ3vkelGmcQpYBHJ/gL+Dxm0YJC2aP0SUA==
X-Received: by 2002:adf:ed0b:0:b0:33c:df0e:7579 with SMTP id a11-20020adfed0b000000b0033cdf0e7579mr9187464wro.37.1708333504362;
        Mon, 19 Feb 2024 01:05:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0033d07edbaa6sm9725160wrs.110.2024.02.19.01.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:05:04 -0800 (PST)
Message-ID: <80806260-ac19-4801-ba05-d4257aca8df0@linaro.org>
Date: Mon, 19 Feb 2024 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <170833286959.1749763.5981999865888937241.b4-ty@linaro.org>
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
In-Reply-To: <170833286959.1749763.5981999865888937241.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010506_361648_D8310CDA 
X-CRM114-Status: GOOD (  10.07  )
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

On 19/02/2024 09:54, Neil Armstrong wrote:
> Hi,
> 
> On Mon, 12 Feb 2024 18:47:33 +0100, Marc Gonzalez wrote:
>> Add support for Freebox fbx8am boards
>>
>> Marc Gonzalez (4):
>>    dt-bindings: vendor-prefixes: add freebox
>>    dt-bindings: arm: amlogic: add fbx8am binding
>>    arm64: dts: amlogic: add fbx8am board
>>    arm64: dts: amlogic: add fbx8am DT overlays
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)
> 
> [1/4] dt-bindings: vendor-prefixes: add freebox
>       https://git.kernel.org/amlogic/c/fedeacff9611917231d710382e7ccb518cd440a6
> [2/4] dt-bindings: arm: amlogic: add fbx8am binding
>       https://git.kernel.org/amlogic/c/beee431b3257334e450999ebe77636bb18ca87e7
> [3/4] arm64: dts: amlogic: add fbx8am board
>       https://git.kernel.org/amlogic/c/acbe5b6b0fb74197ebff06a62abcfec9858c23ae
> [4/4] arm64: dts: amlogic: add fbx8am DT overlays
>       https://git.kernel.org/amlogic/c/13636d5502204e671398470962babbfb46bc2721

Confusing... this was not applied actually, because it was not correct,
and instead you applied v3. It took me some time to spot this...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
