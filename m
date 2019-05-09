Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC7EC46460
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 14:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFE420644
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 14:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="joW3VOLG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+FN6B2M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CFE420644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vQcBLkXHodxGXuj+HTjEngdkp9lFoYoamDh6ox1O5Pc=; b=joW3VOLGNl1pQP9IsBsczgOBy
	BRJ07HTMSNqmkLgX5zR0PrGSil6NQAY9UPxSG4Zb37HbrD87A9EfPOuK80xinBSRwp4O41eVOLyfY
	FH5yKxd+vkgSdcQcu35wTImBU8v1gLCj0T/ZfCxJeukoqoR0EzysYD9Vsompc9Q1mhmOSUEew0Cib
	eIsNO89QnKyI6PuIHluAG6a8KWSNoP3MdspSNt0rWRv+nDJQpKz3F0uuBZCb7hbVWJ+Xauv4/QTFJ
	iKODL6bSJ9vR/dVheFqLjY/vn5Ro/9xGiWntr7YczORf3/cT2rYFS8pFEKCY6CRzBSbT5K+9YsA7G
	GSCc9EF7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOkPh-0007Pm-F1; Thu, 09 May 2019 14:52:49 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOkPe-0007Ox-L6; Thu, 09 May 2019 14:52:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id f2so3585464wmj.3;
 Thu, 09 May 2019 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a1mSEvBcWliyo5EhRJMQRVCOMthYdHYHBHHuPNvU0UM=;
 b=M+FN6B2MBKrB5K/MgMp3XiZNG9lhFHskRCTbyo1lnz1UAF+MtV1rCwKd3IToZ7cDCi
 m7PjLF6yq03pWdrfNCH4LX7l4qajtgiwGCMG8y//ebtsMFdHa6fnCjSHuPv+XUbADhoq
 VxiEnfykY/466xARZrXlh9gPjPprdd0SanmtndoJlAkd8A6JsCBTjla8dEXb+9gO1Nw+
 C/lDlI1LF0Mp4Adm9rv4O2h9XbdX5t3W4c3/sscyBUFDepwtbriOdCaPFTx2Rx28oqUZ
 8gS9YGUKz5pn2AZo4s3fHOisxtM/53DmP/1g0jGEJDcKppw+zDSr7eKnHreaXzeU1TIV
 LS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a1mSEvBcWliyo5EhRJMQRVCOMthYdHYHBHHuPNvU0UM=;
 b=h3SwrM5UdRT1vJ6QPIIiqaoHfgVAbCFzw2KR51vwySNjkt7cftVy+yR3cBjY+RXs+F
 L6533neCn+vD3DrgYxHWAIn3IZDLB4kl/wQU1TbCLdaKPL9AnUoNqsg4aaEoNjpMm+kx
 zCP8938DK+N+QVuA5spiW2Wc19uUL3nA2uy1GPmBX0wQT5U8OGLVLhsUW2dC9mdPNTXQ
 wF8l+C0sQiq/vfeDJP09yUwKwiovFDqX7xe2FoGdefDuYqlZIyjsy3NCfjvTcXRIBpBi
 AVoqj64/hb2xy5uAaAtvaEvEtApA3RLHoqe13KdRueCu2d/O1W98C4ahyI/VVQy8DKFl
 1I0g==
X-Gm-Message-State: APjAAAX4fwMplYKyj+E/smy974elx9j56N3vBFB7p3809LM8cVvUv+PT
 s1EL20cdDX5JR8nXx0FUr2w=
X-Google-Smtp-Source: APXvYqyp7HHKcshcQDFEs9klXPopVR55hJEby0tFHAI5KP3xTanR05+4OdehHVqjKJoqQl3kNr0Q2A==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr3207118wmh.86.1557413564456; 
 Thu, 09 May 2019 07:52:44 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id q2sm3249998wrd.48.2019.05.09.07.52.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 07:52:43 -0700 (PDT)
Date: Thu, 9 May 2019 16:52:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/1] pwm: meson: use the spin-lock only to protect
 register modifications
Message-ID: <20190509145242.GZ8907@ulmo>
References: <20190401175748.5376-1-martin.blumenstingl@googlemail.com>
 <20190401175748.5376-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20190401175748.5376-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_075246_692799_9AFB57DA 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: linux-pwm@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============7823622459389322430=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7823622459389322430==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LvlcLv3JjFtLV6y2"
Content-Disposition: inline


--LvlcLv3JjFtLV6y2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 07:57:48PM +0200, Martin Blumenstingl wrote:
> Holding the spin-lock for all of the code in meson_pwm_apply() can
> result in a "BUG: scheduling while atomic". This can happen because
> clk_get_rate() (which is called from meson_pwm_calc()) may sleep.
> Only hold the spin-lock when modifying registers to solve this.
>=20
> The reason why we need a spin-lock in the driver is because the
> REG_MISC_AB register is shared between the two channels provided by one
> PWM controller. The only functions where REG_MISC_AB is modified are
> meson_pwm_enable() and meson_pwm_disable() so the register reads/writes
> in there need to be protected by the spin-lock.
>=20
> The original code also used the spin-lock to protect the values in
> struct meson_pwm_channel. This could be necessary if two consumers can
> use the same PWM channel. However, PWM core doesn't allow this so we
> don't need to protect the values in struct meson_pwm_channel with a
> lock.
>=20
> Fixes: 211ed630753d2f ("pwm: Add support for Meson PWM Controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/pwm-meson.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--LvlcLv3JjFtLV6y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUPrkACgkQ3SOs138+
s6EbQQ//cCrVsIOMfus+LS3hL9db6Yhpor2moT9YI9tTtoyGZjgbCupOilKeMqDu
jj5vflVwl/AWtW6okavjVj+xaUaUxNxHxm9Nx2yWwDo4fmhZ5BcRhg0O4bfo55eY
ED1NvERiM9P5TCCsnakPJxc/VVUt9voqU0C7TR6CzxlucTUAn84GtQNhdyMKJV4Y
3XHr2fYynP3UJbv/WXXSoIO4VPNOHO9/c/FkdPN+51lbum1pxeUXOB4OIqEzSwCh
Y175JhoOMqt7nKy5AnWWm20IpgEOA7MT4/gZDOkeyVni2FzGeHFeA3w41fwdQnl6
aM7mClWdYGY5WqDLpe+8GOhTD+LeNxlLsSPoo6H5M+YahDDULYoX2f0QT2U1UiX7
MFMTjDy2gNWfPdO1y+ynScbFVW6VCuczmOelwMdQdWEf5U7kYxED7zNHDJGmemE8
tQ0vuLZEDPqctCwACswaDYagHgDBFPD575sqJmf5FvA7aMedjFlNNamfK5t1rB/s
lrgYobMqhatckbeeMUVBVipxtL6N6MYbfM8pFO1GULGnC5u9q8plRGsB+X0na0in
gk9+9DAYpQgrkXRsKG0McHbvEWGckogX3FbckxivAj0wRnQwSM/cgswcHGwJs3GR
ZfJBEEqf8UAEQSQPu+gpHm5py7KWRO/taKr98J4unhGfNzh9mow=
=HHny
-----END PGP SIGNATURE-----

--LvlcLv3JjFtLV6y2--


--===============7823622459389322430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7823622459389322430==--

