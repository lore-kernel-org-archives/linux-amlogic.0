Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D49DCD98ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2026 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvuwszZy4jVXQAbOMtbwcYOXqIPzqTiG/KiM1CdDGnY=; b=l1xfQX/RMVs33A
	zAztWLQ6nyU4I/yg1j4wOBKs62FeBsgHTDD9lFdNd+Mrj4LyjMmksTXMkBdeLX51G6FhfKPM62O69
	od6zbmCZjCVEog1RA7m8P/xshpW1/vi7HiaSQkV9EtPn+mcMLPJaifAErJ4axn7HWaUXCFHScXAG7
	Rc4YY8QVBvyjQ7eOygrZ1Do3cMH79BBIeZvzl0yrPWZdT6GQOJCjnqZMKUuAT7bzG5+FF8APtfaNF
	/5ULnRoo1c0fHN2OJb+260BZ8p4K02hYmwvkC/eT7DkSR2CBUZ6CisXJ9SQ4Tit2x6Xtvm1cHJKsC
	nSz9L+JY/NgBINBsc/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHuV-00000001iC8-0VTB;
	Thu, 18 Jun 2026 18:56:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHuT-00000001iBU-03Tz
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jun 2026 18:56:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b7866869so12092225e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2026 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781808974; x=1782413774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=LIWVcKVwpVJw/LTX5Ox5fUnjBI5l9K2tEa2XTxPhDVArfOC30vec8bnogmOn/SdzZC
         1VE33x4PxNokW/tsj0ine9g0kTOESO518mULxh/FyDDTjFvSn2RAHhhVnxcUEYM/ZTNT
         jaeNRNaH/3iURi3NMXycNzE/pfQ9ETUmjmjylWZL7Tw3giwVx3mSob5gyPqst9eRLpaQ
         1sHMOwsIKEZbXkC9ht7C7UQMGojkTyRH0R8S2OnLBj2Y2KArJCfsyw+UvzCR/AA7K1HK
         Ggl2GVGzbV8SNEoKx7nAYLZ8O3A0DVwp3jfnUctFWnGeEeiMTEDvwYe3dwHTy8N3UOG4
         fgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781808974; x=1782413774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=T+nsduZWvmK6FYtVbBiF9wX6/XHTd+PkYbVhhIQNDRw8ftnfI4vpIBlM8pExEWvOIr
         FslfxcGM0E9JH38e+wfqDYqa7hnz55Qkzsj1cznMTjPoX2/MYDsfvblJmIGLOq7WNJFq
         MYxrv/OJDKe3XChbq68tuTvLPFEweM7xOH3TCHUaWWQzwxFrfS01QFrcmeU/wOXzftuC
         PKU7/iL9m7AC975iiU9foG0+Ja/AUgyUyecQUmNHwhmyi2cF77Ctye8brki9QjUXsOwP
         mFXOLEw/adaDwujtAHbWa/MfAPEVCoZeph6r1j48O2uCLqg0f7OjDX1N3As+xQaq/HpR
         /NTw==
X-Gm-Message-State: AOJu0Yw3GljWVmKolHPSvft6QgJElFZI14d7b3YNYNUlqtwWvrPlN40/
	XAnEM4CwgKyVLNnWV4w8l0V3uDXsnXcWYUNo3MfEiiOloMswqNDGaLfX
X-Gm-Gg: AfdE7clkhy4RfmYok6JMF1miCJZzxHNrmIrvHdGWQvGDkLIX/OtU7c6UBE7XN2h/DPc
	BhbHDBhAK2cyIT7PeDRwbGElEDMnk7KxU3BlOGDj+6u+7L0bf0QMvH028tE7kcmETYiUjG3FnQ9
	Tnft6nZnXVA9dkp7DWv1LN/uaUmyNLwF8db4i7TgZW4r0gUEtoRjzgfiuDyvrtzh5wXDLwd8+Kv
	3HfUV7wv3WEAE2IgMn+DQFcNZOFS88OlzsQg+d7vqebo11TDtb7j2pMnEzR85+vHsrGMRMjusou
	48TDD6Ys9cSTZ0bhxiUex3DTRcH8lMbTIGigOde8OPK4qwFy3y02QqTwIWyxPfPdzHRwHKtiUHe
	mMXDZJDSW5dknRt2/umxyhSQtIuX2SZO+U7Qv6nnLhGYci52oS59lJrgovW6eWXhqIcnd2t0Oi1
	iwbmTvDJ5Wh8Ke5oRJPhDscwVzd44loonejaU9AfnljeO0P6+FeNnuOQYwA/n6WlkcsVGxut5HP
	5vkdyw4k5JyopoABQ==
X-Received: by 2002:a05:600c:6090:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4923f4562b0mr19793815e9.9.1781808974258;
        Thu, 18 Jun 2026 11:56:14 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm9756965e9.1.2026.06.18.11.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 11:56:13 -0700 (PDT)
Message-ID: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
Date: Thu, 18 Jun 2026 19:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_115617_069707_C4901054 
X-CRM114-Status: UNSURE (   5.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jian,

On 6/18/26 10:49, Jian Hu via B4 Relay wrote:

> +config COMMON_CLK_A9_AO
> +	tristate "Amlogic A9 SoC AO clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV

Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
selecting COMMON_CLK_MESON_DUALDIV here.

- Julian Braha


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
