Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF535CA1006
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25ZN3lycU+NA8qn0YSoNQZgkmuh4+A1xCtc5a9El6WY=; b=NzUmioWW8SkyX3XZBxCq8fBgDt
	P0ON77CnbyHIuwktOklrxvHsAeCH87PLHHyCYBRPU+PowogI92SGWyPVQX9JCL2vl5vJ4aS0HedeT
	LPUXCrpW96QC5gTBSxGuJeKjN9IG7W1V875jQhZ2s9QRNy524AyaZws2rm6sreiqvLw/XzYyMZNne
	zV7nsdMyzinI2zFd3axh5lJsxcdTlHLgxrh6bBUBt1fItJ/bMNf7QOvd9cYwt+HhHG+LSXNOr/Ld6
	cjo1I/t5n47deDM1UfHVKiDJbEQHCk7aejTV6rlSK4zOytLJqQBt/Kko+VftMunBxMJv35C+k2ejD
	FJJXrLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oi-0000000CsyK-47Xj;
	Mon, 01 Sep 2025 14:47:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3WW-0000000CLbj-1sVH
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Sep 2025 12:20:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so13824435e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Sep 2025 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729235; x=1757334035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjeTTnIl0jOEJud+l5JHju8hS4DYKMB3s9qvufpCuog=;
        b=pkjxhL6tsDHanhOZfKaALREDRB6eljYhIYecgBHfU+Ohd5OsN3AcZxML1R91ddFY0U
         pai6KDteIhfZcqvmjMMhnUg0Xtkg8wj4EVcjTLxSJh5HM7rUItyIUE1H8M2XIYIbRkZd
         E9b2kr1ejUbJIf8Kn2PX6j19M2MISyvDTrE3vrn2RxY3UpHkyQEnxwtfsYqiM1DnuQP7
         LMabkdhDimdlbUpc8YtLjF26bMPBvFGf81/k5mN1W2jp3LaVNB4SxBrgsaiOj3UKj9bH
         dLGN1B+PXn6IvuVNt6AfLUSjOyCuiPIR5oGCHyHmR/Ddr5HFsTci1gEudx/zrtiID2fQ
         nWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729235; x=1757334035;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WjeTTnIl0jOEJud+l5JHju8hS4DYKMB3s9qvufpCuog=;
        b=Boeed6iIDcEY1DDSweD+GAfS1d9/ILeXueuS69GMnFXZ5vd6Ol9mA3kwgzRR56+UaA
         3dUto4FcL1wsI1cHZoBHWb5pQHgHGmTpfwg70UWAT1kwG+OVvKPxyDcKelmdMdBkp6tb
         o4wXY6EG9G60aXh3xsGVcsNwLPLxzffUiB9nTp6XN6/3PPsDvBZVma7KaXQN+5YRzGoU
         zApjX8dZcJQF295iTO1fwACoJZYFLoNFRweNzunefOXRglTqEFmO/UYYTh8EyuU3GoUP
         EM2+cv8Qw0R5CzhoomQSx6cFiGJWkmhp1egyJFwZF9GVsuvVG9JEQTfXTIIN8D4FcATG
         IztQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAQhJLO5qhGuuwOgoOwy5TVv6pGa/ieWcDQRDuu0YL4P4lBEFUWZxr0h33LDYjSM2XVmAFOuIl2IJULpRj@lists.infradead.org
X-Gm-Message-State: AOJu0YxMFXvH1dGMaahLTAnVbGriOwVAdUGTr1vQJ/YD6kvdvOC0jmU1
	8EQkrs9+yEQ+I8t5ENLpRPAcyDbQNf4qAlgHz83xk4JUVpcDyC8QEiQUaC9ngk3LWSbGxccKY3Y
	Wx/EW1YA=
X-Gm-Gg: ASbGncsggZ5ky/EVhmVsHVk01T6wE8fv7M8DS6vTWHcKUGZNeDGqz3QQKIdRv7U8QOe
	To0/u9ydK7ArxCX6avPf3l22QirzfLxpdOGL6zw0gn1UKWejo/2WTzF4DHThj7H4pzXO/hKukhH
	e6dBRQTvqaVCzGA1MqMYTFGqA4Ev8RkWGG9urG63qqS2c79KvZNnPO/P2ybfWJyiZ3c+00wZi4o
	320yDkQybgi4fOq7EUBBzfMvNQnl9JrUvUEgWzAVXcT0cBoFKineMfnbPeXjRS2tPta68g7pY/K
	IJc/F7Z0evX+x2S++UMo1N8FyqbFFR7a/xcT5XsGJOfCDX/znxL7BQs8vPHThkOAHwuWVqJgia3
	lDgOvEk8dd+QcaO+qz1n+n1/dsWwYG/Tj2duJ1PRs8yAf3Q8+tqm6alR5+TY/d0iFl8prB6wwe0
	dmWds+yCs=
X-Google-Smtp-Source: AGHT+IFRNIETqpB+2jIgi5Tu/QDZHVgu9dKwYHLpUPiWYKQcXey9hx08WJgHdQv+NvmQy5/dFQ/3Qg==
X-Received: by 2002:a05:600c:524d:b0:45b:8a10:e5a7 with SMTP id 5b1f17b1804b1-45b8a10e8c5mr45748725e9.37.1756729234802;
        Mon, 01 Sep 2025 05:20:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a? ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d45daf3293sm7429476f8f.48.2025.09.01.05.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:20:34 -0700 (PDT)
Message-ID: <0d471827-16f2-4eb4-9212-82ca20a1c0ba@linaro.org>
Date: Mon, 1 Sep 2025 14:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson_sm: fix device leak at probe
To: Johan Hovold <johan@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Carlo Caione <ccaione@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250725074019.8765-1-johan@kernel.org>
 <aK7U7-ebrPcxwEIj@hovoldconsulting.com>
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
In-Reply-To: <aK7U7-ebrPcxwEIj@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052036_513858_1F7102F7 
X-CRM114-Status: UNSURE (   9.04  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/08/2025 11:50, Johan Hovold wrote:
> On Fri, Jul 25, 2025 at 09:40:19AM +0200, Johan Hovold wrote:
>> Make sure to drop the reference to the secure monitor device taken by
>> of_find_device_by_node() when looking up its driver data on behalf of
>> other drivers (e.g. during probe).
>>
>> Note that holding a reference to the platform device does not prevent
>> its driver data from going away so there is no point in keeping the
>> reference after the helper returns.
>>
>> Fixes: 8cde3c2153e8 ("firmware: meson_sm: Rework driver as a proper platform driver")
>> Cc: stable@vger.kernel.org	# 5.5
>> Cc: Carlo Caione <ccaione@baylibre.com>
>> Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Can someone pick this one up (along with the compile-test patch)?

I'll pick it.

Neil

> 
> Johan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
