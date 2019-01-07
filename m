Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9451DC43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 16:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFBF2147C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 16:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZojl5p8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ln75HulD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFBF2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yzKRNPXf9CMMoaniXyij/nloL7Zdo86NBgh+MOeUuQM=; b=NZojl5p8N9zwG/6mWwBPme40K
	unuZQpnl6bs+BEvSlhvdQ/RMLAl8OoAdXRs5jxRs7aJ3DJ47oSAt4hUIcpfTsrpWvmzfaH/DUtc1+
	3kWWJnMYPUkBlju4L6lUIxKh3thhDHt4NE4nT1qvffogyGtEZEpDR9K1DBhwXvaEwHS9Fomp0VkU9
	9CPC2LfRve5d/4WEyVpwX7XZRbgxed0CHNvIfhWxj/43aC990fHogDYFd5f2eGsIKZy7HuIy2Hcvo
	1sjvX+a7wQYiMxiJQO7NrH/S9dyW9yPrpIxcY4opNLqzi0+zFmj1a+nhrnte46nlgBVsXcA8jbmf/
	mx+R01OYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXfC-000100-Fv; Mon, 07 Jan 2019 16:22:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXf9-0000zH-Ey
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 16:22:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id p4so1027906wrt.7
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 08:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=2cCUr7PlaXmiRjtgfpz3Nae1G4BEEyhXg8rSKqZZ88E=;
 b=Ln75HulD8kMo5118jQgIXCZQlJUcI3zzOfGV84h9A+YsQGyAuRom1MI3NByIeZOEbx
 I8CYyid/j/wWWwAlfA7uGvHTXdmzU/AZPcljWcOSJj88jTak20ZGXSFwqS7CCf2fIJpl
 IjXL74DmjHKYgfuffzbNbk3mFjArmI8lpYLF5G3KHMiJLqyjCWqChh1BMyR/6ioqQNJm
 H1nT5DZZC7dyPQh5PUioBLtOOocZvDk634WZjHOm+5m1XTnQPXl4lqrRzsR3LX4++jGA
 EXTHsdOU8V/uswf4btvMnxZrNjoUBUHEUd/oDaGunuQ9Rjs61VUWC8k4lcUxdMtxeA+d
 a7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=2cCUr7PlaXmiRjtgfpz3Nae1G4BEEyhXg8rSKqZZ88E=;
 b=UEbZGG+7S9BhoKeHWqBHZSnfV5c2muGKLATVhjFQrQQ/a5ibYdWPJdv6VB2In/OHDd
 jJdfzUUHexm5o5Kt/lRjW9kCPyHDM6SnOSyhPAzj2YFJbsi4vSgusIlDuTyLvqORO46p
 VMyswvKvc92kjjET5Y8d3PeVAysBgSszq/W/uK/OxxQ88XBbWCtRoomSFXw3NBfSuGXy
 FuDluRqtsAJMsSORMwrxBPyzxy1p5YWaB8+ZJVBCpgSs2/0G5L5FhefSycnzswZsZCL7
 hVzqHXbh9QwBhdmdH9XBHLyijHnSFqpKLp8y4DGlXaKL9rzZ9HGtsAYkBFQR9D3qAETF
 fEZQ==
X-Gm-Message-State: AJcUukfr8sptYIieHgpS0or/tcdsgRLqMKPMX38YKqoxhDnAcXCftU5l
 Pj7RkJrr/3c8hbQwJTxiasmAkQ==
X-Google-Smtp-Source: ALg8bN6Xo4Re/va2IqW4tTrg+DLn7mq9r7Vs2LxOISxe2uenpNQHJZSwLoa0ZCbXvWIA4iKPOPiOKw==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr50787171wrt.63.1546878120518; 
 Mon, 07 Jan 2019 08:22:00 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:9696])
 by smtp.gmail.com with ESMTPSA id y185sm6216760wmg.34.2019.01.07.08.21.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:21:59 -0800 (PST)
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <86bm4x6830.fsf@baylibre.com> <20190104091937.GA4737@localhost>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
In-reply-to: <20190104091937.GA4737@localhost>
Date: Mon, 07 Jan 2019 17:21:58 +0100
Message-ID: <86ftu41lqx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_082203_561319_5153CA0C 
X-CRM114-Status: GOOD (  18.01  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 04 Jan 2019 at 09:19, Johan Hovold wrote:

> On Thu, Jan 03, 2019 at 05:04:35PM +0100, Loys Ollivier wrote:
>> 
>> As suggested by Neil Armstrong - this GNSS device seems to behave like
>> most generic GNSS receivers.
>> I'll send a v2 with a generic driver that works for both GlobalTop and
>> u-blox.
>
> That doesn't sound right to me. Judging from a quick look, this device
> appears to be based on a mediatek chipset, so I suggest reworking
> (renaming) this as a Mediatek driver (gnss type would be MTK, reflecting
> the vendor protocol) even if it happens to look a lot like the current
> u-blox driver.
>
OK, agreed - will rename the driver as Mediatek.
Would you recommend keeping any reference to Globaltop ? Such as in the
devicetree gnss bindings.
Or only keep "mediatek,mt3339" for any solution based on that chipset.
> If we ever add more features, like support for some part of the vendor
> protocol or maybe 1pps, things will start diverging. As you noticed you
> already have the generic serial gnss implementation to handle a lot of
> the common bits.
Yes, I would like indeed to look into 1pps after that patch series.
>
>> Loys Ollivier writes:
>> 
>> > Hello !
>> >
>> > This patch series adds a new GNSS driver for the globaltop GNSS
>> > receivers.  These receivers transmits NMEA output sequence as soon
>> > as they have booted.  Power management can be done via the main
>> > supply and optional backup supply as defined in the device tree.
>> >
>> > The driver has been tested using a GlobalTop pa6h chipset on a
>> > Libretech-cc board using the expansion header. Changes made in the
>> > board device tree can be found below for reference and testing.
>
> Thanks,
> Johan

Will send a v2.

-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
