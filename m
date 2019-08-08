Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF2C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 21:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D107721743
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 21:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hsgb4rlG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yVsG+UlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D107721743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBLTi7RPUiU3NWrFeXe6SsPlkbljlxMEVXwIm81kFxQ=; b=Hsgb4rlGzTBZB4
	okZTEkorZ6c6xef7NtENCtp33Ug+Sra8b1C5g3KPMP7TM663DVP5zms9ZWrnODvWOeIUZpf7QNFiK
	S6bC1gTQS9CWZU/AKYENJjeTLrKDZMlxmJF0iPcHK1U8OFxg6fI/UJKWEfaPqtXlv7FjNfSDV9R5W
	eA0oScTgWl7KejVrsiaSg/3fh26pblOLt2litUleak7pqqZ3FfWbrg62m10HdcX+dA41YpDPbc7VN
	b9asHHbwBxmonneAJc8jIMafLI3r9LyGG90Q1RCxnQCKTws5zoQQrLvW2XTdSB0Qu1GMWIcEBgqT8
	hylnMBF9slioNeuD5MyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvpoM-0001vC-Hf; Thu, 08 Aug 2019 21:19:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvpoJ-0001tz-D8
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 21:19:00 +0000
Received: by mail-pg1-x544.google.com with SMTP id d1so11885147pgp.4
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 14:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vwaIEfS1FAZl0r/hGbrJVWd7+Oh098wPSMDgW6Rp92k=;
 b=yVsG+UlRQMtUxQczwRr+tGNXUpgb5JuGIZ9Hfs14iduOWR4txHlXpZxwWUtDpHEICM
 0MfbhxhGzwCJYtqk5hFjfeD7f431qxlD05AvrQtalNSTduDiqTXEzg9UGnLeuDvICMHA
 amsVyPWg0D2y/C8YKdGFbHSa+zooR1bVvWW6htALbJFbSc6XmTp7bdV5UlaBBO7BnVib
 Dw7ZdWKCoPW25wvAOjSzgAlahac71LGMqXF2ZndJhZxbF2KxWBMg6tW8x75BCxGLlWci
 qvlzvbM2kfW6rShIo0jnFME52p2//RFT4yhtncWCGiQOIjt9x5fflNeS7IbAM10OkQf+
 hL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vwaIEfS1FAZl0r/hGbrJVWd7+Oh098wPSMDgW6Rp92k=;
 b=hLD1OCmPtvp2x8MKgydztJVK+PbXOJt+ik2SmvwQKDpdULINVW2wMLwjwr+9ClB4Ck
 Nir2hLoJfX92G4k+PfF1X0wpcQg7J6+/36MN9a7Rdv10qb/9smWOGPRhColcWk4xx6X+
 B1M+Lc37IpwHAAHIxrhSsppsWWwdVZ9ylq7BA8ygvUK6q4kyB2AXmYwNLOp0plx2Ap0q
 N1q1Wqz2iakYDvsO94vqvlRLB845jPm2bTmPTcDkWcKVpUKhZbXg9A8y2VoUmDUJZ52/
 PwOX0pWjWjUtfbn2Vd5Fm3aDyYGGd6eWnK1Ox1NYoO8DCW+LiJyFzG40oo2bKXzY7tLs
 yQSg==
X-Gm-Message-State: APjAAAUeA2q3ONei4hqHTwEpNaq/KvyAuLbBVBiBXgNnOW/ZLkaYzVc2
 DEWFmxg4gtoOqfoXz4rkz0v8Sg==
X-Google-Smtp-Source: APXvYqyy4N7d0TMp06csDZZcZzQG4KzhyFYusr8lIgCgQLzqwyDXrb7dFwjXWCDy+6BWpdpaIBvNUw==
X-Received: by 2002:aa7:8705:: with SMTP id b5mr18439724pfo.27.1565299138091; 
 Thu, 08 Aug 2019 14:18:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s5sm79644816pfm.97.2019.08.08.14.18.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Aug 2019 14:18:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 jbrunet@baylibre.com
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
Date: Thu, 08 Aug 2019 14:18:56 -0700
Message-ID: <7hzhkje4ov.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_141859_441843_74445C0A 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
>
> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
> the CPU clock in a safe way as recommended by the vendor Documentation
> and reference code.
>
> This patchset :
> - introduces needed core and meson clk changes
> - adds the clock notifiers
>
> Dependencies:
> - None

nit: this doesn't apply to v5.3-rc, but appears to apply on
clk-meson/v5.4/drivers, so it appears to be dependent on the cleanups
from Alex.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
