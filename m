Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AC7C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FE9208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E06pZmEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bxE/eExN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FE9208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrK4zeEUW3RxHyjxJB2AcJ/pGALWB3dJAuPO1yvfSCM=; b=E06pZmEQI4YMro
	hScbA/LBDcZstA6Q2Y5Akp+KrFU8ESqC2Gcqj20Y2mxYc1A5G2gk0pbzFYb9Rz/Ku5Zw87zZyPFwp
	CgRAqQPperToA8lSUIxRKf45JhylhOd1fa1S4jTpLkKtAXCLDmPzT/YZD9nh8mKA4AkXdMZLmzaCb
	fMa9FLKODXNIanhTczt6GcMpr9S7sJVnxo026ib/79EDN6D+db0pLrwVnDS8+VY/yE8Igui7UBiVS
	MZ9HR7KDk5ZBXYDPkOBgeJn7Yqu9nVG3h+whiStmLqsPyReaNwO62QdNS6BcfS8K3K1/chahi8NvX
	G6p5zuQ2yARhz83nG1eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJnz-00035S-Qt; Mon, 27 May 2019 17:53:03 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJnx-00034t-Nv; Mon, 27 May 2019 17:53:02 +0000
Received: by mail-ot1-x344.google.com with SMTP id r10so15477859otd.4;
 Mon, 27 May 2019 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odU0SgbTEI5GhdwYmf/8HQWqSSD3RqQBq6W2Heqhv/g=;
 b=bxE/eExN9DUllzlPqfF6gBqDQmqz6kf3hkDdqXF1OsTTBF6tFi/jlwB0B9y4Hc1xs5
 wDNnDO4c5ec1MjJTgFAHYbmeozBgLYwg+wOlWfNWDz7p7NJfcI8gkPfUmZhCr8O2ZnRc
 K4h6PoOPb+FOMjip8VMFMe6JOg9IHvqG+j9zFUpmemOfdlOheyrZgVb38w7ychsQ26Pn
 eAXTK35CW404qo4h4pSJDwRZVGOPcXT1juOyfKEAzTDcSxqT2YmvCxcuITKtDRAaViyz
 3PO0j0f4K4yYEgQtf/xfQs2N/j62Pr0SEMMG4M5cMkWC0rbkMZ0x5x50PANo7U04AoOW
 RsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odU0SgbTEI5GhdwYmf/8HQWqSSD3RqQBq6W2Heqhv/g=;
 b=hYdMVve8Yxa0hE8bKlVwZXq7Ob6I3AD4Iupq51s6ttxlzubcAsmwhGF5hFPMewQQKh
 tHIS/PtFjPSbCa9YFShYu8T/R0jKvxbG3jYS8BmCghevno4grH+M6nRijJh9MoHyIHWm
 8RtBOWAp3uAeY5TbIrwOAHAXFkT7SXcge4RrARTpuCxa7nHsyBr0IiWkWa2pMndM8ZYr
 RiHcukr4lrx3C6kLgXqusAQK+bF6XIVnPPNwNWjURS7BIpxPjbDde/5Qq/Gr6kg0jYVu
 P75cSpxGEAG39ljF/p/plMYKKHyeVJcR/+Z1m+tQI8Fr9TIDPtMywk0UDZvhpBzwlLO0
 qH0A==
X-Gm-Message-State: APjAAAUyZYy4rdy09CWEmLHJLhuFMg52a8tFf7vOdQvBCotEtQK5tAgz
 1ToeWBlfKT3ovfu2r0JMX4RiN5MZrMVQ0nooK9ggFh7k/qY=
X-Google-Smtp-Source: APXvYqzN00Cuv7RkZRm5zYVZtYYroc43LSaIjSU8KO/gl+bM0ccpLPNKsokyqH3WeTCV0u7HXvOhGtnnXYEw4k8FwJU=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr61251110otb.81.1558979580496; 
 Mon, 27 May 2019 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-8-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190525181133.4875-8-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 19:52:49 +0200
Message-ID: <CAFBinCAYaLd60ABFxEB28p4J7FO1PRaTZ+N6Ak1AnizAKGaxnw@mail.gmail.com>
Subject: Re: [PATCH 07/14] pwm: meson: add the meson_pwm_channel data to
 struct meson_pwm
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, 
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_105301_810072_996FBF77 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 25, 2019 at 8:11 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> @@ -509,18 +509,13 @@ static int meson_pwm_probe(struct platform_device *pdev)
>         meson->chip.dev = &pdev->dev;
>         meson->chip.ops = &meson_pwm_ops;
>         meson->chip.base = -1;
> -       meson->chip.npwm = 2;
> +       meson->chip.npwm = MESON_NUM_PWM;
I messed this up during rebase, the macro name is actually MESON_NUM_PWMS
I'll re-send a fix so these patches can be bisected cleanly (patch 8
fixes this typo accidentally)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
