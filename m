Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF12CC27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBRaMT3Hdob9a1yGMhbAtDHbWiUeGsVjLRJQ15Mqxfg=; b=SO4CX0ossCpKVBVva5uZCtWnsG
	LqQCbT3LqVU/3okjdNHjQd3OZJGtGRduwuRITiTYhxOzFK/BJtfPOlriqgZTijuvJbsSUhKXZA9U9
	zkzANulYZUvZVd09iY7IT3UwjPc8z2VRyTdAeHIt2bOlnJ7pc7SulXgUs7O2EEr0cFVhvi7sR5kSY
	oW1IUTi9e2KuNAOFXN/gWGghy841Nez9AZG1zym7BgTIvPRRMww1eRqCRpWlYOjcrP6FW8q3eeSaN
	pw9xVyXqduYC6yxDpkDuoKZ+Mb0DyzmJIw7CfR/NGxdS4lFkOWErnaOMR243HTPWTAmS8S4Pq2NrI
	iE5RS9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7x9-00000008jYh-1x5I;
	Thu, 06 Jun 2024 07:54:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7x6-00000008jW7-1R6y
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 07:54:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-35dceef429bso267435f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717660464; x=1718265264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmYn9rMjzNzeNgtppFDQy4tGwULHDIGKKfhkuKp/Fsc=;
        b=Txbp34a0nYQqB87IQo3mIYkkBxL0ttN/FPaQHR/5FgC4t6uqHG/KDz8wRSXHXYnjVD
         JHpgEUXhokxi1GnvM3/8HaCxs++NXTiGAcjidmPJVzj+kpWyY6ttaXJQMoSSzlV/vD7j
         Us8juhixib2/9nhaFyWctWUZmU5ZxBGEpKFZ3dnYHnzMUaoptLduzdYB/XNQxj3wqW7t
         xuMHJ79vd+NTgSrLDHHCVgllltbYZXmI2ZmK1362D5aH0ZzzO/vHgetjs9bdWfTXCnRM
         FNnimJZaxH/hRBK5a7s3qj66GrKwvBqajt7V/Z42vHusPa671Qno6NVNRsrtGvRx/E0U
         Ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717660464; x=1718265264;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kmYn9rMjzNzeNgtppFDQy4tGwULHDIGKKfhkuKp/Fsc=;
        b=X1wFbyxS6gAV2Cg+vySlgs9TtcZIZTtpofjSA/1rgup4AlLVAfdTKj+foQFB+KZQ8s
         3znjmr4F9C31MlJqnHs2xXyO5i7JwAu1bDvhgKVo76O+VH5Bk3YwXnzDWqjA4ZdOeKLp
         LqrtVYJKH/ZbnlyIkhNobbM5R3Zl4ir2AGU4cqBQSojQvXyKAUGL+axVcAMeDMt05FgT
         qboSqNhGXaBC471wI8FSYmmKSkXURQgRiUh1eU9xsJiGx3o9fItqyWxvrsAtaqsEMPYN
         v0P5Lj+YihIYLI0JL979lCLrP+HDjh0IOCd0lU58iF3ejcR+w4tNoGoPnwsl30a3wRJS
         tUzA==
X-Forwarded-Encrypted: i=1; AJvYcCX4O6AZPx3lCQqIg9iWUCmCev1JnOdlN1L+t4YXGxvvnOR6UqAnVUZfjl2zMDYPOms72xi9AwbyvnYFzcof4gtLqFcfgQAYe00O6F0Ypm2MYTQ=
X-Gm-Message-State: AOJu0YxBhArW6bnGlMpHXdqScsP0Qd/7dHCcUNFmxVnJ9XMQORz8wZOw
	Nh7mxfge1J9AFr/lh6mdCMVWKkhqaX/W5gNVUW9oW06tM3CCeJdvhn1b34KPsfY=
X-Google-Smtp-Source: AGHT+IH4KWb4XVK34xYY5tEiXvzfkgFMx11vnQnrD9YBFyNgpHbpBdy+mWtj8PG7uu3umEeRvRNHwQ==
X-Received: by 2002:a5d:6a44:0:b0:357:16f6:71dc with SMTP id ffacd0b85a97d-35ef0d7a2e0mr1635823f8f.13.1717660464551;
        Thu, 06 Jun 2024 00:54:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2? ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148f66sm47781085e9.32.2024.06.06.00.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 00:54:24 -0700 (PDT)
Message-ID: <1a82eeb8-bb95-4fad-acce-798ba0cda170@linaro.org>
Date: Thu, 6 Jun 2024 09:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: add optional
 power-domains
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
 <20240605-abdomen-starch-4fd4d7ead431@spud>
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
In-Reply-To: <20240605-abdomen-starch-4fd4d7ead431@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_005428_458898_98EC7492 
X-CRM114-Status: UNSURE (   7.72  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/06/2024 18:58, Conor Dooley wrote:
> On Wed, Jun 05, 2024 at 11:37:08AM +0200, Neil Armstrong wrote:
>> On newer SoCs, the SAR ADC hardware can require a power-domain to operate,
>> add it as optional.
> 
> What about the older socs that don't have power domains, the property is
> now usable there?

Old SoCs doesn't necessarily have an associated power domain, or was handled
by firmware, does it harm if we make it optional for older ones as well ?

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
