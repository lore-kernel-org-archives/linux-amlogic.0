Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09435E75433
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Oct 2023 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx5TS1EkuWJPX/STXogq1MsgSFTQItjW2kBcN4L/bNQ=; b=oNxI6WZqDEsMDKL1hICoHLBKq+
	xzdAwW1ynu3imyBVZyU99eFex63nRV/akuKdbaQQdCrUtH7BDepJz58H/9S/VXDvIjivpv+m4qtLc
	xBRDW5V4uCE14lX0DzX2TCbTV3WxXCUyg9IN8Uo+uWi9f9kF4GUjBcwDdcvxEzYhl58EgbyEQaLmj
	7cv0WiqGnF0MLur8r3Me6bxquDXLfg7nAL4S1OaiBrYWMSqXvR+nbMzBMj5hZs+34v6gGn20AuW5t
	gGjF2Arc9sq4mqssPTsfL9baHEUcap2ErAjMDC7U+g10Eg2wsTu3Qz5eaq10Dm/i6biBsEj4xAZJi
	gfqkDWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZwx-00E09B-1f;
	Tue, 03 Oct 2023 07:36:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZws-00E082-0K
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Oct 2023 07:36:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40652e570d9so6209615e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Oct 2023 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696318562; x=1696923362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UD/AB2S4ZYVLnpGYToE/FYGZFMT1WUw1oYcs+MI0m4=;
        b=QovUF3pmj1BwGteVae9iCa8sdEoAf8LLT7IGGXygb0vMrupyjYRKfuFTCFH9ZqyA9l
         fzQSdKNuJH2e/KmYe2I+kqpOHmj019aHP0I4CYRq6SEZnJm6hz+pbhi4jiMyYTj0HHsA
         rX2f/IskO4SsktRMmK36lO58QD+cMyzzquHYyCMPUV6uqh+BycuanRUNq6geYiEBCr0C
         jIyIC4sjl6QEpNaXc6TW+9NLBT3YUvKPl48yHhYsC13n567SDW5fH4NYNdAMYd/QHpZ3
         2nGSC0pfv4VmGcLn+NGKnddnTcypPt0DhHi4efWby+of2e4RcuVraZilrYmBMtkCW1e8
         Lbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318562; x=1696923362;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7UD/AB2S4ZYVLnpGYToE/FYGZFMT1WUw1oYcs+MI0m4=;
        b=w3E1+V5lEhCJ1aDtuKd0Mv++t7UlZ2rRz6DFuVl/zWeN+Pkqse+09WhcpF/uWC/syd
         ZzXwf0+NatCfFSPRbj3MxJGljCE5rZEohPECW+4YCCJon/pfaTs1glXZmiAIa7NtRD+y
         LzeeQ6MEpAHnplvGgmbSrKlD/Gg67T0qKsHUE+DkP82x2jYDLhSsR72zNCyscSqCmw5m
         GzVHQcnlD6Z7os1FAJ31HAxMOma0ifCcLttuoH4q+mZ5Hh1BJ++aXQpeC3cNWRZMAP0n
         4WEq/I6LBWCiuI/2pcG0IoklQSik0Ks449ay8Vgnq8QYLFeZ6USgIuaZT7UzO29KsTFp
         Nvjg==
X-Gm-Message-State: AOJu0YxkSzjlqZHXYTF+6DFnOnisQEeV80XaG1TPoFCbEXlMCiD7XXVe
	d/d8YKlXhuwDh7HUGLQ80Ie9pw==
X-Google-Smtp-Source: AGHT+IHfrMd12jZOVbBNYQXDMF8woMAZg0b4WJeiSzKXpx/lbo968fAvntSoS0fq0qv1sKjTmqjuPg==
X-Received: by 2002:a05:600c:2116:b0:401:519:c9 with SMTP id u22-20020a05600c211600b00401051900c9mr11917623wml.13.1696318562223;
        Tue, 03 Oct 2023 00:36:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e31a:fe1c:e925:9858? ([2a01:e0a:982:cbb0:e31a:fe1c:e925:9858])
        by smtp.gmail.com with ESMTPSA id p25-20020a7bcc99000000b004063ea92492sm606899wma.22.2023.10.03.00.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 00:36:01 -0700 (PDT)
Message-ID: <3e69ae4b-5d9e-42ee-a21e-151de8fbb996@linaro.org>
Date: Tue, 3 Oct 2023 09:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
 <b81a296d-0640-4b2e-aab6-c9de37d10206@linaro.org>
 <1j5y3ozvmk.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1j5y3ozvmk.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_003606_139629_4AD3BE76 
X-CRM114-Status: GOOD (  16.04  )
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

On 02/10/2023 20:57, Jerome Brunet wrote:
> 
> On Mon 02 Oct 2023 at 18:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 

<snip>

>>> +&usb3_pcie_phy {
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +	phy-supply = <&vcc_5v>;
>>> +
>>> +	hub: hub@1 {
>>> +		compatible = "usb5e3,626";
>>> +		reg = <1>;
>>> +		reset-gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>>> +	};
>>
>> Not sure the PHY is the right place to put the USB HUB,
>> and it's probable the HUB is connected to both the USB2 and USB3 lines
> 
> It is connected to the USB3.0 only
> 
>> so you should have both USB IDs in DT like it'd done for the Odroid-C4:
>>
>> / {
>> ...
>>           /* USB hub supports both USB 2.0 and USB 3.0 root hub */
>>           usb-hub {
>>                   dr_mode = "host";
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>>
>>                   /* 2.0 hub on port 1 */
>>                   hub_2_0: hub@1 {
>>                           compatible = "usb2109,2817";
>>                           reg = <1>;
>>                           peer-hub = <&hub_3_0>;
>>                           reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>                           vdd-supply = <&vcc_5v>;
>>                   };
>>
>>                   /* 3.1 hub on port 4 */
>>                   hub_3_0: hub@2 {
>>                           compatible = "usb2109,817";
>>                           reg = <2>;
>>                           peer-hub = <&hub_2_0>;
>>                           reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
>>                           vdd-supply = <&vcc_5v>;
>>                   };
>>           };
>> ...
>> };
>>
>> if it only has a single USB ID, then it should go under the dwc3 node.
> 
> The usb controller is connected to the PHY and what's coming out of the PHY
> goes to the hub. It seems logical to hub the hub under it.
> 
> Why bypass the PHY ?

The USB bindings the USB devices nodes should be under the controller's node,
not the PHY, see:

Documentation/devicetree/bindings/usb/usb-hcd.yaml
...
patternProperties:
   "^.*@[0-9a-f]{1,2}$":
     description: The hard wired USB devices
     type: object
     $ref: /schemas/usb/usb-device.yaml
...
and the example.

Subnodes aren't allowed in the PHY node.

Neil

> 
>>
>>> +};
>>> +
>>> +&usb {
>>> +	status = "okay";
>>> +};

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
