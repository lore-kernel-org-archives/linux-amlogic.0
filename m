Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81CFC2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s/ba2oQqSnCgNIINPseXltQt6ZQTfUHoZ95mo6iKNME=; b=Htm6BIq8YwoETz
	G3AeU9Pzbi6nz/MwP2H+dE1W63yqb6d+IRwV1g3J0kNx+0+ZI/7XSfGm+ibnrI+rlsgAsayirNdnl
	8uHVM5OSIauiNY2qg71SOzPmYwJXfKOewKAA2JJRgpEsw3g3Es5BxbSB1pJpUeO51/TiifWJcpfaM
	xOPm+k0PXvwIM8kwplLitvj0/CUa4D/gHrDts2ttCu8rG1WdmVvjbcDkxLl2mXqRS2qCetGRbELJ4
	m4YDH0ZtVxTpSXQmiRyMyIuZKddNlR3Xnhzdi5oOE2jvHwTVtdrUqLnyLgl2oxQ0RdYbfqCoMU6m/
	6BZW3W4sEUzxag/yq1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDB7-0000000HESp-0je4;
	Fri, 12 Jul 2024 10:07:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDAo-0000000HEOS-2F7i
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jul 2024 10:06:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42679f33fefso12137235e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jul 2024 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720778800; x=1721383600; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViaHCNAeG8ihbJc6bdCSZIRUdRyAnEBp69+5NJzbeVY=;
        b=wZy889xeiDnaV29cX4C5jslOkoF9tK0gqdQeXJYcmLd72ocqYqEZCYryIsVrNSQrMp
         mUr9JfdunPrvE1Tnksty0bN2jri8HgosnxFc7hVtOFixuEubjdPAouvVNufa4c9fJvln
         J/fSmBHaXp34MflO3LQ/dyLxbyIgRg3ABtsE3oYz6x1ro6IIqTm9zUuJXUrTyNw2FvWS
         iAJzsUby/xEHukEnvWkqhfPiRqvFaK7fhcnWwdS+wORW3HRMu31VOqkZoDtQiiBCucqk
         DITAh+WC0qemS4tTv64gBEGlosyLSN+gRxeii24tgBhlThdAP1cJC08Lv3bCnnscP5Bt
         ctHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778800; x=1721383600;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViaHCNAeG8ihbJc6bdCSZIRUdRyAnEBp69+5NJzbeVY=;
        b=NiToMvj6N8XrE9GQ0Vbhd+1IR9OIp1NPdo+I3+janI6stn9Tao/k7/mD16vc3xQOc7
         v9Phj70/Ud2CQnYGkIWgi+wXK8taa6xxmk8k/C8Lmhoz5RMqeWmgAE1PAnuyUGr+wXFY
         9uJ7h/Ut7hsOdFM60JAbzNxH55xQ7h0cv9tQxpkeQGciCpSkjL92B4IocZUKYpbPIeGl
         MRoNLmp9kDxWCf+UfbL9k25zWofiWt1te+IU7rcbAaaSzO9QiDMNO+PV0ObkHifUvnMv
         PI691VXHu7du3WXv+2hhawR838CfSP95JNLWT4V2HcAGJym/uBQJmD3z0qbNGoPHovfo
         RyBw==
X-Gm-Message-State: AOJu0YwpCIVer86q6Dl39wNJ5DFhb7bBrmmNbI1F4lAOK+U9Rsq8E/c4
	fkDQcqq2G2PXXVQe5kuDdKu57DTdI8pEH4XCEUWX1W/d1JVBQsIyFzw13ucNZxw=
X-Google-Smtp-Source: AGHT+IFjDPNqzHVUPGQZeWkzhMj4GwK79Q50L8ldtb5YVInT6BRpxyTEGawez7JSBfYDoDqBL6iBwg==
X-Received: by 2002:a05:600c:5748:b0:426:597c:7d58 with SMTP id 5b1f17b1804b1-426708fabf5mr69180275e9.39.1720778799904;
        Fri, 12 Jul 2024 03:06:39 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2c2078sm18516615e9.47.2024.07.12.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:06:39 -0700 (PDT)
Message-ID: <220683c1-e250-4c55-bbe5-c36e89391c32@linaro.org>
Date: Fri, 12 Jul 2024 12:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.11
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
X-CRM114-CacheID: sfid-20240712_030642_614496_239CF236 
X-CRM114-Status: UNSURE (   5.07  )
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

Here's a single Amlogic ARM DT change for v6.11, correcting a binding check error for
a gpio keys node name.

Thanks,
Neil

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.11

for you to fetch changes up to 488386d7ec680c8900f81b3fd7570797935bf1ff:

   ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings (2024-07-09 17:30:23 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.11:
- simple dt bindings check fix for gpio keys node name

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings

  arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 2 --
  1 file changed, 2 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
