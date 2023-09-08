Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA972EE7FE7
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pLflAW9K2P5S6DqID4LXRlce1Jp8uErMzOZHvCbFUY=; b=eij08LpsX7UQ6yvdy+4pQaG6ii
	0c1xReksKJzwxGZr0XAPmxirGGLXsKGR+Ts8c2R7izj4ZYV2I4o+DiQyTyzijYhBCLzX+VNBlXeSF
	ZergH8vhpA6ksLbRNFay2e8wXuQrpVA7i73pfLzYLPY9FpiNkRRr96W61m0ILP4twsRW5rz5vh1jQ
	2oskIYKqzIPNlZCjBtW0NNrYmIRvKcJK95Y3BKQ2TB9GgW1KPPuRbV1jYBBGZCLpQHxAM7LwbZIHi
	ZT/DlWn0W42GgsTe7S+uhpUvqvxNRN2bmU+RkDkG7Oql5svfCEYEj1ch9nI1iE6M4QN9MLNVllDGD
	t3WV3Kzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeamX-00DmXy-1X;
	Fri, 08 Sep 2023 12:40:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeamU-00DmXD-2S
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Sep 2023 12:40:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso20766185e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Sep 2023 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694176812; x=1694781612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU2+QV4aODXtVs7q5YHeaRMbqDNd55USgbN27DWq/do=;
        b=U0ssriNpOcod/mgZKLCaXyzXxlH1CgIEMOaGFXvYYrBq8IIMn/Wyd+U4gvDFBjF6uz
         ocwBmU+/YBWyb5QNjJQfVu7e+7vCNDIveWs2COOnrik/I/KSZqWV2ANHdDFN99UE8wKQ
         oyssjZJvUvgRN5flwTNZbZlUb/5uMESomJ5O0krohnLBE7yjt/89UeLygBMlk5F1CwE9
         ehCmrGHRSLg4xyvNHL2udF7JlAffOvcdjRUqD4TmtdnIHzM8G3nzNyyobd8c/h5SVB3x
         kOM+o92iAsK/J6EKOln/AfTVD0LzBhRA3mwINUeRtXQW4wVfoufvz8G07CnIuafY5HHJ
         AvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176812; x=1694781612;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AU2+QV4aODXtVs7q5YHeaRMbqDNd55USgbN27DWq/do=;
        b=uwHAH5DB3kzjXYejnzhTcLULhPxs41m4/EEBkeb/F8jhlnQvSkrHrDVnUckbmVL4S9
         voZ9i669+q9d4simjkz72XEGr/i3ribd38FwFA1K2+Gy4OzRAH7A7kuBa1nKxQ6iHTD4
         vWtZKylov6FNgZv4tmQuvYQEq5k94o+lo3hKf/nuO+OMZWKMRFcRQEGe8YYJ3blRfdhl
         MRRQeVULO5K4ToRcOs+yy+18seasKhBrLsim9ggINXoA4S/Tgpmb5aSFZk3Bw9HD/Czs
         nAZMT94VS+Dk5Q+84vtM577b8v94mYBRFHZmVU28OzqWf6g9OMfqZf9CZyH1FzMDqL2M
         mhcA==
X-Gm-Message-State: AOJu0YyZk4bITqnt21GJtj/WuXe/f4K0JbcCYAmmA2J3NX/Wq9QFos0Q
	CGpIStTG1OyV7kVazH+vWEGLzA==
X-Google-Smtp-Source: AGHT+IEn1A3t/Z31ElsOIiIsqnkGtN+Eg1q91yWkXBCHpOTFYwJBqaz03nsf2vXzeiEMpEAs1KYQ7A==
X-Received: by 2002:adf:e54e:0:b0:31d:db2d:27c6 with SMTP id z14-20020adfe54e000000b0031ddb2d27c6mr4534802wrm.30.1694176811908;
        Fri, 08 Sep 2023 05:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4? ([2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b0031c6581d55esm1988726wrp.91.2023.09.08.05.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 05:40:11 -0700 (PDT)
Message-ID: <82001107-3e72-4cc7-b7d4-8ca1a840b508@linaro.org>
Date: Fri, 8 Sep 2023 14:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V3 0/6] Power: T7: add power domain driver
Content-Language: en-US, fr
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pm@vger.kernel.org
References: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
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
In-Reply-To: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_054014_829621_352D81A1 
X-CRM114-Status: GOOD (  11.17  )
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

Hi,

On 29/08/2023 04:03, Xianwei Zhao wrote:
> First patch is that remove C3 some power domain ALWAYS_ON property.
> Second patch is that add driver to support power parent node.
> Third patch is that turn on power if initial power domain with
> "AWAY_ON" property state is off.
> 
> Other patchs adds power controller driver support for Amlogic T7 SoC.

Please re-send to Ulf Hansson <ulf.hansson@linaro.org> and
linux-pm@vger.kernel.org since this driver has moved to the
GENERIC PM DOMAIN PROVIDERS subsystem.

I'll take the DT patch since bindings patch was reviewed.

Thanks,
Neil

> 
> Changes Since v2:
>   -Modify subject.
>   -Define PWRC_NO_PARENT UINT_MAX
>   -Remove modification that transform is_off into 1 or 0 using !!
> 
> Changes Since v1:
>   -Fix license from "GPL-2.0-only OR .*" to "GPL-2.0-only OR MIT".
>   -Modify T7_NIC flag  "ALWAYS_ON"
> 
> xianwei.zhao (6):
>    genpd: amlogic: modify some power domains property
>    genpd: amlogic: add driver to support power parent node
>    genpd: amlogic: init power domain state
>    dt-bindings: power: add Amlogic T7 power domains
>    genpd: amlogic: Add support for T7 power domains controller
>    arm64: dts: amlogic: t7: add power domain controller node
> 
>   .../power/amlogic,meson-sec-pwrc.yaml         |   3 +-
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   6 +
>   drivers/genpd/amlogic/meson-secure-pwrc.c     | 127 ++++++++++++++++--
>   include/dt-bindings/power/amlogic,t7-pwrc.h   |  63 +++++++++
>   4 files changed, 185 insertions(+), 14 deletions(-)
>   create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
> 
> 
> base-commit: 413f5c02929bb33042bbc4ee233166550a5fca70


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
