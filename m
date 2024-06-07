Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4576C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcPbQVAI6YIPDMHUFkFHMWN9qZkZUomX9wRg4yt0jOc=; b=BYiXW3WIAYfOdvWO9++BeFGKru
	26WURPqhSHWt1lBb/QeXt4zyneIsQv+Awgf3Y2w+r1xwlDG6PiZRRTgXWafibt0e5OiX/iv6P3zYs
	CZBYHB1+7A3Cf52Vzp0Rl7S6ird8rzlej+ugC/TZw7oHJYRgZ8vdEx+1cId2yJyA+Ucsg4+QDQkTB
	+Ksn4NzSHXDstu3szA4gzx35N08CqIDnc8ZNLWOipdE/Nve3hs2BCZVBRoE+TkGN6oLnmXvh/2Pbc
	tb1aL6C3GZ9D9QF0GBFSboaHeoG6OftGrf6ecqx7rDM4zdx3agmdfZ5/Ks4df3uomfwxSXU3PRY4b
	fDcsZnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVi9-0000000DGjo-13UG;
	Fri, 07 Jun 2024 09:16:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVi6-0000000DGiQ-03zn
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 09:16:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42148c0cb1aso18941585e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717751790; x=1718356590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKhcW2Pv1TQb63OYj0Ad4PZwEbdEXdKfu9Ta+939bwE=;
        b=GoCq+WPy5ifDXc84V01aqLsma2I+VrrUkXY10R5HIL0y517wPcx2znzSznmQVhpBIM
         gLpVLmmWEprlpM7cxUPIt2pOcsLnF0eULidvZwV35brSkHQUGBgTVIdhlwUsOL30BlGR
         qtf102/yfu/I3uqlXJsTDNl68oiI8TD5H65UFKo8ku644G0eaj2SwMQQkK8XcRG5yMFM
         I46lFZzg5xEcvBJeK6gw4r8kn107sJyPm3SERpWokTCn3wmqWszty/JVhdeMSUTP3PzM
         L1yOzURjgpKsfrzlI+Rwst9p30S1KFpcQ1Pfhg+x+XVHzDwDPzQPOhKau8bNpSlBq2cJ
         0UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717751790; x=1718356590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKhcW2Pv1TQb63OYj0Ad4PZwEbdEXdKfu9Ta+939bwE=;
        b=KUetQ26lSiuf4uM0yusYYscv6CFOCxhMCigr8Q8iRFsTXs5jL8UZPEBj4LjKxTb5E0
         rBC5TpjLthMy+agistGlww0P68D8WvAdYCoJNKDhedSgyZP98637ROJAodPsTs2LD0G+
         348luBzod4XaH6DUfxQ3HfSJnuMLLo0AwDyLfmnhc7ygNDmUk5gvosi3dbwukGc0nzhA
         98XWslDtCabY8/X867aHbabWOwHu3HlKvY8dRJ1CF0FNpJHFT26Jyi8utThrPW5rHDw6
         KjenS/JjqXwYBdnP38eSKcznODYu/T2N7DGZ311KpoBrg1x60BSNFYG3v7lqYzRi6PFj
         fLoA==
X-Forwarded-Encrypted: i=1; AJvYcCXqssvcz6fdKnMYuWVtWARrIsWczQ8FcRqn4gJgxDIXlj4ydts8AbGRSfS9MA7ITok84bEKxM035JL0PgV7FFrwh5bp57QtRxm63mtJR+BGmE4=
X-Gm-Message-State: AOJu0Yy2lM20GyZMNfHDePsKjfXQEk4WLdHr8K0s5egFVw1YXQZSnmaZ
	haAbmTUJv5s/JybuyMgQ+AX3lPT0Z9REhhIhDehRrAKHrui21rgdveinfSlQ/WU=
X-Google-Smtp-Source: AGHT+IH6lSQLjPhb+rH7MhIJCz8VcmYFFOPCXGM2LCapictgRME7AWqPy+I8YzSDVKMGrNP+Ca47Lg==
X-Received: by 2002:a05:600c:4f4a:b0:421:20aa:6048 with SMTP id 5b1f17b1804b1-42164a20b24mr16134255e9.26.1717751789789;
        Fri, 07 Jun 2024 02:16:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe37csm82143035e9.3.2024.06.07.02.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 02:16:29 -0700 (PDT)
Message-ID: <88119323-bd54-4d2b-bb63-366c5fe77e39@linaro.org>
Date: Fri, 7 Jun 2024 11:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/12] arm64: meson: bunch of DT fixes, take 4 (final one
 ??)
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
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
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_021634_120557_292D707A 
X-CRM114-Status: GOOD (  12.12  )
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

On 06/06/2024 10:48, Neil Armstrong wrote:
> Along with the following:
> - https://lore.kernel.org/all/20240422-t7-reset-v2-1-cb82271d3296@amlogic.com/
> - https://lore.kernel.org/all/20240513224552.800153-1-jan.dakinevich@salutedevices.com/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-spifc-v1-1-380f29ba4a16@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-convert-spdif-receiver-v1-1-262465adbac2@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org/
> - https://lore.kernel.org/all/20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org/
> 
> this bunch of changes fixes 99% of the remaining dts check errors.
> 
> The two remaining bindings conversions for arm64/amlogic are:
> - ti,tas5707
> - everest,es7241
> 
> I'm too lazy to do them right now, so if someone is interested
> in doing the conversion, please do it!
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (12):
>        arm64: dts: amlogic: meson-g12b-bananapi: remove invalid fan on wrong pwm_cd controller
>        arm64: dts: amlogic: move ao_pinctrl into aobus
>        arm64: dts: amlogic: move assigned-clocks* from sound to clkc_audio node
>        arm64: dts: amlogic: sm1: fix tdm audio-controller clock order
>        arm64: dts: amlogic: sm1: fix tdm controllers compatible
>        arm64: dts: amlogic: g12a-u200: drop invalid sound-dai-cells
>        arm64: dts: amlogic: g12a-u200: add missing AVDD-supply to acodec
>        arm64: dts: amlogic: axg: fix tdm audio-controller clock order
>        arm64: dts: amlogic: c3: use correct compatible for gpio_intc node
>        arm64: dts: amlogic: a1: use correct node name for mmc controller
>        arm64: dts: amlogic: a1: drop the invalid reset-name for usb@fe004400
>        arm64: dts: amlogic: gxbb-odroidc2: fix invalid reset-gpio property
> 
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   3 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   3 +-
>   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |  17 +-
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  24 +-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 427 ++++++++++-----------
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |  16 +-
>   .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  18 +-
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  16 +-
>   .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |  18 +-
>   .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |  18 +-
>   .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  30 +-
>   .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  16 +-
>   .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  16 +-
>   .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  16 +-
>   .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  18 +-
>   .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |  18 +-
>   .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  16 +-
>   .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |  16 +-
>   .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  17 +-
>   .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  18 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  17 +-
>   .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  17 +-
>   .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  17 +-
>   .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  19 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |  17 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |  17 +-
>   .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  17 +-
>   .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |  17 +-
>   .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |  17 +-
>   .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |  17 +-
>   .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  17 +-
>   .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |  17 +-
>   .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |  17 +-
>   .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |  17 +-
>   .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |  17 +-
>   .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  17 +-
>   .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |  17 +-
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  17 +-
>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  16 +-
>   .../dts/amlogic/meson-libretech-cottonwood.dtsi    |  16 +-
>   .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |  16 +-
>   .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |  16 +-
>   .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |  16 +-
>   .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  16 +-
>   .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |  16 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  36 +-
>   53 files changed, 679 insertions(+), 630 deletions(-)
> ---
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> change-id: 20240606-topic-amlogic-upstream-bindings-fixes-dts-6a572ad54324
> 
> Best regards,

I'll postpone applying patch 3 to be sure it's the right solution,
but the other ones are trivial and I'll apply them now.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
