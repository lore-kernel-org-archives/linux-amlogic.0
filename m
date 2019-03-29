Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF0AC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 20:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B086A20657
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 20:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMxow8hK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dXR44ej9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B086A20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNNqdNruCBgNzfLu6is+TUgC7l64zG3XbOSHYF+xO08=; b=gMxow8hKC2uiQF
	1ow0LChmwDB9T4OM3y4N/nKY1noU54PEVKEvxYEOovN20u/1PNqWR/GR1SYdBp3Y+v/BYqHeZXT+V
	8xN7Hse1t8TaArJ1sh9w9MRCV+E9pdeBZGMleI+mX3XQkBDsUYmiIYPp4XHqXfRoTOoFkjnSQ9v9L
	plqVaGylQGMo0TjlQ4lYPU9RxRv3hMSxPliDRcoWbGJTR+BDRHOPhVWdNcDuWHpbmLgtAFeQ4Wrqa
	Vb4TLy74/RVS3Tul/+pe+cxim1I/DTc+FLoeIeA0A2KeEC6jlzcwZmwQ/kcW3pVxwRxFat9m9gFcH
	SQcfdWo2Er3jhlIaMiag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9yZN-00075o-5n; Fri, 29 Mar 2019 20:57:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9yZD-0006wT-A9
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 20:57:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id z5so576012pfn.3
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yOQHIHqs6rJaZH1VdOTite7NVnkSWVgMNqjDuwcXG8U=;
 b=dXR44ej9qLc+ja0JxocAvzju9L4iOyYI9TEZIQBjBCVO9+QvNhKapqjpDaY3MZ2Dsu
 iGnLcjYE7gv6o154g85DmtbiRybRxlrHhzFH1gw2zdUFtvSuK47WNx2X476jkfxAl1LO
 3j26FE2ggjFGptIouKrRFd4d+ycgGSaRIvXfKpxJy6mbnXN0clHHmdzhd01YqY/oFSIF
 i+6NKoh5d27EwnTDIRZHPdo6tRIJuXfRdUl0OkoIpSUAgluE/T+RrzhXuq1w/VaH/yjU
 P+2NraFKe1+8/8LQ3tuAUBvC4fcyfYjGyXo/5in8s5tQD4qQx6QvF7XbZlu72v/dHnEV
 xG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yOQHIHqs6rJaZH1VdOTite7NVnkSWVgMNqjDuwcXG8U=;
 b=keT+mSPP8UP2Q0dDXYeLD0fIYWUkn69NNRy8ToNuwrAgW73OiPS2OnWwuEEC5ogCs+
 FUeUrUpxJ1Vnp87r2Q4hV/sGrjOE792vmssp2hJTVNRkjLzOjZvXzx7ySaLiNnPEd4M6
 JjpIJPh45W/oqbrqYmVdSccx/SPkkWqMcdA6qNaav8fDo/6PCGhZ6DBrzG9Ffwwn9X5w
 J4z1Omhuw2+q547NoWaZqp4yhdnXiwUFBNbeul+DaJoNdWP77ufOVGkegLusRP2glSFP
 sYSAJ/7+Ok+oRe098h5OX3NHqBIqEJLnk8Z73T/ePvx74ZJe3JFlu3owJhc1IBwl7y3D
 4ZRQ==
X-Gm-Message-State: APjAAAXsBVG3ZrBSvdmUmvsRLDC2zWg1wIEypDqoHWj2OtXxr8Frmqpw
 jgTffRGMyj+9U5V+t0GEya1eV94Dxvs=
X-Google-Smtp-Source: APXvYqwUHTIyRfhErGvZU8IE6qbbE/vosE+F//qOmRab0/qjFkzRqKqLU5PDrKQcBqjhuGwjAvGgsQ==
X-Received: by 2002:a62:4649:: with SMTP id t70mr50738429pfa.100.1553893054191; 
 Fri, 29 Mar 2019 13:57:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id z6sm7366443pfz.65.2019.03.29.13.57.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 13:57:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: meson-g12a: Add CMA reserved memory
In-Reply-To: <20190327102157.15908-1-narmstrong@baylibre.com>
References: <20190327102157.15908-1-narmstrong@baylibre.com>
Date: Fri, 29 Mar 2019 13:57:33 -0700
Message-ID: <7hk1ghwg8y.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_135735_480845_0702F5E7 
X-CRM114-Status: UNSURE (   5.84  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to handle Video Output and later on Video decoding,
> add a reserved CMA pool with a similar 256MiB size as other SoCs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.2,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
