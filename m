Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCABBC61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rn3MSiyVIhLlZrJ5BeKzVIr60I1jMTJmhOWDYCK7vw=; b=kiWZzrDrcoD4PifEgiJ20HHSm3
	Ksfah1vijb93AFW/FaRTwhgjrDksDeHUkAiAvCNUNBfinEtNcsV7bxeNGU9iogm5EfTN5cFQcPme3
	M0pciPuh9s/WJTTIrQ/kc8VphDJTTYxbLYGdwqCCoW/SkPuZuhteRj09ksj2h7kCNpdpzde/i9mtI
	7Xr9B/yxQG7p18W5cLgVfIev5BDv/9k6Uo610CfheLPnaOCBzYQmYW1t2912ot+/giyYlYkXWMPln
	zdGm+jsBamtFh7+uDg2Kl3XuezRg4eABKXSvhszNwOLWHVYDSDCI9VQUUlQKtapi9aFC9wiI2XGq/
	0JqVb4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6WaO-007M2W-2A;
	Fri, 24 Nov 2023 13:51:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6WaL-007M1A-2C
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 13:51:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so13313095e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 05:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700833866; x=1701438666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxCC2Aq/t8/Q52ovrlgjo6dDEhp//mxj0rpaMToUQEw=;
        b=xzt5bx97WvIQ+JVMwNHykFiu8zvGBTWt9a/91M9h8Exjbue3avTfgAMgoPAJu1wlBP
         DquTcWpfLWIjZUyBZIyB/qlUQi2xioqRmbntfyyPYvtTHo7rd3uSP6i7C7wNvF9+qZ/W
         uwC5pFtcTsec/RGPr010uerfXwcw16P1gp3qT1wcGFCOJi2PgWHG28CyjMKGtOEvPXqD
         TLtW3nl7G6yAAnAMIaSygPy4SOkx0A25Kj0nFvhOfEk31Rht9edvBb/6goQ2faS8SQ9c
         sCMe7DQikLZym8dLkzhkIFt0WO1kxMTy8+U8d0gb/qlUD+49miv7qNlTjanmDDV7BRcu
         Qw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700833866; x=1701438666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VxCC2Aq/t8/Q52ovrlgjo6dDEhp//mxj0rpaMToUQEw=;
        b=Xkh+BrJuzqNrJLfKiPP8XaTQyX6QFN9FipnRjRpMuT+pOH6O0GT2DQ05gcvpiL9tZZ
         5HVONGSHtolocLGl4Mb4FLLyVnAzk4zD6j2lDXIc9cbQ0mZU+pAy4w3vqEJJFH0PhgQL
         k2y4I/DViQlnKqiIjFfu4ToUM2YjRddmzN0TvsrZ/j5mn+PMeG/yY9zFbuV7RcPsq3O9
         PDTzB+W98uMxgv7dEoA0+h7fVN9nH75OUlQ/Lk96nhjkAdksz2rqF7L7OSQ+4nSVaSvB
         mCFdux8W3KkTNFHvG7FQ48o8FTLi4X0IUAH0mdr5wZSWpkS+RYheUIe8lSx+u5UyrTzV
         49KA==
X-Gm-Message-State: AOJu0Yxu54wU+Nrj+TOeHbdKU8Y+F1h/Opyidb9vanHyA0SJqrq6d1Xi
	WNPTv0+HXxBtF4IRJZyXoSDq+Q==
X-Google-Smtp-Source: AGHT+IEEAJHJwIQiERlLA4dW2jNyNyW36yyG+T8pNRKwyFVm+lg97DXezz9uNgCZRLAAjUfPmw5KOA==
X-Received: by 2002:a05:600c:4f4b:b0:40b:36e9:bf4b with SMTP id m11-20020a05600c4f4b00b0040b36e9bf4bmr2821370wmq.41.1700833865591;
        Fri, 24 Nov 2023 05:51:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4? ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
        by smtp.gmail.com with ESMTPSA id fj13-20020a05600c0c8d00b00407b93d8085sm5856582wmb.27.2023.11.24.05.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 05:51:05 -0800 (PST)
Message-ID: <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
Date: Fri, 24 Nov 2023 14:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog:
 drop unneeded reg property and example
Content-Language: en-US, fr
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Remi Pommarel
 <repk@triplefau.lt>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
 <20231124-felt-tip-everybody-f2a6836e52af@spud>
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
In-Reply-To: <20231124-felt-tip-everybody-f2a6836e52af@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_055109_740149_B3C98775 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Conor,

On 24/11/2023 13:36, Conor Dooley wrote:
> On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
>> The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
>> amlogic,meson-axg-hhi-sysctrl system control register zone which is an
>> intermixed registers zone, thus it's very hard to define clear ranges for
>> each SoC controlled features even if possible.
>>
>> The amlogic,g12a-mipi-dphy-analog was wrongly documented as an independent
>> register range, which is not the reality, thus fix the bindings by dropping
>> the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.yaml
>> and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
>>
>> Also drop the unnecessary example, the top level bindings example should
>> be enough.
>>
>> Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I feel like I left a tag on this one before, but I can't remember.
> Perhaps I missed the conclusion to the discussion to the discussion with
> Rob about whether having "reg" was desirable that lead to a tag being
> dropped?

I checked again and nope, not tag, but Rob's question was legitimate and I reworded
and clarified the commit message following your reviews.
On the other side you suggested a Fixes tag, which I added.

The rewording is about why reg doesn't make sense on the nature of the memory
region and it doesn't make sense here like other similar nodes.

Neil

> 
>> ---
>>   .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml          | 12 ------------
>>   1 file changed, 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> index c8c83acfb871..81c2654b7e57 100644
>> --- a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
>> @@ -16,20 +16,8 @@ properties:
>>     "#phy-cells":
>>       const: 0
>>   
>> -  reg:
>> -    maxItems: 1
>> -
>>   required:
>>     - compatible
>> -  - reg
>>     - "#phy-cells"
>>   
>>   additionalProperties: false
>> -
>> -examples:
>> -  - |
>> -    phy@0 {
>> -          compatible = "amlogic,g12a-mipi-dphy-analog";
>> -          reg = <0x0 0xc>;
>> -          #phy-cells = <0>;
>> -    };
>>
>> -- 
>> 2.34.1
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
