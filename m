Return-Path: <SRS0=2Oki=JQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE08C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 09:34:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C16361027
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 09:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C16361027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AkPvBcQcbC2F7gMi4bOJWSZGFqP2YtvRoAU28iPcxmQ=; b=Ls7+TPNJk+5jmu+yl5FTLiGde
	XIBsYFPckwLa2tHxFcH/223eBKYK7MbyfkGzgnLapLuSK6yOvMQgrGFbIUTaQpCCQphYEv92Qe7Lz
	IUHJN4QmebDChkguNLpWJLhaGo45Vs9aqzb/qv44kNntJt/lpZ/aIL7q/XJTgv7N8P2gxmAdqDmd6
	53PrvE5j7UmiOqOma+h7NC61+u53Vcpd4POzaH8GnyTrxbwB0/4bMXtwb402u32zjh/d1k7e9UZlH
	hj8oFPE1cWLEo+BI8gDdug5SVHgqbIUPB6hsmtYidcqwxMXQW/MJaGD2RuPdqpYWIDyZ3DNW28Xog
	EWEO1ELtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQIN-009Yrb-3Q; Mon, 19 Apr 2021 09:34:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQIK-009YpL-N1
 for linux-amlogic@desiato.infradead.org; Mon, 19 Apr 2021 09:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f9v+Sm8mKFEbQyXi/sN2tJHr2LOa9v0CsJoz/H5l6cU=; b=kaQa/AbeFluWEL1g4bjzwaRow8
 yXqSwa46A+gZEm4zoKnEIJXxcrDNvfQU+tuCrUePruxaaSObME882ZfGQufXF3gRp2DNjbZeR2Z/m
 E6cTn53sGJ4KJY/UkrTEps9vMJepxE4AReRwZSb5vVzWgLpsZ9CMoP13Gy1zqIjJV90SYlrxKv3t2
 ftYnANI1/x7e4WQiVu0W4GzIBhHxk4vxxoAkgOYN1WlyeT7gq3dn1g1eFFu5MW9OTyDuFC/WUDWKE
 kWFosyKmEwPydot5gQM6oNn2jn3YylssPEsYFUBlDEfZQP44EX86E2HRVYEZ+XOj0so0NMTSyRvjO
 A5kodCQQ==;
Received: from gw.atmark-techno.com ([13.115.124.170])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQIE-00BERW-Sl
 for linux-amlogic@lists.infradead.org; Mon, 19 Apr 2021 09:34:15 +0000
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gw.atmark-techno.com (Postfix) with ESMTPS id A2BA28049C
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 18:34:08 +0900 (JST)
Received: by mail-io1-f70.google.com with SMTP id
 y20-20020a6bd8140000b02903e6787c4986so4166627iob.23
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 02:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f9v+Sm8mKFEbQyXi/sN2tJHr2LOa9v0CsJoz/H5l6cU=;
 b=rjn8TE0MOMIDgbAIEdnQQJd7sIopk9acuaYyaN7rtaQAj0cRU+/u0mvpINn16HMaro
 KWGTz3NF740RxXz7cenxHPiULIrwf5zaF/2S9OVY+zsXNyG6mp0x5NhSIgkMvBCfkNfR
 pgXPuRrzQkvfKWUN8MipLahMr3d/2/x0PAl44kL1uWzoRw/Hrwgs17+vih1c/4DImKuk
 PFNxmzHSnZ0fKPEzrezO4Fp/B24elsK0ZoN99Lgt5a/0mn+wmqi8GAw6w39eD9zaAMNZ
 HkfgPvcsdpUh7fcRnaMuCZgjk8rxv61ZZ9h2wpZAzxrUyUkVdWZbsBkz3olSNvlAJZ42
 lVww==
X-Gm-Message-State: AOAM530WSCkD771CTxAI0ouAuoi5h2GvpV8oNU3a+8UlQxpOWS909irQ
 oInfOo5sWyuDaF/ZttodlziqBthJFKa2+krLFz9H87NRmIIndilQ8XjgcsNvBAAjEMUZGQ1BnrJ
 JXL9Pgii9tn1I3WWAdoY9kozTTToyRVQi0Ng=
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208876pgw.31.1618824837067; 
 Mon, 19 Apr 2021 02:33:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BVfHB/Iu3InVzb+YLUkuY7/BfcYMlC0sOGsbJiks+G4SQp5aPsproxuobb7vRE8Qif9k+g==
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208853pgw.31.1618824836841; 
 Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from pc-0115 (103.131.189.35.bc.googleusercontent.com.
 [35.189.131.103])
 by smtp.gmail.com with ESMTPSA id x18sm10982637pjn.51.2021.04.19.02.33.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYQHy-002k7D-3h; Mon, 19 Apr 2021 18:33:54 +0900
Date: Mon, 19 Apr 2021 18:33:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, horia.geanta@nxp.com, aymen.sghaier@nxp.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
 geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 vkoul@kernel.org, peter.ujfalusi@gmail.com, a.hajda@samsung.com,
 narmstrong@baylibre.com, robert.foss@linaro.org, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org,
 jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org,
 mchehab@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
 kishon@ti.com, kuba@kernel.org, linus.walleij@linaro.org,
 Roy.Pledge@nxp.com, leoyang.li@nxp.com, ssantosh@kernel.org,
 matthias.bgg@gmail.com, edubezval@gmail.com, j-keerthy@ti.com,
 balbi@kernel.org, linux@prisktech.co.nz, stern@rowland.harvard.edu,
 wim@linux-watchdog.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH1OeFy+SepIYYG0@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023411_054713_533E363B 
X-CRM114-Status: GOOD (  25.81  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
> > This is going to need quite some more work to be acceptable, in my
> > opinion, but I think it should be possible.
> 
> In general, this is very hard to do, IMHO. Some drivers may be used on
> multiple platforms, some of them registering an SoC device, some of
> them not registering an SoC device.  So there is no way to know the
> difference between "SoC device not registered, intentionally", and
> "SoC device not yet registered".

Hm, good point, I was probably a bit too optimistic if there are devices
which don't register any soc yet have drivers which want one; I don't
see how to make the difference indeed... And that does mean we can't
just defer all the time.

> soc_device_match() should only be used as a last resort, to identify
> systems that cannot be identified otherwise.  Typically this is used for
> quirks, which should only be enabled on a very specific subset of
> systems.  IMHO such systems should make sure soc_device_match()
> is available early, by registering their SoC device early.

I definitely agree there, my suggestion to defer was only because I know
of no other way to influence the ordering of drivers loading reliably
and gave up on soc being init'd early.

In this particular case the problem is that since 7d981405d0fd ("soc:
imx8m: change to use platform driver") the soc probe tries to use the
nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
So soc loading gets pushed back to the end of the list because it gets
defered and other drivers relying on soc_device_match get confused
because they wrongly think a device doesn't match a quirk when it
actually does.

If there is a way to ensure the nvmem driver gets loaded before the soc,
that would also solve the problem nicely, and avoid the need to mess
with all the ~50 drivers which use it.


Is there a way to control in what order drivers get loaded? Something in
the dtb perhaps?


Thanks,
-- 
Dominique

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
