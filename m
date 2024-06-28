Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1586C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8CNNx0eCthfoDPL9osTJvAUEKdGMVGB6etxOWuzusM=; b=lUSK51Ig4CIO9aqofB/ZF4b7LZ
	py0VHfdvZ18R1MfYBnkEIHZkHo+YOzQR9nPgChTkzX0igCFguChogNq0WI/otBvpl708/3pLdTdha
	FyNC6I5y6UjEYKHuSQz8lf0dTnOF0+rybUD22QqBkCZYuIA02S+W91H01PUy6MeenfY9Ce8hQ6WKt
	wXXwscJE/kuXe5OrkMhYrTXu4nMOiL891GPCqYmxeOIdAKG5qr0WfmPgJhZa7rzBgd+Z5B/zmWQzc
	MeJAHQxIXgIfNb0Yp8Tt8LyZpnNCr69QUpPXDzoP34vK9QGkh0lbjEow61/DkLzuZXQMeVr8Rxlc2
	pf63b4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6gf-0000000D1Nb-49pw;
	Fri, 28 Jun 2024 08:10:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6gd-0000000D1N6-1RTR
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 08:10:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso411768e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2024 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719562225; x=1720167025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx6Kfw8qVkhu43FPigNKkiagy9yQK+KD3/V0XMmuLoQ=;
        b=uWjJABu6WVSnpNtntg0xoCg/syh4K8/HOr2PcT1GSjxOFwP4k1jEI+fT/7IGw+KXIz
         Ex8R9M0dMADZY32iuuzJR152TeIGgZUgvOkhrHE+HaS8zH2t4OYGpkogMrGky2xkFhZ5
         evZ6z2MSZLVPHKBGd0uiDpQcF70+De/3xPjcrn46DSBQYB0ginNY0nbVW2m4JSWe+0/f
         9rGbnoo/UgWDmMu1BalthzTTSsvbcvUV7fY5gybzb3dd9/twO6EJlzdR4zz4s0Wbe1MK
         lJ13G0aTZSOGBeryDuZbKTihXOALGA+5iyqUWqxXZXrVmZ60UcKxhyJFWYI5pbqNOATF
         9ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562225; x=1720167025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wx6Kfw8qVkhu43FPigNKkiagy9yQK+KD3/V0XMmuLoQ=;
        b=ppCWk6trAQ1rb1PJf6vUCQfFa2pnQPaoQIYVAHGbOPINDp9uHNNwWecGDTQqizRCjs
         wYyRSQhjliogcFzxG1JJSXVL4UiIbUZmN5dIEcl7JWt4MQE7ecbgAyUw6EZO1Z/fGHUk
         HSEwInp1/o3JdEM1gbJ5WmlJltYXNRk1F9JOGC6RRYDjX/9UWxL+L7NYRIEM5WKKSqva
         s1ARNP0bLJwvlw+Ej5IzbCMDLOKKyzlC2FswCQQ+qqRX3kyn8wvV+VKbbQ2DfmUio0kU
         PaeatJWB/pfdYTI0g+Y3NNaR198vHGEyHMGwJ+H5aUwX6hHhZdfxcYt9uZ3d3pc5HJnO
         4AYA==
X-Forwarded-Encrypted: i=1; AJvYcCXxZaE2sj3EY3BEGqKNC+Rqm+sWO7QCyvDLgeAthdTE4Zx5m9HMSebB61V3Ea3QAOjcVvyair2z9LCAmoIfp4hoHwSQT8IPrWF88OPNVi+yaio=
X-Gm-Message-State: AOJu0YwQBn8FvtVymb2ZSCS/SwmWArhACZqVa92BS5uZjnz9ML7gOfZN
	iBk4sAHLcB2pEr9TW/Z5nqIcLIck3GoGxY4/ip5J3FWYnFT0LJjCDyDRYcEhgP0=
X-Google-Smtp-Source: AGHT+IGTO9W7Boht9fioCYhTcSmnpjcrLoWd1bSV6nEc8wC/5NmPCAVlrVj69S7MOt078ZRE7j0ZSA==
X-Received: by 2002:ac2:43cd:0:b0:52c:cc46:d59 with SMTP id 2adb3069b0e04-52ce1834575mr9162934e87.18.1719562224200;
        Fri, 28 Jun 2024 01:10:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b17d:324d:ca1:ab31? ([2a01:e0a:982:cbb0:b17d:324d:ca1:ab31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd60dsm1489067f8f.2.2024.06.28.01.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 01:10:23 -0700 (PDT)
Message-ID: <16ec9c9a-badb-4626-9227-fb03f0ee3ee6@linaro.org>
Date: Fri, 28 Jun 2024 10:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] arm64: dts: amlogic: handle hdmi system clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240626152733.1350376-1-jbrunet@baylibre.com>
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
In-Reply-To: <20240626152733.1350376-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011027_450405_7E56F48D 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi,

On 26/06/2024 17:27, Jerome Brunet wrote:
> This patchset adds the setup of the HDMI system clock for HDMI Tx.
> 
> This is another step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.

Thanks,

Beware we will need to keep old DT with new kernel functional for a while,
do removal of component & HHI in meson_dw_hdmi would need to wait for multiple
kernel releases.

A migration step would be to add a phandle to hhi right now, so we can drop
components earlier, then in a second time add a proper PHY and then mark
the hhi reg as deprecated.

Neil

> 
> Jerome Brunet (2):
>    arm64: dts: amlogic: gx: correct hdmi clocks
>    arm64: dts: amlogic: setup hdmi system clock
> 
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 5 +++++
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 9 +++++++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 9 +++++++--
>   3 files changed, 19 insertions(+), 4 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
