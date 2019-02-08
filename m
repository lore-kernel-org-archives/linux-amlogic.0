Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABC0C169C4
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 17:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC192146E
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 17:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOIO7s83";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VSk4/BiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC192146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qSaHiGSYk6UFuFeEoMBVLh1DO47Mjew6Omwjf89gP4=; b=gOIO7s83XC2EWF
	HvvOnPipEIOu9T3k+NkpDcjp+XA01x/OdtJIied/RC38SL+DAnW33N+CV4WZz2fs+kU15unCUk+DG
	4TBRkkuSVPqQlx0SoEN9sRL6EXAZ7pqBCaLp4UnX7to3V8b0Jw16F36rvY2PDUW7qyNzGVFX94R5b
	U3vn0PK88hTpA+dhMrke+61zuXtNxDurkl1hawYP+NwmuznJveDbyG8VUR2SFZddaSoNvA0e2N2jm
	qrKjR1XToomBKvOf+tMeFOlPMHK+p1ZWh4l7shKz/tpjtPO1a8OBrCFzvvXfQYKBlf+UcudQQxG47
	wZZkKh/Lf9i0yNJ39KjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs9vn-0003KS-9H; Fri, 08 Feb 2019 17:27:15 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs9vk-0003K2-59
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 17:27:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id r11so1858136pgp.6
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=A0SZoanrAhMzXgD1Yl9c3skIAdSpAApQYRd5mYRfnQI=;
 b=VSk4/BiACZ1Y/PMAdarcrBEcjeZo8welwpoRceXK8Cx5fOfYcUuPMfwmWAiAwacALi
 ccb2cyvsZpOvPqEDMsKWVd3uuDOxVp5PD7Pu50lEAxhPJb2TeLBWqCG/FY9INPsB4i7G
 lkmL3QjaQhv2J5wKV7rKaztOcl20d6wkf0wzKAHMZF00hdfCbVlm2L+oshDQ39HVTym2
 0/hV+NKocJju+qZbvd/JkKzbvWj68pDUAlBciIkdpVLkL3HKWywa95IMCmBzKaH0sQ7m
 JvS0X2xcIue2K+U3rgbsuP6NwaYLd0Y4MJtHvjTeDSpws6vXR3vtlUFCE5G+OfmXOMDB
 2sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=A0SZoanrAhMzXgD1Yl9c3skIAdSpAApQYRd5mYRfnQI=;
 b=TsevNi1aDdGUuUIDC5OdC+alCYln9FxiE9kGDRRLlyGwn/rP1pVhkRy6KV4h01wEGL
 zZIoZcEZMNFNqujY31oY9Y+5eeex06v7VGeO/33G9C3AimEqR5XibqNELDZcHHk5SZkz
 5lzxh6Hre/a3gJ3pz9H+Cct9FATIveSsBxyYPliu20gCi7ZWIGndqGXTzpbo+vYEd0GR
 OEOJRI3tNsnbQOQhgCFog4ZQfroZXDcpLLsBWH2w5duG1mIDa+gaPk0xwZd9dmLEaUtp
 xULARcebDDA0339S6NEnzHI3DnY+ti1EVr62SMCBgJRnwmPWZ/dNAP1Q3+ZwXs28A74g
 z6DQ==
X-Gm-Message-State: AHQUAubFSMksQih151PWGicxGJCpoisjR6wPbwYmdleLdXwNHwFgmu8C
 U8qvbFwLFgNkIBh+/PurWdSYRxURtwk=
X-Google-Smtp-Source: AHgI3IYoeeScEcUExZ2BexVMFqQeNiPz2KJ/io13uTDR4Zw6N7A9YTN5xoMYLZBSlVGDQ/JedtUZ1Q==
X-Received: by 2002:aa7:8281:: with SMTP id s1mr4076534pfm.120.1549646830429; 
 Fri, 08 Feb 2019 09:27:10 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:551b:c3ab:6b62:8b9f])
 by smtp.googlemail.com with ESMTPSA id w12sm2564435pgp.38.2019.02.08.09.27.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Feb 2019 09:27:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
In-Reply-To: <CACRpkdb4105RwXhiyVd1dz5mjYO_u6CxTbCySbqUWBv=yhF1qg@mail.gmail.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
 <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
 <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
 <CACRpkdb4105RwXhiyVd1dz5mjYO_u6CxTbCySbqUWBv=yhF1qg@mail.gmail.com>
Date: Fri, 08 Feb 2019 09:27:07 -0800
Message-ID: <7ho97mgphw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_092712_191265_3F7115D1 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Jan 21, 2019 at 4:36 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Mon, 2019-01-21 at 14:53 +0100, Linus Walleij wrote:
>> > On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> >
>> > > This patchset fixes the initial pinctrl support added for th g12a SoC
>> > > family, which is mainly around the register regions claimed by the
>> > > driver.
>> > >
>> > > Linus, would it possible for you to provide a tag with these changes to
>> > > Kevin ?
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes
>> >
>> > > ATM, we can only use the devices for which the pinmux is already set by
>> > > the bootloader. Enabling the broken pinctrl driver could cause regressions
>> > > in kernelCI. Having a tag, would allow us to start using pinctrl on this
>> > > SoC in this cycle, w/o regression. It would be nice :)
>> >
>> > When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
>> > or next (v5.1) with these patches?
>>
>> I was referring to the 5.1 release but it is a good question, I did not really
>> think about 5.0.
>>
>> Those changes are mainly fixes, so guess it could go in the 5.0 but support
>> for this SoC is still in its early stages, so either way is fine by me.
>>
>> Whatever is simpler for you I guess ;)
>
> I already merged it for devel and other stuff on top so it will be for v5.1
> as it looks now.

OK, assuming that tag is still valid (and immutable), that works for me.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
