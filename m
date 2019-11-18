Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EA7C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 17:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F872192B
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 17:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GMMXQhbs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKjpiZLs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F872192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJQYOEwZ+q4as1fIt74GMdZQ+vUB/QZjy3jUPPC3PCw=; b=GMMXQhbsVsvztM
	cT1UlThMiIbWUwJoegzqpPuLRYaXauCdvmRUudF2o7z5sfj6HwUbCqU6IjgaqwhD6JPXyHn4gzC9c
	JqqwQvVq5sjP2QMIeIYPgsEhavmYgEjvyhag2NnD/17vXd3QNSmEJT7NB+ma15XTG/H/DrKmoq02f
	8GS4LAWL4PuZnmSweXN6MgPZAZ7GVWa0wQSvi1ROQGOFZPD8/TXoRAXqyfyEeaMIeen6sTREgBHZ9
	DbNPx4VepSOG5plom3F/J/atntPb6VJwiVut0DJOyk4iDrIpf4tyL++s2NRT8mszbB8lOSqXCMk09
	Yi439u0BRKvGBp0cgttg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWkw3-0005vj-An; Mon, 18 Nov 2019 17:35:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWkvt-0005lz-OH
 for linux-amlogic@lists.infradead.org; Mon, 18 Nov 2019 17:35:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id e6so20572775wrw.1
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2019 09:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fgiG8DT5fPgARrDyuF+q220ThmwLgCP/WJyEtvcPUHs=;
 b=TKjpiZLsVfjGHbNGCQvjk2b4eZXUn2SgdA/npAadsfs0xhr2L2N+B6Ck4kz4i/745E
 5Ipnyggb4fqwN1POnazcjtbIjvPXpofSC82NWd5+FlSCFtLxRmZvm/5CbVMlV9evzieA
 p/GOrXLExSU3aKPBt1kkYXNWd7S9WhMgroA5f0mXjRhVxN70bwZb6/I1PGdyTT7XKzz7
 D0WzcdkJ4B31weYKJ4G/Zrz/F8A7NgTkUpTy3eRr1jFv37f7tUQZnoD501M1n5YUGbGe
 PtMJY9oyjQ7sEWiFdZoiHPM1pdB+QUC/NDJHwY39pYnx8HKnnk4vt03ZXwbyqHyHZyse
 Aenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fgiG8DT5fPgARrDyuF+q220ThmwLgCP/WJyEtvcPUHs=;
 b=c5T5xxjyilJVRsXzjb7JZR3/nlKf+EemJVsDdX9H1RAMav5cak2N3arUC07OTrmGmJ
 7V7fUJh1FojENqFcH8GpksXqxhVaRmZRfTzJ+8tCqfZkvz+kS3h5MxDYdhDOYXw1Rxgi
 WmPbNB6fTAateX77w/X45OeA96bwM75zxGsehbhBkwi2lmOisjVEijRlzph7JwBQlVZG
 yzgTBhovWf1PTygIP7Nt5cdJLSokaF9D3Bvn4ha/3s0klhOgUy6o05u5CJGQyALqou9A
 s3jiQqAtO7sRki4PpoE44t1WxXACw+3NKvQY2UtVgor1v0h88SY6fojKW5CfKmza83C0
 w+Ag==
X-Gm-Message-State: APjAAAVgA/WBtmGzVwE/2Z066Jv2AhvEglYVQODPzsvVB0MliSTZo9q9
 gS2G9thMFmEy5jXu86P6tn+6AHpFPB3h/Q==
X-Google-Smtp-Source: APXvYqxps6er3e7+ax+C8OaILteQJO4LMDe86AMv0i/GR1uO6Xr+KLaNXyUfz9BE8LKUD5w7pwMF7Q==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr31293733wrw.222.1574098523590; 
 Mon, 18 Nov 2019 09:35:23 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id n65sm70024wmf.28.2019.11.18.09.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 09:35:23 -0800 (PST)
Date: Mon, 18 Nov 2019 20:35:20 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [RFC PATCH 1/2] Add entry for BCM4335A0 UART bluetooth
Message-ID: <20191118173520.wfznan64jcaawndk@manjaro.localdomain>
References: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
 <20191115165026.19376-2-mohammad.rasim96@gmail.com>
 <b22e57eb-978f-9ec8-9ca6-06c0f5e7b9f6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b22e57eb-978f-9ec8-9ca6-06c0f5e7b9f6@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_093525_812198_E29E08C0 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/11/16 10:43AM, Andreas F=E4rber wrote:
> Am 15.11.19 um 17:50 schrieb Mohammad Rasim:
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> =

> Lacking a commit description. Please add a sentence.
> =

> > ---
> >  drivers/bluetooth/btbcm.c   | 1 +
> >  drivers/bluetooth/hci_bcm.c | 1 +
> >  2 files changed, 2 insertions(+)
> > =

> > diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> > index 2d2e6d862068..22464bf8cda3 100644
> > --- a/drivers/bluetooth/btbcm.c
> > +++ b/drivers/bluetooth/btbcm.c
> > @@ -339,6 +339,7 @@ static const struct bcm_subver_table bcm_uart_subve=
r_table[] =3D {
> >  	{ 0x220e, "BCM20702A1"  },	/* 001.002.014 */
> >  	{ 0x4217, "BCM4329B1"   },	/* 002.002.023 */
> >  	{ 0x6106, "BCM4359C0"	},	/* 003.001.006 */
> > +	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
> >  	{ }
> >  };
> =

> Beyond this patch: There appears to be no order in this table at all?
> Not alphabetically, not numerically, not by comment.
> =

> >  =

> > diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> > index 7646636f2d18..7b4bb5dbea1d 100644
> > --- a/drivers/bluetooth/hci_bcm.c
> > +++ b/drivers/bluetooth/hci_bcm.c
> > @@ -1422,6 +1422,7 @@ static const struct of_device_id bcm_bluetooth_of=
_match[] =3D {
> >  	{ .compatible =3D "brcm,bcm4345c5" },
> >  	{ .compatible =3D "brcm,bcm4330-bt" },
> >  	{ .compatible =3D "brcm,bcm43438-bt" },
> > +	{ .compatible =3D "brcm,bcm4335A0" },
> =

> You can't use compatible strings without defining the binding first. Why
> do you need it? If you do, use lowercase names.
>
I don't really need it per se, I can use any compatible (i've used bcm43438=
-bt before) but I thought I'd add a compatible so that the device dts can d=
escribe the exact model of the module, if that is ok I will update the broa=
dcom-bluetooth.txt binding in the next version

> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, bcm_bluetooth_of_match);
> =

> Regards,
> Andreas
> =

> -- =

> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Felix Imend=F6rffer
> HRB 36809 (AG N=FCrnberg)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
