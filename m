Return-Path: <SRS0=uPkF=4X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24764C10DCE
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2020 16:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C732E2084E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2020 16:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgbC/Y8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTpAGJks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C732E2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eV+HPtG5t5hoRLmIXb+1hxenAtytKQ/5lPVpvBywpg4=; b=qgbC/Y8SMtWes8sJ3n3qWRxd3
	3o9/5mrtoXZ6fgVIfAZVavtfnEVEHXpVdfrVAa6GXRy7OEj4Ymh78q7KAoAT7sg9pxINEvMOx+3T0
	u5un7+2oazLh3FEkZM5+t0lD8yAsIp6+kc5m+zagYkzXV5rM8CEIw4NcBebTv76Gv6PY6h1V5JDri
	FWxC7VW1WjhH0dJOQjUXzbiy2AmAFfhmF4nHVekOiUcY0vCPD7jFGujlIaA7HhdbvOTmFTBriJpk5
	efBjCnJmi5qC2XyFaXZlheozoXMr7q3eRjDpZLt5JQCiouix2sayIDoiIWA18zkQtzKrtatN6+tsW
	N2JGEJjIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFfn-0000Hv-LN; Fri, 06 Mar 2020 16:18:03 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFfk-0000HB-VK; Fri, 06 Mar 2020 16:18:02 +0000
Received: by mail-lf1-x143.google.com with SMTP id j15so2361410lfk.6;
 Fri, 06 Mar 2020 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Z+TJMGEeVoGtC49ptXlQFv7le4nU8temgCblUT4vbVU=;
 b=mTpAGJks0WsFlELSXp3Du/jidQlD93dWjc024/xOuNY30kBjARicDYFfvmosqSZXyq
 IDx7jqBxS5J0xYtZe5jG8pEPuKBu/z6SNrj52+Bz9YmP0+nWu9kP60a57/4W4TqkLv+9
 yvCmE6DDVl5vEy36xyI0gv68OW3yDlcKJ00hDSQNEBUqBoQhAYfllOVlQ62fQtad5Hhn
 WIqGlIDQSbO7Nvp9Q2aGjkRGlxGxV1nVe4Xs4JXRuJEDT0Smb65gC5Bb8tSz1aX+73io
 b/Cdxdkkqg9u1B0i5fYuaRtR+7NTH6brln6Zg0pnSQql7QdNlM6ktmv/0s6X0QFmCg2d
 XKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Z+TJMGEeVoGtC49ptXlQFv7le4nU8temgCblUT4vbVU=;
 b=p7hHwCucLhQ2vSlHTxFL3PgXQBn3nMiidaicKZBlcQPmWIuSymvUroDFJYYctiNEi9
 DjhAb2vEcY+Nz2iTQfccml7WpqzoFIXMgsccuwwhoBR169E7x9sP3rlE0r3WcYdtqhWB
 yEuoZx5CjZBvQ7fOdRidoHe+4wTYGE9jcrxQfmo7UlqoUWUwdHagi9bP3ONEh86bnU0K
 udOsX8haO9Ovz8j3VwKo03mW3fgOwhx5jiSEFz6ap+tOCVqTA74o9OoKWLDybKpxvGQV
 4sVePe254RU7oKUTAvuygrrNQ5x6jB0NlkH2VPfEMBZ29Y+fUPEyFgaeX3rcf0Sfa/Ap
 Q2TA==
X-Gm-Message-State: ANhLgQ1fU/9WmAFRdVxkgch7rirA/UUB0tx2Wul03Z0OCXxTVsGgZX5k
 YLSXCSjYD5bU5aPt3Ijk+ww=
X-Google-Smtp-Source: ADFU+vuwI6V8yMCkBVEfEewYfNim0qzEgKl4clXc2U7TnaM4A3YLgo87+3yB8AqQvMGoDHbSLJ1YPA==
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr2458169lfg.35.1583511478908; 
 Fri, 06 Mar 2020 08:17:58 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j26sm17383971lfm.3.2020.03.06.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:17:58 -0800 (PST)
Date: Fri, 6 Mar 2020 18:17:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200306181747.5dbda69d@eldfell.localdomain>
In-Reply-To: <27d09559-055a-7bf3-0f23-9948da0e1f76@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
 <20200303173332.1c6daa09@eldfell.localdomain>
 <20200306101328.GR2363188@phenom.ffwll.local>
 <27d09559-055a-7bf3-0f23-9948da0e1f76@baylibre.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_081801_034184_0CD40AA5 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-amlogic@lists.infradead.org, nd <nd@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============7289532601328665607=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7289532601328665607==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QRgxWOW3=LdfxDd168gPaIX"; protocol="application/pgp-signature"

--Sig_/QRgxWOW3=LdfxDd168gPaIX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2020 15:40:01 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi Pekka, Brian, Daniel,
>=20
> On 06/03/2020 11:13, Daniel Vetter wrote:
> > On Tue, Mar 03, 2020 at 05:33:32PM +0200, Pekka Paalanen wrote: =20

...

> >> Sorry, it's waypipe, not pipewire:
> >> https://gitlab.freedesktop.org/mstoeckl/waypipe/ =20
> >=20
> > I do think this is very much something we want to make possible. They
> > might pick a silly modifier (compression modifiers only compress bw, by
> > necessity the lossless ones have to increase storage space so kinda dumb
> > thing to push over the network if you don't add .xz or whatever on top)=
. =20
>=20
> The AFBC, and Amlogic FBC are not size optimized compressions, but really
> layout and memory access optimized compressions, without a proper network
> size compression, transferring plain NV12 would be the same.

FWIW, waypipe is not intended to be the most efficient network
streaming protocol, but it is intended to be a direct Wayland protocol
proxy (X11 forwarding, anyone?), which means that it needs to be able to
transmit also dmabuf buffers as is. It does not want to understand
modifiers but just send opaque data.

It may or may not do lossless compression of the data it sends over the
wire, but it will replicate the dmabuf on the remote end.

Or so I'm told.


Thanks,
pq

--Sig_/QRgxWOW3=LdfxDd168gPaIX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5id6sACgkQI1/ltBGq
qqd8PhAArj8wtOHDFlSHaRYFMSEtCurAGSLkUTpmQWl6J1kvS7Stv5XI9jgfSCws
IITQFVQc/DxIvzf4KO9zECMi+oIrhw3vyrvJEIErhE6LuZdqgR2MNP3ATNBKU8WR
OTEawk87ZvZQENGUYPiV9R3uF0+yr2Qlz2FqmizM8lD6fmWXV1QBBKr8AgkZ+/qK
E4e6GRAn+3mBZLS4dxEeU/pATGoZNnOoMpmp/z27AIaibtN88Qpzxy+WtyYUREGm
oTjidQaSOgwEt8nDdhdTFCfZcN4HwH8n5p5JleSvKVziTQlTy5IQZasa5ViuX0wB
eC+x6OmdrxZ0wBuDfZBp26jKmWP3QDxfwaL+QCRnor+9Ao7Tty9MoGVAbPuy1mwc
SzJpjIYsY0OGIjp6OL/Isi5wPZbawkeifutoPVdo9o9PdRIzhR3PJtoOZPN8Ywva
yFP28GivCkapKxSlM3NDDjzA5dT+rUFEeBGurXuZqPZe9rKocN2CmXQ96wsmYJ/a
WMsJNg7EiswQoUf/JadWfm5dpSK42wyGGs9M1i6yRpTo+QGGzQVkmT5Kx7uLAd+p
vuYVc+bNjwNeELU4UhEBXZVWM3n7l7OIcL38NshrnBhdOs0Zy/ElXnSmHkgpccbv
sfZp+i8Id5jdyzKGwzbFsG8OQ/zlUyM9B7yhHhejzP7Q482a3gA=
=KY6f
-----END PGP SIGNATURE-----

--Sig_/QRgxWOW3=LdfxDd168gPaIX--


--===============7289532601328665607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7289532601328665607==--

