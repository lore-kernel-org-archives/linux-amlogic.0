Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B799C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 20:55:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E33C21848
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 20:55:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NtrdCFC6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z8fHU3xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E33C21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMhX3+Hgs7Vc5lSEQq7HxevJ3YGhOXjgajP+TRl1urY=; b=NtrdCFC6krCUB3
	KZlfllVlBdjrZfQtJWoOpe+D3mSevu0vQGlj49oKmlS1GS6D2DAkiFvniuTSz2SctXwcw02uFtkBK
	rmjMdHbiqQDnmqOxUaTra7k0apl66sZGAnSQSjzIAtoJMIDX1tLm1SDH4jP0Mk7Aa5cSHT5ccEug0
	pDdHnPF1+ZDDs4tqdtn0+4XeAxsJB/dxra9A0pbUn+RDF5IeA50UnrsSWwZ3bUvi8b06cEHgTIrhj
	KDRMdjsWhPnvtACB3iBjEtXlXEZ/8pasoOn4sGh42tGAQ9TBIO0y/Qq/peNjmUBp1KwKL3qjxwBzW
	xmvDPtNTnRkqiRBwdt0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Gat-0000Ik-AF; Fri, 23 Aug 2019 20:55:35 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Gal-0000Ay-2M
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 20:55:29 +0000
Received: by mail-pg1-x542.google.com with SMTP id x15so6402736pgg.8
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DOMSbUFejjbvhh3syNx2mPd1ccD1hkCqGREmnUI4Bh4=;
 b=Z8fHU3xaHyWUdk8aM+/Zr1k32eHFHXEUQIEGhm0QTklwjF6o2yeRak8xLVTnReEHws
 mnfMwuQHrRUYoES3KexwZ32OsGrcnrb1s9qJzgF9ziCfP9tYYhWZXUSlT/TmnyHCQoSD
 EH2wLU7ldNI647pM/cNY8j+L2MWrI3yOfrObg6w/dFr02If3S0v5jO00vVaybZ04gUw6
 SZaeYbscZ35Rk1qZJNQq70E3JvuhKldBFpRGdwFURY39FdTznEdVQq7XzppcqHi7VNkr
 hf3Uysejz+aJrF8U3J3YFeAoa5fEXvw8IQqJjVHzxN+LCfK73FdybzahiiwbNaM6mbwE
 JLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DOMSbUFejjbvhh3syNx2mPd1ccD1hkCqGREmnUI4Bh4=;
 b=CXiLJUu0VwLvvnn1PgTrXZt9eLrVdUvHbIu7wpNCoWlSp+AMUs9wz6xPrF2JuVNrri
 xhN+DbeTPgVEaYPRNnR9iT0Ed32FP0MXp1WOz78raAWVugkkT/wlFaoc11/7B1N2JziA
 0XiYYwNnt17nEpYDHk7WETK+BJry2jlhE7XaH+e4O2TeDpHVs9DkOxLhLE2BAL9Y/+C+
 t0yIwNGWNImDjD1YP47DgMXTq1gwHQDs2dW4VEo+oGK532eglqpPxoF0X5HdwQlhEHhC
 FnMODu5fF4mWnyBbVcy3grIZxCpOmnfYh0IBbAkhtzvK6/vViZtAiIX7WZnScdggt4P5
 0Zdw==
X-Gm-Message-State: APjAAAWqGPxiUZ/vezzOprY6P7Q2G9cais4hC2eOL5b4oJbW8WNp+LBT
 wSXhzY2kQErWqug1s5KDxeXkLQ==
X-Google-Smtp-Source: APXvYqwWqXwZanA/RIBsBivTmQ7OMMhM9wxbpGObupZqpUyHXrFJ3OB2nqQJqczKD3p98hiZv47Gzg==
X-Received: by 2002:a17:90a:f995:: with SMTP id
 cq21mr5481913pjb.27.1566593723715; 
 Fri, 23 Aug 2019 13:55:23 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
 by smtp.gmail.com with ESMTPSA id w10sm3132874pjv.23.2019.08.23.13.55.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Aug 2019 13:55:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12b-ugoos-am6: add initial
 device-tree
In-Reply-To: <1566565717-5182-4-git-send-email-christianshewitt@gmail.com>
References: <1566565717-5182-1-git-send-email-christianshewitt@gmail.com>
 <1566565717-5182-4-git-send-email-christianshewitt@gmail.com>
Date: Fri, 23 Aug 2019 13:55:22 -0700
Message-ID: <7hv9uny539.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_135527_118788_9EEB88F8 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Tested-by: Oleg Ivanov <balbes-150@yandex.ru>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

nit: empty changelog.  I'd rather see the changelog from patch2 here.

> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 567 +++++++++++++++++++++
>  2 files changed, 568 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 07b861f..21e2810 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> new file mode 100644
> index 0000000..27d1d62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>

This is a bit confusing.

I'm assuming you kept Neil's authorship because you copied from another
g12b board.  If so, it would be helpful in the changelog to describe the
origins of this file.  I'm assuming it was copied from odroid-n2 and
then tweaked.  That's fine, just note that as "originally based on
meson-g12b-odroid-c2".

Other than that, thanks a lot for your work on adding these new boards!

Neil, I'm starting to see a lot of duplication in the g12b .dtb files.
Should we start thinking about factoring out some of the common stuff
that's standard across all these boards?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
