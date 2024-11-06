Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A8DD44D6F
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2024 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l8xDDeMOJxduVNCQvzX1ilzMvrQw51ClX6WqgkvJ8IY=; b=Xk6gg5CN87THgD
	AhgIOFc8FYFw1A5wI/2x8MfHfh8IfmiFumuizGpIKC/pvqbgFd95mLl2B1pD1QzG45NPm9xPpDG8Y
	8Iej6XR9D6Qler5wjEVfQRKVtb19+vzSs9208YK0V85Z393yNhi+vfDUSNbuDuSEmTygFe6rBSfSr
	cx5mf/rbqEi1HKWPoiLJC8+QuDSz5c0DWLkDG5gdJZRt4KazoN/iQuRoHRqdPVFrFat1rgE37ZNSs
	wrqryXmtWhFnvJTPpniUoKbtG8Vk9LBco5PmWieu2iuf/Yk60+j7HUC8rxQVvnnOxmsJHOqmtHMhx
	j5f+qbz0mHkumZP/7KXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gZ4-00000003WBk-2n7c;
	Wed, 06 Nov 2024 13:59:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gKT-00000003T1G-1rTc
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Nov 2024 13:44:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-431695fa98bso52631615e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2024 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900651; x=1731505451; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1t9SmRdC1grTnxYfq0WRsgynjzOVFKr29y6dkcaAKA=;
        b=O0KtdupuRMZbKzc87eCpOZOVjn1N9KVvXZMrzm0sL0nywnl94+2Ts69fVXAgSvLm5i
         mJRwVUSStKL2iA5Iy4KVf48aiR0Q4n9xH1//YKBoRnKd5VNKAT+pLpSxIh0pxiByd834
         TMeUPbq71uHE78jgO19Qm3sog8q4yN2IbvzWDVE3xMyOXQ1L4uwNMZY7ZxQY7G41BLKx
         5ZixxcnzGotvZxV4F9NY0E8dGYoUr3coItUeiDMhec0NYNIMSSZgPx4gc9/oPYO9uSUa
         jOhDiHAzmJYMhvAqiAarJprpLsbZfVW0cpxkWztd9Fx0Orw2Akx9+DRLAtUfREPWfA/s
         sRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900651; x=1731505451;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1t9SmRdC1grTnxYfq0WRsgynjzOVFKr29y6dkcaAKA=;
        b=okiwTJFLwimf4S6Lz/K6QzlHSXdFRPDhMQQGF58HhUUmtQaQj7bPCFsoMfBeC6Bu25
         bBNiTsaxnoC808/hdp8ogN7w6kbEka6UpQd+ZRJ+eBYf80Y/WTm4B8vk3Md1HS7YHO7c
         yjzlwWkJYHeE/N3FbIisgZMoHS0eMlQAcTKCJPjRr9w6JLo+hFIEFUA/fhyhpBZOhc6q
         ExsxnY2uAByb4qsmCrWaXBdjZaDEOF7bloyl4FrHEXJz9kikcb0ghoblSKWNXYVEdg4O
         kdPRCRSOxPJdymD1pXfzdQzGWp7KP1RSX+2d4xBjFP/Dsjwxk6XHyv2aAucY6TY2aqwU
         7eag==
X-Gm-Message-State: AOJu0YzeMrxfAGbjKKoV+21jslNSOF3gwo1RcCtnb2mXar2NB/sr33YT
	z2MUkYSPNVPPXGpAkXWfoqNzWVRa6dgbNFDbrAU22Zq9OGLh16FHrZhN6vrEQbYjYaJT7P8jz2/
	CS6A=
X-Google-Smtp-Source: AGHT+IEDfXHPYnEzdKdGDOIx5isWt6UJom2MOYrbNvWHKRq/DHETWuaNiRBX5ymPlQgTN2VRGVjI+g==
X-Received: by 2002:a05:600c:524c:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-4319ad24a7fmr381006385e9.29.1730900651357;
        Wed, 06 Nov 2024 05:44:11 -0800 (PST)
Received: from [172.16.23.252] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6ae726sm22960195e9.3.2024.11.06.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:44:10 -0800 (PST)
Message-ID: <ffaa3755-8c5d-4fc3-86bf-9129d3889bff@linaro.org>
Date: Wed, 6 Nov 2024 14:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.13
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
X-CRM114-CacheID: sfid-20241106_054413_544440_54D9B4D9 
X-CRM114-Status: UNSURE (   9.27  )
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

Here's the first set of fixes towards fixing all bindings check errors,
this set + the dt-bindings fixes picked by other subsystems fixes most
of the errors.

Thanks,
Neil

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.13

for you to fetch changes up to 2b901e9ef05d84e99582607e85393a6eba0e2363:
amlogic-arm-dt-for-v6.13
   ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg (2024-10-17 10:21:32 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.13:
- DT fixes to pass bindings chedk, including:
  - fixing nodes names
  - dropping meson6 ATV1200 board
  - add missing properties

----------------------------------------------------------------
Neil Armstrong (12):
       ARM: dts: amlogic: meson6: fix clk81 node name
       ARM: dts: amlogic: meson8: fix soc thermal-zone node name
       ARM: dts: amlogic: meson8: fix ao_arc_sram node name
       ARM: dts: amlogic: meson6: remove support for ATV1200 board
       ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
       ARM: dts: amlogic: fix /memory node name
       ARM: dts: amlogic: meson8: use correct pinctrl bank node name
       ARM: dts: amlogic: add missing phy-mode in ethmac node
       ARM: dts: amlogic: meson8-minix-neo-x8: fix invalid pnictrl-names
       ARM: dts: amlogic: meson8b-ec100: add missing clocks property in sound card
       ARM: dts: amlogic: meson8b-ec100: add missing gpio-line-names entry
       ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg

  arch/arm/boot/dts/amlogic/Makefile                |  2 -
  arch/arm/boot/dts/amlogic/meson6-atv1200.dts      | 33 ----------
  arch/arm/boot/dts/amlogic/meson6.dtsi             | 73 -----------------------
  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts |  5 +-
  arch/arm/boot/dts/amlogic/meson8.dtsi             | 32 +++++-----
  arch/arm/boot/dts/amlogic/meson8b-ec100.dts       |  8 ++-
  arch/arm/boot/dts/amlogic/meson8b-mxq.dts         |  2 +-
  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    |  4 +-
  arch/arm/boot/dts/amlogic/meson8b.dtsi            | 32 +++++-----
  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts |  2 +-
  10 files changed, 43 insertions(+), 150 deletions(-)
  delete mode 100644 arch/arm/boot/dts/amlogic/meson6-atv1200.dts
  delete mode 100644 arch/arm/boot/dts/amlogic/meson6.dtsi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
