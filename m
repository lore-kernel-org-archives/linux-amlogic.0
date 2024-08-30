Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723FCA0EEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AYB8vIVT/36NtundaXPbMU7oN7OrtLjiCvhEAHeZow=; b=U9vAmjwA/n/PxBcLoQgw00RWVG
	eHagLuB7qHINApqdO27h43hqU4EhshVo6R3MYC1aiPrN/BvNXRmazz9VOD1ne9h9hTy8y1edfqIRY
	4XCdSHwEUPIWS9Zcgm6pS/mXMXiE4YEeRbXLZMwcS4gYU6PfFHwYSbO/yZMdY7c0Ah9/CmRp/+1Ux
	BZaV03ZJN/zNs5IqPBWo5iT1dTMkyqumuSYMIymBOG431OfeTMPwSUoE619STfePiLCjglnaXkJab
	mVWtYsMa+Twr+BtB75O8jijQSUvQ8utVTHunCDXBNL8zbHf4mu2CzriSry2YWZFPv8CTxPVP4v1BH
	qqTddQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwaO-00000005EIT-3z5y;
	Fri, 30 Aug 2024 08:02:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwYl-00000005Dtx-0SvO
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 08:00:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-371b2e95c34so866697f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725004841; x=1725609641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aT+FymHOGJ4ZjNsGMyV1jzCm+wux1VTZ963iwlhoYNw=;
        b=rqAxpjnGrr+L7aPiV52FRnvtBJcZZmIKqUtCHSAxuiaf/tCb57gTjv97DC7c7AmYBn
         I/WCjMZDvn4fCyJy3DyGmMItB/P32MGl50gRA45YIxCVsOn3C5RSZ+U9DarZ9qQczuZz
         bm+6xORrOi0spipabSDw0//DSelKwBA0ZikfZfTl6YkFog8ZhlUk9phgGICr0aWoi5zb
         2kUlXa0Pt64NkxILcSY55x6G9JPLjQP7fvFmr3IE913yHxfbmMLAD3T1BStNQtV1F9Hf
         6AH1OGGIiNXradylNUFiwMgV0lzVF165KB0XXhmJb4Pl92A5KzHIw9Zg7ESYnhvgForF
         KPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004841; x=1725609641;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aT+FymHOGJ4ZjNsGMyV1jzCm+wux1VTZ963iwlhoYNw=;
        b=JuVmJdKtM6rryg6w4xKntbo7rBZdXD7xjKBYdaUNKSiTFDF5eVa92/UyRl5q4NkTCq
         fm4oTJjVH9paGVWbdHZoYMZaFFdvX/A7abX4Yz8hnZLLbfovqYKcetSrunZhpjVzTTk7
         hauZ4KT3tdDM/bPLUQDamIE89VZm2VlgBplDKq67w0egWYVv/9rSHaZANCQzABojtqxU
         v9bslKIf5dPmP4AoUMoABI5G1VhJ4ZvcQNF9Je+hkd99jT5vJMwIW/EHCRlxaj4tbS/A
         0FJrourhXWJxxNrR8Bd0w/3JNMSXtwn2EBukEfJw1fpzlhvoNGJCGZC6YEWjmBftZzHD
         vZRw==
X-Forwarded-Encrypted: i=1; AJvYcCUlyiCDdEFOJwDBRs9J/GAwZU/grVchhz7n8XSwiSdLhw0bTHIUYOQMgCro7Ih8yxtXOuNIVT7C8uSwTcU0@lists.infradead.org
X-Gm-Message-State: AOJu0YxTXUFlmnd8pfJmi6deG1L5MWkX6AIU2b8eFBsa7R7zTXwTI6/7
	CqzCUvJWUNXrJnc44gw09VUrcDWQPz530ShYu6Bsep6iRQcOOitDhjZ3+36o8rQ=
X-Google-Smtp-Source: AGHT+IGaS+aWpJsYuGRyJ2thiJRtaJgzM7top3t36Ppo8teV74FQka/MoeeTgTC2ZthBBwQRrYjM7Q==
X-Received: by 2002:a05:6000:ac9:b0:368:504d:c3a4 with SMTP id ffacd0b85a97d-3749b54950emr3987898f8f.17.1725004840209;
        Fri, 30 Aug 2024 01:00:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3? ([2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a57bsm3300078f8f.20.2024.08.30.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:00:39 -0700 (PDT)
Message-ID: <0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org>
Date: Fri, 30 Aug 2024 10:00:38 +0200
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
In-Reply-To: <20240830-c3_add_node-v4-1-b56c0511e9dc@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_010043_165027_B1FB768D 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Jerome,

On 30/08/2024 07:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add C3 PLL controller input clock parameters "fix".
> 
> The clock named "fix" was initially implemented in PLL clock controller
> driver. However, some registers required secure zone access, so we moved
> it to the secure zone (BL31) and accessed it through SCMI. Since the PLL
> clock driver needs to use this clock, the "fix" clock is used as an input
> source. We updated the driver but forgot to modify the binding accordingly,
> so we are adding it here.
> 
> It is an ABI break but on a new and immature platform. Noboby could really
> use that platform at this stage, so nothing is going to break on anyone
> really.
> 
> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--

So you mind if I take this one via my arm64-dt tree ?

Neil

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
