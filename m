Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FEACA0EE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/drxzaanB07+XGf1BZjAQuI821xocCv5FL9HwNJ8DZw=; b=18kdQPbIkhF6v9QuYC0wXNF65q
	9l6q/3Wo0Rvvn/PHJdntMHdk49XKncwB4uDsQj8MxFpAaApcwgfwiNqlg8URV5x7njOPdoAIG4yKP
	48IZM5IXfMOesfYCfhUv1hFdGuwBEtU6l6TLJXRiiuy+i7Z+PaORyODSvKMbSVSBpjezfSNBME9e2
	L9X22QEEdaLI06R0SJIPPvqx5CiZ2DxXGA2oZbXG6HystwUKa7hyFaMmqawieOPW2evCQkxtPZ//J
	QlHbnYl9cPg7eNVdzYFmo92pEkV9FVTsix4SqmxGKbGybujSZUg3URJr7d8CTOYboYx0fJlpEoM1b
	4OTf9ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwmW-00000005Hui-0Vzd;
	Fri, 30 Aug 2024 08:14:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwj7-00000005Gjn-3FCk
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 08:11:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so6858245e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005484; x=1725610284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AWw6cuU4qnYJYiO0KkscvNgK+nvviO/5QOFUcQDLXc=;
        b=Coz5KWq8caonCJD3z9Og2O4hSu/7/q1jjvXcjueLLLKcfUREgYG62KUhHc8yBE3wIE
         yi9Chz4oR8J1kQG7UBDzdTTXJqIcZpub0xOYjiV/xg9MckciH4s0ZwRTWGhj3rExbOZ6
         9CxD+9zDWuTjFLbBF3v/ZtE9/ClnezH7zRAY0Osz7BUep9RLQQjGWwBEHGum0gRkr4SP
         aqLdq2Fdb1E5++DTOe1/M/EEv6/+EmuGCXb1hV4ATE39e3H46fhsu5XOp74VfBy3dm+O
         S1R2pHjqWLKJUoY43xELAjkp1pN1h7xNStTFGoDRFO4xZhfNFhWyluz5/pujh9Vdzd96
         24Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005484; x=1725610284;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5AWw6cuU4qnYJYiO0KkscvNgK+nvviO/5QOFUcQDLXc=;
        b=r40cxCFWENyIrYbmVqreryJSeMhfdzAW68UZ1AeaUJnsTWqqHJMV/Pp1hT8BhuMUIm
         jumpdki0aTOLSJrYue2hgz/AXWfpCg8WzY25DZmvdPvO/+lUZ/rFK/0xIfbgIoxmyeXB
         yGCq9bp3P4jyVhjXsJQyzRuRYedUhLSEDlvC5Nu5Yaa8zO9wj0x3lti4tiGF2GeIoGrT
         l+J6fChPOt9rH1tBJVtFGHLnp4mw6ZADc2KLwoCSqDY4hJfK7U+96lgmrGQYZpl1v418
         cRFG5HUXB/BCUI1Y9JfVdNO2RiiDC1094NO1ZLksrkIktAePw1tpGrrSb8NLDkSnU/EN
         lqjg==
X-Forwarded-Encrypted: i=1; AJvYcCXojoou6t7LSfcFEHIT071zJFDbYv/IPYbrsfDXn8rFsj9YIEx9wU0oX3rIF9HlAdZdESr4/IQEYfQWAvZF@lists.infradead.org
X-Gm-Message-State: AOJu0YxHQybD78mDnDchfMB48LVyNO8dWDdt+rqzHwNfLvyzef3fEnci
	/dai2yhve9YKrAJ6oB9jNpvHBinYbMwhznBF+6b4omsjnE1I0m+jFaeVAPQhGjM=
X-Google-Smtp-Source: AGHT+IEV5spCX0hbbp4UfJY+WGRKziPDTx2Krz+YblmLQl+3ltKa8h0jfNsfBitlfkYP2YeGxnySbQ==
X-Received: by 2002:a05:600c:4594:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-42bb0283665mr42641335e9.1.1725005483843;
        Fri, 30 Aug 2024 01:11:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3? ([2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb73e20b7sm36307285e9.14.2024.08.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:11:23 -0700 (PDT)
Message-ID: <79c735ca-008d-497b-bf5b-a21f6dcde796@linaro.org>
Date: Fri, 30 Aug 2024 10:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: fix C3 PLL input parameter
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: xianwei.zhao@amlogic.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
 <20240830-c3_add_node-v4-1-b56c0511e9dc@amlogic.com>
 <0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org>
 <1jplpqsa71.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jplpqsa71.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_011125_872414_70B4B726 
X-CRM114-Status: GOOD (  10.49  )
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

On 30/08/2024 10:10, Jerome Brunet wrote:
> On Fri 30 Aug 2024 at 10:00, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi Jerome,
>>
>> On 30/08/2024 07:26, Xianwei Zhao via B4 Relay wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> Add C3 PLL controller input clock parameters "fix".
>>> The clock named "fix" was initially implemented in PLL clock controller
>>> driver. However, some registers required secure zone access, so we moved
>>> it to the secure zone (BL31) and accessed it through SCMI. Since the PLL
>>> clock driver needs to use this clock, the "fix" clock is used as an input
>>> source. We updated the driver but forgot to modify the binding accordingly,
>>> so we are adding it here.
>>> It is an ABI break but on a new and immature platform. Noboby could
>>> really
>>> use that platform at this stage, so nothing is going to break on anyone
>>> really.
>>> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock
>>> controller")
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>    Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
>>
>> So you mind if I take this one via my arm64-dt tree ?
> 
> There is no conflicting change in my tree so it's fine, yes.

Thanks
Neil

> 
>>
>> Neil
>>
>> <snip>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
