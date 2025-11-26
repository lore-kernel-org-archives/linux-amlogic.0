Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B16D10390
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Nov 2025 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5tJmC++fo6RVLon63jPmr4b3r+dm7m0kLSuQc5QUbI=; b=lyKbJTJDIfcMvx
	zdiormWQIJGUbMyIVMR/HnI6YORaPcjZjRXHyGYhpNY+qaC4xOl5QrcgENqJ17isT7UToPAE3c05n
	yOfwkzi6WpO0+At9T7QCVsBHP8Tl5TduxKnG0rvuiN5JiwqhHo983Ia32GNo/v5cRsFPHjbl1Epqt
	7uaEXkmJbQQdr7E8NMQCkjHA8oDKyLjHv48g7ny3whJuMWhy8iPepXxuRwPfRkYaJcba6cKLkzFqq
	0eX5I3meRpk0TTXGTVGx6uMXB5mlUCGQBiEBbd85zn3Mj0JO8PqNMaJiPz0ASXHh8ycoE8xVu/tpJ
	7CK5dVUpc9Czo5uJLYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB56-0000000Ectl-42Sf;
	Wed, 26 Nov 2025 08:40:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB54-0000000EcsC-1F04
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Nov 2025 08:40:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477563e28a3so4113845e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Nov 2025 00:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764146452; x=1764751252; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZRyLJQWLyu2ofm6THBGdej8nUflr7mrvYDLc8L0ZgQ=;
        b=MLTLfxUsK71yY4HSqeBU8PZVGLU9CdU8s33G+FferfruwdfJ99lbDqDK/Yf/w3173O
         4rkhAEethgfg18d7eG8jtzcGxjurYjAwN8FI9mKplV3G/vxPEaW/YzpPxtFgofY/PgHA
         yALhtifXUkKs7HcsmqUWWBjIVoPYWDdRQHIXAWZQY2jnnYLqH3ZARHbU6iiQ23Mq6KUw
         G8hTzTscWEtvGzvsJaJ1CYEjSwXExZMBY6RkuI2fdJMOR90+AgV3L2YirpWFhH/C5fBA
         QpYhUTGsCsO7lJUqpclb+kefQtPNcI5OLbYEucGehA9EvHd2WudD4eaoaKtA2nMsX/4a
         LIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146452; x=1764751252;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZRyLJQWLyu2ofm6THBGdej8nUflr7mrvYDLc8L0ZgQ=;
        b=XUBwPDPTsn8gdaMOJproIl4pqdlXZKhxGwieoiLyi03vwLIqh8rzddIFaiAIUxqXcz
         7XxUVbHKUmXrloRx92kwip6L6WUy4EaHmcIoQTNDSNI4QiG2CCmYIMreSH/rsrawC1Cj
         Nb+nURiWg4GvOYvMX9WzI6oCslvnHlx4lEgJX9Rzug6CYN56Kb1LLKkyCwKIk3ZXcifv
         /uzxCcaIYw4bhKS739QgyTdOIZt5gwsCESYfC1z1Sszl675aZLvJqaB7AOisSuYptg2f
         RefvhV0LaNu97/Hdh2JCZ8462po+6118KvXb5FAwDSDlW8VLMMgIv1QvpqIZH5DO8ZGe
         Rprw==
X-Gm-Message-State: AOJu0YyrdYbP6b34Q9kTE+pxC0Nn7T1xYnTOASFaD09+nPssSiA/vKye
	bwlB3U81sEaC8PFjQFHy7DYMDjfyMLh4hnWYwSqUVSfkUfLD7/mIbkL6mOt/U1wakn8=
X-Gm-Gg: ASbGnculDGKZfW0P16YjeaTt1X4LBwUIduq5nXgIHkGK0ppaf2npAtJNSvnTQk12pUq
	CdkEto8RJlrVJFzl6AulUJXGS2N4Uokt1fH5MjZptEgnrFjmnvuPwgJ9Ll+GIOcwwZQnp4C/A4q
	FH54Xku0p4Cy9twqSiC+OKiuXzbH+S1J/+vUXu3eXEyU8iiD3Q64b2+ZGhlAXciHLXboe6icwf7
	Nw+Zu8MiDTDm9Mi9VR6oKmXtSlHc8IHMC9iL4aAGxbeZK9pdmzqDvfW6KX6+PCqHnEw7Abe1RCW
	HOhLSAQrp4EvDxEXBy1Pur4k1OQFfx4metmHv/DmlpJavzA+kYFgBP8laQ3WdcEI1dFFvfc3a1t
	nQVffwCwLX9oItDYpEVAcVQWfG71yP+IrynfKbatOzlcknu9WlX/KbkY8VgTl/QKZ96hd2ItH21
	Y2/1l3RTIy9SclN7FAzK+x1blTeS2qA81BJVIU5LAF+qd3a8rPeGj7c3MJW67c
X-Google-Smtp-Source: AGHT+IGzRRMF+OnlXmN4I27NO53Fg8uCF8bhGoTJ8TUJhsPX0oqyzIKFxwBWRjR2h6rX86vbOV8tcg==
X-Received: by 2002:a05:600c:c8a:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-477c04cfb70mr207353655e9.6.1764146451593;
        Wed, 26 Nov 2025 00:40:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052b3f5fsm36218435e9.4.2025.11.26.00.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:40:51 -0800 (PST)
Message-ID: <9e0a76ed-8eb5-4820-b64b-a0efa0f91170@linaro.org>
Date: Wed, 26 Nov 2025 09:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.19
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
X-CRM114-CacheID: sfid-20251126_004054_353633_0E18D8E5 
X-CRM114-Status: UNSURE (   7.07  )
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

Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the canvas driver
and support for new SoCs.

Thanks,
Neil

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.19

for you to fetch changes up to ba8abbdfd09e64f51ead8b86afc6b586505919b4:

   soc: amlogic: meson-gx-socinfo: add new SoCs id (2025-11-19 15:47:15 +0100)

----------------------------------------------------------------
Amlogic Drivers for v6.19:
- Canvas device leak fix and error handling simplification
- Add more SoCs definitions
- Suport more SoCs for meson-gx-ao-secure

----------------------------------------------------------------
Johan Hovold (2):
       soc: amlogic: canvas: fix device leak on lookup
       soc: amlogic: canvas: simplify lookup error handling

Xianwei Zhao (2):
       dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
       soc: amlogic: meson-gx-socinfo: add new SoCs id

  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml     |  3 +++
  drivers/soc/amlogic/meson-canvas.c                           | 12 ++++--------
  drivers/soc/amlogic/meson-gx-socinfo.c                       |  6 ++++++
  3 files changed, 13 insertions(+), 8 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
