Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5B2E77188
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Dec 2024 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS00b891Rd4XlwtzCB4D1s94k3bbEd950fB1YbUqHqY=; b=I/CjCBE8NeN4L1p/MEB4uTAfOV
	XxromhrYDzkGogHgyh6EzkFaoYPgafnF+v8BJwtJG1oAEC1HdQOesNu4+KaTjIq8Rztqwu/HlTAse
	SQEXiZMwDJOaQbS7iJwiB9r4UZ68whVZ1hh/9lbekbR9SBXd8aCKdZ7KEqqp8WF1wz4FMb6vIt1KT
	FrK+ITQQVBNP8CXTqJgwEC8Ph7Ga7WB2JZ+hMXVkKvWKRAtX8DWoTCU6KLHXg345YnPs9xwxQXBlH
	HFrQhn4u+/IuU1GVkRTo4SyCjLbbnbFQYyGQ7noeG65NMYBCpl+WVFjc/aAMw4OOfQMqZK/yk37Vb
	CHO62Fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCWD-00000004yvG-0D9t;
	Mon, 30 Dec 2024 09:57:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCWA-00000004ytS-2M4A
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Dec 2024 09:56:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4363ae65100so94771885e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Dec 2024 01:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552617; x=1736157417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5I15+dY+aIukWIWhqchquvXUi0oT/lsxucwaaW3b9T4=;
        b=a5Hi6QCbdPhHSFk5KXjC8Gnef8gRDzo3mwi9DCrn4g5IQ8KnQN3IP4tAL1v7an3lFT
         MxygbahfcT0TgIbRcDPnP+MfQJkbJ0XEI5uEiRh8c37TqgVwo8kl0l6fo/V/ikLTNIbN
         2/ksi75OY/olHWRl7vL+kNP04oJ7DnOFE5ornaURIXB8K/cqlPV+CxNwwHo7omdFeOJM
         K1gN+I0nC7zNpjmgT3+jIwqH4vkZeX4JFNTvRfLJtLtXGRQeGivqt92dMbIVJbA6Ja+w
         mAlMvxZKicOT/7KxGlGKXcw3Iaa6hTP/HDjfeVzbPMnGv+rXwMdKMXTCvZI1XSlZXQwH
         GvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552617; x=1736157417;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5I15+dY+aIukWIWhqchquvXUi0oT/lsxucwaaW3b9T4=;
        b=frdLbMYWvPU6gd6nHTTvFhKg094GElu/oPe51hcwzHs9sYmSq1X+z+YKfESfnrRsvS
         COgrsctsRhHgiaglpNHelC5IKwkikbWPAayUd2pBYBvkIcvxKBfdR+dt+vpXCFtnMKRN
         nbABY5Xa0q7bk8FhWm9FKLmbT1ZWm6QxJ7EQrGR89j61XqFlvrp9gCEbEFl1TCBeuxHH
         vqKb3VNo0py1w6S3GzfD5SbzDiW2qlfpV8vZ4mJ/TXC1OPaP3oHoPwQ1IEF6QwWB8XIc
         DiAbtSRyuCWLOhM2W5iLTVocZFoQLHbYVn+RJQQZaAqj4xBWZmMDcCZwZPvMu6KClFzC
         iCIA==
X-Forwarded-Encrypted: i=1; AJvYcCVAspGxYCvgRhYscGhfBZrR1ooQ6R5F2YQQ9sGrBIDrn+zBsYAOfGCNlvGa1oNW87YE6Zpdt0EZqbY3SBVc@lists.infradead.org
X-Gm-Message-State: AOJu0YzeWjs4vc/tAXjUE95Z4lCaliCpxHjO+Z9bfIIizLgdPT377LZz
	LhCZ0mgyJDXgRWw40Rdz2x7+i3McEm0BY+tMHJMy+DEFjVocI91SGNKGmh5ve+qy1iJxW10oBcr
	c
X-Gm-Gg: ASbGnctv6nd/HxT0a1azFryYbxViZX4/wfV3taTpxU2fEx2S4WmHY0KPIflSt38FyA7
	v+iceqNQQQ/WPufz41hiWsUF9VFuBjBwWv7YLkDSm9Jl/OwbN4sR6D8T5VjlCOUipdv+hJvGsZ8
	RTHbDpnKmAJa8iv03LA8417rz9dWzVbiJBx2JRABlWrrzBzivFRkLiZBqVqaU5GfCmmIjoJdALx
	KXu1HsaxLQXQ7x3Z4kLgXICI9IZnxufa6f+OTT+UDyQZG+3yEPe/Bsb0kF/cfHxIShVKDyJ6n8Y
	XK3OYatvFFDIum8D2L+6WUfUGngkmDAUBw==
X-Google-Smtp-Source: AGHT+IEBE78/HeRDA/F7+TamaKKbELYqVuNJpyUAMgc9BzN9CCa+wQXxK+QSy+ywq+gUvsq3dokZUw==
X-Received: by 2002:a05:600c:350c:b0:434:9ec0:9e4e with SMTP id 5b1f17b1804b1-43668b5f6f7mr315772855e9.30.1735552616872;
        Mon, 30 Dec 2024 01:56:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55? ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a3c9sm352128265e9.40.2024.12.30.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:56:56 -0800 (PST)
Message-ID: <da394f9e-e1f7-432d-871d-e0ae400e38ca@linaro.org>
Date: Mon, 30 Dec 2024 10:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/5] dts: amlogic: switch to the new PWM controller
 binding
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jbrunet@baylibre.com
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015658_606687_9CA9CB1D 
X-CRM114-Status: GOOD (  17.18  )
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

On 27/12/2024 22:25, Martin Blumenstingl wrote:
> This series switches all Amlogic SoCs to use the new PWM controller
> binding. The main benefits of the new binding are:
> - the pwm controller driver now picks the best possible clock to
>    achieve the most accurate pwm output
> - board.dts don't have to know about the pwm clock inputs anymore (as
>    the driver picks the best one automatically)
> - new SoCs only need a new compatible string but no pwm-meson driver
>    changes, assuming only the clock inputs differ from older IP
>    revisions
> 
> This silences the following warning(s) at boot (for each pwm
> controller instance):
>    using obsolete compatible, please consider updating dt
> 
> I have tested this on two devices:
> - meson8b: odroidc1 (boots fine and cycling through all CPU
>    frequencies and thus voltages works fine)
> - meson-sm1: x96-air-gbit (boots and the rtw8822cs SDIO card is
>    detected, so the 32kHz clock for the SDIO card works)
> 
> Since I cannot test all devices I'm asking for this series to be
> applied so the Kernel CI board farm can help verify it works on all
> boards available there.

Ack I'll appply them for the next release so it stays in -next for a while.

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks!
Neil

> 
> 
> Martin Blumenstingl (5):
>    ARM: dts: amlogic: meson8: switch to the new PWM controller binding
>    ARM: dts: amlogic: meson8b: switch to the new PWM controller binding
>    arm64: dts: amlogic: gx: switch to the new PWM controller binding
>    arm64: dts: amlogic: axg: switch to the new PWM controller binding
>    arm64: dts: amlogic: g12: switch to the new PWM controller binding
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi         | 18 ++++++++--
>   arch/arm/boot/dts/amlogic/meson8b-ec100.dts   |  2 --
>   arch/arm/boot/dts/amlogic/meson8b-mxq.dts     |  2 --
>   .../arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
>   arch/arm/boot/dts/amlogic/meson8b.dtsi        | 18 ++++++++--
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 24 +++++++++++---
>   .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 ++++++++++++++++---
>   .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  4 ---
>   .../dts/amlogic/meson-g12a-radxa-zero.dts     |  4 ---
>   .../boot/dts/amlogic/meson-g12a-sei510.dts    |  4 ---
>   .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 --
>   .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  4 ---
>   .../amlogic/meson-g12b-a311d-libretech-cc.dts |  2 --
>   .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  4 ---
>   .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |  4 ---
>   .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 ---
>   .../boot/dts/amlogic/meson-g12b-odroid.dtsi   |  4 ---
>   .../dts/amlogic/meson-g12b-radxa-zero2.dts    |  8 -----
>   .../boot/dts/amlogic/meson-g12b-w400.dtsi     |  6 ----
>   .../dts/amlogic/meson-gx-libretech-pc.dtsi    |  6 ----
>   .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  2 --
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  8 ++---
>   .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  2 --
>   .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 --
>   .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  2 --
>   .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  2 --
>   .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  2 --
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 25 ++++++++++++++
>   .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 --
>   .../meson-gxl-s905w-jethome-jethub-j80.dts    |  2 --
>   .../meson-gxl-s905x-hwacom-amazetv.dts        |  2 --
>   .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  2 --
>   .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  2 --
>   .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  2 --
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 25 ++++++++++++++
>   .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ---
>   .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  2 --
>   .../amlogic/meson-libretech-cottonwood.dtsi   |  6 ----
>   .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  6 ----
>   .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  2 --
>   .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 --
>   .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 --
>   .../boot/dts/amlogic/meson-sm1-sei610.dts     |  6 ----
>   43 files changed, 132 insertions(+), 135 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
