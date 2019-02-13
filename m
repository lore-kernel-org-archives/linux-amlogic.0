Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE8DC282C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 15:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDA9222CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 15:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hada8Qa4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pflZjFWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDA9222CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P19Ex5Nk62BmGUDb5l3pumzHkeVR4AeIQOeumMfwSBs=; b=Hada8Qa4QOY1xQgOK7a93U0rki
	S+5LGS1fvKmkTkAFergKJX2HaAV9qv4yw3jb8ShqF59tDvMgfpZwyl0X1l0qBZTamoiAPKE4eKoRK
	ThABLC+USt+V6EBtiI+cRLE0+IFcgbr5VqmJ+UdaUeCpHp6GuM/NSHlIxvk8MIWHjLR9Ntwj/t7ru
	rXQYhHkfbiiGhrB+WLWzSBxSHYhHcDi4RAP/2TeeRQcAAHCB0HVJ7Ki2pyTqiKQ1oBhNSMt2RR8Y9
	XEGJXjApPaz++C68YYqhhCs0JICiQAuooLSaB0Y8UFJhV77FlfR+QZaPqhZXthZfYROoUtxEhcmLj
	CTYI9fPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtwMg-0005Q7-O9; Wed, 13 Feb 2019 15:22:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtwMd-0005Ou-Le
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 15:22:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id x10so2810196wmg.2
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 07:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=zCTBS95HOfXoiRWrgEvh7FtEvMXNrSB3FuomsjeF4Kg=;
 b=pflZjFWWDAz/fM+e1VlkgbPbYLDnO0ygiMMDYgv6ga46W2+QUy8S3KXuZ703g9uUhm
 3jfZ0xeqSVL9Dwl7BKPi93fpLcB3G08C+dokFOibYDnFUMW5p0MpkAcbJJxlNLSbCX/0
 9lQGMeVvmLQ5aHDCzua1uRZWLQ1XQmZNitJr/6ANUuGSwOIDIe1LRe2RAWQ77YWCftMl
 /TCDvcoiIrZBDmSw8I+N6gxz83JstFEf2S+PmGUNl/4rrovt3VIw+o5oxiqiTx0Kh9aT
 VycSaU0vpupvUIJ/ZYKZA5QUFkyCYBpksmS7WPbMIcjYWZ50ZRB89nDwAVDumo9tieTY
 +6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=zCTBS95HOfXoiRWrgEvh7FtEvMXNrSB3FuomsjeF4Kg=;
 b=hDUhWlQWDM2AkNvFLYIfAWRkPdsZK/oaPoC9ulHQCPcy8VUA8vXAA7J1k03m/b84y6
 WH7J1hjEFczL/0IiqR1Ie6St9+WkZg8gDSq2MK5oxzPyPGGV+wjef4VOGsD1tW/bZEOU
 518p4V9d7yB3+zsqbhE3NKzdqUieVpf95NhXCm6XrZJuMmLyckVRPNs9xgYwSm2mN0A/
 8D3pwSx5DCmkxeB6RGlAwZ7gdrgbe2J3I9odhkkNeWQ3Ixkx2FDYbMIT6ekPVjYOeybN
 654YCsb08ODmnCni+k5BJJosFw7Nzwawb+PZrBf+cAFOewT/w6TlHzAJjjw31ku96nMj
 Wj/A==
X-Gm-Message-State: AHQUAubOS1R5isaADLNpOAs/9/zGVYVV+Lif1ksoYVlMGG2q00NNrWMJ
 1MyTKmt0pVEOvxm70unQiQ0Bpg==
X-Google-Smtp-Source: AHgI3Ia0hwslWfHZSw4X5NkH0y6KRX9SyiTgQVjvvivQf6Mr8gWhRHhp/1Q4bQf04fh3UtNFwlhDUg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr733736wmb.148.1550071337998; 
 Wed, 13 Feb 2019 07:22:17 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:4505])
 by smtp.gmail.com with ESMTPSA id u184sm17675746wmg.45.2019.02.13.07.22.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 07:22:17 -0800 (PST)
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190125090755.GB3691@localhost> <867eeo7pjm.fsf@baylibre.com>
 <20190211083349.GU4686@localhost> <86mun2v27r.fsf@baylibre.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <86mun2v27r.fsf@baylibre.com>
Date: Wed, 13 Feb 2019 16:22:14 +0100
Message-ID: <86sgwrsogp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_072219_708966_BDB03DBF 
X-CRM114-Status: GOOD (  11.00  )
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
 Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 11 Feb 2019 at 14:17, Loys Ollivier <lollivier@baylibre.com> wrote:

> On Mon 11 Feb 2019 at 08:33, Johan Hovold <johan@kernel.org> wrote:
>
>> On Mon, Jan 28, 2019 at 04:46:53PM +0100, Loys Ollivier wrote:
>>> 
>>> On Fri 25 Jan 2019 at 09:07, Johan Hovold wrote:
>>> 
>>> > On Thu, Jan 17, 2019 at 05:54:32PM +0100, Loys Ollivier wrote:
    >>> >> +Required properties (I2C):
>>> >> +- reg		: I2C slave address
>>> >> +
>>> >> +Required properties (SPI):
>>> >> +- reg		: SPI chip select address
>>> >
>>> > While the mt3339 appears to support these interfaces, the globaltop one
>>> > does not.
>>> >
>>> > Have you looked around for a small sample of mt3339-based receivers, to
>>> > see whether anyone actually provides these?
>>> 
>>> Again I'm confused by the fact that it is the Mediatek bindings.
>>> Hence why I have added it and why it was not present in the v1 that was
>>> only for Globaltop.
>>
>> This is no different from the sirfstar driver for receivers based on
>> those chipsets but manufactured by various other vendors.
>>
> Indeed.
>
>>> I find it odd mentionning the chipset but not all its interfaces.
>>> I will remove these sections and only list supported interfaces (i.e.
>>> UART). Other interfaces can be added afterward if one finds a board that
>>> provides them.
>>
>> Right, but please do look around for other receivers using this chipset
>> so that we can make the binding generic enough to cover those as well
>> (e.g. by choosing representative resource names).
>>
> OK will have a look.

The only mt3339-based receivers I have found are:
- [0] Globaltop
- [1] Locosys / Pololu
They both only provide the UART interface and do not list the I2C/SPI
interfaces.

[0] https://cdn-shop.adafruit.com/datasheets/GlobalTop-FGPMMOPA6H-Datasheet-V0A.pdf
[1] https://www.pololu.com/file/0J641/LS20030~3_datasheet_v1.3.pdf

Loys
>
>> Johan


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
