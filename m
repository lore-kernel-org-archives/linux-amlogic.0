Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B93C4741F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 17:55:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E7220709
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 17:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Om1Lm7Gw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XmtwtbDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E7220709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K8tGy5tjs3z95u0XZ52zAoe6iL3PwSOEeyKw4calHDM=; b=Om1Lm7Gwlz4677lQlVQEO8OSG
	mxdnFir6RZ07xpBXxvqi33PeNqU/DL9z4KUf4INrAn1pv0/z9EQcr2K1fmDhi5BMofOgi81hSR3vT
	IZf2FM4HE1Iy8AC57Kmu2nGc95FEl/5EsZ5oLVIaUN8P2/CGHF6YZYbjAhrP/a5tB9RX6HeXf2wtj
	gdWai3qI9MOcm7U5gX7QC7E3v5WMrSsnhniN6zjCtQ9Nf9TXRMaH9AeMfffY6f6IptrAyRt58M+V5
	eTRnJJ7ngqOICJmnveNL2ozo4Zv7qm8IzLnKtoqTHD8LRouSM22ki/gJBR2wz7RPtvX8P2eR7Td37
	bx9Zjgm4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kajTz-0003SI-5o; Thu, 05 Nov 2020 17:55:35 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kajTw-0003RV-Ey
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 17:55:33 +0000
Received: by mail-pg1-x542.google.com with SMTP id h6so1870260pgk.4
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=alO7phFty/V8MxNP5qIJWuT05VJeYMHHqnvuZKSotec=;
 b=XmtwtbDFxGcYMw08TN1AxOf7Ut5YTk3IQ+MYWYUcagVSbmDYd1KMs+EiowA1S5EoPh
 rS8S1X4+CJAm7MiZQrkBI2LNGTjsxqgM1Z03NnvncvLY6NHRpu3gIrnSYwK8efWRCVjN
 4NJwSFuD7zI7NkbLcxIb6y69D5eDq0CFM3POehOl/c0qiCpd/q+R7g0CmjnhJ6ovF+pR
 5pk2IW5AQzoiwYa4DaK5mtvYz/9NhmBKV7xEd+fHNVYp5So0Akjgn3Xf0mowRTXCIAzX
 bp7v60CZnDD3UVwBzuLghxoExC2f4JDijOoBWNXMAYPpgrFqi5aFOe0slr9mLFFIsqm5
 gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=alO7phFty/V8MxNP5qIJWuT05VJeYMHHqnvuZKSotec=;
 b=GNMoai3mafOg7Jy/f6wl2MDkcG3qEK92PNiWUMt/F24GR2+0cumLDizD5EtxfKL0lK
 1CzuGmSUD/ZjRXAC1QWDJoB+oS+0QdlCa24gaTpzhljj3C36bKirbxS8SMzVFokXR6Oc
 Z2CbmRvZRcGoB2rxuv8H50eARn7LmL10+cHA4d9WVBmBHj5oLiYPsD3xhlPUzivM1syy
 IlhWmNAdQvyW3PNl17x4Cg8FB26bonCRmzub01RyJ+klEyzfNbHiI0bzCdsQ+e4q2BgZ
 t6u8W/aZ4V8Gn/8J16X71SrRSiDfQUGj3gYmqwrsByp48W3PD9pUjAvF76ckI7fgA+ug
 wL1w==
X-Gm-Message-State: AOAM5320+xIdzQWTvG8slk1VwWU8D6gmC3FK80lCRUun6XufEmS7xcfc
 NAQ5CwtEArJfxSsZdDSi3Cp5EA==
X-Google-Smtp-Source: ABdhPJy/oIDgFTXccoZSt5l/0jooRzEGnfziBP5cqByfmXvkhB9paB2DlQqM8uSgkV+BqsHf4bYMDQ==
X-Received: by 2002:a65:688a:: with SMTP id e10mr3475759pgt.347.1604598928469; 
 Thu, 05 Nov 2020 09:55:28 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q16sm3175323pff.114.2020.11.05.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:55:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl/meson: enable building as modules
In-Reply-To: <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
References: <20201026183025.31768-1-khilman@baylibre.com>
 <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
Date: Thu, 05 Nov 2020 09:55:26 -0800
Message-ID: <7ho8kbwuwh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_125532_514237_B2D0142D 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Oct 26, 2020 at 7:30 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Enable pinctrl drivers for 64-bit Amlogic SoCs to be built as modules.
>>
>> The default is still built-in, this only adds the option of building
>> as modules.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> Android GKI-inspired?

Yup.

> Patch applied!

Thanks!

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
