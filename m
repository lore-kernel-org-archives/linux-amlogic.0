Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF64BC47DD9
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Feb 2024 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=goe+7xYnkpe2QD2rzQe3RnoaD1rWrR12E1vEdKnWbnA=; b=yoHFkXnCUFeZox
	yxfKTX1oU6NZzzYHg3k9Q2RyYAKb1WGOiTCV6HW5sT25dNCXEC0ejmJNRt0OJXfveHZGgMSQmhmOj
	doARtEqkpfqiiB8fl4S7b8CN6H8NgSHCenaifZyV8AS7JxhfZ8UELOhtsFEKfAnnuCrWZEYyYYYgV
	8WB2nSt3LvFGJ+GZIgb65yjRZjqERXunp8T+DCV87117IZJpnH5G77m5JPlGNKfektjlKR7Mf0nVJ
	xD2gC0B8Ez26RjxoSsNDp16ma65Dvy4W+NQmg8Xyngy9TamDi4VyQYX7titOTNQKrviZLDp0YVDKv
	lrj+qmhJFM1R2LtfuiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFUW-00000008W9S-1pYH;
	Wed, 28 Feb 2024 08:40:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFUS-00000008W8i-3SxO
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Feb 2024 08:40:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-412ad940fe8so10774205e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Feb 2024 00:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709109635; x=1709714435; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jUu2uy0p2IpnzUEB//uQxtY12cZ7UCFdxLeU35hb/g=;
        b=V9bhOaETPSdHTVDpBPbyo2N+fG+aD24AkGFiDouZfjdF2y9j0E8MVtV2SgbPWSnSM/
         YoyD+XIpCut0tQrhlKY0Of68RszOgxECYFEblWZvIG3lZXWXdPfyxwPfpmjTQ/044olq
         rgJo7jwSpTNdKbPDLGWAD6cOTZiTBariJE9Boae1FNRznujE9Mhm+0Fh+5xED0uTPpHK
         FHxVm/m8SVf7B2vnJ1YoHdB/82h6iXo//AwtyUbR1z41LEH25pURxq9ox7v2qXHAxSx6
         A5ShRqWmxzOYlqNa/eXXK/b4u4l0lRE00BNRNRJ8MyyRghjBo6P+7X6CACusQIQxe8Jd
         LDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109635; x=1709714435;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jUu2uy0p2IpnzUEB//uQxtY12cZ7UCFdxLeU35hb/g=;
        b=fwbdbnTFrWw7LlLOakBdqNe/5UxPX05i+5BHigkIrGuiJrLpVTVfN1WR7iQcn8FIAn
         qh9t1H4jxD2xK3M+bX3+cDPxPT3OgbZJTvULyA87gyccBKhSbeUk5uxMjyQFCx/xa/No
         DPK8vO3gfjmNnl/OTkO9bufpDH4i5EkjV1nAMHQJ7oYnvYlJivkfUbOzTnmsq0AIzzPG
         pEm/CWPa19vDYnad3hCqp6pl9vwZK60GFlFoMLStDAhIO9oEQvYr0wXTUl+7dhQF+Tt9
         cjOwKo84MQJv9scP+EB6RVLVBxQlY5dAT3RiHm42AwUFeO6OWUE1rFSrwCJeRaqLD+jZ
         TMrg==
X-Gm-Message-State: AOJu0Yzfhg+yxgl2gOIWzgMTWe1WPDbF852u78BO59tetlwuMwtm6bjB
	gLmlvJCVx0GXNAqQzmkZDB5WuKvplfoI/p/m7PsZWVnIA4N9gjUUBX7CqSMQdL0=
X-Google-Smtp-Source: AGHT+IEkPVIC6W2dTP2yze/D6cpf5DvUZ1YIJUqvsKdDOKL9grIjorJJQ2tOrJ8i2ZG42X+Mm1Witw==
X-Received: by 2002:a05:600c:310d:b0:412:b5ce:6e07 with SMTP id g13-20020a05600c310d00b00412b5ce6e07mr488284wmo.26.1709109634644;
        Wed, 28 Feb 2024 00:40:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb? ([2a01:e0a:982:cbb0:8e80:16d6:ae57:b1cb])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b0033db0bbc2ccsm14384186wrb.3.2024.02.28.00.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 00:40:34 -0800 (PST)
Message-ID: <b9c60991-65b3-4c80-bf43-b3bb95bea9e4@linaro.org>
Date: Wed, 28 Feb 2024 09:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.9
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
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_004036_909051_710ABD2A 
X-CRM114-Status: UNSURE (   6.19  )
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

Here's a set of fixups for Amlogic ARM DT  for v6.9,

Neil

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.9

for you to fetch changes up to 778a2c000470ee56551d0833a0eaa387530e4bec:

   ARM: dts: meson8b: fix &hwrng node compatible string (2024-02-19 09:55:01 +0100)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.9:
- bus name & node compatible DT fixups for bindings check

----------------------------------------------------------------
Martin Blumenstingl (3):
       ARM: dts: meson: fix bus node names
       ARM: dts: meson8: fix &hwrng node compatible string
       ARM: dts: meson8b: fix &hwrng node compatible string

  arch/arm/boot/dts/amlogic/meson.dtsi   | 6 +++---
  arch/arm/boot/dts/amlogic/meson8.dtsi  | 1 -
  arch/arm/boot/dts/amlogic/meson8b.dtsi | 1 -
  3 files changed, 3 insertions(+), 5 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
