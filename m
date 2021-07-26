Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221F7C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D470D60F4E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D470D60F4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVki0F5lbI6F2ROM8otCqkMbvpHKywp5RNUzAcrOa/s=; b=sqOmqU/SbtENyv
	SwCmqqHvxDLHgKX72wkOgbvFdkma49R9i2HarmLphZKP26PmpfCWj8ff6Rj8T0od+D/RkuPGfGqeJ
	JmY3DvmmnSfMFSD3Dkh7NWBLUhiPYhOSDlPB7Sym6S2CahgiiTDpPMNBmDcfUOjlt/VkP+CH7fn/5
	/9xTvQwFFEEXmWG6m8wj2Ji+AXIDdwzKpW3lcjFh6ZI567zw6vpncLmfZvz3mDjimeCT4WAipOw9n
	VgBYjHKynXZGStcg3zB6LtHnUbRNJ9gNT5ZvQR9LByPg86rEFgAQhnCKbZKgy3M68VGHAZxI2GSu1
	EuB6Q5qIdn1ChMZN7msA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vkp-00A7jz-E3; Mon, 26 Jul 2021 08:14:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjJ-00A7A2-NS
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so1391200wmg.4
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZpjgjuUh1n9gqNINTk5X5U12Pvm6cJ3IqcfL4udcP8=;
 b=0YqoY1XuxJBeHq76SOvmVl4M34+V6vmKOYTZaiFZ1LUtCuSLv2DBTHcNDhlcirGVDT
 imeGRw/UCL8jse7nv/NRRhTpJdnLdL9btttorxLzuvMGnyNd9dGVMr82Fb5qn2JmskJM
 vEdTFxTvInmK0fT8VZ0VHmSurzKkgrpjhweincy2paMV87C2Y8EnaQYaVHL6BvSzWHQ/
 Me083lhJaNqeXMWC7ICJr2RYR0d7u6FIsLyM51/0lYTDp41i5czu5iTdQ8eaoJqzyahD
 jXy51AEJZmsfnMVJVdBRk7do1hm8QgAF79Q+pE7JRmRm9AZgLCEyC1llnYOW6e8e3ZXS
 UUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZpjgjuUh1n9gqNINTk5X5U12Pvm6cJ3IqcfL4udcP8=;
 b=oewRT1S63E+k1bSKDN9pUAzg/MYOBwoihfK4tqFwneRgrF5VviqRJmhjVm6HgL1HKx
 8k7gMM4z43BIshp/XoyJHah+2BYm0BXF7QYojKaIUuKD+iN4r/lkatPwveBVrALRjCOY
 SD8JGohNuVusdfxSMY4g7SPHgcVjl3rXRsBI4da+ap84KgKfM6X1Oqkc4aYs6a/0huGC
 bCpbS3KVZf5VKw0pNKk6GvN45ukA/nClBV72gn5hvgKrr0ziBQllAq64SdnLNq0i1M+L
 jY1HvzfPeUHpsRgteGA66T0u47ZerLrvCAvCMM4yWbYB+Uni6WbBRgleOqRcpE7aHabi
 iDnQ==
X-Gm-Message-State: AOAM531OEPoI6Gp8mA4Mft3I7KL5+A0rR0xvSGZBlTPLxuUXAFHuhl2/
 2xZhC2WJXvLs508ytk9yjYHT/dlLYaUBta0l
X-Google-Smtp-Source: ABdhPJy5R+KzB21AsAQps1d0yh3y29yIpafJM2bJRYzHecWOTjx/4VnV6mymD+Jk6eIGtfKAwph5Yg==
X-Received: by 2002:a05:600c:1c86:: with SMTP id
 k6mr16318944wms.147.1627287172233; 
 Mon, 26 Jul 2021 01:12:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com
Subject: Re: [PATCH v2 0/2] Meson8/Meson8b: sound card support
Date: Mon, 26 Jul 2021 10:12:40 +0200
Message-Id: <162728713307.14205.17687651856471455921.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
References: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011253_825642_AE8B30E5 
X-CRM114-Status: GOOD (  12.89  )
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

Hi,

On Sun, 18 Jul 2021 01:30:28 +0200, Martin Blumenstingl wrote:
> This series adds the AIU audio controller for Meson8 and Meson8b. The
> AIU audio controller has been found to work fine with out-of-tree
> patches for HDMI audio (over I2S). SPDIF output also works (tested with
> a scope).
> Endless Mini (EC-100) has an RT5640 audio codec. The driver for this
> codec can be selected since commit 08c56cab302a05 ("ASoC: rt5640: Make
> codec selectable"), which is part of Linux 5.14-rc1. While support is
> not perfect (due to us lacking proper support for configuring
> GPIO_BSD_EN) audio output still works fine.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/2] ARM: dts: meson: Add the AIU audio controller
      https://git.kernel.org/amlogic/c/4f8ca13df1d5ff1c09e06acbd1bc7d4d8510dfc0
[2/2] ARM: dts: meson8b: ec100: wire up the RT5640 audio codec
      https://git.kernel.org/amlogic/c/0bd475db1a5d0cd89b435ff6bfee083aca5d104a

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
