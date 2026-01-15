Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCDFD29FFA
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/SWCCIRavkMT1NdtXN+WzbG/Dail0x1aMIwr+HqRn0=; b=oaJNB8eOHtDvP4s8y8cpvrQJl8
	3kOxwoGgXF6lkc7f271mHkzpBzUNCaEzFBWz94VMf7/z0zOUTj2/y+ai5vUzPwXgkhQs142U5c/gV
	esRmat7uLwUSufqW7seFqgTUff5gESpIQ0aq4ixJl1DQohyIAtJkKk/5mCTRXzHitt+BONgLMDBf8
	mHUN2dWrNv4vTEez/qsP+5w7/Yx5k8tSr11tbGEmC7DTsy+q+DxD6NXFA6QjsmUOegop+tMfnayPq
	8gf/MNAGEtqvyiGiNkJ3K4oQOz5oDnZgjC0WW8AOqDRHEu0sv92k15jTmCtBrpLjZO/lsG6QgqRCf
	XFbDxBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIJk-0000000BxmW-3hoW;
	Thu, 15 Jan 2026 08:02:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIJi-0000000Bxli-3a4x
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 08:02:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so5836865e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464173; x=1769068973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unoGdde8r2uBbMwP8uo2We6Q4bM16+cyYfsGEc7qFM8=;
        b=GLpR944QQd9lJwiuF9a/D0H8v/aDIKbC1A5bJ6e5OF6gkK2S4wz4275q8HLMFtjwHj
         YXjIVPw402DbmU1kbJWptArctH4+CQ+NGMudwwDpQOdFJoimYvRRv1DCM1dzl/ybnYXD
         dB4E6uIcEQJmaLGR5VjILymN+af70kMiN+F3DCj7pBssZiVI1zp5qGdfHj6O96v7uaOE
         f9wwHNHhQDKFHhO1oJzuWJHRg9izBO5vS5Ki0qcLJ9Ejfgw1+Ip2cdO2HqfGHl2mTIWJ
         LJY1mUOhAfaHKCgrgt39/TIgnGz0pDscGFb1GLb+hq7gQKFIo1lLVyQ09Cxnar+oG16U
         LiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464173; x=1769068973;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unoGdde8r2uBbMwP8uo2We6Q4bM16+cyYfsGEc7qFM8=;
        b=OmwY0BVvTNJfQXqYOScfhTEeVun9TjJDmq55E2E8u/46KkjglUl8SURPDmt/ppLN1R
         ZXEDoY57PfnkbZshZBGqTvN6kvObZ5SGHCm2GX8gDTYSs70t1d8ZYcalPnutz5mV95gR
         l2JsgGRoFLtMoWyAwTqSF1bTty/+fioUpJXtZA95jyzlsbgwDM1JS3+huxhAGyN74rhW
         k58y92g+/Tf57/Dd1HuUVGgMokaYaH+D5DrzCYrVX68OC0tLkfr4TYjjUodI3nCHDQz3
         Ui5a3cKQGrRB1M7R+Yv1geEuvoPOXPZ1TDbr5byjqL1YVlYEizqOZgX2sdYOyVuAad2A
         7lRA==
X-Forwarded-Encrypted: i=1; AJvYcCWwV7UFdSiGvvfRt+LMZE0mZb6/F2IisHQ/zAZ80wtK1N1Zc/7uoTsTs7Ym86DoACRh6DA+f57EzqEwxuPQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcQc8Vq1NG/WDKHeNd3REWB5/Ec9sFqWdA8fL5jrtf/agKAcP
	J0BGE1PSRv0bBD6NFDg2+6RLie02mBqZSxvH1wJv6cgk/4Gzf0UN5mk1vMWU8OPoEBs=
X-Gm-Gg: AY/fxX5jYqJ8AmFyhu7SZGqf5e7buIwcKFFVZ1qTu8aCAWCgRoYRwrnL5VIxR7cco9R
	LDj5HDSuqFcBkkV1O5PMTVn5YlDZ2C9LrvbhJFiY1Ldl4iSq+mP4mnBs/4p28XxoQ0AKXEdibov
	hu0Ml9b0UE0NEWNXT1pdmjpK8/KGRpsKy5pHoSuxL/Iv5Mc1adWm/RoWPq8bv1LElEtCFeWhgul
	xQILaV8j2M4gbyh51O9X5BMwVTMFUs+MZ4ZtP+kRlZ8IYTHQA/jIGwPe8fdmtp6rIbQd4nsY/En
	efk6lM1+gJdOEOw+jFDaa490VYjRMfn51qCbkoygiYgcmKbs+hTmshzMznYE4Erde+XAEc/C3xv
	J/1A0C1DXoAMqusQra4q/ppth43IF1wjTwHNJYQExoNsywGPncc3yd/aOiHb3AieUEBekCCap+N
	hQ+Bket4PmvVDGq4M7YNGIXYcK1Rmyo82MmnI+hwBM2qqwspYdKNpSPZjNAlfsNW0=
X-Received: by 2002:a05:600c:3555:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-47ee338f01bmr68210915e9.32.1768464172816;
        Thu, 15 Jan 2026 00:02:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801bc3e57fsm10397465e9.5.2026.01.15.00.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:02:52 -0800 (PST)
Message-ID: <dea5d665-2d5c-40ce-83d2-a2622b79e4b1@linaro.org>
Date: Thu, 15 Jan 2026 09:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
To: ricardo@pardini.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
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
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000254_912189_57B984CD 
X-CRM114-Status: UNSURE (   9.87  )
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

On 1/14/26 23:48, Ricardo Pardini via B4 Relay wrote:
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
> 
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
> Ricardo Pardini (2):
>        arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
>        arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
> 
>   .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 36 ++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
