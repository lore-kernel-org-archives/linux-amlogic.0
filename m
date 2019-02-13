Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB26C282C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D330D222C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5rhKOdj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1yZNOTCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D330D222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuLz7oqMw94DoE1ywYhyhEFJsNEh3bB90S1bfoEQiIE=; b=g5rhKOdj+TuD11
	AR/+mF287FWddw1hsFIz+9uT7Znl0zsr3gXmPQ83phkk4vVZIldSU62rZyEXW9rTc0miC26M6239H
	Yl9O2/3EGKYV7/o+yqd4SjBdl4P04DiF+TbGtJruoU8pQZoW0593Pl87pRmyCNzESZ6SjO5eNH7VH
	BXoe88dSshJEN0GYKGqndjhlKWVQC3noURDuMjyPxJQ21LYkHY8WzogY4juCzZ9UcTHjzH0/6vkrI
	KTFgR9LeU6V3Xs0mxMFL67cuf3HWhdeAhwIkvIzBPPYIZwK7HmEPgjCBa+K21qqDK1PWHgptjx+2r
	/W4bGWW78QMq3mxzDV/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtq5w-000687-43; Wed, 13 Feb 2019 08:40:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtq5s-000652-TM
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 08:40:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id l5so406154wrw.6
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=6uT2+UA6yn0rcHTMvIP/MBTxOkvBxyWG8VSGdzDRTFQ=;
 b=1yZNOTCKutPPE55+mNpGBKozypxhrvkadz1kxAXp9OiIBLTHXqQlq1/rtzTuQShGlS
 14ZPEMO8DsNsp8phdPu1ZauDmXUy8i8oDvXcvXWp4p4A/4lKOyverx0xQs9Vogdvxw+o
 WUeqouG2DVEYi0tCVESrwU5CZIrRoxbiB7SW6Adzs5EPcAKpv1Dn+ZQuboXj5tu5QHRJ
 hWktBayTuQSfHwyobrvpR+uHZCn3PmoltNaiqGXLxSDDpSs6c3+58xTUPmhS9Rx8mk2+
 zL33koEbsbp8AwK5x6vF8xvBFvZlvVk3wGSpDQ5u7y1DzpHxhRBEHEhlMTLquDHkhlRc
 gqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6uT2+UA6yn0rcHTMvIP/MBTxOkvBxyWG8VSGdzDRTFQ=;
 b=BfR3MAHsK3MNX3vh7WkhWnTWDkksFHCs2lHnlzYYzshSvvZ4Cxzz9I1bjUWN1Ezuky
 lhpQeKttYYaTQbf3qTyzdwJsgwtnka9GeRnPgIS6+WAZmEjbaINgB7LknkvAtntTGASC
 /Oa3h2i9ISvt6W0NHjRL98fft42Rzk/NDgQm7RynYwv/3VBERq8CxFBVmvm0/w4dgtsB
 sHun21yCM4yzCOAJoazuGL4t4lqRbTdZC8tV6B0ksSzoBzt3QIKvjkVIMfemnnbCTfKV
 jLMe0a/H7KWtKt6c6sKt1GlM4heDrBGzqxL9KyIocZGQNw9GJ7i02U/nzquPYRhUa8Xl
 gwfg==
X-Gm-Message-State: AHQUAua+pv7V9uymMK3VHHDs3NLp4W559gbt5AENeRPS59zf3Q8Ta93m
 +oUj/RHFQhQMwrTQbsQuoEbbvA==
X-Google-Smtp-Source: AHgI3Ianfn8sdNuun1GX3VCGyVRzPbztB3flDFRP8+4dH/HK+XuUTwll1RCxyNKW2y9cuM3yi+I5Rw==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr6110872wro.300.1550047235224; 
 Wed, 13 Feb 2019 00:40:35 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o18sm29858337wrg.40.2019.02.13.00.40.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 13 Feb 2019 00:40:34 -0800 (PST)
Message-ID: <fc50a3a7f1efc8d2f6054a944848897ed8baf536.camel@baylibre.com>
Subject: Re: [RESEND PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
 robh+dt@kernel.org,  devicetree@vger.kernel.org
Date: Wed, 13 Feb 2019 09:40:33 +0100
In-Reply-To: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
References: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_004036_970882_BE2F2253 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: sboyd@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-02-10 at 23:26 +0100, Martin Blumenstingl wrote:
> It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> (instead of APB) typo snug into two clocks in v5.0.
> 
> Currently there are no users of that clock yet, so fix it now
> before it's too late (meaning before it's used by <something>).
> 
> I decided to go the "normal" route where we can have separate
> branches for the dt-bindings and the drivers in the clk-meson
> repo. This means:
> - new (typo-free) clock #define
> - change the clock controller to use the new #define
> - (next development cycle) drop the old #define
> 
> resend - changes since v2 at [1]:
> - include the device-tree maintainers / mailing list
> 
> Changes since v1 at [0]:
> - split into a dt-bindings and clock controller driver patch
> 
> 
> [0] https://patchwork.kernel.org/cover/10742001/
> [1] https://patchwork.kernel.org/cover/10772199/
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: clock: meson8b: add APB clock definition
>   clk: meson: meson8b: fix the naming of the APB clocks
> 
>  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
>  drivers/clk/meson/meson8b.h              |  2 +-
>  include/dt-bindings/clock/meson8b-clkc.h |  1 +
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
