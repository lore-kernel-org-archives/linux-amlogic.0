Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C92C27C5E
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpNHIwqGvzckPywRQETfc1H9KpAOMp5FcGDJ4lYf4IM=; b=2ybWDuyIVlEbj+YxDKpwRB2aGz
	iqbifPc2rrA/2Ds5QW7LfJr+JZIECzVBGgx9msWimYYonB6CbW4RYDz87jA8gRe+T5x0EZQHJYRhG
	KNTOCJIftnSfAYbua45iyekGdTzkoNW9niWZNLoCNF3qglhKT8U1S0B/nC9V/FMbzTpSP8LUhbGqK
	jcgH9YnbEekhkg3a7Ge5GtTWDQOTy91J1NVVCmRmYsOaMdvPb/bMt+1MH5a2KOExZ7Xb16iJEsNIR
	UstJPvYDhG5ph2lV9Uq3Hbamvk89qFieuSAI+Qj7ex+8aDhqQtpItLlI48WpOYStd+6Cw9ZPxTCL/
	Fi3N5Zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnU3-00000005W83-2S0z;
	Wed, 05 Jun 2024 10:03:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnU0-00000005W6v-2Asw
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 10:03:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35dce610207so4891649f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717581782; x=1718186582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXWabIB/FOHsZFz4UrPUJcmSheKq3iz/zxxFc47g9nM=;
        b=Lg1EHPSmmx1XdNXd4iBmqCiUPfbtex51ee5mgjET5ZAk5jzNgqldfS6pDb+z/CLhnS
         K8Z29TXaQw69RHsahVstuIxJR5M++WM5koC2FnBc2Ltzyoo5enC8iGucek14q3NgNcKi
         5w60KK3s85mGrY+6FwmId7rP9knBsQkTmVsYjmEddXRViHei018l2Qli6k6dpctOV267
         q7rKsZKicoYHcA6sUGlWeUfOlFR7fl1HLzO6sgg4F2PObtujwlxF+0c8AhJVEewsGvwM
         efwPwyGikDX/5cjCImkoUwe+4GLWHCg+jc6dkAuYnEOYZBKGmXZ19X9BFlCc+amMEs1a
         0JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717581782; x=1718186582;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXWabIB/FOHsZFz4UrPUJcmSheKq3iz/zxxFc47g9nM=;
        b=Yyuco166n8DVpjqp8acw3xf09E87tIxYGvznx2sPPdXB4awo8m+EvpBgT10eBkb4lX
         I7Edz7kNJagMLxQmZ6pg6VipHFd29lMW/LIeT/AY/NhPJghYpqNBjfimAzFjsw66DlID
         temL6Eo9Tsc7nEQKbjL2ctGJon1DWf7HRDe3eDLU2p5x9tOgsw5ldqmk+mm065bwqzK6
         k24qpeA1e/Basoyl1xpt9HGLkeCdIit5L8O3i9RFdMweDsnZzUqgNLFS0VQ2L8+OiE9q
         3IHS9INP/0l8QeFQJMupVLX+MBMO+/4uTYF0w09RKIcPmvCxYF+93nu+JfFzBGB/nlbv
         itQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFX5i92ES2j9i0+LdyjJr151nTOISpDhaJgXKG3zjVVFrBtW8iZEmCSRrstFhAlYilKbRW0iT35KUKMKW8n41Gs8jr5x2+1VMD5RZSGiUvcQI=
X-Gm-Message-State: AOJu0Yw2IxgunczVAixSh59obBmQjeW1FUDQdAirk/Zx4bVRIjxTO5G6
	A+e2eWfnM5k9G+WMZa92I0N+bG1WZF/iQ7QHbi2lhyQuLGBkNiafwYG1fKZImtU=
X-Google-Smtp-Source: AGHT+IGtZQZ3/qNpQsmaSHuByn54XvWNAOr9Ii40f2Pi9PuJB4m5TEBP2BbHKGEJH5ZqXFVyC/Pqzw==
X-Received: by 2002:a5d:5f46:0:b0:354:de28:9eb3 with SMTP id ffacd0b85a97d-35eeb7d0f57mr1171323f8f.0.1717581781675;
        Wed, 05 Jun 2024 03:03:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd? ([2a01:e0a:982:cbb0:c7ce:7756:462d:a8bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0d3csm14048750f8f.19.2024.06.05.03.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 03:03:00 -0700 (PDT)
Message-ID: <c51b1d72-7dc7-4012-b479-1ebecb25dd6b@linaro.org>
Date: Wed, 5 Jun 2024 12:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] Power: A4: add power domain driver
To: Ulf Hansson <ulf.hansson@linaro.org>, xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
 <CAPDyKFo-V4aNKWQn2r61_Q5d9R2Lhj8d5Ri_b-zW7VMsVBHARw@mail.gmail.com>
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
In-Reply-To: <CAPDyKFo-V4aNKWQn2r61_Q5d9R2Lhj8d5Ri_b-zW7VMsVBHARw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_030304_567487_8632E8F7 
X-CRM114-Status: GOOD (  12.41  )
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

On 05/06/2024 11:57, Ulf Hansson wrote:
> On Wed, 29 May 2024 at 05:10, Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>>
>> Add power controller driver support for Amlogic A4 SoC.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Changes in v2:
>> - dts: Move power-controller node to be a child of secure-monitor.
>> - dts: Include power head file.
>> - Link to v1: https://lore.kernel.org/r/20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com
>>
>> ---
>> Xianwei Zhao (3):
>>        dt-bindings: power: add Amlogic A4 power domains
>>        pmdomain: amlogic: Add support for A4 power domains controller
>>        arm64: dts: amlogic: a4: add power domain controller node
>>
>>   .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 10 ++++++++
>>   drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++++++
>>   include/dt-bindings/power/amlogic,a4-pwrc.h        | 21 ++++++++++++++++
>>   4 files changed, 60 insertions(+)
>> ---
> 
> Patch 1 and 2 applied for next, thanks!
> 
> Note that the DT patch (patch1) is also available on the immutable dt branch.

Thanks, I'll merge it in my arm64-dt branch !

Neil

> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
