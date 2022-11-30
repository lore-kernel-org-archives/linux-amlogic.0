Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CFFC4321E
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Nov 2022 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ekVlVGN7WhZa2G3XlrXit+g+6GRORWAa8uL80B00Jls=; b=mVO
	bReaeik7ai+1GhOjHWR8If8VgA0ixO3oAw/myhWH6n0/tewDxSP+qoJSWA6XHwWGxfhbCDfOs6Qrh
	yzXvSR+Bkucep64y3X2sjvHBETrIHaDChgIK5WOjzEobmFVkcFAEYspYSCg/QcfPB6eGvzgaKaMxD
	aM/KETRhXRB6gcmbg0T6EYjlmo69hnU25k9wvniw6nsZ73nj9eO45+7q9Koye42a15tiEXVGWe4Zu
	PqmQ2/ZonmxKd43DSoxcT5oLzOpM4cRS72g9O2onvp9oTKVutBjcGkYyQCg6XugqIiC9+XF3gb1Ql
	PIpbMq02LwiSbtiRmr28EfhH6ZDkyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JIU-00EyBU-Sx; Wed, 30 Nov 2022 09:22:30 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JIG-00Ey4f-Px; Wed, 30 Nov 2022 09:22:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id z4so20200215ljq.6;
        Wed, 30 Nov 2022 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrYQxj8rjyddDjRsu3FuqRZBUQ9RMmMk5gv8riRQFOM=;
        b=Q8M4gPDYB4jwdz4f2CMBq+WCzhqoJPnVSqxDPcnPj237ydBotlIL0qg+XZelvewFI4
         OYBGVoLIpcRmD/dWxXTigKma4q45VwiPVPD7Nlvw6ph0ziLAIl8p1blWCCHtUDHwt2e6
         Ia5q8KfFnpMt58kN67cQiP9MuNYK1hyJRvZjnci9KBUH7BNWct8m1a8cHJFQ6o84G/zw
         Oiu/1nOmQ3vkdqPk547uJSzTRtywI/gbFpbJzLKiqkES5ZTXHp9/XAK1l77tq2Zu4JLb
         wTbUAPIfwhT4Xz9Eeuym5sC72XZBR3tzQbYnxinYcZDlj0xUPdzobKS7vbmthCRfNLq9
         ly4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrYQxj8rjyddDjRsu3FuqRZBUQ9RMmMk5gv8riRQFOM=;
        b=BBhVSpQQayuSlmtnFQhxNMh3bluYDrOV38fn+/nqkLdpwFN951XaLVodgy4om6Rs2G
         UwxXRm7aGCTFMl58pIiVb+8Y3BPoo9Y+Xk4gbHid3CNWW+mUl1Izy97/txzQZmJ3SrhG
         iubQHePj7ZLviMDTCTzMuuCKM/bagDIp19EUOR80nagi0uHJmamEHQUj5x3ukzQrcEwS
         Fv3Z/o5ckwmJ8NTmtUt/K9WjgyleyI1icP8XyovpMgQsbxY2yPWpX7D7iAj4qEWl1v7v
         YykhJNAyXzJ3iyTxKS24rrUobxJVqs3LhQVxJFV4rdnv0/tJR9PEec+U7nSajaFvQ4W4
         oihw==
X-Gm-Message-State: ANoB5pkxN7TgFLkbxd7LqUrkgNd8QhENd/9h82uuASh1e5mWEdOtl69u
	cGY0kNebw6l3w7eCODMXjd8=
X-Google-Smtp-Source: AA0mqf4Rchr13o2XY80vRF849S2N11ziLsgahYBib0CNIMQAIIbfLZwyHl7Mga5wg7zBXockjzBaDg==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id h12-20020a05651c158c00b0026c090ff8femr20464441ljq.2.1669800132086;
        Wed, 30 Nov 2022 01:22:12 -0800 (PST)
Received: from dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyygt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::b])
        by smtp.gmail.com with ESMTPSA id u20-20020ac258d4000000b004b5241dc8cfsm190594lfo.10.2022.11.30.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 01:22:11 -0800 (PST)
Date: Wed, 30 Nov 2022 11:21:51 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kevin Hilman <khilman@baylibre.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Liam Girdwood <lgirdwood@gmail.com>,
	David Airlie <airlied@gmail.com>
Subject: [PATCH RESEND2 v4 0/2] Use devm helpers for regulator get and enable
Message-ID: <cover.1669799805.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_012216_903506_A9A9C45E 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: multipart/mixed; boundary="===============3299434464785018049=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3299434464785018049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wDEAM8gkULDvl3zl"
Content-Disposition: inline


--wDEAM8gkULDvl3zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Simplify couple of drivers by using the new devm_regulator_*get_enable*()

These patches were previously part of the series:
https://lore.kernel.org/lkml/cover.1660934107.git.mazziesaccount@gmail.com/
"Devm helpers for regulator get and enable". I did keep the patch series
versioning even though I changed the series name (subject of this mail)
to "Use devm helpers for regulator get and enable". Name was changed
because the devm helpers are already in 6.1-rc1.

Also, most of the patches in the series are already merged to subsystem
trees so this series now contains only the patches that have not yet
been merged. I hope they can be now directly taken sirectly into
respective subsystem trees as the dependencies should be in v6.1-rc1.

Please note that these changes are only compile-tested as I don't have
the HW to do proper testing. Thus, reviewing / testing is highly
appreciated.

Revision history:

v4: RESEND2:
	- resend code unchanged. Commit titles and and commit messages
	  improved.

v4: RESEND:
	- resend only the drm patches - others have been applied

v3 =3D> v4:
	- Drop applied patches
	- rewrite cover-letter
	- rebase on v6.1-rc1
	- split meson and sii902x into own patches as requested.
	- slightly modify dev_err_probe() return in sii902x.

---


Matti Vaittinen (2):
  drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
  drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()

 drivers/gpu/drm/bridge/sii902x.c      | 26 ++++----------------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
 2 files changed, 7 insertions(+), 42 deletions(-)


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
--=20
2.38.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--wDEAM8gkULDvl3zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmOHIKIACgkQeFA3/03a
ocXYwAf+KjfV0msgFQZGZRTYzXQoNbPiRpwjEi03SryY+FAWtPZVLMI0VkM97vbS
eHNUOroZCLa8tqllqsFAbqc2/6PC7pS4hmU4HoFFgFnVhscCECxtJJ6F/MOYb++Y
cHAcMhAXrKbaCcyGHR+y+oW0SktYYIC3nEVwxaR3G3JE3Te4moZWO/0X3B6/WH11
Pg6XPTaclOeTWtw4sqLWDIAjjeGEkjtA16yze+GdPlo4SiS1vem6M/Z0cAWi6jiG
9GzEE8SwWcRSqqdFgMwSX1PIZgQgim6h0fDfhrj43pws4reeUXRP4bcGqUeKCVrf
uyIJN40u03Upe82WPq+z9D6aDrotYA==
=c7ic
-----END PGP SIGNATURE-----

--wDEAM8gkULDvl3zl--


--===============3299434464785018049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3299434464785018049==--

