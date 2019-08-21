Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E963C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 23:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F87B22CF7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 23:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjjQH4Sk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="znM/oClH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F87B22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ldpj0ByVzOY2LTCUGO1VuXLJSwOSZYrgJs26veE77c=; b=FjjQH4SkyNnNUW
	d7NghCWBdNYxnp0YpEkBCDf5Qzi/x5fSJCXnWtemCWZWQuWcsTN+ST0LChA7opspB6u520hg3OI0x
	Cg2Ut26zCZV06CL3hbAW2gmILLRVWbfUo6o/f/R2CV/ZK6TZmGUjssGmZOoZ7fifpV4gVVdCNpkyh
	XJIaEZSTbQ4nBrh0IRwZQE5GoV8aEwbQT2aTmRgFj/q0/nYkL4jDD3KBL5mZHGZAId9ZX2LDkmETq
	RTPAPZT22kexqBrueTYWqpu+3DtBu/HJouroTwqmdO8O2n/qLzRQOLpgAO5EkyhzmWYzIVocofzCw
	PHtvbzvpBxWtzu43XZ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0aCh-0005pJ-4h; Wed, 21 Aug 2019 23:39:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0aCY-0005hC-FL
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 23:39:40 +0000
Received: by mail-pf1-x444.google.com with SMTP id g2so2535792pfq.0
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RoJLziPgJY9mLs+fRu2lKqTyEaUKSYiiOnVn7t9lzGo=;
 b=znM/oClHkBR6pN7RG6wDMkQnx6pbsRIaoNYQc2ceYPiPEl7hq69Qo14MyokFBCw2Xe
 FQ20sImAG9QaU+NbtIppKgexVWzDXK7u3I2TJkT7ch4fu0lhJyBfxEQnkTfHBDvjMSBK
 SBjbbFjeIO1/Uug6SqmyTdB2c9tIYDcPZZc5y1rgtbC2kpInFxWKmChK9bLwT7GvdFbD
 zXk4Lw6gFtHp+EJz64710+rpjuMARq6Zx3BHACB26ZRCfJoRZD+X+W7tc6iRJTi2dOXi
 K6vTKICEJmVxIQEBRpUEaBsT6/s5TODqCjYQ7Ba0Bc8KTkwktqpTmNnvQe18Qg4JtDPr
 HDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RoJLziPgJY9mLs+fRu2lKqTyEaUKSYiiOnVn7t9lzGo=;
 b=agSGzImacNvbVJrP+uHwE0IwAmmgIzjzHg3iitX9odvRSnrrFSKFzUaRZwxjP9CEqH
 FfGFghBd5JHL38arSXpjcljySGJnTECoiBlJU7M3CKc5Sa62y/7J8apxHO+fA2qVp8nh
 a7FlvfNQ7RkZpWpfH1KQfLgg/s9j/PWNDxKfzTTbgEzteFjKRupU+OmEZ0jS11LzfBl9
 xZKQmzEc1utQCzNvFpp4kud+Woizd2f5ip87870J0f4IaOCcQHLFwkOlYrimNZErU8E8
 ZYogUf3tAXMTtQZ33b+F09b53rhNHoX8BTdEwlhSImBkKvLyvp5dMek3U+hjkXsq1yNx
 2B9g==
X-Gm-Message-State: APjAAAXTBfQrDbvwgGdCpFCfiHiaDPoNDTpK7zOhMkrUHec4kgKfLAKA
 ZvWHwVwYIUoXIGzyYLg78SSC7w==
X-Google-Smtp-Source: APXvYqxbUoVvUvpMfuvIMtOftEIUIVFxHRXscpTOlg7Xd4x9nP3Em83MNj+d7QIroKxxfU76f9qS/w==
X-Received: by 2002:a17:90a:d793:: with SMTP id
 z19mr2480702pju.36.1566430777357; 
 Wed, 21 Aug 2019 16:39:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s5sm24549074pfm.97.2019.08.21.16.39.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 16:39:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, rui.zhang@intel.com,
 edubezval@gmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v4 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
In-Reply-To: <20190821222421.30242-1-glaroque@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com>
Date: Wed, 21 Aug 2019 16:39:36 -0700
Message-ID: <7hk1b65brb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_163938_615616_CC012C62 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> This patchs series add support of New Amlogic temperature sensor and minimal
> thermal zone for SEI510 and ODROID-N2 boards.
>
> First implementation was doing on IIO[1] but after comments i move on thermal framework.
> Formulas and calibration values come from amlogic.
>
> Changes since v3:
>   - Add cooling map and trip point for hot type
>   - move compatible on g12a instead of g12 to be aligned with others
>   - add all reviewer, sorry for this mistake
>
> Changes since v2:
>   - fix yaml documention
>   - remove unneeded status variable for temperature-sensor node
>   - rework driver after Martin review
>   - add some information in commit message
>
> Changes since v1:
>   - fix enum vs const in documentation
>   - fix error with thermal-sensor-cells value set to 1 instead of 0
>   - add some dependencies needed to add cooling-maps
>
> Dependencies :
> - patch 3,4 & 5: depends on Neil's patch and series :
>               - missing dwc2 phy-names[2]
>               - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]
>
> [1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
> [2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
> [3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
> [4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
> [5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/
>
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>

nit: you should put these on the individual patches, since the cover
letter does not get applied to any tree, any tags here get lost.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
