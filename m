Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E517DC169C4
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6890218D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="frNR0o9t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qY/5uKYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6890218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASYslt8e7+Te9XJgb+vWr8WP/sfp1LQ6Sac7Hs1t/dA=; b=frNR0o9t/nrkGp
	tmB0Vq4V5aFY1iDKu2pxW3Z+HbY5sCQEgFTGsgFsXmDywWLChFlJx+80C/gAJO4yeapwLIx/uNVV/
	dIm2fo6buWqRYI29PouWvsZ1XWs0KVlAKg2SDcq6uRWEJQpJFj/0GfE34BoltWNAPrTlqRuGpXc96
	ojCT2G8/oXHh/yap4lk9WMt0oFzNKyvwLRcdeE8dA1Kg7bEuNQoYaa8yQqTTRhz9EEw8f5jtugN6S
	H2JB0ehunwToSwZM7moKurBzl51mQ2JEXkFuxZQuSqaJZVOf4R5fWs1LOQGUggeFTLYckth97A9Yr
	uN/jZCAQf58pKPDaUuIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1graZ9-0005wT-CJ; Thu, 07 Feb 2019 03:41:31 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1graYx-0005mA-P6
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:41:21 +0000
Received: by mail-pl1-x642.google.com with SMTP id b5so4152044plr.4
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uMuloIya06N5A9GdiaLReWcolG5ZdkK2sZNqmiTqnB8=;
 b=qY/5uKYdvwPV//MjdA68aYO0jpgDujWJfK81NXVxLitrSqpNEiOfeLt3aeP0ssvmpL
 1AjS3nE+JzV/1s96IamSHrIGEluBFk6lrl4QXk0AO3zNQxSmAWbWxc5axe2qr/XtPNYS
 lXHVKeHCJ9m8sOP8JQqekdDeqP0A2oGcw64f22K+KBNNo2gMnu6SWwBhdI23R1G4v7sf
 tHz92TLg5FrzkuLhWDgHVBHZVjIP/vyQRk0IFXtPAkxGACpL40eyTcuVmcjMESaotqiE
 Cwn6Njwr0kFYfQckFSy1td/4pg3FkU7n/NM8D1QjSNeb+Ytt0NdRFw0+8t59denPCxad
 YWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uMuloIya06N5A9GdiaLReWcolG5ZdkK2sZNqmiTqnB8=;
 b=hkp9XpMnK7mVrZc/82wY/Z7kSQ6PH9kCM1JhiPm/q75a4JBHNEVeE9Mw7mKXTVtV6X
 J86NpRtANrx9v/BiS7rqV8TpOpqUKFNy4UUu9vY1dCTdkV1bWdvQ5sM3NeaNXM3D2FFD
 AOrDQrci3zhoY0mauYPMNqiprox0gCmejiqfsE+35pA+3FHoFqHM8tegvOt5IEcqaUlv
 yzNAqbULNy3GOcQd8vECmPf+OuqS0I7Z3wb864sUq3jWPC5drGWkReZ+cqViHYAAQa2u
 +mFo5DFO5HDp1BCxN7Wu2g8q9VwAj6hBY8Lxx3FXcn9bsOKw3rTW4AJOR59d29/Ox6pq
 EwQA==
X-Gm-Message-State: AHQUAuacj9Q4R+MkbX9VD1YfDK6HqGKiWXL4P3UsGT8oJI5jnzZCfohf
 1Hcf5DeZR6bFYq2W1k8OcjK5EwyRgV4=
X-Google-Smtp-Source: AHgI3Ia9J8s2kFyaF6VMICIUMNqZyitDN3VgqC8egcSZOxuOR+YuEMFnTK6K7A7yV8yLxovmBM2DNQ==
X-Received: by 2002:a17:902:bc81:: with SMTP id
 bb1mr14074231plb.223.1549510878986; 
 Wed, 06 Feb 2019 19:41:18 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id 186sm12404828pga.36.2019.02.06.19.41.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:41:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/7] ARM: dts: meson: chip temperature (hwmon) support
In-Reply-To: <20190118225227.6516-1-martin.blumenstingl@googlemail.com>
References: <20190118225227.6516-1-martin.blumenstingl@googlemail.com>
Date: Wed, 06 Feb 2019 19:41:17 -0800
Message-ID: <7hsgx0gt9e.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_194119_894996_F8EAAE34 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Now that the Meson SAR ADC driver can get the chip temperature on
> Meson8, Meson8b and Meson8m2 (see [0]) we can add the missing bits to
> the .dts{,i} and enable iio-hwmon for all boards where this could be
> tested successfully.
>
> This was successfully tested on multiple boards:
> - Meson8b Odroid-C1 (me)
> - Meson8b EC-100 (me)
> - Meson8m2 M8S (not upstream yet, me)
> - Meson8m2 MXIII-Plus (an earlier version of this series, Oleg Ivanov)
>
> compile-time dependencies:
> - none
> runtime dependencies:
> - my other series "meson-saradc: temperature sensor support for
>   Meson8b/Meson8m2" from [0]
> - multi_v7_defconfig already enables CONFIG_SENSORS_IIO_HWMON, so
>   there's no patch which selects that.
>
>
> Changes since v1 at [1]:
> - added patch 1 at the start of the series because patches #3 and #4
>   require the HHI memory region to be a syscon, which is what patch
>   #1 provides. Thanks for spotting this Kevin!

Queued for v5.1 (branch v5.1/dt),

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
