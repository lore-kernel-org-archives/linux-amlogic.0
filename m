Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2850C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:45:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C2320851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDy2oRMv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LWBTFxmt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C2320851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfneoeMDWJPopL9GV6w1K23RZ7Ro56cbUG59WyW2Nh8=; b=nDy2oRMvNZmdQF
	+5pTuECaDkDbzwLjl6lT1ZMUuoZ8yheb6s76+4B4v3blvHeLXZM1d2fp5ANzHpGWdyFv+TbOQ+SCX
	g7Y3jsVXsccZ3HcvGFXc2pLK9d6hHk4VQDdozfCitrWumx1Im4UFKfbkAXrmWLfv9ImpyXjYnFt9L
	SPyUy05hh01p89FmOppD4bAksBcpU+1W8vlBT8svXXWhSJfV3MjfMaZ08BzIzmFoTjFyYb4YmmpI4
	74Pp0NyP/IPsSKepV5Lz9HhUw5N9UBJ9GlyOwCFrkFs1q0FXZncGn+Xlt2QduUzQ/FqvcuP8igpk0
	kzd/08OVa+m21cyQ0c4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkFTa-0006s5-4Q; Thu, 17 Jan 2019 21:45:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkFTW-0006rG-DG
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 21:45:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so12718336wrt.7
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 13:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=rPL21ki1aX4oJLzX3r8m+1Cfs4ZHb3I5O5QskE3L8Ro=;
 b=LWBTFxmtoOfyZbWPElrNoiBI+uVNot+yh7tmwVW+3pKXPkJoeQa5ZmjNXa0hNE3N5Q
 bozQo2NBA7zD7t8tHdeajCje2oESw/ASW86WgsIW+KC2RMhXKYwuDsLDJyuXUQ2aJUrl
 XU9yEFyCO4sACCAZHngXc98XpanFrWkOXqz4k5Qgbw8si96LGwUc6mVObpWKiJbwX9U3
 ASZQTawU6GROgFKk1XOl7UkhZ8JFOvrIxn0+EQPcpWrTUqyzELf1oApYGLXhY4Gb7zjY
 K2AlthgtxOrYA5beCcMsykRqdEKmI1gc85bgxxat8zan/lZuUVEMp+LaXQuOCfcHBKp6
 CXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=rPL21ki1aX4oJLzX3r8m+1Cfs4ZHb3I5O5QskE3L8Ro=;
 b=O96n7/e1nOF1TQeV+aE7sqGyIThC9fy8ptbgh2Y2R4MNQj6mgaW7mwqXA0jHBHFCOK
 zHFtD+Czckr6/iaARpdtrbQFx2XULrm8tSJ4driJm/K7Ctd/zpK/Gwb+oKPSThjbraQ/
 AU0y8z8HW8H2SHdc5XAyXXnbtO6icYLrQy08iogIXb2cih88CAM0uZwrGvMLXhQdkOUP
 psu89CWzZ+cdQHUDEGV0rGQZi14w3Zcy11QU0b/0f8DNJTS34oJOMdzWTswk+mHE12Nj
 EfEoSq/ftZSofnL8Mj66P5LiGstIqnlXQpTMSXPoH1smI7A4lkHooTIMNbZSYXCrwm4m
 +D0g==
X-Gm-Message-State: AJcUukcbDQETm+KQvMdnjVc3hTPtKUBJemeG4ldv/iAOzjs5BhuS4x6P
 +PR8K429KBiknelVBHGMMKR9fw==
X-Google-Smtp-Source: ALg8bN78J0TErC42Kn2qhyVgFmlOo3FdNsKSHaFh4az+h9weFMyzE+ig7uoKNXkP1/7nkdHtFRwoJQ==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr12828997wrv.101.1547761520408; 
 Thu, 17 Jan 2019 13:45:20 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id p139sm78005569wmd.31.2019.01.17.13.45.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 13:45:19 -0800 (PST)
Message-ID: <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 22:45:18 +0100
In-Reply-To: <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
 <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_134522_592479_0FEBD48B 
X-CRM114-Status: GOOD (  21.25  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 22:20 +0100, Martin Blumenstingl wrote:
> On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > > OK, but we had incorrect documentation in the past. did you check this
> > > with someone from Amlogic?
> > > 
> > > I'm curious because there seem to be two different approaches here:
> > > 1) hiubus name and offsets are being fixed within this patch
> > > 2) aobus is being dropped here and re-introduced with a different name
> > > later
> > > on
> > > 
> > 
> > because hiu exist and aobus does not, for which both the name and size was
> > wrong
> > 
> > > approach 1) can also be used for the "rti" region (at least in my
> > > opinion, the patch doesn't explain why it can't be done):
> > 
> > THe patch remove aobus (instead of fixing name and size) because, of the
> > multiple region documented covered by this 'made region', I did not
> > anticipate
> > which one will be required and I did not want to add them all.
> > 
> > Better to add them as needed, which is want I done for pinctrl as you
> > pointed
> > out
> > 
> > > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > > (both values can be found in mesong12a.dtsi from
> > > buildroot_openlinux_kernel_4.9_fbdev_20180706)
> > 
> > RTI is added here:
> > https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
> > 
> > I don't really understand the problem ? result is the same
> the actual problem is "me" as I have conflicting information:
> - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> as the GX SoCs (for which there are public datasheets) - this is how
> Jianxin added it to meson-g12a.dtsi originally

And it was the same for the GX family. AOBUS in the DT while there nothing
about this in the memory map. Keep wrong patterns does not make them right.

I'm merely reading the memory map here

> - this patch does it different - but cannot check if this is correct
> (no public datasheet is available for G12A or AXG) nor do I have a
> "big picture" of upcoming changes

Yes it does it differently. We should have picked up on this a while ago,
since gxbb at least, and we did not. There reason to create bus that don't
exist in the memory map of any recent SoC.

Creating bus should at least require a start and end offset explained
somewhere. Copying vendor DT is not enough

> 
> Cc'ing Jianxin: can you please review Jerome's patch and give some
> more details on the memory map on G12A so further contributions can be
> reviewed easier?
> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
