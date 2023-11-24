Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C9C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDM8nBVs0p4NgxRd/uli671m05pdvrZNBjjxWbTPuqQ=; b=KNEpgUaEGfUXG0hNRsglS32i/O
	VWCozATffds4zETq2EF5NPwF+knIIpbVo5a8yuG667iNJmaVqYL5Tio33BlamXzf4ckrwzekShxa2
	bR5qdrN5YpFbDR4jpc3iEJY/08s8gO0EKoV230k9IbTIae3IkyZUwbY2efHekhNwUxJHQawNNzZig
	6TvwmQ2Xatr003yrx13KHJH9F7DYqoMmBdQQ0x9YtWjg2srqS7PTSxgzLFIRo/lHZ/kaOK39LmQdd
	UEivsA39eG8W9w5Q+SphbdgNeVGYGQ9BVYQ1WKZi6dE1Tq5ZAYyF+B/HBVG9iq51U7+bXUJ07Xvsh
	t2dA03JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XRD-007RxQ-2J;
	Fri, 24 Nov 2023 14:45:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XRA-007Rus-0P
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 14:45:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-332e42469f0so1021296f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700837142; x=1701441942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rlwjJ/KXwyxOs4bJrCX4J/yUIaSw0CZF6vSsHNTewU=;
        b=rqB/zFxFbtoIa6W+eOVk6tKfZu3FdGSIUyuzu8KgoWbaIe47LtxGvM3qOrVHVMQLap
         YuSq8TcIxmRMjnxNJa34KfitxL9vVN5IW4e7cJHGONDnFBBjqp6s+rwdWn6q+CzLnsiM
         XFOhPw+h2rGa90YUv1v3W6I3YhhePWxF2M+E9Hwy7hhTpxGS7sRBNWTf343VJysapH+0
         ciRnw/5vr6bjcz9xqzL+PITDDOwUCTzjMcu4OrO0h+k9jDHQ+LEUGSRazVtupehJ7tRq
         H6nM7tpWgbJoHzen/7PZFMEDdi2MPezNcCb6HU5sg0EvurYhBCSNt/Xyg8KlenVHuTUN
         UYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837142; x=1701441942;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+rlwjJ/KXwyxOs4bJrCX4J/yUIaSw0CZF6vSsHNTewU=;
        b=gFWumj2G1tsJ6s0S28d0tGiEJbSrEocXckwXYNZH0uorTdpwj3JEiDkrtGFO8UO46i
         lZbpHM0p/Fn+y3CuHf7vCLaOgSWMEDvBFjvFQ90N9Pbrsobxt7k3CEe41b6m6K7vpFX0
         OsPWrCskDY9DXS2WMyBWOxJ58oTIDIvUCQ/r8FU9YWaUw5Ipw7QuAtyscKyvXW+zLmfH
         NgQ/YYpB4BZrJ2c41ICP/zFoyvrSEPOapLY+HGO8EvxiSf01vm1ydygJtuvJPs18Tl1E
         Mfjnesf90mu4sKu1il5B05IGQ0OHgGoZDvH5PyFpa/5oBhvE3xWWBjB2BSnmuvn/QR17
         SBKQ==
X-Gm-Message-State: AOJu0Yzx9bS5DdcNQsq5TeMd5mGpFOKrrzUrXP1kxAkNOujbDb8y1aN6
	LxKI0ZtQBbEv9aMKp9UEh/b8sg==
X-Google-Smtp-Source: AGHT+IGlqE3ztd4VccZrqzlaEyl8+aN4JopsoscrrQaRhl6IxnBq4wdAmomOGsmqb5zRiPTC+v5Seg==
X-Received: by 2002:a05:6000:b4c:b0:332:ca0b:578e with SMTP id dk12-20020a0560000b4c00b00332ca0b578emr2125621wrb.27.1700837141963;
        Fri, 24 Nov 2023 06:45:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4? ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b00327de0173f6sm4511051wrr.115.2023.11.24.06.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 06:45:41 -0800 (PST)
Message-ID: <5e1479e7-a353-4ccb-93eb-a74efc4bdb17@linaro.org>
Date: Fri, 24 Nov 2023 15:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
Content-Language: en-US, fr
To: Maxime Ripard <mripard@kernel.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
 <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
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
In-Reply-To: <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064544_170046_E8BBDBCB 
X-CRM114-Status: GOOD (  11.90  )
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

On 24/11/2023 11:52, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 24, 2023 at 09:41:22AM +0100, Neil Armstrong wrote:
>> This add nodes to support the Khadas TS050 panel on the
>> Khadas VIM3 & VIM3L boards.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
>>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++++++++
>>   .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
>>   3 files changed, 76 insertions(+), 2 deletions(-)
> 
> Generally, those kind of patches still have value. Now that we are
> accepting overlays, could this be converted to one and merged maybe?

Yep I was thinking about that, I'll probably do that,
some new boards will also need overlays for DSI panels.

I'll probably switch to an overlay on v10.

Neil

> 
> Maxime


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
