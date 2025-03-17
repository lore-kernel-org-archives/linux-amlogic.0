Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA1DC35FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Mar 2025 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=INTKDftyir8c5TPPtsa4GKAkeDV4+YAMRSI7KiR2pWQ=; b=eBQsJ6+HPr81Jt
	OqiulRvEpDQqzAzzgIRCdaodSPW7DhASIwxZLvpxFuRtWly7tPZqi5iyt332jcEldQgEtrjn0e9Ke
	EBF7br69xZvJXldK8ug11lFh0hD9sIFsbP/irZPkQQ94jrNyDoxTzF8RlpbKpRxejNcT68hplv6N+
	R3Edo3aV6ehaNXb+MDbMOUkpv4NSoxTEtxUtfCYn0VF96o8L3q0rPPQg/6V0NulPzcrnajIVazlDS
	2A9mxItsYHJttD6JixUR6mhqdvujooNbdNCintIAtzoAosw42Ft1BSBPwBnMX8p+J+NI8hwa5x7rY
	Zu7VOUkKkykJgeTKaR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD7k-00000003IS3-2SH0;
	Mon, 17 Mar 2025 16:15:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD62-00000003ICH-25fk
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Mar 2025 16:13:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so24152445e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Mar 2025 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228025; x=1742832825; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3Q78GCQxaQzQ0+b/W0JORUc7kRo1vxatGamr7JrCU8=;
        b=G7HBRWHWjtXDKz8VG+79N6WTKrNpwrKEkeh+cOwoLYJ0H34p/bZ3H46FStKg9+GlFA
         +OVgCaCiTAXaISTJQvlEo77/aZUywiMZT3g6hZOrGeZWN/hn5VPWPpLBbrvrVKUkqzSZ
         gtGQ6CKEXzBrFnXoWkWPgCBHY6alt6O0EFqbbdZOiuhd34zqEIRZQbS7UfFfek7Nti9y
         NfDite+snvHgskASr3DBnG057UkRh4ywf8kFDgPl9PnvVV0/n3lMokbS9fCt94TjT22T
         6UuGzI56t25ef4n9hcESq8WBN1zXZK6cJQdu9admaKzPcYDiDdQGW1KagogyCqFbK9Ev
         OgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228025; x=1742832825;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3Q78GCQxaQzQ0+b/W0JORUc7kRo1vxatGamr7JrCU8=;
        b=xChguI6ZWxzWBNF3y7DDOnr0JNu1D1AMCJZVT14rDXec0gew43mNl/NgzYQ3XSr++H
         h4RDCmNdG1Yz8HtqWkfQH79YF6hx8EKqyE8VZwx7TZtR9E/mH7fy13BHHaZOqRGpZ7Bt
         xXLDkxR8EKjW6ip+/yBCeCssnDUy9YQR6l5S2D13cFeFEr1/Cg3a2klSvzBzxlX1/WWC
         1DLy2ypcs4lSSdOjvqd3sEEvFG1vXTKdRJA6GcDIS1smzYT9mUunbop8rlMNAvL65p4l
         UDck0pnCWILTnD+RB15fKtmhSoXVdJnU+b4+d2M64gVErFP621R/1un6EFYokgXawlUP
         yb3Q==
X-Gm-Message-State: AOJu0YwBk/17AoZ7olXN2ZEFeaomNRP2FZHD2ENj4V6jCY7k9Okfud/R
	eiLXXIeRDjqO9TbHHzQbcn7IWa6UtMbGeo+emXRQYU/60vO+Fq0ZM9uAZWFn5Xs=
X-Gm-Gg: ASbGncv7FApp00NU93KKsKSWMHlC139ajWpHKn1x0AnrRps+BqVDcYfU1ru/jN51j9s
	KFhYVx44DNxeSx/7uIlhXO9Slq+SIDmDOeuesp7NrK2q1GzYiFGKUzCF7pf+lgAqGzG9rQGNJfR
	tgRnzt7NHUHnSamRt9fovBXgOdfywXtj+Vxfrmj6T5UAHhr+te5gRBWgU16rTgq1Yuj/BfCEWvO
	wvmTlA0IyiTnJedQx+/Lq6LBHbJ0Y0zOa58gWJ4ASPICt8+3luoDVZKxk7kLycm83fyAVNOW7ID
	/+WxLUzq+Tyy94cQm8GrkMEL4LWcJl3LxvBBbIX5Xaeb/2xv8+p+Z2KcwyLExBSsU0dwInnnKBJ
	w5EIZwbLEog5RSPmPR9YlL/FlSxhvQMhp
X-Google-Smtp-Source: AGHT+IEgKKfqkoMTMNNyJOIvZMFmniBpdMldb9buXiNIZUZe25GcX5FBNKsqJaRSJPGODxAdF1Pg/A==
X-Received: by 2002:adf:a456:0:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-3971f4116ecmr12318997f8f.35.1742228024672;
        Mon, 17 Mar 2025 09:13:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm108830115e9.11.2025.03.17.09.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:13:44 -0700 (PDT)
Message-ID: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
Date: Mon, 17 Mar 2025 17:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.15
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
X-CRM114-CacheID: sfid-20250317_091346_531948_B66B5DE2 
X-CRM114-Status: GOOD (  10.82  )
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

Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
finally gpio_intc node for Amlogic A4 & A5 SoCs.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.15

for you to fetch changes up to 454e0353b226a47f3c3369b17c7a4893f74e29cd:

   arm64: dts: Add gpio_intc node for Amlogic A5 SoCs (2025-03-17 08:38:58 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.15:
- Add pinctrl support for Amlogic A4 SoC with new bindings
- switch to the new PWM controller binding
- Add gpio_intc node for Amlogic A4 & A5 SoCs

----------------------------------------------------------------
Martin Blumenstingl (3):
       arm64: dts: amlogic: gx: switch to the new PWM controller binding
       arm64: dts: amlogic: axg: switch to the new PWM controller binding
       arm64: dts: amlogic: g12: switch to the new PWM controller binding

Neil Armstrong (1):
       Merge branch 'ib-amlogic-a4' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into HEAD

Xianwei Zhao (7):
       dt-bindings: pinctrl: Add support for Amlogic A4 SoC
       pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
       pinctrl: Add driver support for Amlogic SoCs
       MAINTAINERS: Add an entry for Amlogic pinctrl driver
       arm64: dts: amlogic: a4: add pinctrl node
       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  126 +++
  MAINTAINERS                                        |    8 +
  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  139 +++
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   12 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   24 +-
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   33 +-
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |    4 -
  .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    4 -
  .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |    2 -
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |    4 -
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |    4 -
  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |    4 -
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |    4 -
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |    8 -
  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    6 -
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |    6 -
  .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |    2 -
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |    8 +-
  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |    2 -
  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |    2 -
  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi  |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   25 +
  .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |    2 -
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |    2 -
  .../dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |    2 -
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |    2 -
  .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |    2 -
  .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |    2 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   25 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |    4 -
  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |    2 -
  .../dts/amlogic/meson-libretech-cottonwood.dtsi    |    6 -
  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |    6 -
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |    2 -
  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |    2 -
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    2 -
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |    6 -
  drivers/pinctrl/meson/Kconfig                      |   11 +
  drivers/pinctrl/meson/Makefile                     |    1 +
  drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1053 ++++++++++++++++++++
  drivers/pinctrl/pinconf-generic.c                  |  130 +++
  drivers/pinctrl/pinconf.h                          |    4 +
  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
  include/linux/pinctrl/pinconf-generic.h            |    4 +
  49 files changed, 1636 insertions(+), 123 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
  create mode 100644 drivers/pinctrl/meson/pinctrl-amlogic-a4.c
  create mode 100644 include/dt-bindings/pinctrl/amlogic,pinctrl.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
