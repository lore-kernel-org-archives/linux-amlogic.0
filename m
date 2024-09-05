Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35ECD5BB9
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RWkvK6ew0kpVB+JH5tiSUY1c3L/mwlFRsDmGZjXAiLY=; b=v/0Cgz80p39NOm
	IOac9cBbJRrIiifc152kexstOD0SuFUv7KbnSLmU9Iv+hB1ag0n2cy6d+S5qpRiIjojHv0WtGY3YL
	n6dlFu382oQk36pExOmC7nr6gZzgjZ+9vII99Ol4tFSCQovNV+LBo8q233adktHXdN2X1GHgixWQ7
	kY6+y/I+N3T9oyE4QfRPPJN/g7cSQ/iYvHVXAWkUFohUgV7dTWYUqYcheCO/cgQFer9UjZEqjoCY2
	DzZ/R0yMt/ZkRqdsidCF0z5jHja+XZNPq+BEBLGtf1INZILthmlhqUP8k1NiKY9crkhzhxToyGHG7
	WrAqAhAywZ31qrAq+xzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBut-00000008PHM-0yNO;
	Thu, 05 Sep 2024 12:48:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBtt-00000008P0N-1fIC
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 12:47:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-374c7e64b60so406684f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725540466; x=1726145266; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nrk4B/qGNUdaCVWJVOZf6rns7BLg+A0NUX/JpMGGFeM=;
        b=d3V5HwnXyra8K6zLZbNBBz/fyl4FQImdx67zuUlqDJBhQ7SrbcRIfQ3wDr+tfIGXKv
         WsHohSmEi7ld/PT6Lmqh/N5pa/EVIZG4gBq6+D64dZO6omtXy6CS48imjt1KVp+QDmho
         wygHaGYqqsilPIhMef1mVckIG7jycHOHdO5Es8mVIuJXN5UNdv7LlMlT50lzpemjDRVV
         V2nDnLYcXmqTx0wRBDvGsB/rVM1NzCA7M4NeUxKu/fYY+wAk2hpobE6mQq3kTGnYHClh
         tDOGDjUWTx5YkucAcrqMzRH7UViT0SiKXZeF0pWfHG8ok8O+a7BxGIPPfXoYfiCm8GVp
         o1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540466; x=1726145266;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nrk4B/qGNUdaCVWJVOZf6rns7BLg+A0NUX/JpMGGFeM=;
        b=ZfGBzYJ4Np7Fl/y09MlnbdYp72iZe3+v64zafXgKuoMIzLWyK7ev/51O28i5KrpWMw
         dUVGleh25m8rbxRWXhzwv3Q0eSK9asYJng9R+b5KtPhiIzOWCt4RrhSs+PwTLgwlwy4h
         kDZmpIoedZU8eZPzDc/D47eCguNXT2KUMxBo0sn5jYjicbAH5OEUKpZsJYy1gym8j7Ec
         7Utau9DiOwLGR1iTc+gtpnKAqONSUab9nH3/0DL0qTiQWdk0EcMA5fH6ljEg4ZIeRmgA
         lybsN/zC9dU2BHuylO5AZHPqNHN8NpZ0rFrFQlhFXXvcgWuKCxbXS7uycwcsfsFdGil0
         eqpQ==
X-Gm-Message-State: AOJu0YwvTFzKywpO1zeCzzNjFjdKiLb7PKUeR+YKRSVoplhG61otMhhE
	TE2sMRw88JNMsiV+mGudrb9G5MzLZNbv6C5Syq93Sl8q73QijXEc/qWVZiWmxAn3W6dlOgYeIzM
	H
X-Google-Smtp-Source: AGHT+IHf0iYbRCgb9G5+xSIhuBBVI4n86LROgBs7UgYF9s8Ff3uqlS3m6Zcht7BRO/IuEFPxKw3ISQ==
X-Received: by 2002:a5d:4f92:0:b0:374:c2b0:6fee with SMTP id ffacd0b85a97d-374fa052da8mr7727620f8f.59.1725540466094;
        Thu, 05 Sep 2024 05:47:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52? ([2a01:e0a:982:cbb0:4a45:fd0d:4bfe:dc52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bcdef309sm15002876f8f.71.2024.09.05.05.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 05:47:45 -0700 (PDT)
Message-ID: <577ad7fe-19b1-468a-b994-573855493fd7@linaro.org>
Date: Thu, 5 Sep 2024 14:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic drivers updates for v6.12
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
X-CRM114-CacheID: sfid-20240905_054749_471402_7DE17DC0 
X-CRM114-Status: UNSURE (   5.60  )
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

Here's a couple of new SoC IDs and meson-gx-ao-secure compatibles.

Thanks,
Neil

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.12

for you to fetch changes up to 009ff80bfaec1aa3fa48bbe5e2903c95931a6f37:

   soc: amlogic: meson-gx-socinfo: add new SoCs id (2024-08-20 17:27:27 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.12:
- Support new Amlogic SoCs in meson-gx-ao-secure & meson-gx-socinfo

----------------------------------------------------------------
Xianwei Zhao (2):
       dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
       soc: amlogic: meson-gx-socinfo: add new SoCs id

  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
  drivers/soc/amlogic/meson-gx-socinfo.c                   | 10 ++++++++++
  2 files changed, 22 insertions(+), 4 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
