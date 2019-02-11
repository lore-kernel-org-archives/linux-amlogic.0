Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A008EC282CE
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 14:18:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA10222B8
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 14:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LsUWNt48";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yqJpqGvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DA10222B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rux9cvSnjbPOrhpojcv9cLoswAcjgskq2XpZKzrYx2U=; b=LsUWNt48spcbP8Ji1XWHWBc6I2
	yWoH2sCI+HTFux0Wc8ywC9dqcWDLtsrHmUpPBzu3D+MWeTA25H+IMwJgLyNrZqfgNGgclk9JJwSQ2
	59omEtIj2R7Bgb/r7gbIUPN1Gvv7e1f4n2fzZKdjZ4Hqs4e4YR1kJE4w883YDNUjjhK3MeMCliR21
	ZZr8Jt/ybvlFJiQoj/6W5t7dnee/eyLBoIvpZZBRR23SqcVl1g8hAxdLRKJDTimbehGdSOl2jCVrf
	AnnAoCRZKdAUF4/JGoLlgqU7Twa1l10ZVdjX3r6ltvo33gvtFKw7psms8zAvzK9fU4QQUAzWaRJ2/
	HNcj4UVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtCPE-00089w-OP; Mon, 11 Feb 2019 14:17:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtCP7-00085E-2K
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 14:17:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id r2so4849641wrv.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=puv3gC+Nk3BQy/pOka+RnqNUGH1wGRY9YNG6l/8aQic=;
 b=yqJpqGvSf5YixOGoEcFDrKq5ChskDq62jsL5L3y5M7thAP0oQTeMKOpDimNZuBVE9E
 +QMfyTbR0AhLVdlPtWQyYEJWjcZjbaB+K6C/SbGWg8vyGUMHHuvHVVyjz2g51gLEuTUe
 Pl+Y+t1MIh/zK6U4Bq9tiDqPy4ltj07oAUNZX82Y0HXHCZy88to3r+N1M4C0tYAg+Nav
 lYWfkD7TFIfWN3akMIYJcbnvFGPuZG/9Tyty2+JDqYfixssDX9OUl+8nmvkugWIiO3wb
 r2uYYRZ8Smuv/6oCYEqY60HUPvsVfyHr9iiloT/Cry8s6du1lfpU4pN+zGAg0EzcaxuQ
 gA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=puv3gC+Nk3BQy/pOka+RnqNUGH1wGRY9YNG6l/8aQic=;
 b=BZZzJlATSyuvH1QdG//VxHSTC7fS1E26znuqg/gvkuhoixF0FZflhEkMkRwSqApIeA
 zQYl1NPW8FC7UTuzB6mCjwtOXIdRHKfOmsWdUzrCpLZXGK/3luBUqSNTkNo6tUcWxPQO
 bvRSY9oHfAaKui8ihw/aitLISY8+0WrJuWAK0pZuZuLHKyScyDargcsNUiB1CtwyorpD
 0pXBZ1VtKtet79TqWLTUABfdr9DdpK/3nE2IL0I5WkVwB236g+DUIPvVEnDUO413XMXO
 1yqidNwkIoIt4YZC9SUiCaW+nUiJvgrDa6w+II+Sv0ba+gAb0/cO0oge8BIa1llLWqP7
 Y4Zw==
X-Gm-Message-State: AHQUAubLVJg36tCIp8WF9W6ELBuS4BgRMUHGa8HbQqWoUcxQOGKS/5DB
 YsulinnFSbCwVyNh6fF/P64DJQ==
X-Google-Smtp-Source: AHgI3Ib/CPu+ZVEuPdcvWu+xqlLLULGHwy4ZWV9srPnleOSXHl+Ub8ku+HZuh37LDIVAyXxqsOxi4A==
X-Received: by 2002:adf:9ecc:: with SMTP id b12mr7013674wrf.83.1549894667289; 
 Mon, 11 Feb 2019 06:17:47 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:7e84])
 by smtp.gmail.com with ESMTPSA id t199sm55863947wmt.1.2019.02.11.06.17.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 06:17:46 -0800 (PST)
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190125090755.GB3691@localhost> <867eeo7pjm.fsf@baylibre.com>
 <20190211083349.GU4686@localhost>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <20190211083349.GU4686@localhost>
Date: Mon, 11 Feb 2019 15:17:44 +0100
Message-ID: <86mun2v27r.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_061749_478930_ABAEE0CF 
X-CRM114-Status: GOOD (  18.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 11 Feb 2019 at 08:33, Johan Hovold <johan@kernel.org> wrote:

> On Mon, Jan 28, 2019 at 04:46:53PM +0100, Loys Ollivier wrote:
>> 
>> On Fri 25 Jan 2019 at 09:07, Johan Hovold wrote:
>> 
>> > On Thu, Jan 17, 2019 at 05:54:32PM +0100, Loys Ollivier wrote:
>> >> Add binding for Mediatek-based GNSS receivers.
>> >> 
>> >> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> >> ---
>> >> 
>> >> v2:
>> >> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> >> Moved current-speed as an optional propertie.
>> >> Removed the status line in the example.
>> >> Added "mediatek,mt3339" compatible.
>
>> >> +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> >> @@ -0,0 +1,39 @@
>> >> +Mediatek-based GNSS Receiver DT binding
>> >> +
>> >> +Mediatek chipsets are used in GNSS-receiver modules produced by several
>> >> +vendors and can use UART, SPI or I2C interfaces.
>> >> +
>> >> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
>> >> +properties.
>> >> +
>> >> +Required properties:
>> >> +
>> >> +- compatible	: Must be one of
>> >> +
>> >> +			"globaltop,pa6h"
>> >> +			"mediatek,mt3339"
>> >
>> > I'm not sure it makes sense to add the GPS chip itself as it cannot be
>> > used stand-alone AFAIU, and either not way would require a lot more
>> > resources to be defined than what you add to this binding.
>> 
>> OK, I find it a bit confusing to have Mediatek bindings but no
>> compatible Mediatek SoCs.
>> But it is true that it can't be used stand-alone. I will remove this
>> reference and also remove it from the mtk.c driver code from this patch
>> serie.
>
>> >> +Required properties (I2C):
>> >> +- reg		: I2C slave address
>> >> +
>> >> +Required properties (SPI):
>> >> +- reg		: SPI chip select address
>> >
>> > While the mt3339 appears to support these interfaces, the globaltop one
>> > does not.
>> >
>> > Have you looked around for a small sample of mt3339-based receivers, to
>> > see whether anyone actually provides these?
>> 
>> Again I'm confused by the fact that it is the Mediatek bindings.
>> Hence why I have added it and why it was not present in the v1 that was
>> only for Globaltop.
>
> This is no different from the sirfstar driver for receivers based on
> those chipsets but manufactured by various other vendors.
>
Indeed.

>> I find it odd mentionning the chipset but not all its interfaces.
>> I will remove these sections and only list supported interfaces (i.e.
>> UART). Other interfaces can be added afterward if one finds a board that
>> provides them.
>
> Right, but please do look around for other receivers using this chipset
> so that we can make the binding generic enough to cover those as well
> (e.g. by choosing representative resource names).
>
OK will have a look.

> Johan


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
