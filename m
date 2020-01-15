Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65DAC33CB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:46:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B5224683
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fkIpy+TH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i87EVfYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B5224683
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SXenzcxVum9f4fGkT3wJcyp6jc/FWcalwPGq5EknoXY=; b=fkIpy+TH2ih8NsK65OgJbMr4C
	z+R4YPEsCR8qseWlVuBLc5Z+tThXmuIMTral0CTgEf3YpM5z3uTZIPeVwFvZzGiD0OQJOPTzfWoVJ
	oA5zZGRC6O6Emev6UZSPE6RPbMf1/EnixIHJfxu/rn7TmGz2KGPyqXS3rw5WYkq1NpEjwdZi8a5a3
	K3Dz/mGQoWF/pj44ntiGyxxh7zblpQxGYegSSSIUB7XdOPKdCPrhjJzYk2ItrVlRHZ2r1dJYFQVtB
	3zSpnG2SzS9HpatS4co6c02xE3iT8+Y5Ap8UdkEZHVPSk+1qjHSZZqDECurucGsF8oF4yPBlhnRmy
	sAF6D0/Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iri3d-0002Px-46; Wed, 15 Jan 2020 12:46:01 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iri3E-000205-Of; Wed, 15 Jan 2020 12:45:41 +0000
Received: by mail-lj1-x242.google.com with SMTP id u71so18356073lje.11;
 Wed, 15 Jan 2020 04:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XrM75ATOZQXz6SoZn1okjiJgULz2HKkhFLxEF09kY14=;
 b=i87EVfYpDyR0g6vMWt7prBmZ7KGPMTqtHHGezpq2RddzuyXhi0ONnCPWA7fezCoUQV
 VU7N1ZWCxkXrrr9TcXBRyjmaz5TaTz7LvISiS0ZbgcTunx8/9OlwORUBamF6uv6PbsN2
 T6NPLh/VHH1Xh0wqSiYSEQomGsiIXziGgSmVHCM2QyM2OU2lbAqrZbV5JCXBGLwyb/Hi
 Z9giZcnBQ0ue9dDd/e4HuBc90b4WFvHXe+DeWRWa4flHgYpdFoTmo5pUtdarg9gfq020
 TF/UD7sAxxckKPY2ArubZVTboAD2Fp5O9bSzHCGzQmNX774KEyA+E5HuvbokiBVC9ffV
 cKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=XrM75ATOZQXz6SoZn1okjiJgULz2HKkhFLxEF09kY14=;
 b=t5ajz6TTu4aH7ap0mv9mn7J9STAdV+huUIgrBHPMNQjW7HRQ2igHpJZiBu1WQ1cOet
 YT2X1HbNr8F2qfEZ7+Fj/VDs0RlfJY/OKgZRAQ+/oGt/YyIXvU96HmAsMm3CLzdMwcr+
 SlzUMGZats/CMV4CZMhYlDgykx+s5KRsS0i53N41sRPfds4w/HLi0GS+q25keCisf8V7
 0StOodnUm43H33/EjKs+UA69jSWeF4dGJwvy7HGGiWpq+v9lufZIUBvIsAsgRrrRlqA/
 GsOshNR1kA7bYxeLyr5KACyfG5nQDwhbPcuZDmWgGPHCUej1oJYRYG3Rz7+lJRZsA8Vl
 gdaQ==
X-Gm-Message-State: APjAAAWxfvIrfPnpBj8Ps8dlnjWHdAfxoWZF8yNeBQddUxlL9rXWkkGe
 jNiwPozmtgy3CGThF57eyDQ=
X-Google-Smtp-Source: APXvYqz4Bq77weyLue1f/qeW9fizhG9jawwzQWA+qQGOtBhhBta8rZc6D9tMPh5Pw9Z5ftzXbPtDHA==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr1716057ljg.69.1579092334547; 
 Wed, 15 Jan 2020 04:45:34 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
 by smtp.gmail.com with ESMTPSA id t10sm9100696lji.61.2020.01.15.04.45.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jan 2020 04:45:32 -0800 (PST)
From: Felipe Balbi <balbi@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
In-Reply-To: <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com>
 <87pnfl6rdk.fsf@kernel.org>
 <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
Date: Wed, 15 Jan 2020 14:46:33 +0200
Message-ID: <87tv4w6g5y.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_044536_840552_6D99D7BA 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============7809295624145685014=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7809295624145685014==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> On Wed, Jan 15, 2020 at 9:43 AM Felipe Balbi <balbi@kernel.org> wrote:
> [...]
>> > -     priv->clk =3D devm_clk_get(dev, NULL);
>> > -     if (IS_ERR(priv->clk))
>> > -             return PTR_ERR(priv->clk);
>> > +     priv->soc_id =3D (enum meson_soc_id)of_device_get_match_data(&pd=
ev->dev);
>> > +
>> > +     if (priv->soc_id =3D=3D MESON_SOC_G12A) {
>>
>> you can use of_device_is_compatible() and get rid of the enumeration you=
 added.
> Hanjie switched to a struct (instead of an enum) that is passed as
> "match data" in v5 [0] of this series
> personally I prefer what Hanjie has in v5 over
> of_device_is_compatible() (because that match data pattern is what we
> also use on other Amlogic drivers)

but you end up duplicating functionality that already exists by means of
of_device_is_compatible(). Frankly, I don't have a hard opinion about
this anyway, since it's not touching dwc3 core.

In this case, I'll defer to whatever you guys prefer.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4fCakACgkQzL64meEa
mQa9FA/9FlpB8k6FjnAZcPKfZiMTE3FBVk31vXpWrefKTxAZmGAzK2MFwzGVSlK4
R2wgfY66niKyT1JW/T+/OOPfyyY+gIz0G44zu5qSmYFq/OAVpLSO/ZLw91EPE1yt
0m7ohRi55RxaWMO3LiTTr4zu7/wSxb3/QP3oAtC1G2PHDXQNzsYp0vMEuH22nS6h
sXXQlHOxBbqWQSnUXYHv7JLcvK+YC9JGBqnjCbP1XDx7KTYjZdgH2UOzF6G0OWGc
kk/RVuCB8fobf1rb4VlE9P3iEWtkiTZx73902YRQA1tMs+yRO4BoMLZTUx7VakCz
as6sTfFDc9trmj/uShxMiMxHpqy80rovEKCR3IxASMMBh3jF3Ohe+ghwLV9Ex+Fi
yyhJjaBYFI3lkXV4gA11MpJdDbeLn554ivLHrdqIX1tgh7NOPwqULQm/kdX4URbR
6gKK+Yj2CwuCmDlrfFZZxrQS9pS2xrdykMDW3guZPmeNdgySgtNrQBEIYtxeQw5+
cjQZ373zf6s6lnZhzspEh2cvGnI0cSrxmvb3TjI2RLFDvjooB8u01fZ1u8O51yPY
ou1IV/vECiO1z8Fxzf8AVVqBo9GTptvLurAWZoNAzqrbxnC27OkN23i9vXlDwP6d
Hff4t0AR2FyQD2J/M12Lz9lHyJeECr9+l56tItScfshwp0Dt6bc=
=a2TN
-----END PGP SIGNATURE-----
--=-=-=--


--===============7809295624145685014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7809295624145685014==--

