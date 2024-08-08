Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409A6C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/kHxlgalq5WWyHiYvwRhX4OWNHrXgP5FHi0cnIu9kA=; b=qmHw1uTtgLCr3j
	8oskPYIK1Hrf7blacUbSUEBZ9czF9Frau2UXyLCCMFG0to2hce8KmynltAVqZRiGbPLevkxJo49rK
	XRS2+adSadQ5SefEKVCI6aNlyfXgbaGviBBBYvkAjEAwfwvZYvSe1MFlHQ8Ql1asM/8OmvMwosVUa
	2yl+dlW6cIgnZjmbAdwoCm3z8ddlT/nJSNCuBoJVTuDCcA4YTQxg8D7KuYa3oTil2Dj/nGOmBm9yd
	TJZRo7pS7fNeTuesACDTKdLQZUN6/gFxvXpaXUiVbDW/E7LX156iX3GbGSwhw4kQpvlEOHTLslxTs
	kmgF+gNcnlVqhJnxn/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc02z-00000007prW-3E4Q;
	Thu, 08 Aug 2024 10:07:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc01w-00000007pco-3U8y
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:06:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-369f68f63b1so409209f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723111558; x=1723716358; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=HT7Za0DCTj6vFUerYZcuXEaDfDobwFQchflbUG7OrgSO51MgKQa2a0ZqV7+ucKFgPD
         1MZZQL+JE8Xc3ao7uF9RBG/kRE7awyB0EdtstB2xAoB0dfywzrtCWDYfc/AkBm13yTdO
         43BobGq5eaRaUO3p03jljgTwI3SuqW27FP9mSxvLfSWIH0HuzimjZDBVp4Isq1MaNBWn
         IH5nCkGzt+2bWk940ajTmT7D4pwN+6VRWQMtv0NtNBXnoWcW1giv/gG39EAoY1MjNewn
         y8Icv5Oxu6LJUPfL303JE4qyeXdIj281XBGunlPV6f5RW8kTn8I0e3pao9FrhTUY0hG0
         7Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111558; x=1723716358;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qPsQ8QVE2zEks663h1JC5K+bSl/B5g3BfpyLqR4k0g=;
        b=MspQFi8OVQ4UwAGn6qoA/O1AbuKBh5iiId2vyialjI6/ddtwC8jW++4FH4Tr8cuTTH
         cFC0D5X59S3Tp4yeWVlLYK4P17ba+eA1qveyVjev57joLx5QE7BQ15O6khA1ZsjHIRZ2
         x090c/9EudGpVBxG92R8skSftfqiK3ZSeL2g74AqaRQ4q6iRn2OM2hfJ4U90fr7IdhxH
         XolxVlAWSZcOwfSJWQzZOSQSY6L49A1Cu9IBIxbsLpMtiGxhD0tdVk4JZBjkw+jfDmQS
         7WQ58reynHoIOZIrXTVtds6hhxhyqo/bbMSyptQxao6YliwpPrzCwhCNATP8aXYrg1JH
         +o9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE1CMuwKIK81UO1fbRqF68ZM3Hjef/9l7LdnMTQb5za/SW83kr8XYICepfKDHkMWmIjM4iPQGxnuknpDoY@lists.infradead.org
X-Gm-Message-State: AOJu0YwfVKYdTUyk1zKs8IjhO29oPoUfrJPEjXv8QT36kxHfB7ieBTWT
	/3CkuX0tY14oiD9MkQgo2laYIlNj8Ct8gUO+iK5gvz6R489ryoEPrGeegC0ZyP0=
X-Google-Smtp-Source: AGHT+IHuYbrCTlKt5TCgiFSu5JCjZWHBFhE44QTQFbwLXgNURs2glTBXxCRbpAs970Ya85dt2iUAZw==
X-Received: by 2002:a05:6000:259:b0:368:4e98:6e9e with SMTP id ffacd0b85a97d-36d275900a9mr806392f8f.63.1723111558368;
        Thu, 08 Aug 2024 03:05:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27209a5esm1390336f8f.80.2024.08.08.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:05:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Wed, 7 Aug 2024 20:05:36 +0200")
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 08 Aug 2024 12:05:57 +0200
Message-ID: <1jplqjxray.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_030601_014980_74BC6E1B 
X-CRM114-Status: UNSURE (   6.38  )
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

On Wed 07 Aug 2024 at 20:05, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The following structures are not modified in these drivers.
>   - struct meson_bank
>   - struct meson_pmx_bank
>   - struct meson_pmx_func
>   - struct meson_pmx_group
>   - struct meson_pinctrl_data
>   - struct meson_axg_pmx_data
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
