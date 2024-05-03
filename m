Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51A9C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nFgV7GPNIbDf4oqzmo1YCGaXZfxF4rQ1wmOwn6e73uo=; b=PJOyhXzdq+gaAc
	ONzC+OmYzAY7OKij14RjUvDdabfMpocnOWECsA8p1GpUP3Ai38lVwIJmS8kQs20/tue/j+5ZD9rna
	R+OCfGSynlo3fy/HjkPFWrxNzOEsODMjt5SyWfa1v1RpMNDYFopfb2x8XttMNjyTKUv4RTjiFZyFr
	+Fa79FXW+wltE9Vm7tLTlUpdwIDYXRDauTe5jXkqyvBObAB6//L/rjSlBtdvLOfNFGpfEihxE+/Q3
	jEUjB2VtVCTwrasljQywdTF2qTyUNncimILSD41Zbq3IQeucwGbJs5daS41H+7cepFNeMn/h1vQoL
	uGZFPsftUmr577RsuHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oNB-0000000Fg01-1ypC;
	Fri, 03 May 2024 08:34:29 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oN8-0000000FfzE-2gSC
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 08:34:28 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so64206211fa.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725264; x=1715330064; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOIGpp+UI7FlgvnWTiaj9AF30Udmc4L7gLFm5A9fuzU=;
        b=hWVV8MV/BQYNeRcbizP1a4ESUtUwBX8pf1OVanG3mcNwPDQcbzDVEr8NEndmVjPbU4
         tBziqRcVJ9J6z+NbqhbxA6CiDhluIPlBJahyYYSkubEOxd7DNwv/+kPpXGP55AExwGeB
         N6mahyjIMKGAAC5lPTfs0IUXGBEt21Fl9u5sikvSzU3U7pz48Wk3yaxl6JqnOZpFGOZf
         54HnE5kYqFYnF/IHMdNqcfC2QrQcIdWl2EH58jCDZLbj4tphazp1LoM763TQuWduuvBd
         QeLg9GYSOJsVXQ7kzOUgQyLVl6ZU51SN7wb3o/ahaEgbk6G7hGs8qMwaiu4HZVFGYxxc
         vD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725264; x=1715330064;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOIGpp+UI7FlgvnWTiaj9AF30Udmc4L7gLFm5A9fuzU=;
        b=mLXmyDsNqr+QpTcYoUkpXd1j7K8NZpX4UlfjPdY8zW8mRbCokUYvfX+Ualm8QcpRah
         AWZ9W2+7Fr5nDC3Yn11Wt+DFG8ckX1mVVW7vW1m+mMWBJDO/+EGb2TT+nG9IqfNE8RoO
         o4x2lx2RXh++/RheCaCbptyslu1RZQPwwhGJ6J99Uj2FPcUJsUvVz5L5aYjKpPZu5egz
         A9VVK1DEqCjh8qDyE8QNy7ATubEySJuIPfDPQFHfgFmb8JPdVb1UIE+IButTy8XhODtU
         VIJAOcOgP4bnN9TNjh88vNBm7Q7v/5/SlmJkrVjg3DcQMqiBgUswbe66ATymXPK5WmWZ
         xlgQ==
X-Gm-Message-State: AOJu0YxINfBTXIIq7gssgH9fJj0yic1dpzFQ5mPrw2AcHWqaI4G+73mH
	rQTnUxY9odQQtp8HFMW84HrZxEZ05nOO7BvwIvS9ibZDBnmMITMgYq/4k46Gci8=
X-Google-Smtp-Source: AGHT+IGGTVCKUZpd9nxrLaMW9MPrZZHef1AgJCu+TEJjPw7NkF5hZAooohOdNcL5VycwN96eAnfaAA==
X-Received: by 2002:a2e:7312:0:b0:2e0:3f37:5af5 with SMTP id o18-20020a2e7312000000b002e03f375af5mr1508286ljc.41.1714725264448;
        Fri, 03 May 2024 01:34:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2? ([2a01:e0a:cad:2140:e481:a79a:a1d8:3ad2])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b0041ac4aafd3dsm4818075wmo.12.2024.05.03.01.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:34:24 -0700 (PDT)
Message-ID: <13bf8bc4-1cb7-4b94-8c98-9d1cdae5e1f8@linaro.org>
Date: Fri, 3 May 2024 10:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic defconfig update for v6.10
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
X-CRM114-CacheID: sfid-20240503_013426_721313_D114D40C 
X-CRM114-Status: UNSURE (   5.06  )
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

Here's a simple Amlogic Defconfig changeset for v6.10 enabling the
Khadas TS050 panel driver as module.

Neil

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-defconfig-for-v6.10

for you to fetch changes up to fb73c312a939cfcf9bae0d88fdb382516b424e50:

   arm64: defconfig: enable Khadas TS050 panel as module (2024-05-03 10:23:35 +0200)

----------------------------------------------------------------
Amlogic defconfig changes for v6.10:
- Enable Khadas TS050 driver as module

----------------------------------------------------------------
Neil Armstrong (1):
       arm64: defconfig: enable Khadas TS050 panel as module

  arch/arm64/configs/defconfig | 1 +
  1 file changed, 1 insertion(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
