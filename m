Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77FEC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9813420643
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 19:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdMrkeON";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rGggi2b0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9813420643
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RWYjtrIH0rgzZHHb4qS1FrQ2AwYRwGAnHxmQGCFSf0=; b=tdMrkeONkBA+mM
	/MSJe2kUuixWWPFex7o7K8ln5T3IUflqW/t3hqCEOhaxO60h5OakixEsMC/Md4OphwE1wjG/5FXq6
	0W4K+6pEEqiYTOm5BmPkRJNTjDfndwI5GK+c2SZk/dlzPK1Y5YlJP4AHHVui4aC+gXK0/SuNZWROv
	MNTxZbjItBjBzKDp2a74+Yn2XX1uZ9JTzMYpdv072DlPDrZ0rwEwj6o3MiU9Ze8jm5ztIU6N89s6L
	rZr4T8EobPEyU59sIn2pjq5GDZ859fm7MCtKgzzibQQZErvkZnbonbkNcALepk2ShUbBNOmZkWgoQ
	zxjMR2uL55N4uO8aJ0hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHD3P-0000po-RZ; Thu, 18 Apr 2019 19:50:39 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHD3N-0000pQ-5j; Thu, 18 Apr 2019 19:50:38 +0000
Received: by mail-oi1-x243.google.com with SMTP id y84so2509425oia.12;
 Thu, 18 Apr 2019 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRvT1PEVseMZAP2ynkS/SS5qFXKObpz+RcLF5TwvBXk=;
 b=rGggi2b0m/5WpygkewyHZhqZ4YCrnifo4SxyC67gS7vCldse0rBXEw94uSd1GhrKQ7
 DLJ5DhGEZxg9bK6XF3rM9I2+fydi+9m6PM5m38JgF3wg9KUlnqS0fRUPgkcG2MCcQ+pE
 Lla3gh3OMUDOEvvgL+8uBI5RBxKEnyTboGvstoU4myq94OyeGkyI2frTmri+bboM9wTd
 MrAdvlDSo3PtyPU74/S+7AN0sGHKQxeGHdu0e7fmlrR8uRi3WklIPMewSQw9gBQFXiLF
 u2Ik+/CCPE94yHTbX3T2cPMzz4b7OyIOBGtjdAIxErbT7v4pPCVuPT7a59GggwD76INX
 Boaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRvT1PEVseMZAP2ynkS/SS5qFXKObpz+RcLF5TwvBXk=;
 b=JsU2FpaXz2t0uqitGy5OeoskQ6pKNleLz8XLYBnfYkC8osl4GSt8OPRC61CyJea17I
 0JL57q1OYh9TGPjh71mbqit5pnB5ndGiTv9gFWcM40hrVU55O9XKFN/YgGxeFlLnSwAD
 8O9I14zhBP1dG4wTn2WJ561RHr833QryIF6tKM97hE6U9tcKIOmhyycziADDZVWE6sND
 fFi1P0f9Ax6o2JeFh9b8dId92lAQbMzB7Pwxwi1XhlVO8e99GLzw+hQzwMoXuWqlj9kW
 A/w4n4zxbR9h8QfOPNLTPr7Ekj1I2ed5c0v7dWs7AlOVSNvHTIitJUI7l9xyNaSMuyF4
 3UJg==
X-Gm-Message-State: APjAAAWDDsczHXwUeCTVT7QE7+qRJxCZrXlBR7mtNrCEa8pZtyoWD22s
 cAemkE5tld6l1TFfXf4TyeT0p9PQ9rvSz+7dDQQ=
X-Google-Smtp-Source: APXvYqxJGLZyK9SBJ5gTvhX4LITdBpL+VDqbCCkvMoR7TiLp2bOwDBC3yJnUSiSepeDpi6ZM3ELU54+1/aBp6t95PdI=
X-Received: by 2002:aca:ecd1:: with SMTP id k200mr3126007oih.15.1555617036093; 
 Thu, 18 Apr 2019 12:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
 <CAHStOZ5Pe9LvDk4cKAVB4SS5wgFcK-bweFTqU_mnEhOAyZKHuA@mail.gmail.com>
In-Reply-To: <CAHStOZ5Pe9LvDk4cKAVB4SS5wgFcK-bweFTqU_mnEhOAyZKHuA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 21:50:25 +0200
Message-ID: <CAFBinCD4OnBbU0YR5P5cAhut==XXUxdHSxHQkBVm28DHZWkbAw@mail.gmail.com>
Subject: Re: [PATCH 0/3] 32-bit Meson: add the canvas module
To: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_125037_243732_5F62BBFE 
X-CRM114-Status: GOOD (  25.60  )
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
Cc: mjourdan@baylibre.com, linux-amlogic <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Sat, Apr 13, 2019 at 8:54 PM Maxime Jourdan <maxi.jourdan@wanadoo.fr> wrote:
>
> Hi Martin,
> On Sat, Apr 13, 2019 at 7:15 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
> > IP is used by the video decoder hardware as well as the VPU (video
> > output) hardware.
> >
> > Neither the VPU nor the video decoder driver support the 32-bit SoCs
> > yet. However, we can still add the canvas module to have it available
> > once these drivers gain support for the older SoCs.
> >
> > I have tested this on my Meson8m2 board by hacking the VPU driver to
> > not re-initialize the VPU (and to use the configuration set by u-boot).
> > With that hack I could get some image out of the CVBS connector. No
> > changes to the canvas driver were required.
> >
> > Due to lack of hardware I could not test Meson8, but I'm following (as
> > always) what the Amlogic 3.10 vendor kernel uses.
> > Meson8b is also not tested because u-boot of my EC-100 doesn't have
> > video output enabled (so I couldn't use the same hack I used on my
> > Meson8m2 board).
> >
> > This series meant to be applied on top of "Meson8b: add support for the
> > RTC on EC-100 and Odroid-C1" from [0]
> >
> >
>
> The series looks good to me, however I wonder if we should maybe add a
> new compatible ?
>
> The canvas IP before the GX* generation does not handle what Amlogic
> calls "endianness", the field that allows doing some byte-switching to
> get proper NV12/NV21. So the following defines are unusable:
>
> #define MESON_CANVAS_ENDIAN_SWAP16 0x1
> #define MESON_CANVAS_ENDIAN_SWAP32 0x3
> #define MESON_CANVAS_ENDIAN_SWAP64 0x7
> #define MESON_CANVAS_ENDIAN_SWAP128 0xf
I didn't know about this - thank you for pointing this out.

your suggestions to add new compatible strings is a good idea for that case.
Amlogic uses different defines for Meson8 and Meson8m2 in their vendor
kernel and they keep Meson8b different.
I will add three new compatibles, one for each SoC (Meson8, Meson8b,
Meson8m2) just to be on the safe side if we discover differences in
the canvas IP on these SoCs.

what do you think?

> It wouldn't change much functionally, but we could have e.g a warning
> if a m8 canvas user tries to set endianness even though it does
> nothing.
this is a good idea, that will make it easier to spot why something
doesn't work.
we can also return -EINVAL, like you already do for the case where the
canvas ID is already used.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
