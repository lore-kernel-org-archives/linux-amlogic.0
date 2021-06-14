Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF3BC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C29661378
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C29661378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hcuG+4Oj/d59erpnfhffWHY2k5ld6+FHkUKEofjU7Q=; b=qqnXsjFsAS7gfc
	SaVTni9FzY3/cE+Vdbo1QZB6n/CZK0xm4gnkjuYcKMPPYTTHlWb+lM8YG6wn9jLVvKWP8fSxD4k/W
	kHtlXgB1HsAImcIs9gjW9jvcqHjWoZnFONflVnUYxvqgOWKs0ZMHpG3hFyyJkuVPRpuBJjUA5lXae
	NAIx6/t3MkszckDe659/J3v9fGyS7p70MO6PWUBV0uyN7sxhjMf/bGEKYfodAp0MP2S4eNHs1xNuT
	mDXy97i8/XbkQx6x+HktLaGIKke3ngHvepXcsF1HLjZURl+74RHZ8hfGkHYd8FhbOHVzmBF64ZMkt
	FZitc1wve9J5qdduoQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqWJ-00FSJd-9m; Mon, 14 Jun 2021 17:37:07 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqWG-00FSIZ-2t
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 17:37:06 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso446207pjb.4
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jFxOJ2sNlaTP2oY/1tOoZt+pjnC/fp0BF0cd3UacWKs=;
 b=PBufRmGAhMtuvaAA3A9gVrHkgFthtx5a9k9CdTuC7Zk6bWxhjqsUwjSkCMgQYLqD6D
 D/Cb+nXpHp4ofir1Yx0TZ/W1PfpzP3535b+toBTglbx4ind/t2CkaBO07RwSXL84pzH8
 QmxQO+YJ/ooTDsUWzgyvJ2rKRGieHBzxIWWPdlvUUsipsA/0E+e9ZCnNe0JkRtIeL0qp
 JkuxERee00bdtOznIBuNfwWcL0P3JNRsjDT1R2MEW4NKhDAic+VM0/KekJLmc4OMCfDi
 nPEDFQh4tnCU9soyFaFR/JpatLgo+QaGqzTVxCU6Z+7H+TOA1qjHCZfs6MvDDgDduaHn
 u5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jFxOJ2sNlaTP2oY/1tOoZt+pjnC/fp0BF0cd3UacWKs=;
 b=HV9z02lKNwS8ERz29UD7klYUuXiJsDMrFB9nlEBxldEeTqH3D4EDGsYPklpQ5Yk85t
 sPm+E1VvVOP9Kp8KzWbunFlYoStEtblsZwZwUGwBM1296h5OMG82ip9JcXy0PKq513n6
 poMBrZaNU9H0OzoEHFL+/F1M41nyX0z7DkyX3ih2Dqin7gX/sRk7Vz9ZLu6zhvmb1/Lo
 0MOnuhxko7T2fdrmAGqxqvB5LJdS1lvWaEmMSFt08fI8etyCDBQxHOgRHOwf09BLHesf
 g42ydXAfcBFmRqcvatRn+Bma+6erKqcoXb/FYYBzMsHARdcJa4KQZv5W5HsIc39DPMcb
 Umqg==
X-Gm-Message-State: AOAM533e6UbAMfXaxvbD1D03m15J3BqnBU3eFmJxLimGdNsC2l/+wZIs
 ZHnb/2Mp2Q/5Yn9P5cm9WVxIS11M/Q8D3PVVXLQ=
X-Google-Smtp-Source: ABdhPJznWNeTiit7/SGu60G684FYkuKoY8YSsBjZc3t8NAngrtT4QqDdIbNZcZWdN8/t0QD2Z9vO8Q==
X-Received: by 2002:a17:90a:3801:: with SMTP id
 w1mr258363pjb.138.1623692161330; 
 Mon, 14 Jun 2021 10:36:01 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:3410:5b3a:5eb6:9380])
 by smtp.gmail.com with ESMTPSA id 21sm13521088pfy.92.2021.06.14.10.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 10:36:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: meson: remove COMMON_CLK
In-Reply-To: <20210609202009.1424879-1-jbrunet@baylibre.com>
References: <20210609202009.1424879-1-jbrunet@baylibre.com>
Date: Mon, 14 Jun 2021 10:36:00 -0700
Message-ID: <7him2gxsan.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_103705_008599_AE8D3460 
X-CRM114-Status: UNSURE (   5.85  )
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

Jerome Brunet <jbrunet@baylibre.com> writes:

> This reverts commit aea7a80ad5effd48f44a7a08c3903168be038a43.
> Selecting COMMON_CLK is not necessary, it is already selected by
> CONFIG_ARM64
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
