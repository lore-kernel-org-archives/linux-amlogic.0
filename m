Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B22D44D71
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2024 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rQM+2DE40tKgQgFv5ad/buwn6YOBmT5aNxgUvSbrk7k=; b=bAQZ5Bog3pOqAH
	iYFfS/VNW60zN4DMSKsA75+3w/JvOSlvwHVk/HecA/C/5cueOpRmoHUliytEZ7lRpHDJNQdrTRETP
	ksKwGPcC8gx/0v2AZ+6urTCVwmm36wxQvOPb7oY7AVgy04UHPVQI9320jpLwN0B6SSGdByk2lV2Wv
	Rhim2+8eEy5oSu1xqwXxcOCXH5VPP2PdmgmdO8ThJGE51w1IyRyDs3re36a1uDc3csLm71YpoT0uM
	5cA6BDwahY+HhnHIcxVWdSG9RZTLnRix/3AbyZ4hJne0x+y5P4Si1Z6Ha413WEjQ7ay1/oJLkqdrj
	WQBeq20X1ygw9/O5MH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gcV-00000003WvR-0h1c;
	Wed, 06 Nov 2024 14:02:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gMC-00000003TOz-1nr2
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Nov 2024 13:46:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e59dadebso8342350e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2024 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900758; x=1731505558; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=nBPoOJzhykyoYbwcV19EzWU567+GvMs56ZjjqGvWDKJgk1b4BkRDJmIPtk0IWKEzLs
         HlqpIRDhG+9Ze7tbdgugys6ltl5wyndu/LyVb4zjZYkwGyPfUQRVVdyJPFDeraZh1MIY
         oxloAfE5E1ycfc8MeKk6uaZrWjvSTk9nvxDLPgA1VMndPGgYpE7J6i+X1s1oN41awXUa
         GTncyQBFh7BLt678Xx94tS+SII2Icv4/OcjDQSJ90V2zuPcw3tMRY+UKX2NGL2G5rDnL
         PhvSE2etHLMdP4drQHCc+FTtlrrof3d59R+iSzQi0r5jU9GhpIx1RUCo6i9Yq2OAHkxu
         KNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900758; x=1731505558;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehYC5jyHQqP2TfK80B/7xWqvzi8c0/X0fL6unhG4urs=;
        b=kJjs1Dlp8KDmJ14/iBf75Pdje0PYCjlK/r5xlwdn3tFmJGdUvzBsG3IKoS8EQZRUsS
         s5rOT+9ammEwblfunkkG/HZdIdCxmq9CS3e/MQs9c3rHqSWPkaX/oUUqUdUHv6D5TN5v
         X/bk2XycOCzUhfFEP1nr4iFDUfXJWSN6Z9g8BhITKAxdqhFhILAAPbqrEvbEyBvTO6O2
         xpiDBKvpyRveboX36J+E2ul1/tJ5nYC1DF2KKUSC06xqVY1Ht82PJG/GfyE8iLKjcdP/
         d1dPJBgzmwNqqLHj4lpwK+/s2+bIewN4hiFnonETCejp3KKrs/+W3cdqXG1/hp+WzvSm
         m4IQ==
X-Gm-Message-State: AOJu0YyP15KzKB2rI8OYn566bB4FK0C2uycwB7EzuBPUE3+hSOpdHw8b
	rJ4LtuJ0M491JPMAeQRUBDE/1AyKdPvggxpRexvi2SXsU+UebHTsDpROgdrMYBQ=
X-Google-Smtp-Source: AGHT+IG36xkVt+ks+JYrBPCyJZNNr5to2RevB/PEtfvJ914bM+YQAJ+CS5sRJcV8XkOk11ShH2fhow==
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53b3490fabamr19945832e87.31.1730900758178;
        Wed, 06 Nov 2024 05:45:58 -0800 (PST)
Received: from [172.16.23.252] ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm23255865e9.7.2024.11.06.05.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 05:45:57 -0800 (PST)
Message-ID: <6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org>
Date: Wed, 6 Nov 2024 14:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.13
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
X-CRM114-CacheID: sfid-20241106_054600_515117_E5AA8FAB 
X-CRM114-Status: UNSURE (   6.57  )
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

Here's a set of Amlogic ARM64 DT changes for v6.13, with
PWM for A1 & C3, missing properties & typo fix.

Thanks,
Neil

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.13

for you to fetch changes up to be90cd4bd422e8ae235f534a2fa46d40dae0816b:

   arm64: dts: amlogic: Add Amlogic C3 PWM (2024-10-09 09:57:50 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.13:
- Add PWM nodes for Amlogic A1 & C3
- Addd missing power-domains properties
- Fix G12 uart node name

----------------------------------------------------------------
George Stark (2):
       arm64: dts: meson: a1: add definitions for meson PWM
       arm64: dts: meson: a1: bind power domain to temperature sensor

Kelvin Zhang (1):
       arm64: dts: amlogic: Add Amlogic C3 PWM

Theo Debrouwere (1):
       arm64: dts: meson-g12-common: fix uart-ao-a typo

  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 364 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 216 +++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |   2 +-
  3 files changed, 581 insertions(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
