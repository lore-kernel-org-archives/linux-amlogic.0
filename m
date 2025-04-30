Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1011C369D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGol+veRuaFNv2XZGLjLa9L7oUBmjwr0pMXwJ/5Tc4E=; b=HknyRV2+HeQOECd/EP8jdTrWpa
	+ILyBAhRtIQqbhYEg5QHUBlsInoCyzglcaY2Qo3rhc3yi6Pm7Eix52tN8/bxnw9JisdnuzJ8N8Grt
	xpgi1tSnKyNrBSNzuzAC4yp/ucFFDI9Ngs6HTV3FYOh7e7gXyvcYy+IjA9tjscToC4JWpHq8RMdsU
	omLjFjsAu3/Eyo/YJhaksSrJIkGKTGkRPz5JeoawU8AUxOx2UlQCw57YsUv+XOOdJ/YN9w0x/7Ny8
	ozkMW0xzP3OPWHIkCfJg+SF7q3bRXx4E+uWjtzYdlP3j8d6KRH8KKjcAcwgMjAdpK9i6maxAU0d+J
	U2GhcZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6AF-0000000Cltq-1YQP;
	Wed, 30 Apr 2025 12:03:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6AC-0000000Clsw-1Zf1
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 12:03:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso4923981f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Apr 2025 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746014622; x=1746619422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWDnYWos8iR+frz7BzDPn4ReWhpPnx9d5NcrN5s3tgI=;
        b=xZr0FlgWqz+4dnF4kcyrbMI74aLxEdJrDnh3ZdN+xIrpgGG5UDVPhPxpgCOIq8Kdd0
         n+Wp4GGTT4khPmEHxokTkD9iFBZyf/FszpL4gSne3SfpVPHiJF2Jr7SDu5xCBB41GYqj
         KujhMl2Omhym15fOCFksbcDA+BiFopd3dDOClvSKR90F+TVjc/wSdRCOgwprYtmIfOBc
         vM/a5ZiUK4vv+zfqvSq3GxzuGRjIFspQ23pw9qd7ps309h2SI9SwhK4OZKVoVRMrRc1x
         sTjLNtRFtYKBz1U6H2Q0pPCozgfg3ao1C0n1bvdKFXdFbPnZtoPRBBxQh24YKDRYzBzz
         LVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014622; x=1746619422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xWDnYWos8iR+frz7BzDPn4ReWhpPnx9d5NcrN5s3tgI=;
        b=XMsqF3LOukZJANNvGE+rhvJ3t2DBAaO4U1aVzHTTZ1MIveM9CCrSdqa/AERykkUR+G
         9pDtVUDkh8jpj35L9Tnno3kkF80oD4u/4oBltwlQoOVXIM9f+grsDZhTeNWhw5H8UOJ+
         fmq4YBNfrm7bOqt/k3rjvYqPPWdgcL3u2guXbaJbrIq7wBJgwF1I3zWsucsEHPndx+qC
         G7/YLd44KtTtTaRGr5uENuVZokBJ85z3rtF25qHsQ415F5jCse3UHVCVQus6W8kY9BQn
         bk3cuUcp+MU8WW5xkF6kgcZAnmEJzEY4vosDGFquOysykBkfLGBPI1d4h9YdrjFR0+yj
         aYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeYoGsoqv+dGFfaU/9AQHQCgrEO2FfwzFDL8yunECrCjjQRgtZBg9LVFBRFHzgN6ejkueH4EeVdOO56DZV@lists.infradead.org
X-Gm-Message-State: AOJu0YwLrtvVWssXlp5b9bfnr976gFp9X124Ku7nLrU+0PSAIxaGAMTd
	Z8e/UCQRqm4IXSKXYX/KeHH+nqLG6NwBuLEQA+Mp2P+0MT1JW0OZhBP94oADN+Y=
X-Gm-Gg: ASbGncsCzrPgmNzh3MhBlg2GlYFAOCdAmF7CedPrTscI7rsLfi4WMOao5B3JSWhwfdt
	jbW3P19X44YrccwCG1J4fKYihhr9WVgezrUu4YMw2BEJWIlaQ/YrDn8SRXZunpm9+Bqo6xECTvF
	Ptg5cRZAuxisBQ/XN6fnX9srDGpjv9O1TQIdChI/1bp32y8Jb7UEBt2XGS85H3RpA9Rr+8BO0LY
	f55PBN+W0q3a8cJhlnZwHFC4TgJBJ2zIhWILm/CfXRYNSSASJG/0kmS1K0uJAqds+XXT5H1XaT9
	BBM2jL5i5VkZSk9T0AlqcswUR7ZG01pi7PoFIZmt9TfV3xKZ5dvqZlW9taHsx/XB81dJXtH5Mhy
	5WalSo1LCWa2sLFGANQ==
X-Google-Smtp-Source: AGHT+IHruzbgGycV5GwA3xvIcHV8g1ppqdtLBRwTcfGnAD0uiOIOK3hbSEtCbs1o53hPhXAs5Pr6pg==
X-Received: by 2002:a05:6000:430c:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-3a08ff50ad1mr2119279f8f.47.1746014622188;
        Wed, 30 Apr 2025 05:03:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm16870012f8f.77.2025.04.30.05.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:03:41 -0700 (PDT)
Message-ID: <98628a5e-4f89-4085-9ebd-0a03e3e5de88@linaro.org>
Date: Wed, 30 Apr 2025 14:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: AML-S905X-CC-V2 emmc issue
To: Jeff Sacksteder <jsacksteder@gmail.com>, linux-amlogic@lists.infradead.org
References: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com>
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
In-Reply-To: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_050344_420360_8DD84A72 
X-CRM114-Status: GOOD (  18.29  )
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

On 29/04/2025 20:59, Jeff Sacksteder wrote:
> I'm having a problem trying to install Alpine Linux on to a Libre
> Computing Sweet Potato AML-S905X-CC-V2 and I need some clairification,
> if someone has been down this road already.
> 
> The sd card is detected, but the optional emmc module is not(per dmesg
> and /dev/mmc*).
> 
> The suggested distros Libre suggests work correctly, so I know the
> hardware is good.
> 
> I don't know if they have magic patches, so looking for clues
> elsewhere, the current Gentoo image for Arm correctly detects both
> devices.
> 
> The first obvious difference I find vs Alpine is that they include
> PWRSEQ_EMMC compiled as a module, while Alpine does not configure that
> option at all. My operating theory is that this hardware needs some
> bring-up power negotiation before it is available.


PWRSEQ_EMMC is definitely needed, so if you try to mount an EMMC rootfs,
then yes it won't work with PWRSEQ_EMMC as a module.

The most common way to boot is to use an initramfs which will load all
modules for storage drivers and then boot on it, but I assume it's not your case ?

> 
> However, since I don't have a cross-compile environment available, and
> it takes 35 hrs to build a kernel, and the Alpine build process is
> convoluted and weird to me, I would really like to know if that single
> option is the solution. Otherwise I face multiple 35 hr cycles of
> building and testing.

35h !

But why ? you build on an esp32 ?

Neil

> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
