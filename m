Return-Path: <SRS0=HNkX=7J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBD1C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 May 2020 12:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0147B2084C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 May 2020 12:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D99cwBmb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr2coyS1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0147B2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bW7ro5hwSpcUSdB9HMzNVoEO/FuQaoNxpFxCPBBJgxI=; b=D99cwBmbp28EWhj+3xkicxaIi
	RwTN2bYPGIJ3qsU3lFa/FHzqggsM0zdptvndQmLvaL1JFD/Y/MG2iClQwYzNCK4g1nGssBdEbN0pn
	fW//Ngr8VHdEncKpeclryfchKHm6O2QRsP0xfzvZhzUGH1wnP/F9fG2SOBBeICvEULPkXzh4Posof
	QGk6qcx/YAk0zlZqEPqBe8kI06L3+YjjMtZ64VDmB1qii9XVHU4vXXlBCXLZRiT9pT6yCZu7pou27
	1kBE5PEpGC3te7X/Z8rbnqY0MRa+NJ3CrEXO/G3+jHqhU/1rl5Vw5fGezDa5JaUt+bEVL5hIyYs5P
	TJgJPgzcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdvcE-0006AQ-0K; Wed, 27 May 2020 12:57:02 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdvc1-0005uf-3H; Wed, 27 May 2020 12:56:50 +0000
Received: by mail-lj1-x243.google.com with SMTP id m18so28753377ljo.5;
 Wed, 27 May 2020 05:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3vGPAEN7EbkXErW9fSFtRny4Z1vag3pW/OLkpcJ4DRI=;
 b=Mr2coyS14UPM1YA2MC9vEyzwVu5iP4fzdum+cFAUe/8X9S0pgLoTIoGj6bdxCvljvs
 OR2TzhIdbIrASS6tdBBIceaqzyzw2fzC/IQgZ9bBg/22zKJ0fXytoUy+lIdZ7lQFCQgq
 jLUuH0WYDLxxtDhTb/66gKClmWBKt4St5ex1KCjCYssVO+FkIvr4kLQIzLCFDsiECyla
 0DTRbVC7xAuR83vo+nY0frHtSmpdHphoKUF9hXg+UlungONT8B/69caFWp5fcTINSnDa
 AapHA/dKF9IkNTslv627nuwU+HAJPfVk8qScTZSVgfCSBkiA/ZjAHsu020EkWdCHPBQL
 M93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=3vGPAEN7EbkXErW9fSFtRny4Z1vag3pW/OLkpcJ4DRI=;
 b=B+qc/aZXoErOmBQKzBbxTLcHmg7wZ7oBjVOIlgldYam9A4CTFFhE35pDDBbmukK2Al
 M7v+DTKn1KJqKk2IWkgNY2umE76vmjmJV2UEQXqft3X/3tK4uUMPKPD9Hdb5g7HZD3MY
 ymJ3DLCH6576bpc78OC32igadTzD8X5NUnA5T33SR5cmWklIRWS3GUC+eg25zkW4tx74
 lvKNmXMiMEDRfbTpTLJ1dh7TPcdhtiuhJfhDEvrWzSbDZIv5KbVZTMZZ9C13bo6hjF4u
 tPLAj3YRGJbHG+YsQvuEelX/L7pFOEodD6j+EnUwgfi1qCcNltsIZeovkJRWWiVdrTnL
 C3EQ==
X-Gm-Message-State: AOAM530VPfHbAmV07CpHo8o8BdadOG/VFuI0NGet6lMNJsyQjaDdNmT8
 aASfv9OSkdQ7ZfCRSVLM/M4=
X-Google-Smtp-Source: ABdhPJxtvzmXmbURkG5ELpUsVYJeCfAoLEjID1fDrWld7TIOVChr9rYSaLDVBxcHfTbBmJq6HA8+DQ==
X-Received: by 2002:a2e:596:: with SMTP id 144mr3191505ljf.364.1590584206551; 
 Wed, 27 May 2020 05:56:46 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id 23sm800224lfb.1.2020.05.27.05.56.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 May 2020 05:56:45 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH for-5.8 2/2] usb: dwc3: meson-g12a: fix USB2 PHY
 initialization on G12A and A1 SoCs
In-Reply-To: <20200527085315.GA168054@kroah.com>
References: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
 <20200526202943.715220-3-martin.blumenstingl@googlemail.com>
 <40a874eb-1a2b-533e-ee3e-bd90510abaf9@baylibre.com>
 <20200527085315.GA168054@kroah.com>
Date: Wed, 27 May 2020 15:56:40 +0300
Message-ID: <87y2pd1qpj.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_055649_187051_EA1FBC7D 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: hanjie.lin@amlogic.com, "kernelci.org bot" <bot@kernelci.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, yue.wang@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============9091801674343725299=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============9091801674343725299==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> writes:

> On Wed, May 27, 2020 at 10:17:31AM +0200, Neil Armstrong wrote:
>> Hi Martin,
>>=20
>> On 26/05/2020 22:29, Martin Blumenstingl wrote:
>> > dwc3_meson_g12a_usb2_init_phy() crashes with NULL pointer on an SM1
>> > board (which uses the same USB setup as G12A) dereference as reported
>> > by the Kernel CI bot. This is because of the following call flow:
>> >   dwc3_meson_g12a_probe
>> >     priv->drvdata->setup_regmaps
>> >       dwc3_meson_g12a_setup_regmaps
>> >         priv->usb2_ports is still 0 so priv->u2p_regmap[i] will be NULL
>> >     dwc3_meson_g12a_get_phys
>> >       initializes priv->usb2_ports
>> >     priv->drvdata->usb_init
>> >       dwc3_meson_g12a_usb_init
>> >         dwc3_meson_g12a_usb_init_glue
>> >           dwc3_meson_g12a_usb2_init
>> >             priv->drvdata->usb2_init_phy
>> >               dwc3_meson_g12a_usb2_init_phy
>> >                 dereferences priv->u2p_regmap[i]
>> >=20
>> > Call priv->drvdata->setup_regmaps only after dwc3_meson_g12a_get_phys =
so
>> > priv->usb2_ports is initialized and the regmaps will be set up
>> > correctly. This fixes the NULL dereference later on.
>> >=20
>> > Fixes: 013af227f58a97 ("usb: dwc3: meson-g12a: handle the phy and glue=
 registers separately")
>> > Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> > ---
>> >  drivers/usb/dwc3/dwc3-meson-g12a.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >=20
>> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc=
3-meson-g12a.c
>> > index ce5388338389..1f7f4d88ed9d 100644
>> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>>=20
>> [...]
>>=20
>> Fixes regression reported at [1] on SEI510 board based on Amlogic G12A.
>>=20
>> Felipe, Greg, can this be queued on uxb-next for 5.8 ?
>>=20
>> Acked-by: Neil Armstrong <narmstron@baylibre.com>
>
> I can take this and patch 1/2 here if Felipe acks them.

Sure thing, Greg. Thanks.

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7OY4gACgkQzL64meEa
mQbULw//QEHuzbRomKSbPaOe0cM+/i1yGMyZAnXKQ0Q8bG+JLpSVDe8cXhRr2edg
Ilfx6m8Kt/CYIZn6zZ73MdjPtVADkkJfsNVpGD+iAZ3uww8lAIm1rn4XozjNJt/5
Jpno6KBqmXY3NXuE0HZ7LraJw7XMc01c3tSOh8T54pqeJ62aLHuxfkv+4fSYQS2R
0gSF0tCJKC5eATjzg1retNX8nUkf0h8Zi3HyZTD2iUVSYiOe5FJeGYGNfmozwe3c
shI0qMyIzCU/yFrvblfh4LANI8D938SCCgUfs8rXUNmbtdYlHcdcNEPWOh9q0ecF
/bwHfaMkNAhtjrLa/4U4kNuoTPQhZIlPfl48Smq30xw+qUvMfkij1woAneYPBvxE
Qz8VuaLQEcIBq/qkG2hQAjkJn6XoAXVPXO/dktZJjTWv2iJq2arNaGcUzB9t5RNg
h1zCj3uphIP3t5uTmLGaeGm/4NQVcTSH843/kWMEcc/eZ27/t2DZL8Zl9llMVsr7
cMIS7LWBTamc+GA2g5c2d27EH6xGnUYW9ribrXNZsZlpqFCGc0nvQHNj++lAFUc0
iOoKhst9DZYTegMOgpbHyxIJnsInJlHhXf6C7vVdL75S9O+mLm9S5hJid9baWJTO
mW78XccwWqGp5ctssvPr0e1qbflw39fQGeXAZC4acQr6W76wvwI=
=bVFY
-----END PGP SIGNATURE-----
--=-=-=--


--===============9091801674343725299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9091801674343725299==--

