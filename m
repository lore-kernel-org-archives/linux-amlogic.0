Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC80C3ABCB
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cPFzommZKiUlSLfBqyin0aEiN9j0auxpROp+OGoHyk=; b=cm9PTvYgeHhU7TZ4t+9AmUDIHK
	NmFwlq78Mabl2PtW42tg/PKep/oH87xcwbdH+XiTc5/6Rs6WS2bGQ+eNb8Ml5i3QTeYPzw+CXtTwz
	r+xK45A3Jpi/0lINzqBLeJd5W6JYuH6Yr4k6Lnt073GPzsdHztIrE1mU6eZSzh4ua71GzphBnoy+3
	ydKxem7jfL6wSQGa0yZOlCXzUwa3XoAyWdCGz08WcdQ4hPpdq2RDJcRz5LrgtaIODYDGt4so/wRXs
	Bzc7a+5v7Ee7wIKDzcgud0jtE8L6ag2MGcSXKqBfsSlee9OKoZzwZuOaMSlxYjqDaeNzAqVtiq47c
	GO2B8Mcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRnP-00000004TkH-2jqK;
	Fri, 09 May 2025 17:46:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPog-000000047Xv-0e7z
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:39:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso15788375e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805153; x=1747409953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a41eDfh61Q5Z4SkQUQEgJsG/7aXRDbddPfKHN/yq7UM=;
        b=IkEBj53PjB1BXvb0TB33ruCFI6O+Dzq16NtaWIhob9j28eXp3FvOpaGsApmtmxSMhX
         Haz/xlcBa621PTBZaOQ7+cKEuG4tGWhWD3E+rJ5xeuPc5eckmYZhDg/ZcbdRKXKTjYQy
         5oQfvTjmDHnCrKKkiKOSbzeyofPP2jbi1H/4Kk9VGYtTl6Iq/T33lGIw7vcdjTieocIn
         1DTuE+fEmeCw8LVIdEVWT2UELv69Z3KBUZX9DGCPTUXHUHITwv2gpx2uFl2GEd9E3F68
         IfahNA60FqL9c3oXchEyuoetRJMzBcsipBUUC6Uv4+h81Vk1lRge/Xdi5CRGFzos2ntl
         tTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805153; x=1747409953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a41eDfh61Q5Z4SkQUQEgJsG/7aXRDbddPfKHN/yq7UM=;
        b=HzgcIfa2MgEyLYduWTY7DeJMGEr1QUkEyLM9sJ47cEw4KOQGJsV5qe9SBU1e2jO0N8
         kdrpqJWmx3KQGvyyc7qfkW2XzAnR0f1XbWTafFw9bkJooFjR7NHzxJ29eZ8aQ41P2VeI
         6YRKMt/opTiKeULRZn3b1uW/yaTnF2GMbyFrKo1od8NlJHMiB689TNvwdtxBizPfZ1bS
         z9yoQzhbjFmGOveszXbMAhkLqSwgrkCT3ZvqMRcLGPeYjf/KLGIn0AGDBnLc4MYJkHI0
         pZACVSHILAy56I0R/to9ZBnd5wH3UVEsoSz8o6IvOctVlQMvMvp3oVLHGcJzXCRT+anC
         jeYA==
X-Forwarded-Encrypted: i=1; AJvYcCUNOWbX332Bz3GZ+CvA0KXSyzXhdRTbKpffufPnB/jFskUC38e0jGlepa22KwcPdE2Y5ODUN1iEQjL0VNUO@lists.infradead.org
X-Gm-Message-State: AOJu0YzNAyRvI4ddRDy/6dZ2/bSAQvvX0cwGDA6b9KiNuAVdN28ARyvR
	ablj4a18D7b2WroxMc9Zm5Dv9H+v5+M/rKdxXZrytBPaEKjZ8cjfA3+u6yFYWFI=
X-Gm-Gg: ASbGnct8hp+/kJ0m9uGut8vHL6AJ6h+CLcGac76xCQoMKikI44r09ffRqMHj6S7b4p0
	MRjarHsW1r1BUsKdTTPWeQKAMyiguXbnzr0opZsT+FkKY72JU4XDe39jntGjnt0dq1n0IHy+hlp
	cbtk6Q0NHW4yWk15YzD1zYf1Dwh9FTtAzf656cVtyGB/DSRVxjeHPAO+Sc+jEMOTdi3LBWJUHbu
	qPDbqKZsSKVXLtksPwnrV/8yVlSM3PwfwBCaRikqrF3PD6h+HrINHlhxhxEoFgciTYPjxUVE74X
	4+3gZsM6zR/rLemhhDVRrp+JefVpuzbj3SWg3ZQlL6Y2HFlXnghPtLq6Uh8NiLRj4TNjcDXajMg
	DhuG+4yOsSZVkMmxwoW5rg6Mxig==
X-Google-Smtp-Source: AGHT+IF/KzfuGyRQ1Z2TahSiggYWnUVBaa3ap37t1eCzjzZRV6+n+EkM6GAEnKKLpOA6jpkkDHYmaA==
X-Received: by 2002:a05:600c:4745:b0:442:cd12:c68a with SMTP id 5b1f17b1804b1-442daebf181mr16387535e9.1.1746805152581;
        Fri, 09 May 2025 08:39:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d7806a73sm12857905e9.3.2025.05.09.08.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:39:12 -0700 (PDT)
Message-ID: <40fe47b4-9373-4afe-a5ef-1b584b3ba26f@linaro.org>
Date: Fri, 9 May 2025 17:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, kelvin.zhang@amlogic.com
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
 <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
 <168c0dc2b1a9ebabbfd993e3a516dbf96d809f47.camel@pengutronix.de>
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
In-Reply-To: <168c0dc2b1a9ebabbfd993e3a516dbf96d809f47.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083914_276759_86D40A72 
X-CRM114-Status: GOOD (  13.64  )
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

On 05/05/2025 14:53, Philipp Zabel wrote:
> Hi Neil,
> 
> On Mo, 2025-05-05 at 14:30 +0200, Neil Armstrong wrote:
>> Hi Philipp,
>>
>> On 11/04/2025 13:38, Kelvin Zhang via B4 Relay wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Add compatibles for Amlogic A4 and A5 reset controllers,
>>> which fall back to 'amlogic,meson-s4-reset'.
>>>
>>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
>>> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
>>> ---
>>>    .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
>>>    1 file changed, 14 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>>> index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
>>> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>>> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>>> @@ -12,14 +12,20 @@ maintainers:
>>>    
>>>    properties:
>>>      compatible:
>>> -    enum:
>>> -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>>> -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>>> -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>>> -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>> -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
>>> -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
>>> -      - amlogic,t7-reset
>>> +    oneOf:
>>> +      - enum:
>>> +          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>>> +          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>>> +          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>>> +          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>> +          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
>>> +          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
>>> +          - amlogic,t7-reset
>>> +      - items:
>>> +          - enum:
>>> +              - amlogic,a4-reset
>>> +              - amlogic,a5-reset
>>> +          - const: amlogic,meson-s4-reset
>>>    
>>>      reg:
>>>        maxItems: 1
>>>
>>
>> Do you plan to take this change ?
>>
>> It has been laying around on the list for a while now, I plan
>> to apply it in my amlogic/drivers tree at the end of the week.
> 
> I thought you'd pick it up together with the dts patches [1].

Sorry I missed this... applied it.

Thanks,
Neil

> 
> [1] https://lore.kernel.org/all/a5d9b775dd860d8f2bbf174300a2e3161b654035.camel@pengutronix.de/
> 
> 
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
