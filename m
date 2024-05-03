Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44665C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SyJM1jE7gHTpZaZgCt7iJjInI+NvMWGAqCCDtulQY90=; b=UzGyH7GfBRZjwb
	EouJFWPrXpO39enlcfGrZd+mtDtCrpfegvdq2fso27WFRmya0r/h7IoVjIi+himtCEcwt49JyehjO
	nHjDA3LeJi9Trb7mkFNcdDgsBce/F32TVBYzjfawn5cZU4pwaElni5Qu/DssG4f3vP+LnEdsxrJBm
	vf+1V3tHG979kWU4eRXIGqQNuo8R4Xp1cO8Aw4PV8USj4z05iU+sesZEKDwL+RGRPWbkfEwB38msR
	j6ZFSGK66X6iKv4hPTs0/ZlSgtZcEtnuvubwZVwhfWodciczUunGqF60dbx7zdfqua5Kc+CGzcKWG
	uQZvbs8JOaZpniomyKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oL1-0000000FfKP-0Ijp;
	Fri, 03 May 2024 08:32:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oKw-0000000FfFv-1mmd
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:32:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so54780635e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725127; x=1715329927; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfZqj/uiTXAWVaICZsb8XGcycuISC2QrzlPyuabJPZQ=;
        b=yYf5aOAyQZq1zlXGpRds+8wySHDSFLxdOFGzD8K0AClHvQzTaD5svz+6pR0DKxNTNP
         S0zEhmMtqw1LdVj2N7yoEYKARpJr2kL4blOGHY0Mih7GDYJMOVYvQjTQEDYQMjvOGvsN
         OoLOC87QQpIgEHriDNN6DmNzfhxQGiGZZeMQch55/mOQE+KTfdS9oyVB6gxXZZyv2U3G
         y3fAhQmtNf1kXaEUxGfYmQo3bjtcslL9VtYvGNpSWxNBXNm9+1ryT+6SaDm5AcB12UGY
         HhkJWzyV2tgNkc6ozdNDZYOiyXNukyg1pkoW2GeDzJE7TUc8aHJvcR903f4XXNHn2Z0b
         iE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725127; x=1715329927;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfZqj/uiTXAWVaICZsb8XGcycuISC2QrzlPyuabJPZQ=;
        b=r793nWjQ27bnv/X15WSYpyoO2TXsTKkR0xNYldX66QyJL2GQ9LcnnIoJS0FvNCleid
         VxtkuKUzPliou/87lh0bdBoc+45np4++/Va1yiqFvrgrBlGW7DbHZoNu74OMT8M9Dcvf
         6WWlyy5MMffxmEqk0crUffxukarxAiBPaLJaogsLgVH2QgHTV5b3xqovkFwGwgGlGgwr
         77rnO1IF+YaVwNTHMkdH/YU5hMiVoIf0nijdvXE2mrXbhK7zS2XikL5BEhFtGbxxPD31
         JFsh0rGLsO9fTKFW/ij/t2PLPSl8x7qN56rjSk2Dxb4c9aHkNZFxU0ImqfadNBnFEvLx
         EYyQ==
X-Gm-Message-State: AOJu0YyBLAohlLjc0iJ1qL+FDdhbf+hHSt+vf13N4tuDqzbXlB6bjrQp
	7o0RhV7r0GwVycF0NvG14VC74Tm8kuSBDTgTJmTnZOTOOeytQZV25J96q7h3ayonUi/SELdcsYa
	0DUA=
X-Google-Smtp-Source: AGHT+IFhxQr+lmvVrOszWeI4LjVFeSB2fpxfi8yQWJUByV+T/Z2kBX/gj36Lqd2+kb9ElWT2vjllgw==
X-Received: by 2002:a05:6000:1379:b0:34d:7dee:649c with SMTP id q25-20020a056000137900b0034d7dee649cmr1532075wrz.13.1714725126617;
        Fri, 03 May 2024 01:32:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id i3-20020a5d6303000000b00347eb354b30sm3164818wru.84.2024.05.03.01.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:32:06 -0700 (PDT)
Message-ID: <6030a450-fb4e-4e27-a5c3-6f4e0f326d9a@linaro.org>
Date: Fri, 3 May 2024 10:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.10
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_013210_516174_0A25572B 
X-CRM114-Status: UNSURE (   9.71  )
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

Here's a set of Amlogic ARM64 DT changes for v6.10, with:
- Initial Amlogic A4 & A5 support
- MIPI DSI support for G12A, G12B & SM1 SoCs
- Overlay for Khadas TS050 panel for the Khadas VIM3/VIM3L
- Amlogic T7 reset controller
- New board: MNT Reform 2 CM4 adapter with a BPI-CM4 Module, AV400 (Amlogic A5),
BA400 (Amlogic A4)

Neil

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.10

for you to fetch changes up to a42f2e9ba13b8a4c556f43ed99e22ae14fb73130:

   arm64: dts: amlogic: Add Amlogic T7 reset controller (2024-04-23 10:04:25 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.10:
- New Boards:
   - MNT Reform 2 CM4 adapter with a BPI-CM4 Module
   - AV400 (Amlogic A5)
   - BA400 (Amlogic A4)
- Initial Amlogic A4 & A5 support
- MIPI DSI support for G12A, G12B & SM1 SoCs
- Overlay for Khadas TS050 panel for the Khadas VIM3/VIM3L
- Amlogic T7 reset controller

----------------------------------------------------------------
Neil Armstrong (4):
       dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
       arm64: meson: g12-common: add the MIPI DSI nodes
       arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
       arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

Xianwei Zhao (6):
       arm64: dts: meson: fix S4 power-controller node
       dt-bindings: arm: amlogic: add A4 support
       dt-bindings: arm: amlogic: add A5 support
       dt-bindings: serial: amlogic,meson-uart: Add compatible string for A4
       arm64: dts: add support for A4 based Amlogic BA400
       arm64: dts: add support for A5 based Amlogic AV400

Zelong Dong (1):
       arm64: dts: amlogic: Add Amlogic T7 reset controller

  Documentation/devicetree/bindings/arm/amlogic.yaml |  13 +
  .../bindings/serial/amlogic,meson-uart.yaml        |   4 +-
  arch/arm64/boot/dts/amlogic/Makefile               |   7 +
  .../boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts   |  42 +++
  arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |  66 ++++
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  40 +++
  .../boot/dts/amlogic/amlogic-a5-a113x2-av400.dts   |  42 +++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  40 +++
  arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h     | 197 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
  .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
  .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 ++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  13 +-
  14 files changed, 1028 insertions(+), 5 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
