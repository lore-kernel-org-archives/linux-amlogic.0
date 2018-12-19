Return-Path: <SRS0=yw6d=O4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFB5C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 23:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A4820869
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Dec 2018 23:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HyqYs6Pg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XabPlfjq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A4820869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZmSLep/rwMJOR6ANSEodhrGEDjk+juenqIr9YMqCVI=; b=HyqYs6PgPltljL
	Wgkaz6HjjH6GH1rq3ntidH3eFekAd3Ksn98GHWIuMuAiM/O8jwiNEv+Up2uLpHtnNGogPr1yTMxrA
	oP6qgGVHOn+wMJdtKKxFK4A1R3ap2CvE50jT3qVs+t1VruuywCxoKp6CpLhrWw30Wp+YCzebyCVcq
	6YKsKGM3WksHcYkBZOc4TXjtOxP0jKHCXihgMgKNCVpiy+7U9/Uo2UTzzdoUKod7DaQa2dZWh/xPX
	8Df8HD/Qwmu7+prwxl9aROAA6Nc86nd0OquJRZLcj/R7oTDnvVKoZDhx0+ei25zXk0PjnVau/8sQy
	B8xhAttOZuwopiNKABIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZlK1-0000mG-MT; Wed, 19 Dec 2018 23:32:13 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZlJx-0000ko-N4
 for linux-amlogic@lists.infradead.org; Wed, 19 Dec 2018 23:32:11 +0000
Received: by mail-pf1-x443.google.com with SMTP id z9so10565059pfi.2
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Dec 2018 15:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AnhRXD8JtTDZx8cD48gAZvL0e/SPIdCg74t+erkzhw8=;
 b=XabPlfjqjZ2sDUIEKjY0NlvuZaTbnCC84JlBVi1M8eYwlpdarY4LY3GKzR20v4p8oX
 UwF4A7UuK8Il1O5AShvDPU6WlYn7PGPmH4TVojoJW1YyyuHvp+r33kAMJabnEihOL1KX
 VnPk3ykcVPhyUVZ/r+J/A+POlQKn/J1NzLZlfjSPH0gJHIg5NAfIYE9lR3rwrW3zBiyN
 Ysv469wHriALdEgluq61GWgCBeBI721NSBFWt6lYgsTTreWT0b6Lq/FkBPKBzAgdI0NJ
 TNlNkP1aLIIqzUH3wOH1JQNejzkXCG68LCTjbLE6lkhrNoEkTfxoFDTIAh/xATp5TIVi
 69TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AnhRXD8JtTDZx8cD48gAZvL0e/SPIdCg74t+erkzhw8=;
 b=NBZORaU4IgP/WPNphCbxJexYlOj0aGEw7YzzxzKcp2JhE4TmcqjYqvFQaYSZTrVMER
 2gkjiLppdOPZx9Bqw8EXl/5GR0gGMKD9EcXpMCOwr6yVZR3n1f3di1cT8uUCOl6UjIgm
 1vHhkhsCe8d6JF5TH7zaOWKgEMWC3PXWFdEC5OwZwX7ImuCsDr9CXmyF3GIwrgUEAKf6
 nsHyheZ7mztGsmmyX/dLgM0U4l2N2I7Gd5Nx5nV69ADBwgDDeR38wXNq0K/79NHBY/XW
 P5YsAvAotOTRUTd3eSU4pBXbyant5xuAvTt+KG95+w86xnsW1aLul71cnuFduXsc/3nO
 LLzg==
X-Gm-Message-State: AA+aEWb8AJ4fkLf27JfhuJI3WzHV1N1DOIcYy2+itewehXRmpnS8dl0K
 zTTLhf+APDGE964p7d2FZNG3Ww==
X-Google-Smtp-Source: AFSGD/Vk+oAwHw2fSDYe/2wyNoPZCwhQbXe7pcXZ9REiPskAlY5PhXYHaTvVnVKsVN2Mdw15m+5HiA==
X-Received: by 2002:a63:c10f:: with SMTP id w15mr20926225pgf.199.1545262318198; 
 Wed, 19 Dec 2018 15:31:58 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:4dea:8076:74d1:94e1])
 by smtp.googlemail.com with ESMTPSA id w88sm31550074pfk.11.2018.12.19.15.31.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 15:31:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
In-Reply-To: <877eg51olo.fsf@dell.be.48ers.dk>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
 <877eg51olo.fsf@dell.be.48ers.dk>
Date: Wed, 19 Dec 2018 15:31:56 -0800
Message-ID: <7himzpt7o3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_153209_803606_520B46DA 
X-CRM114-Status: GOOD (  14.84  )
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Kevin" == Kevin Hilman <khilman@baylibre.com> writes:
>
>  > Add the G12a (S905X2) based X96 Max board[1].
>  > There is no branding for the manufacturer anywhere on the product, so it
>  > took some digging to find the manufacturer.  But since there's nothing
>  > about the maker on the product I've left it out of the DT name because
>  > 1) nobody will no that name and 2) keeps the DT filename shorter.
>
> s/no/know/

Thanks.

>  > [1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
>
>  > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  > Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>  > ---
>  > Special thanks to Martin Blumenstingl for extra digging for the manufacturer
>
>  >  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
>  >  1 file changed, 28 insertions(+)
>  >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>
>  > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > new file mode 100644
>  > index 000000000000..fe94765b671e
>  > --- /dev/null
>  > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > @@ -0,0 +1,28 @@
>  > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  > +/*
>  > + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
>
> Amlogic? Shouldn't that be Baylibre?

Yes.

Thanks for the review,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
