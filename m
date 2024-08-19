Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983FC52D6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 17:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f5nGFYBr5+xphQBRv2f3ihAx5cY4ePTlx22yzrU4p8=; b=is/B+I4x/Z0x8ZPzMZdtdpZwqI
	IseF77KR3JBXxPIn7Wo4Yhj++27BwcLFrvFTtZbJ6R/goHGKABxC7L5C72H//6hrln7o7MDTlNn1K
	zJAg0XDgQYqB/SSk564tn8j8hGyBht2llStzTEytdlZM1+DSUEwvAZaS2fczaHGhrXDjBuhnDX89q
	yy7txf1RSIODz8q3gdNQ59hDs7RLlNXtIm+RUWAkhGFaPv3ZcT19vm/tIJG1GlORvGTKNTBhAAw0V
	uohlqjwqNeU56A3VxQ8KiHWcMoAGvZcz8Oqlh/nXipfwyQ3z2FCd00EAXR5H8Mskefiu1No7eAu4L
	d84oVfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5v9-00000002LLa-1iI8;
	Mon, 19 Aug 2024 17:11:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5n7-00000002J1k-3dwe
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 17:03:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37198a6da58so2445978f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724087016; x=1724691816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnDFSTAKv2CbUB/GFxo8WQKI+dvEV3GJoZctb6HdaJg=;
        b=Oq1xICt1iqCAzW+tKa+8EBAMSbjDxG5QsQp1JrQaPDOHLvz4c4h3VLeb5y80EYYfeL
         k7KGJ3g1wrtSimLUrSuouXyea1ULQU3jzqJlZxK9fhBlnFqhqp+7PHXOnljsnjhSI9My
         SdEQb5LRb+DUB4/vkZYqT1ViROpu+kK4fM90X6oS7MOEKohzsS3b9QrbAFxBrKxFB4/a
         F6k8i28t8n19iRj07mrGYCXiwfmnbQ30b9WSWmuy6/xrFveSfehaoIOBGSWRtIBKmLqa
         orhvztHaus3EkENwF4KKMuWocyTiSErPRyHgLKaCDOvadNxBCuhsuN2ct8b7gvPYeebz
         n5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087016; x=1724691816;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fnDFSTAKv2CbUB/GFxo8WQKI+dvEV3GJoZctb6HdaJg=;
        b=IVvURHI0X/dsBzGjHELk21BBfKbo8/YLZagyrI57arbrNPqjpAVy7nR3ZleLA4f61I
         fbeg3xUeBPBZOG8f8+sK+Wo1+Kpp2Ojnn+0QcdcPL8/1aw5JlHY6EzF9QRh/m4/1Y2WG
         YrrPcPDXdLKtN4g7ujI8lx3M/SItNOQTI6cuF3Qj473SgthE0N1u1xMqstR/Igq9ydnd
         /WZWQIRRsIRrTVW7YPY3aLS0BOKmXBLvvXLqM2GbSdO+OJSSUljWIFv1jBDry9DEqhm0
         KRSle2zRs9Ayp0f8CthzWSXGubAM29fvNR1E5AZrHQeVjgste/+GyM+0RnlRY8N4FAJ6
         ILQg==
X-Forwarded-Encrypted: i=1; AJvYcCW4GjDeKbGJaC3Zcet0sw+9ehkMVTjZ8qaI6cfqgksQLImQlt0HAuUMvM6aaeqznoUjHYLcHNOWW8PSaF3WCYLOaAfWQVxK259eB6lGGCwq2pA=
X-Gm-Message-State: AOJu0YxXFo21WIt+jMCEPQgL1xd743OIkcDRwf1Rx0GTMYXlgU0mMXDl
	cT8Joq8RuV35KG1l0BMyw18tjgSln7W5FivcLeaoQdxDO6Ivz8CkDuEbsFwY0CM=
X-Google-Smtp-Source: AGHT+IGQ5kx82xhxsw7wqB/29WGVSG0vwg+ZmcFDHp0t1PUqrHJXqfXV9Jrt9OgVCooQy8mfz0TeRQ==
X-Received: by 2002:a05:6000:ec4:b0:371:844f:e07 with SMTP id ffacd0b85a97d-37194315732mr9821639f8f.10.1724087015346;
        Mon, 19 Aug 2024 10:03:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189849697sm10964887f8f.37.2024.08.19.10.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 10:03:34 -0700 (PDT)
Message-ID: <35e56911-a99b-4818-8b31-78baa680f8fe@linaro.org>
Date: Mon, 19 Aug 2024 19:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/9] reset: amlogic: add driver parameters
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-5-jbrunet@baylibre.com>
 <614de1b0-fcaf-457c-9183-1f3cd7f91b38@linaro.org>
 <1jzfp8wjod.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jzfp8wjod.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_100337_977177_0BFFF148 
X-CRM114-Status: GOOD (  13.14  )
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

On 19/08/2024 18:40, Jerome Brunet wrote:
> On Mon 19 Aug 2024 at 17:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>>> +	assert ^= data->param->level_low_reset;
>>>      	return regmap_update_bits(data->map, offset,
>>> -				  BIT(bit), assert ? 0 : BIT(bit));
>>> +				  BIT(bit), assert ? BIT(bit) : 0);
>>>    }
>>>      static int meson_reset_assert(struct reset_controller_dev *rcdev,
>>> @@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
>>>      static const struct meson_reset_param meson8b_param = {
>>>    	.reg_count	= 8,
>>> +	.reset_offset	= 0x0,
>>>    	.level_offset	= 0x7c,
>>> +	.level_low_reset = true,
>>>    };
>>>      static const struct meson_reset_param meson_a1_param = {
>>>    	.reg_count	= 3,
>>> +	.reset_offset	= 0x0,
>>>    	.level_offset	= 0x40,
>>> +	.level_low_reset = true,
>>>    };
>>>      static const struct meson_reset_param meson_s4_param = {
>>>    	.reg_count	= 6,
>>> +	.reset_offset	= 0x0,
>>>    	.level_offset	= 0x40,
>>> +	.level_low_reset = true,
>>
>> Just a comment, I would rather leave the "default" users of this driver with the default value
>> and use level_high_reset = true for the clock ones
> 
> In every other place in the kernel, we specify that kind of thing if it
> is acitve low. Your request make things up-side-down and harder to
> follow IMO.
> 
> There is no 'default' user, there is the platform ones and auxiliary ones.
> Platform ones tend to active low reset line. It is clearly shown above
> and hard to miss when adding new platforms.

It's only a suggestion, we tend to not add `= true` to existing users and keep
the new boolean properties for the new users, whatever the logic, and since
the driver originally did set the reset as low lever by default, it makes sense
use level_high_reset whatever other drivers does.

> 
>>
>> Neil
>>
>>>    };
>>>      static const struct of_device_id meson_reset_dt_ids[] = {
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
