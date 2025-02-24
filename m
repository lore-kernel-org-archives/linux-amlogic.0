Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE863C021B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGYCqMat04wfpw5IpCa6D8OSLJ2y/hxX4ubddt1IX9g=; b=xtiv+S3HmwV+bFbrQ4nLIsBUmT
	HPCRrBSNn5NeOkeo+jf0SdB8ydX4y6qI+4r/KSJ5vnTn25qFiNEgl4FAFJvnasEl58lAXGqvVeJU9
	fPWflRRKXxWYJ1NeCGtn9MVMVmq0kVuJ2EGcg/VyIVAGOoBZIxKFks26n4gE8JVls2FLBrGf4bdmU
	OjPblPRnbnRCYHj8YZF81eae8AOfZqttjPFYm2KuPcJQvZ9muIhrQRmy/mxyDChoaBO4r3nFt7m0q
	c98HDRbCb6aWwih4Aj+cOC7i04AqfeSWxw+RnQafMQafiANq4rVClzB6meUP3N2oTwmn8rdop6RLt
	tTm7I16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUU7-0000000CqC3-0KGI;
	Mon, 24 Feb 2025 09:10:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUC9-0000000Clvk-2kOv
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Feb 2025 08:52:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso21772775e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2025 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740387128; x=1740991928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfttPucZes4uslCtilxnixZCmYMBBrCsgPvpifvl92U=;
        b=CzFDo9DAUH0A2tUtR/aqrON+AZNavftiDfiCKPUkmvlmt138kNi0M7mm6b4u4Jxs8J
         2NRW3/fedRCGZHIKkvtwwB9ahaHoZ9Q3+eGdsFjpW0KoRa+IxEc6FD5VD7pS4IECP1uT
         f2U2CZ9DDDvloYBT8suUbaWZEwssnwpkaDkuY/+q3nkqBTqKyH7W3ALWga7JaA6Tz496
         UeZprlp8PxmPAl1ZfXHC/SZjG6b8dz12MCDJvhrJ+NLCSWbFLXm+rgEq894XAawxKsnR
         TX1KN+o6wUo2AhrR+LELW3EQe3lq/iw2lIMI7Addxu7HOxKq4b1a/G/PdpRnZsFL1bJY
         Yopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387128; x=1740991928;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rfttPucZes4uslCtilxnixZCmYMBBrCsgPvpifvl92U=;
        b=vDfqIrvSUgMoV1OOUQMvG+OnbkOzrvkHyzt/jbDmmJLfuoKNx18sHCIhsb4p89FPOm
         gLa9GfYF/O5tT3yapdQz2K1FIqev2FQp4HdqqDO3lhTT7c7bhSRdyTRXUFuOqkUhCPW3
         wJU/KMbTkVmVnTVW0dCbBn+gEbU6Q6oHkhSazUxJx5BVAgARkb7e1+0UW5OlVCHXuZa4
         24QeJJWrbsXROEp1lejRvhHRwvUfbRUI49nEx2raeeRUAwxKEitQN6jx4B/+KFWPX5gO
         nClEvoKVFQ2+TDhXJW9VaogYBMHPjr0BWVYPPaLt2znYKN+2wIhA4iuqRCh8DnUUavxD
         7lKg==
X-Forwarded-Encrypted: i=1; AJvYcCUQVHWp9R/rWORb/8CnZaBDWvdRq8o0ZY+ZvDEnCOmxHLCCQ2e/y4JpbGo0SfSJoyQHvV7NeslqjfSOX+eX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqh1hvpBM7/9ISjDr2QdcNWf1rO83m+61fwVwMxpjdbRWLK37e
	sgvk+Y16f87InnplvlFSXQkWl5aZG574qLJwjCJ8ucFKZPQlNlIR2/hZRxjZTHU=
X-Gm-Gg: ASbGncvK4LDb8HgmNI4Il4D2GxuxqG67Bfo1XdaSvOQDR3tcZ5xtV449jQ+1L9F24bQ
	9+A4Juld1Oufv1pfOBZTnZ6lVjz5IXPKgnphKVd/F7A8N6b6w36AmowXvUqGkKIGXKyvNsu9DKf
	dfFELX7KACQezrm+4zYPoepBU0mjrmPW2N9VZa7UApKuXk30AHhD8zPIQIdLXFyImKUGIh28QXi
	XTXGNdwLDvtEoJ3b/iRIJpJLILZmdcSVDPEJvrO28TBh1Hdt4bbYZJQ7x7wU4vap9z+xEIRepyw
	Fmz0Hf9f/2FotjbsqK0NDmIpck7H2BrH14IJzdp9ECkKkUleu4+vtjeVp2I3XtsJZZMkMY5z/u1
	Bf/k=
X-Google-Smtp-Source: AGHT+IGc4DlL71WulAAnKcQ9CzF1y/33BchgEuu9bZ5o2bSiiIB3/0bTM2b5M5+480mvGS24HXxp7w==
X-Received: by 2002:a05:600c:19ce:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-439aeae05fbmr98203575e9.4.1740387128219;
        Mon, 24 Feb 2025 00:52:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce65dsm99552155e9.1.2025.02.24.00.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:52:07 -0800 (PST)
Message-ID: <794bf229-df4a-41f3-a8a4-8b1362eb7f04@linaro.org>
Date: Mon, 24 Feb 2025 09:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
To: kernel test robot <lkp@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250110074458.3624094-3-christianshewitt@gmail.com>
 <202501210513.GCec6kts-lkp@intel.com>
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
In-Reply-To: <202501210513.GCec6kts-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005209_702975_1A7A0ACB 
X-CRM114-Status: GOOD (  11.98  )
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

On 20/01/2025 22:56, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.13 next-20250120]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/Revert-drm-meson-vclk-fix-calculation-of-59-94-fractional-rates/20250110-154701
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250110074458.3624094-3-christianshewitt%40gmail.com
> patch subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
> config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501210513.GCec6kts-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/gpib/fmh_gpib/fmh_gpib.o
>>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/meson/meson-drm.ko] undefined!
> 

Please use do_div() when dividing 64bit numbers to please 32-bit platforms.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
