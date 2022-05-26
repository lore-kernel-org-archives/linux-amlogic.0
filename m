Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E08C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 May 2022 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhg/cxUnYyZZ0qnjhIJuBl/Z5PG0LaRrI3AHj7DaeV8=; b=ua49hahohFGMie
	63BUrwjXrVJNqtL0IDjp5v5yHY1BoKsuns5Ubjo1BQGlh+r8FWQV0+veqcPFqOo41a/YLXdiMxazt
	wyW8jaAhR5eCoy10AcOmHHtr9ydEBkAo4ldh5p3ahqD77+BPKUmwn4BvebPZK8Uhk4ilvgHuTJKV5
	JPj1gqMx087P6wXg3WIpIw8JB1S6YlwbBn2n14U6tXb6h2ZZ1CJ2BjNlyel5Q62fJSN836G2LuPBB
	u0woqINCS/cOZZW8ygcVMiuWZnP8sFQPEBaXjQ7I1Wg10aypyViYYw34MdSmi8nyG3NlyhNnJUCOZ
	IdMKz1cdMSBB4Uz+884w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGM2-00FPCy-Q8; Thu, 26 May 2022 16:28:54 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGM0-00FPBa-5R
	for linux-amlogic@lists.infradead.org; Thu, 26 May 2022 16:28:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id r71so1785018pgr.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 May 2022 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ZV2y77FSAdklT7BKF+Tws43T4buN/hfHfm1U5B1OUTY=;
        b=2l+TLfCq3eeZ8fnL4KvNPyIePz/kfWJ3xDqUw9rjbwjbepocHIx4xOokRfKmQZXcjq
         sB5yKd3QPZI5WpbmUONnogFtTwkfTufAtkNQonFhta858pKIj2mrLBfwaThv1XLZ5qUw
         HKIfY772DkudNhL4y/3qsv/BKNLOeELnYiOseGovKA4UxOyeMFRh4NyVQGIC8uqaGZim
         9DhOn5r6/7Sk/fsjJsyGjQPLb6Cq8vkxTNiyMwYleEyaUXMu9ZHZuHnsnYj9aY4063pL
         anmx7dkc0QrcCB3o/tKUCMuIy3+/gM0QRdQoNMrZ6w6nZ8SVa+ajkscjDC/GqA7XbnmK
         m6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ZV2y77FSAdklT7BKF+Tws43T4buN/hfHfm1U5B1OUTY=;
        b=5/95IGenvGNTc16I8ZbA1wknT5ZiQGrh1K/91vmUgZ4obJyGuFx7x3i1KZtrmIt/ls
         xjTNzdHdvP+gXlawTrUCT5fNq6/GG7HrLNTtg5GkgNP7F0S/p4fquGxjJlfhXrbatwVg
         A3dwugS625rEMt0PMfB8XueViH3pTTqU/ynKc5FExJ9SP1dCjbBLJ8Rf5ZfsCQ474+/m
         DJOSHlcOa5Hfah6XH5+zYEb/rEarFbyZI2/44QrxPpO/BdHxH52TIRgptU2dhGOJiuF6
         kqH3689Ru5T4jD6ut4X+qAg3Fa2OGYChm0WP5vdGUChz6b+rCR6fUE3Tgpyc1GEkBiEy
         JF2Q==
X-Gm-Message-State: AOAM533IH61OfM93PSqtTG9XUnY0TK0qfM2EGLPhpbqfChnm+L1xBjht
	2KgF1IPsrALEY5rtMf1GNuHPvA==
X-Google-Smtp-Source: ABdhPJzsd/UhDYfCsKi9Q0HQ1PX++LTeTnaX8uCbHKcHAw1xfbhM6zfM0BCJpYZwUgFFGZu7q+LWNw==
X-Received: by 2002:a05:6a00:15c2:b0:518:9911:4952 with SMTP id o2-20020a056a0015c200b0051899114952mr22033146pfu.64.1653582530334;
        Thu, 26 May 2022 09:28:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z12-20020aa785cc000000b0050dc762818bsm1714033pfn.101.2022.05.26.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 09:28:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei
 Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] mtd: rawnand: meson: fix the clock
In-Reply-To: <20220513123404.48513-3-liang.yang@amlogic.com>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-3-liang.yang@amlogic.com>
Date: Thu, 26 May 2022 09:28:49 -0700
Message-ID: <7hwne88dha.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_092852_243091_A8D869DD 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Liang,

Liang Yang <liang.yang@amlogic.com> writes:

> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
> a common MMC and NAND sub-clock was discussed and planed to be implemented
> as NFC clock provider, but now this series of patches of a common MMC and
> NAND sub-clock are never being accepted.  the reasons for giving up are:
> 1. EMMC and NAND, which are mutually exclusive anyway
> 2. coupling the EMMC and NAND.
> 3. it seems that a common MMC and NAND sub-clock is over engineered.
> and let us see the link fot more information:
> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
> so The meson nfc can't work now, let us rework the clock.
>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thank you for your persistence in working on multiple iterations of this
until we came to a final agreement.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
