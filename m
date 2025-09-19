Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03357CAC592
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Sep 2025 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9xR+P2T/d2Vcfjq+BbKCJ0MDtJLDTUenDcwdmcuNNe4=; b=Sj2Jyv24PoaOzW
	ThgtHomVey2YRDCrN5eJDnMmhaHAmpI4yltlXU6NJ7tdLteRGpUCsmn2n9v8lNKZQDG3wq2AhuDmY
	uwszeKzUPkpknVY5w1lt6ITcfaaGNrfOF1py2p9NmR5vNro0jbUcQLKtg5EQENeCUqgQT9CJtGQeR
	fefj+CMJOSEEpy2hDaT8xmWoY4r5kmHD6ekkOGRK+CERWOYRH8Oo5i16JMVwxKmOUxH1fPqPjvbF9
	qtiPVGCK/1UV5MlCItinGFz8E/phsuuWaTCdwJGIARylryBw3F1snstP2o22dddA0aithCM2FNfnz
	7lk3eZuygPbrd8yKf9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVor-000000027YD-0TyP;
	Fri, 19 Sep 2025 07:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVop-000000027Xs-0xX0
	for linux-amlogic@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:Sender:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=; b=It/FwiUdqJbv/2gTGRtOTcZDED
	V1bCseNVv/S8AMkI+OpQVPtTjL2KVAVU+qYH6FhrGLLhxEPAOmZ8czAdYkdLv0/gr1w9osIJvkW77
	V9gfbLEqASvHIdZJnNvRhtLQ7OEBpw1GJpGQYbMH91xqDSUpBGAspVPJGHy4uIIa0ZfX1sRzYEHNQ
	WjY93DNjDX6vSM6ci9QxepuSHHXM1zswQAVQMDXPD+8kKrmIjOmm9uh9JYjJM8JB8QN4BA4ZCOAj3
	tDVjR/lUf97EobyXRTr0VbNZC57N3+7Gmnk3leyurP0qT0zBnFgoSpEcpX/D3/v9IqATloIV1gD7S
	GetFFTyA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVol-00000007mAT-3KEK
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Sep 2025 07:46:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso574859f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Sep 2025 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758267965; x=1758872765; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=xhEIQMCmrIcNZkE2yNTrlgdk/Z43CHtyopzogS3VAxk3sxI2kx45Mm6A2D3OSX7i6i
         2+P34S9QUD2vhuqnR9NeBulObsvXszyrXJDGxv9aB95lNHAJy9247QIseWhNajyiUzhW
         BG54bXApYLaEhCf+L5ywhjZ8dA55O0WTQyNcJXbjWCQmYv+LSHfV5CW2IpSqNymfb70+
         LqNx7V/hYAPPZ0Yz0e1FRuRG+ZnrkAWQMi7a2C67bCBf6w7hxg1zd0GoOnoNCnsb5sto
         luijO771Y7lipEO5/+Mf0t3+wO0DhQ5ZBZc8mqjZUWur8GmboGB7DXgnPyFiNloyUam9
         g0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267965; x=1758872765;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj//8F4fTHzOhzOgZFY9djcOmaWCzdNmUbED0aVzyoU=;
        b=QTydA8D8lYB5UJUtvKCUX/K2JKDBmNiVnkoLva9/J/AH+AUhaveM+jYhA3MkPSQ1s4
         SukaBjnno5hP5CEiOIAKjypWkhLfkdoRIBbz4CtETapgIZSnNtvkDdYDQVhNXGrPnxOj
         08A4vvec9oJGlg1/xK8PccXylfVTvKRBU1EeOb/pEicDTFbG57gIO9kehIxkdHfq+C5V
         eKWK2CZ94i0sblZoSqnbcUj3g5E/IyUKPpfnWcjWVhr8+CJ3uIUeNvIjd/gCCqZs4FUi
         4gK+dRRqGGz+eJuJjUDQTpSs7jVYwNQiLRTB7yFUUEIiJejpYy65GxLVzZe/msd44TJ7
         UOZw==
X-Gm-Message-State: AOJu0YxTquUR9cFWnNj5FiyP9dzkXVsD6hwrfevEkfdpmkwaSbolMQGW
	6KLgTvVQ2H6FlnWo22q0GtmQWOEenINULTtUNFhL6zAIQEQGmqLT6VI6isuwrzRb6G4=
X-Gm-Gg: ASbGncu2RwrP2MpbR6lcFOFq8oSGXgXClR25esO2+jGiHxOPRW9+/dvlxT50vda6Xzw
	Vu/Erl6QH5IqZnJH9y8ncfMVtrrVAJoOwoqZB3Z9l1PyvhJBwPTDIEdLz4FvCgIFAg6qhknk2F0
	Td6TR9PH48iCJZ/KI5hwSZAJKB0+SO8a+D0hGsJqNr33cehcvl+XeuJeLm0Q3GxG/URqf4msI7O
	Ho/IqkTUEU2XeM5zSkhNvCfZoNBafr10xAbWPM0NAxUvnOUCk9ead2hxO6AGNeZ7zCT9VkZCseV
	lBBp/P6meSFYM6hclONYo4nP93Oucj3AnBQHlJuMm4D65WQWM+wOvOeWEdJWntrlFO4wm8BxJP3
	uao05fqKwchAqV8nMUo2G6VwNoYdmKUvYgx4WwYNIo5gJdOMBnj7MiMskLlb6Ns/d/tnmXyZO
X-Google-Smtp-Source: AGHT+IF1xyuhwXqnZwy0ko9KlFPIehOGJYLXMgJOucjyGCzOVvKO3TFQuawkjLcp2ZJOEerqdy3ZqA==
X-Received: by 2002:a05:6000:2dc5:b0:3ec:df85:351e with SMTP id ffacd0b85a97d-3ee7c55272dmr1797890f8f.11.1758267965437;
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0740841dsm6625247f8f.23.2025.09.19.00.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:46:05 -0700 (PDT)
Message-ID: <d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org>
Date: Fri, 19 Sep 2025 09:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.18
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
X-CRM114-CacheID: sfid-20250919_084608_118191_474BE64E 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi,

Here's the Amlogic ARM64 DT changes for v6.18, mainly adding cache properties to all
ARM cores in Amlogic SoCs, enabling RTC on C3, fixing RTC node layout on C3 and fixing
long-running issues with SDCard on BananaPi S905x3 boards and the Odroid-C2.

Thanks,
Neil

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.18

for you to fetch changes up to 663bfe77b6f70bcb33b2607e16c94fcb1029580e:

   arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card (2025-09-10 09:32:09 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v6.18:
- Add cache information to the Amlogic SoCs
- Add RTC node for Amlogic C3 SoC
- Fix PWM node for Amlogic C3 SoC
- Remove UHS capability for Odroid-C2 SDCard

----------------------------------------------------------------
Anand Moon (11):
       arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
       arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
       arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
       arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
       arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC

Christian Hewitt (1):
       arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability

Valerio Setti (1):
       arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card

Xianwei Zhao (2):
       arm64: dts: amlogic: C3: Add RTC controller node
       dts: arm: amlogic: fix pwm node for c3

  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 37 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 41 +++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 36 +++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 74 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 15 +++++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 21 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        | 27 ++++++++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        | 62 ++++++++++++++++--
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          | 27 ++++++++
  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  4 --
  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 24 +++++++
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |  5 +-
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 27 ++++++++
  13 files changed, 385 insertions(+), 15 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
