Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A2C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaVWpV7vTreMkvpoygJEGWuyP0g8xBRQ34Zt5tm3Ahs=; b=W4FfoPSNqw5BDG9iYJuehD7DGr
	IavCREBh3Zpg5jB/WcLR4tKBgW+yCVIpUWa6EyPrVLwNKJyDqtKZOIi2IuA3UG+PJ47Ctr65qpI+B
	wwLsoF9GloqNUxn3qW4b+ZNCBYgspBG7BAdi63ld/yAOIRFdOXxy9Hirme+2YFro82GfQFmepuDg1
	vbpNtlGBIJKEyCbqoZ42yXUzNSCme8nuCe27jg1fgp4e8tlBRubVx15kfdon+lp8PVGjd87C0e3th
	CBpD8pwZLZkoK0TJH+Qr/KarfiHDgFVJ5f5c4MiDRyjRRK5B3JHrqd3vnZFXA5i4W38fELJpcW+Yx
	aLLy5vEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAnz-00000000rQk-10fY;
	Fri, 15 Mar 2024 16:53:15 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAnv-00000000rMX-1yh4
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 16:53:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d459a0462fso33136661fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710521587; x=1711126387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52kT8RCFGC7okKDqG5Bcwj1POjAaTduZrpTnpA9FpD0=;
        b=x6NOAPryjNIjVlRCEyvNFQz6cx+jbrnx5OqeSI7/3s5idySYoLKMNj70aVnUBa+YoT
         RNE6+zRlGYee+DIjgXr8PgrPSRhA6IeBT12U1sSGeEpL57GtmLqsjDZOQEmgghnoTcVE
         AYn6JV39LKkv6sPeJ2N7nUca7s4mK8fnxeuHtWb2Gyi7DTjbU+ec/+ClEqcsj+euR1NZ
         DMvaobQWu4ZWyFs0ajr0Xy7ceKJZOMUREXHJxWvAVBZIZ79hg9jHyBXo/JWkGVCDTAnG
         ubpUWLdRMEgh3lxxMaNPZ8ZfKGFQXy0jqIGmtzPDi4HAE+tN4kgWTteNQKmS48XAmNMh
         MGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710521587; x=1711126387;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52kT8RCFGC7okKDqG5Bcwj1POjAaTduZrpTnpA9FpD0=;
        b=bW44YM5NginiUOI7ZuVxA/bbTr/uG1c4Ve1v48z2NMxqlBmce8aS6ID7i/eebnuHYt
         xAMs7Hgtb2VXokuxNBj1g1e5ZMV3etKLnDVHgH0SO3mZPUjbs7XfWSuQzngbHb+99vSI
         /N7O/XU0136Uu9K3QXwD7/4duqZU/IgTvprtGPvyMez3IFOMDnAu84pDS1S8tA10E55n
         pUhFOOMlLvy+xGH4ap8yJ3l8EceZnYilMBjS5rCFzeVjAyw33Y8o7NpmF0qpc4Xabh4B
         gSu58U46HSa6NsOsfyWxVtZOiP1wSsbFJMtpL/fGvOa7fTViPJOhFhSlfsmfcItKxLPG
         Mn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp/XImz3h+coYr28fmlLjWpVATOp0v6BdnLOWz0FfltfV254exqBkdK88tFu5AebXHy2qaoz9X/2B20WVvGR/UZn07h1EE9oDYsx0cR/YUdyA=
X-Gm-Message-State: AOJu0YygPXrmah9vZJEassMgR8maT/w4Y8npGRrFSch5zXQn6fgmuD7l
	v4sczx28v9aM7RFM0BVnybQJ7XHEJ/OK5XK8lmOJzhw79zh0OB3Rl7RX4lQxy7o=
X-Google-Smtp-Source: AGHT+IHLfd0FUA2LIoNuC9vV0UbukiLHlnyaISY5TaECNKl/ARlCMBUC7tn6mgNu/CU8tNB0bzSEnQ==
X-Received: by 2002:a19:911e:0:b0:513:d24f:6455 with SMTP id t30-20020a19911e000000b00513d24f6455mr3304106lfd.29.1710521587073;
        Fri, 15 Mar 2024 09:53:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a633:992a:92cc:9c3? ([2a01:e0a:982:cbb0:a633:992a:92cc:9c3])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b00413e6a1935dsm6359144wms.36.2024.03.15.09.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 09:53:06 -0700 (PDT)
Message-ID: <4bb2fa50-0944-456d-b51b-449a2bd9bb69@linaro.org>
Date: Fri, 15 Mar 2024 17:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/25] Introduce support of audio for Amlogic A1 SoC
 family
Content-Language: en-US, fr
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: kernel@salutedevices.com
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
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
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_095311_600723_188C80AE 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Jan!

On 15/03/2024 00:21, Jan Dakinevich wrote:
> This series includes the following:
> 
>   - new audio clock and reset controller data and adaptation for it of existing
>     code (patches 0001..0004);
> 
>   - adaptation of existing audio components for A1 Soc (patches 0005..0021);
> 
>   - handy cosmetics for dai-link naming (patches 0022..0023);
> 
>   - integration of audio devices into common trees (patch 0024);
> 
>   - audio support bring up on Amlogic ad402 reference board (patch 0025). This
>     patch is not actually checked on real hardware (because all ad402 that we had
>     were burned out). This patch is based on ad402's schematics and on experience
>     with our own hardware (which is very close to reference board);

Thanks for your serie, it's nice you're working on upstreaming this feature.

In my opinion it's fine to have a "big" initial serie if you're not sure
if your changes are ok, but next time add the RFC tag so we know it's not
a final changeset and you seek advices.

Overall the code is clean and your patch order makes sense if they were meant
to be applied by a single maintainer, but in this case it will be split
into multiple subsystems so it's better to split them as Jerome explained
to ease review and the maintainers process.

Don't hesitate discussing with us in the #linux-amlogic IRC channel
on Libera.Chat, the goal is to reduce the number of patch version and
ease the review and maintainance process.

Concerning the link-name property, I think it should be done afterwards
since it's not necessary to support audio on A1, and I think it could
be extended to other SoC boards (which would be a great feature).

Neil

> 
> Dmitry Rokosov (2):
>    ASoC: dt-bindings: meson: introduce link-name optional property
>    ASoC: meson: implement link-name optional property in meson card utils
> 
> Jan Dakinevich (23):
>    clk: meson: a1: restrict an amount of 'hifi_pll' params
>    clk: meson: axg: move reset controller's code to separate module
>    dt-bindings: clock: meson: add A1 audio clock and reset controller
>      bindings
>    clk: meson: a1: add the audio clock controller driver
>    ASoC: meson: codec-glue: add support for capture stream
>    ASoC: meson: g12a-toacodec: fix "Lane Select" width
>    ASoC: meson: g12a-toacodec: rework the definition of bits
>    ASoC: dt-bindings: meson: g12a-toacodec: add support for A1 SoC family
>    ASoC: meson: g12a-toacodec: add support for A1 SoC family
>    ASoC: meson: t9015: prepare to adding new platforms
>    ASoC: dt-bindings: meson: t9015: add support for A1 SoC family
>    ASoC: meson: t9015: add support for A1 SoC family
>    ASoC: dt-bindings: meson: axg-pdm: document 'sysrate' property
>    ASoC: meson: axg-pdm: introduce 'sysrate' property
>    pinctrl/meson: fix typo in PDM's pin name
>    ASoC: dt-bindings: meson: meson-axg-audio-arb: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-fifo: claim support of A1 SoC family
>    ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
>    ASoC: dt-bindings: meson: axg-sound-card: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-tdm-formatters: claim support of A1 SoC
>      family
>    ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC
>      family
>    arm64: dts: meson: a1: add audio devices
>    arm64: dts: ad402: enable audio
> 
>   .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 +++
>   .../reset/amlogic,meson-axg-audio-arb.yaml    |  10 +-
>   .../bindings/sound/amlogic,axg-fifo.yaml      |   8 +
>   .../bindings/sound/amlogic,axg-pdm.yaml       |   5 +
>   .../sound/amlogic,axg-sound-card.yaml         |  12 +-
>   .../sound/amlogic,axg-tdm-formatters.yaml     |  22 +-
>   .../bindings/sound/amlogic,axg-tdm-iface.yaml |   6 +-
>   .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>   .../bindings/sound/amlogic,gx-sound-card.yaml |   6 +
>   .../bindings/sound/amlogic,t9015.yaml         |   4 +-
>   .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 126 ++++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 471 +++++++++++++++
>   drivers/clk/meson/Kconfig                     |  18 +
>   drivers/clk/meson/Makefile                    |   2 +
>   drivers/clk/meson/a1-audio.c                  | 556 ++++++++++++++++++
>   drivers/clk/meson/a1-audio.h                  |  58 ++
>   drivers/clk/meson/a1-pll.c                    |   8 +-
>   drivers/clk/meson/axg-audio.c                 |  95 +--
>   drivers/clk/meson/meson-audio-rstc.c          | 109 ++++
>   drivers/clk/meson/meson-audio-rstc.h          |  12 +
>   drivers/pinctrl/meson/pinctrl-meson-a1.c      |   6 +-
>   .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++
>   .../reset/amlogic,meson-a1-audio-reset.h      |  29 +
>   .../dt-bindings/sound/meson-g12a-toacodec.h   |   5 +
>   sound/soc/meson/axg-pdm.c                     |  10 +-
>   sound/soc/meson/g12a-toacodec.c               | 298 ++++++++--
>   sound/soc/meson/meson-card-utils.c            |  12 +-
>   sound/soc/meson/meson-codec-glue.c            | 174 ++++--
>   sound/soc/meson/meson-codec-glue.h            |  23 +
>   sound/soc/meson/t9015.c                       | 326 +++++++++-
>   30 files changed, 2394 insertions(+), 223 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
>   create mode 100644 drivers/clk/meson/a1-audio.c
>   create mode 100644 drivers/clk/meson/a1-audio.h
>   create mode 100644 drivers/clk/meson/meson-audio-rstc.c
>   create mode 100644 drivers/clk/meson/meson-audio-rstc.h
>   create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>   create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
