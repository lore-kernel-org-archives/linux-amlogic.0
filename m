Return-Path: <SRS0=Wall=TX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A7C282DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 17:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D9C20863
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2019 17:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKDaGfgU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fh557pb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D9C20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daGczydcdEeqxkI2zUCLgaZ3gcWehYIQSfRoxUkFSFg=; b=fKDaGfgU6ucR/h
	rPcaEdkoJvKICgJLLqEgQ1FIpaS6+D15EL2pUYGSsqoKdHw3soHgpR4NbSdBNuc1d9TYWTaH3h/dt
	OC7B0CZ+R2F6GcaSwqNJxO0yDEh6xN1nwhmnSeOXPEiNE19bJzEPxKtNcyHP1cQAcBxAU/ymjTimZ
	kRoTpErXBKV2QjLMDa7KdZ2UjU39RjWYqP01mk5n36OpBRaXVm4mvyaZm2IcZ0Mto3dSNUSjCgY4k
	Cy//uPDs2Xmcb/vd4pRR3S5y71sjoKOR1alLEQ5X2ayBvuVq5Hh2i7PupinXLS2HCnnPxggPB/uT2
	fSRfs/AexRakAOQURi/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTrMK-0002Oo-UO; Thu, 23 May 2019 17:18:28 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTrMH-0002O2-Sx
 for linux-amlogic@lists.infradead.org; Thu, 23 May 2019 17:18:27 +0000
Received: by mail-pf1-x442.google.com with SMTP id g9so3586301pfo.11
 for <linux-amlogic@lists.infradead.org>; Thu, 23 May 2019 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YloeaLv8j/8CdU/rR2e95VLQQZQwEkYX+NzJuaPndDk=;
 b=fh557pb9rJEzVtAf7S1A0gQ3SQrSKOPSNOy0iJ9MplvDyGbbcUToSF3oH3aszBWnGv
 AEMEqWvT/GY43YQxI54XOwjq/8R97X8gM1DQUqV6IhdaQLXX4w42VJseNaeNpnFt24mA
 Iu3m8zZvxZBPO0ZpsvSUpXU6EAiWC/iETra1JV/QYZ0zw7FERrt+WNAXKgc4sJbvxqFh
 aDnHVh6wKGCQS04MwZpaAYaVNxC3BW5BDrlbScTfY3IC8DR3kAg7UmwCuB/FNepIlwzA
 cgMQRhStbURFadohc8tJuhMWBrbjTurlRm8zW9/Z8jgLkQUhobpUP2K1EqR1W1GpCVh/
 VR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YloeaLv8j/8CdU/rR2e95VLQQZQwEkYX+NzJuaPndDk=;
 b=bqmjmHm0OgRL02oydHQNP2vJRaKOdg9bp8IMpmYRj+UY16QiaZl7tzGVhC7J868k7t
 B7XwBkDM8yHO/jx4zbASLk7qbTZ+JxnNqRkkAMqAz0NtyBK7aGOwocHv+bGhTbbHPqU1
 Cr26KQWpGVd3ia/lLXUEYeY5R+NqTRt56/BoKBy2pzDHdW6qrr6j0ZZMA+CdBDdyBEWX
 LVRMc13KvWEnOSx+g53SWk3E5ciCSxFu7PR0a0jThRoZR2J9DmUqp/GlLkpth3nATwT3
 w5kAnFyP7HkN6ws0kn/g+q5pnlpGQhUa04xvF8I06IVEGEaZ5wxIrf3Jq0a0ras0O94c
 MmGQ==
X-Gm-Message-State: APjAAAV6pXw1RUpwm8kS1CLhjXA0pSkzF8Qt6FvY3pxkZexuhfl0TY9X
 cRJXMjHPuyhFUDmu+bO+DlMvYA==
X-Google-Smtp-Source: APXvYqxm1N4Ih/eqOYx9sg3AgTVOm37fzlGSbcyqTWEcKx6HGuceV5W9E6JFu+pn5r2gZ6BszP2VNA==
X-Received: by 2002:a63:234c:: with SMTP id
 u12mr101562576pgm.264.1558631904843; 
 Thu, 23 May 2019 10:18:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ed4f:2717:3604:bb3f])
 by smtp.googlemail.com with ESMTPSA id t7sm33669908pfh.156.2019.05.23.10.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 10:18:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
In-Reply-To: <97cde329c44eade402deb517211a15fd70103f01.camel@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-4-jbrunet@baylibre.com>
 <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
 <20190520190533.GF22024@lunn.ch>
 <97cde329c44eade402deb517211a15fd70103f01.camel@baylibre.com>
Date: Thu, 23 May 2019 10:18:23 -0700
Message-ID: <7h4l5l3x9c.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_101825_978441_8888C89B 
X-CRM114-Status: GOOD (  21.61  )
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
Cc: devicetree@vger.kernel.org, hkallweit1@gmail.com, f.fainelli@gmail.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon, 2019-05-20 at 21:05 +0200, Andrew Lunn wrote:
>> > > +                               int_mdio: mdio@1 {
>> > > +                                       reg = <1>;
>> > > +                                       #address-cells = <1>;
>> > > +                                       #size-cells = <0>;
>> > > +
>> > > +                                       internal_ephy: ethernet_phy@8 {
>> > > +                                               compatible = "ethernet-phy-id0180.3301",
>> > > +                                                            "ethernet-phy-ieee802.3-c22";
>> > Based on your comment on v1 of this patch [0] the Ethernet PHY ID is
>> > defined by this "mdio-multiplexer" (write arbitrary value to a
>> > register then that's the PHY ID which will show up on the bus)
>> > I'm fine with explicitly listing the ID which the PHY driver binds to
>> > because I don't know a better way.
>
> ... 
>
>> 
>> Does reading the ID registers give the correct ID, once you have poked
>> registers in the mdio-multiplexer? If so, you don't need this
>> compatible string.
>
> Hi Andrew,
>
> In 5.1 the mdio-mux set a wrong simply because I got it wrong. I pushed a
> fix for that, and maybe it has already hit mainline.
>
> As I pointed to Martin on v1, this situation just shows that this setting is
> weaker than the usual phy setup.
>
> I do understand why we don't want to put the PHY id in DT. If the PHY fitted on
> the board changes, we want to pick it up. This particular phy is embedded in
> SoC, we know it won't change for this SoC, whatever the mdio-mux sets.
>
> So yes it should (soon) work as usual, setting this id is not strictly
> necessary but it nicely reflect that this particular phy is integrated in
> the SoC and we know which driver to use. 
>
> So, if this is ok with you, I'd prefer to keep this particular id around.

Seems OK to me, so I'm queuing this for v5.3 because we really need
network support.  It can be removed later if it's really insisted on.

>> 
>> If the read is giving the wrong ID, then yes, you do want this. But
>> then please add a comment in the DT blob. This is very unusual, so
>> should have some explanation why it is needed.
>
> Sure, can add a comment. I suggest to do it in follow-up. At least it keeps
> things aligned between the gxl, which has been like this for quite a while now,
> and g12a.

Follow-up is good for me,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
