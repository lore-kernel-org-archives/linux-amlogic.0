Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D8BC2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LOjUOYIqrDZ529zKIWW7O/BM2z/aCz3cloQCFmgHh04=; b=K+aq/7mZdf5pM6
	puJfZlB8qktSfkpNDBRSLz1wqVmN+r1ckXkUB45hDETGUfGdTZjNIuRjd1zAknfDe0NPiNwaF3SmW
	ggtYWnz5q8NXZjxkFg8ATukul8duFYxH+H6InGXPN4dc53k5vWmNE6ZKzadubNWYFbTikJhmPvsU2
	Km9i9o+OcD9JObUDfLQdqKFnKxgaJ64hiUdig4xcUym0251OjIR6dMgCBEYcUOGuvRsmK18VV/E6Z
	6BsRjaTiPYYW+M129U0mGIBuXLzBMhw8lkTPT4fn8gmYJWaIItqeUWW+HiF92POO80uv139I3VBFY
	oGG8WjVwuP65iPmbq33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDDo-0000000HEma-2Gef;
	Fri, 12 Jul 2024 10:09:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDDl-0000000HElj-0QHw
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jul 2024 10:09:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so14609535e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jul 2024 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720778983; x=1721383783; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiwMVqGgBWGhXcER0nCBtLIs2MWDaYiuBsqvkHeF/7k=;
        b=kGjcsfVFhKTD2eOWnSIbAkTtRxG1qu0VuPHi5pEtbXmVfVgGV3SyDnIGr5yHgL8615
         zvHCSjzHB+HeDELszaR/ymv+3cstfR1mGg3LcCB2T8IqvFPp+8GsY/CUO6uKZti5Yxm5
         LAL4hmE9WPulUyMrk9s1N8Vb71bZuKAKp0QvxbBKtRDv/noFnU8zVn9reMZj/TTC/+PE
         PB5ERva5xfLC9wfRLAHD0/Lc3GHeZyOYsdcmkmQK028JrpH1qRbco9A6D6Iu71KxPca3
         8eTtQnGFRInvUgLSiuYOguN9lACAknn79z/RgCgl35diJ0K033tdRkhhU467nu7YV5PN
         04ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778983; x=1721383783;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiwMVqGgBWGhXcER0nCBtLIs2MWDaYiuBsqvkHeF/7k=;
        b=uwMnxhHa5YbWtbUlfK3Zbhol/kHQ/UQe5Je5iEqLqnUuxjtzDBvDgjxr/oWTFPiEW4
         lZy691TIRYICHmDpdlxdo4deNyoufxBcFzPDsoYhuwZQ3+d+Nbbu8HAe9LBA5u55j3iv
         7VTF7/0fIW4/UATe+UgvbESEaolXXU4z7kvKnkaICh97BnR/zvOTgBUutN7z1uAIJYwL
         4xdhflPxMtSehtG3ME4g6wJsKH0NVuvRFCVZnjNfVxbZtDcXA4C5fNo8BdUOYEgWO0ai
         /7SiJW92cZB6AsotQG57tIqzR7jUaOvQODW2u+EtjbVSU90Lhs9xqQoq3o6f/gMQ2y/8
         2dwg==
X-Gm-Message-State: AOJu0YyTNBeKZaEnYXMTx38q3Y6O4FJWqhWOfgW1z7zMjY+4fQ4PfHsu
	ffr8x52Uai7eFr/LmIIpqVVhzZGr62+adTObt3aonw+sP21XaDq7G2C6jn8rB6I=
X-Google-Smtp-Source: AGHT+IH5s2V+DJ+Mg475jEQzq3YEFuiu4gRnmubqYbwskqcjAGe3kG2fO4b9+LV/TZeusErFvbT53g==
X-Received: by 2002:a05:600c:2d84:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-426707db6d5mr96144765e9.22.1720778982874;
        Fri, 12 Jul 2024 03:09:42 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc286sm18561655e9.33.2024.07.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:09:42 -0700 (PDT)
Message-ID: <d7810433-71a2-45c2-9095-4abd23c12431@linaro.org>
Date: Fri, 12 Jul 2024 12:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.11, take 2
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
X-CRM114-CacheID: sfid-20240712_030945_180111_7B635308 
X-CRM114-Status: UNSURE (   7.58  )
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

Here's a second set of Amlogic ARM64 DT changes for v6.11, with:
- Amlogic A5 power domain
- Amlogic S4 supplementary device nodes
- Watchdog for Amlogic A4

I again merged  Ulf's immutable dt branch for the A5 Power Domain DT changes.

Thanks,
Neil

The following changes since commit 1443b6ea806dfcdcee6c894784332c9c947ac319:

   arm64: dts: amlogic: setup hdmi system clock (2024-06-28 10:10:42 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.11-take-2

for you to fetch changes up to 34b60b78550eedbb596274f0336d1f86a80fcd19:

   arm64: dts: amlogic: add watchdog node for A4 SoCs (2024-07-10 09:40:08 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.11, take2:
- Amlogic A5 power domain (+ merge of pmdomain/dt immutable branch)
- Amlogic S4 supplementary device nodes
- Watchdog for Amlogic A4

----------------------------------------------------------------
Huqiang Qin (1):
       arm64: dts: amlogic: add watchdog node for A4 SoCs

Neil Armstrong (1):
       Merge branch 'dt' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into v6.11/arm64-dt

Xianwei Zhao (3):
       dt-bindings: power: add Amlogic A5 power domains
       arm64: dts: amlogic: a5: add power domain controller node
       arm64: dts: amlogic: enable some device nodes for S4

  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   1 +
  arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi |   6 +
  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  10 ++
  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 145 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 128 ++++++++++++++++++
  include/dt-bindings/power/amlogic,a5-pwrc.h        |  21 +++
  6 files changed, 311 insertions(+)
  create mode 100644 include/dt-bindings/power/amlogic,a5-pwrc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
