Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E1EC48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 21:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13F802085A
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 21:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbun++Ot";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xY6ZFOG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13F802085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sXei1KCBCr9F3lKyOLvIkDaiU6m65ip34w8WuLuaeI=; b=lbun++Oth2qUrU
	mkQx1I3xRcLpdUCWKCHi3Jy+JWN7EDcvuUL2YuhtAkUwlgZbUFSUA0trP/yivPIqY0hZV72xH5IsU
	2rXyJzisGiXq3pFCX0AI1UPM5SqISz//AEBFb2+o0R5Pv1NnJ0MRWd0KpCadwyHGtPtrpl6G3+ud0
	FEYET++Nl73RGrxONWtw91Su5d3Uly9a6zWn6vAKhlldncPKGwD3qlWaVE65KEhcKq1PLrIAN9srU
	0fJzwPPdfojHsl3au9vW7NNrdIJ+/2CbNafBF54YHmn+zWiEsGt+xTu5T38CCZXnKvbKpBTXUoKrM
	tN1e0gC5zv5o1QiiagIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgFFX-0007LH-Lo; Wed, 26 Jun 2019 21:14:39 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgFFT-0007KN-SS
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 21:14:38 +0000
Received: by mail-pf1-x441.google.com with SMTP id d126so75642pfd.2
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 14:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=53I8P7pVHdGr7CVELeueN4wlxDxQMmB9ii8M+PWqbOU=;
 b=xY6ZFOG5gwi9WY1w/oyM0PMksBgCTOM4D5F9p+wyTLhFAUqb+JD7TVbED2bIK0io1D
 RSTwzsvLgLLO15BzhOaqgK+oa8kN/JB7gv7Wni9AN+ElyMnVBe4Ws/C9I6a0HUwTw6I9
 AMGIqHn7ITUR5LFjPQvVPcZS1VBPaZBXg5sTVRAyRXfQNHRlsO3ZP8kQfwFCQH9zFfoa
 22eDV/1RVi1MDxr/BvGCwX4CrRq5efjE50ztlA2PBF8gOx6QVVQW/jPq3gJFXESRHfia
 kOt5SlBGFbn4OAfOI58DhcBt2BqWHIKh5dR4kVU8OdS91i7aqddmxZKrsF7B9VfGTX9I
 qxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=53I8P7pVHdGr7CVELeueN4wlxDxQMmB9ii8M+PWqbOU=;
 b=MYWyxtMU0I4ECeKhoba/qAXFmvRGzrB8/VHb1BOMcJlX81nO0t9VsDHBSrcI9Onwrn
 X8Emwi1VQpbBcQfEfI2saPFpG3xRwq4zzeNYGFTX19HXtcuwS0Y/nzaV203K77SKriMZ
 5Ml2poYxjRwCjb2EJtemwVnTeegx7owDHAjhYslB9BoTCrK/lf2B9kBOBDtKSXoecXg7
 vFh2JeyG/KShK3lACVM94MOX59Xd70ClsSY0KgGRx69nmUtFpLI/AhwjQt/f1UPtnJAt
 +I7hBEvNu0ykT3VaYA2xqn4TgNSmAQRLre5QyBrhaA9Z4tq8HOyBfCZnMkDKPzNhamnc
 eEoA==
X-Gm-Message-State: APjAAAW3rE1upJMf+2guSftPRxEfS+gMf+i38qAdv2ktEOPYuotoUQHD
 IhTN77CHqaKc0sm11sGpMGgmTQ==
X-Google-Smtp-Source: APXvYqwoz8b6HwaFbl6/xSrXK5m5dSsBDeP1IPKiXBbgJg/1ORZQsQ9RHcK2/6YI5p5a5tr/C/G13w==
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr1354630pjb.137.1561583674831; 
 Wed, 26 Jun 2019 14:14:34 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:559b:6f10:667f:4354])
 by smtp.googlemail.com with ESMTPSA id h6sm3658379pjs.2.2019.06.26.14.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Jun 2019 14:14:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: Odroid-N2 on archlinux cannot boot on using linux-next on sd_card
 / emmc
In-Reply-To: <CANAwSgQOaPmuYC6HQ-mPpCn_h98nvrX7_F7zy790NPdh0U=Fsg@mail.gmail.com>
References: <CANAwSgQqJn8PBUJGWk2ew1RT1Df_-uyHoA5ECovTG632EnS=rQ@mail.gmail.com>
 <99a6ca7a-3100-975f-c7a6-aaec04199719@baylibre.com>
 <CANAwSgScwahG8u-C6kRktDShezAS9D0o42HUkPnScRxhJEAAbA@mail.gmail.com>
 <CANAwSgQOaPmuYC6HQ-mPpCn_h98nvrX7_F7zy790NPdh0U=Fsg@mail.gmail.com>
Date: Wed, 26 Jun 2019 14:14:33 -0700
Message-ID: <7hpnn0oxqe.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_141435_946247_84B8E749 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Neil,
>
> On Tue, 25 Jun 2019 at 14:17, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Niel,
>>
>> On Tue, 25 Jun 2019 at 13:17, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> >
>> > Hi Anand,
>> >
>> > On 25/06/2019 09:43, Anand Moon wrote:
>> > > Hi Niel,
>> > >
>> > > I am not able to boot using sdcard / emmc module with
>> > > *linux-next-20190624* kernel on my Odroid-N2
>> > > when I want to boot using archlinux distro.
>> >
>> > Yes it's expected, the missing clocks were only merged today (cf
>> > [GIT PULL] clk: meson: update for v5.3) and will appear in the next linux-next.
>> >
>> > Neil
>> >
>>
>> Thanks for this input, I will check this with the latest linux-next.
>> And then check my changes are valid.
>>
>
> I think the clk change have being merged into linux-next-20190626
> but still I am not able to get this pass the detect of *sd_card* or *eMMC*
>
> Here are the log: https://pastebin.com/Sw0wA4nM
>
> Any input for me to look into this?

Probably more FYI than useful input, but at least in kernelCI, odroid-n2
started booting succesffuly as of today next-20190626:

  https://kernelci.org/boot/meson-g12b-odroid-n2/

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
