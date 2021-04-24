Return-Path: <SRS0=b9B/=JV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30746C433ED
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Apr 2021 00:09:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820AC61477
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Apr 2021 00:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 820AC61477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OBYUPslSUasBOdnmKhC4ffoTNbljPj8U7CLClvmOk7A=; b=T8hFs2tkTzJQBAlSvD9kqjemT
	GhLlQXksA8oiHlyqEptpmQzFGqERBhi5kOyBy/DOFajpMT0643hWZpp3zeALAHPrshw3loui+FXSn
	nfXi3uxqW+9Qa/qJUkdbYyKgiFUj9fGE3btWfofJz+PneOuzHLPb8bk9fywj6p/p/gQ99/KsJi7u/
	A/HTtawlkaYr3I7B5cZNw+lpt7ImNfv0PxbwA6yV0Gt6j76WOjkOyfLU1Q4+/HyRnuvs0W+FbYHwP
	cYUIsByJrFzUHLTJXLrK0mjqfALCivDPY8MLaaoFb3l6hn26WU+i1/AA6y/SJSpm+4+1u7g0eKliR
	XMPF+IlXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la5rP-002dXO-T9; Sat, 24 Apr 2021 00:09:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5rE-002dWW-7z; Sat, 24 Apr 2021 00:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mUIgi8gr2tgzWKj4+8JDnT/+2+iJBvHpF1dlGi1xl7U=; b=JIIAW1jSsYCT7DPL50Y9Va31v+
 /Bc9tD4fK1aS/DiqOctlysz27TrAdN3wznFoQzODBe0qaDC4yrSAl1FMAA/I9hm2EFmqJHZvb4VAo
 TQIOAzQOD3QjQ0hklWMXafMPiSKBFM2Evdi0V+o3+eY4uLOheoVtiCnhGECH3Kp6HczXAf5W9O6UZ
 Qrev2xBYiiH1jo6eWtEYkSJsSHJnXjf69pWcDkvdBBNp9mJjjpTW3+JNdXTKOGlnKAi1lD/V/nEAQ
 2fTfNt0N66f5SqRVBfJfxRVCTZtLExQJSIOlh6TN0DObbawgN5AwRrSBrfqR4auY2eQ5FvXt6cKnW
 F/OgxdqQ==;
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5rA-00EmSP-Of; Sat, 24 Apr 2021 00:09:10 +0000
Received: by mail-io1-xd32.google.com with SMTP id s16so45217968iog.9;
 Fri, 23 Apr 2021 17:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUIgi8gr2tgzWKj4+8JDnT/+2+iJBvHpF1dlGi1xl7U=;
 b=eIVk3kWDGLkxI6e7AjS74LPf7mENaT1FX8HKi8JueWU4UuoHBig3oizGT1ntPq+hbt
 tFqvOi88/997OlaQMY6hKHbHb0cP7bLW4A31KySs7OgfFqPrP7xXw3Tf7xOvwuYRO7tN
 U8wMXMyT/rmbqquvTLIWV2Pge5r3gtI6p3XlGqMcqM2ZOvKqFNIWyPTRNYFA3jw9elb/
 gf/6N2VDaCiDyEDSBJooEq657o73WG9pD3kV8rb3dmsK5x3luSueweF7aDA6t2mKfM4Y
 c79p1OBa/DJdJCA0N+cTn4qi7jZkVZhOoj/bdrMrHAxn6wt7+lo8xhY/GJiJ6EsvOGfp
 TK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUIgi8gr2tgzWKj4+8JDnT/+2+iJBvHpF1dlGi1xl7U=;
 b=JRdcsjI9sf8pw0P57l2T8E3MU0UloUxAbFd+emNj9VXSxAj+6yaC1DNNlmDy0OOssD
 wqoScCNiaOVQfBedrGMxSeI1ap+3ZRpgO3hGyHMnhblTahUbQyZgQgi05eM7vjyCMtnf
 FxM5UlU5OjxmWcXb1ndAuVnfDTaBDbpAk08SEa3moy9JHJpSZ5Df6Rd7os2tmwskjPMs
 bolVMxuFRPIGu8npYd41zKH1Zwn8BOeCOsoZz/4PeKvcgqtpREolx6Dq19uW+3bu/SM1
 g11BCz4jHDCh4WfzjAx4Sh/nU6SPl9UlHEm+bYLSmi8jPjrU203oVp5IBVji0UvRVQND
 eG6g==
X-Gm-Message-State: AOAM531+V4USNhH/Y3Q9d4Q9klka/q++XrRpCiSS8viGybGP/lFCdEXZ
 z8MohQ2pKYgTfh7x4A90z6Q5X1q17jkbq1BjDdI=
X-Google-Smtp-Source: ABdhPJzpqEKzOQAznBrk9weKRq/P/QY2iIQeqtxS3bPY6W15AZaVS8+fIA29w7CgKa8lN9Gg4oFBEDPlkNfMCTJh7/8=
X-Received: by 2002:a05:6602:22c9:: with SMTP id
 e9mr5125249ioe.73.1619222948139; 
 Fri, 23 Apr 2021 17:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
In-Reply-To: <20210423114735.GA5507@sirena.org.uk>
From: Art Nikpal <email2tema@gmail.com>
Date: Sat, 24 Apr 2021 08:08:57 +0800
Message-ID: <CAKaHn9LC19cduyrwxkDRAdM5pjgSPBCdZUjsEMgGqS7yVQS1-g@mail.gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
To: Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, jbrunet@baylibre.com, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 nick@khadas.com, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_170908_842744_38074E94 
X-CRM114-Status: GOOD (  14.77  )
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

> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here

It's strange - But without spi_master_suspend i have randomly stucks
when i try unload this module - as was written before
i was test it (load/unload module in loop) and for me suspend make sense here

If anybody has another solution - or real problem not here - please
help to find the right way!

PS: i have another way for solve this problem (may be it can help us
fix problem in kernel)

# before unload module need
echo -n spi0.0 > /sys/bus/spi/drivers/spi-nor/unbind
# after unbind driver we can unload module without problem
rmmod spi_meson_spifc # can stuck without unbind driver before ...


On Fri, Apr 23, 2021 at 7:48 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:
> > Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
> > and we can get stuck when try unload this module
>
> > +++ b/drivers/spi/spi-meson-spifc.c
> > @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device *pdev)
> >       struct spi_master *master = platform_get_drvdata(pdev);
> >       struct meson_spifc *spifc = spi_master_get_devdata(master);
> >
> > +     spi_master_suspend(master);
> >       pm_runtime_get_sync(&pdev->dev);
> >       clk_disable_unprepare(spifc->clk);
> >       pm_runtime_disable(&pdev->dev);
>
> I would expect the driver to unregister the controller at the start of
> the remove function, suspend doesn't really make sense here.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
