Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FBEEE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJlij1cQ0ZSv6AxdPE/5Ulu1Tn3eQkjUVphxQ/CkzRE=; b=vlNi5y8/Xd3HzHm1tx7h12Fu4g
	hH3Z9S3yq7/JeZfdGDh/pd2YYANslI4xKx5+8cd5iKfCzZCdHLL6XohDqyjY8lZAz9EfWNDvO/Hj9
	khXwniuqWDX609K0QhgE8vT8BTN07XbhZikMlcPc1uTUhM2/oqvxJeVphEm4yNSQh8jqvGao+ZXna
	SNXxABQmcoT/Mo9B+6cHNqlg9nsutL8CKEZFyBrbxrSoxxuIeV4zZNjP89F41q4pHZ6bBTQwPz1Fb
	JA3Z1/g+VQjjcXDHlxSzYVEzNQ22TBE1kzTA6eXnYtXEiHpkQuDAhNtlYmoBdcb30tjnzastsG5Iv
	x/C7Q7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjLb-000xj1-0v;
	Mon, 11 Sep 2023 16:01:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjLT-000xh7-1s
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 16:01:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso36108135e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694448062; x=1695052862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2glCAHgqqUPWc3CP1OHlMrR0Qn4lq/01XXCsFqva+s=;
        b=pZ2wnlxd7Pg2OfEu8fNvKIbfb+yiwSnwqo/WQkEd21pRo4ZII/MoADgvsxv9+t23fX
         s9PlzneHzgQiHy/Whl7OYwsBsQ8ZqYgdQRdHOEBKx/Ag419BIrz1FpZqSOouWlFLBRKp
         dcHohL5vjHi/imTsr2xS6KiqD5xvidE5BlfQ2Uw5L5/NJRcapuaaro9e1WKs1aUieLg/
         VzP5V3Qrt4+aACLFR1t/LOdLJbPfzxN1/AAXePO+udPWCzeKAzMWt0OPBsICvGbfw12H
         nKMX0hGLtN4yKeC8qL/6f+oEyqLs2rWr453lCQH+5377VN9KJfCyRrhRXTrc8tBBAy1x
         fuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694448062; x=1695052862;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2glCAHgqqUPWc3CP1OHlMrR0Qn4lq/01XXCsFqva+s=;
        b=qoD8nZIXriyR520UuSZ3UmBz5mYq3xNlGKYYw9LWJLB9l4Fq4R4PF/Bcy2IeuEwU5E
         CzLSLBTxWKGH9vin4ZqASeEQoPjGj6iMHRNs6ZXIwIByPJHFUzY5k+9fMOmI0qB/tl/m
         P6QZKqLhzV4Lr2hJrNb8XF2qHc8Am75cl/PnFVrIyhFELl7ZwcxTtcfIESQvaLbVKmUD
         PCkbJrjGdpfoOdJyny1MY35CsNuxSWMzGscdwLFpuUOmDPOchpOuBjH5Rwl3UVdRTjQY
         HWazYRrj3m/nfSlm/+fLLUzrSAo/0BH36Ou7+DTgAzFCexc2ZduGMhFNHd43Wicx68Xi
         4dHA==
X-Gm-Message-State: AOJu0Yzupo2dO+aRaeGTHpi9T4kw9Dk2OnFu+PNyW4DE1mhyIg91J31p
	w+W7akjCouWwej2VWBrii/BXAQ==
X-Google-Smtp-Source: AGHT+IEGZdz3zyhtcZpXFiMnEoQFm/pxuP8ny4P7dx2LWdM6dxPR5OqpTxSezqhBaOeX4ArFri4Nlw==
X-Received: by 2002:a5d:568f:0:b0:314:3e96:bd7e with SMTP id f15-20020a5d568f000000b003143e96bd7emr27788wrv.4.1694448062135;
        Mon, 11 Sep 2023 09:01:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id z20-20020a1c4c14000000b00402e942561fsm13648037wmf.38.2023.09.11.09.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 09:01:01 -0700 (PDT)
Message-ID: <eb89a5df-dcac-408d-bf4a-c0f80e0b9da9@linaro.org>
Date: Mon, 11 Sep 2023 18:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: meson: u200: add onboard devices
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
 <20230911154541.471484-6-jbrunet@baylibre.com>
 <eedc9787-06b7-bac5-a1f5-ba07d23f4ac7@linaro.org>
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
In-Reply-To: <eedc9787-06b7-bac5-a1f5-ba07d23f4ac7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_090105_699049_4F7F5F42 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/09/2023 17:56, Krzysztof Kozlowski wrote:
> On 11/09/2023 17:45, Jerome Brunet wrote:
>> Add missing audio devices found on the u200 PCB. This includes
>> * Lineout connected to the internal DAC
>> * SPDIF input connected to a coaxial socket
>> * TDM input decoders allowing output loopback
>> * TDM A and B output encoders and interfaces
>>
>> TDM A and B link format is set by the related external codec.
>> Internal audio DAC can hook to any TDM output.
>>
>> This change does not include support necessary the optional the speaker and
>> PDM Mic headers
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   .../boot/dts/amlogic/meson-g12a-u200.dts      | 228 +++++++++++++++++-
>>   1 file changed, 218 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> index da66e2e1dffb..9abe37b5b227 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> @@ -9,6 +9,7 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/gpio/meson-g12a-gpio.h>
>>   #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>   
>>   / {
>>   	compatible = "amlogic,u200", "amlogic,g12a";
>> @@ -19,6 +20,22 @@ aliases {
>>   		ethernet0 = &ethmac;
>>   	};
>>   
>> +	dioo2133: audio-amplifier-0 {
>> +		#sound-dai-cells = <0>;
>> +		compatible = "simple-audio-amplifier";
> 
> compatible is by convention first property. Do you have different style
> in Amlogic/Meson?

Not really, no specific style

> 
>> +		status = "okay";
> 
> status is by default.

I'll fix the patch on my tree.

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
