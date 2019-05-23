Return-Path: <SRS0=Wall=TX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890B1C282CE
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 01:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBE32173C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 01:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nPglJHBF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PUOdCk/U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EBE32173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mzJz6NBr+ZBoXs/2jRzK9s51QGCD/YELkcqnhUX40s=; b=nPglJHBF2SnCXV
	jS7JOzGPbn7IE6sFTb4NMIIWgxlrai2R//l+Ro+NtW2JbMxm+oJwFtHApwkekB9zX6vvNy0S3gzUp
	rw1TrH6pHUJ+LAFEJ5e5rpUIJoApGNGN/SeIU5zSKrhkCZ7OBF6Jidcl7ZfOiGztZWHdHjSqe2Out
	cPJoN2glN1twHqBP7n5HR2hCmDnTCujaUhR/nOxgvEVtwtFff0FZ9kQyqJVanuqSNIPKzS1neEFGG
	vYDTJo8E5G2DcQM4TQnQjgtwXmtpQAZMQRDr/QgcnX/eOwwTFnow0AnA2S7PsI+b46W9l31huBxJs
	ssWa4lTvPJT0+2gM4Zpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTcQI-0000Bh-GE; Thu, 23 May 2019 01:21:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTcQA-00005I-4V
 for linux-amlogic@lists.infradead.org; Thu, 23 May 2019 01:21:28 +0000
Received: by mail-pf1-x442.google.com with SMTP id b76so2270052pfb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 22 May 2019 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aZA+MNZ2gy6tyuVfxVa4+g2Ok6wQVnYjHxlUytPK634=;
 b=PUOdCk/UEJMFygnW4qCafnKIOUDF9MkSj5dza7t9Rj1736a5ouarchneF9tOUqj8/z
 SwjwewLHDFiwc3/ab4+IUd6mSSbU3wGjHT55wHa0aIKC1NBiPkwHIDEbMwsD2hEcB4Ln
 QF8G7EF8TV+3fes/dMKH9cXzQXwp1u7XFF2Z+TinznOq3GXu9qtm1Bny5T7RiZw8XzNE
 Cxh4wMPEVxaRVCYDbo6IjJEEZzAhqXOME50oAR82x8GVyzLbA7wTLFKB//3urtelO0qw
 BdP2z8abMTXZd7YPnMcb5AUSc4Ao/ie6Fl/4q52kn16qfHT0MciIDBn+BG+YVnjcAlf+
 bBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aZA+MNZ2gy6tyuVfxVa4+g2Ok6wQVnYjHxlUytPK634=;
 b=Wa313K08GY+PyQ/EJGFY/W30kgf20t85MYkwiHWyBOz1BeETNbMW1wFqbhA3BoGAhU
 L6IykCDRVv6OqwVFxIbYlT+VXgp230qXEar4mi1P/ziFvjExQtca0mGvImZBM/ZemPvt
 IyBvzDmbMbHFmO0+hKbWe2HiD4UXA/D89wGjpcNmNb4fud2i0dBvAq6kh1u4GJ8pinIQ
 7LPArd6AQYa4huO61GRk7e1EzGbYQht/+gsYRXGsq6zcC8129Xf7vmRWyGPS+cuBOUnH
 M3iolA92+AIr1D+mj43XuZwEolSAMrsvBwx6SscN6shrPrAjeKRNdhF39/F5OZefvPj+
 Prmg==
X-Gm-Message-State: APjAAAVmXTJ/nAf6mxfQnqA4xd9wGkSTNK++C9g7+jXcpUnmH38PKABm
 udz2PWtU70e7JZOknF79hF/DKw==
X-Google-Smtp-Source: APXvYqwZPRmT7k3u0C+6WYbp7uBd/JRJE1geAcqL1D/11qfWc7DMiFMpRi9UzoUrwq9R8sy64EUUhA==
X-Received: by 2002:a05:6a00:43:: with SMTP id
 i3mr21282572pfk.113.1558574484468; 
 Wed, 22 May 2019 18:21:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id u1sm40517035pfh.85.2019.05.22.18.21.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 18:21:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] 32-bit Meson: add the canvas module
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Date: Wed, 22 May 2019 18:21:23 -0700
Message-ID: <7h1s0q55kc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_182126_314617_78B1ABEB 
X-CRM114-Status: GOOD (  13.51  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
> IP is used by the video decoder hardware as well as the VPU (video
> output) hardware.
>
> Neither the VPU nor the video decoder driver support the 32-bit SoCs
> yet. However, we can still add the canvas module to have it available
> once these drivers gain support for the older SoCs.
>
> I have tested this on my Meson8m2 board by hacking the VPU driver to
> not re-initialize the VPU (and to use the configuration set by u-boot).
> With that hack I could get some image out of the CVBS connector. No
> changes to the canvas driver were required.
>
> Due to lack of hardware I could not test Meson8, but I'm following (as
> always) what the Amlogic 3.10 vendor kernel uses.
> Meson8b is also not tested because u-boot of my EC-100 doesn't have
> video output enabled (so I couldn't use the same hack I used on my
> Meson8m2 board).

Queued for v5.3...

> Martin Blumenstingl (5):
>   dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
>   soc: amlogic: canvas: add support for Meson8, Meson8b and Meson8m2

these two in v5.3/drivers

>   ARM: dts: meson8: add the canvas module
>   ARM: dts: meson8m2: update the offset of the canvas module
>   ARM: dts: meson8b: add the canvas module

and these 3 in v5.3/dt.

Thanks,

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
