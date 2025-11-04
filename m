Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41553CCF9E3
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Nov 2025 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmuEDhN7QzTnkoAt2GKMcjRBAy+TPigFLstEaWl+TYc=; b=KG92qyHx7CbfxrzRQoadRip6m6
	+iGG+GXsEuTJsAYYTDv6VUxaS0FVBU0GPe/tzftXs3+VBgbY37TyODHu/220TeN5VwKHdExthqufH
	e1abkIjscfFgLVIslUjmWFkv+lTEr0cy/VrlcPzZIHb7rUYueGlF5S4MXOY1QpJk3K5es9tYb82lZ
	u0QVif465MaU8wSEzuZSoqeglRL9/uVFRHcuuAhgA/PGfffLVUMzIwdq6JanKV4EeSoquaoANecVw
	WGJuEV/maRtETDtlWlym3SaAZNitZHEwcRzx2cDL+4daOuj/M+RXSsJPPVqu+SL7VIiRpXeLCvzFB
	IojNdyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJee-0000000CAZs-2iQO;
	Tue, 04 Nov 2025 16:13:08 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJeb-0000000CAZ7-1Wpr
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Nov 2025 16:13:07 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8af121588d9so329892585a.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Nov 2025 08:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762272783; x=1762877583; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EhPNKWXcOC4wz99nX7zOq9HMTheZCFEjaub0QmjufR4=;
        b=iwaaPVprKAVUqEB8ZXrFERhEe2inOstrNICP1DxVgzYV0ouC81qu93X4XUBPZJZnKt
         xCGrquaCxvvNosf+1mbdlbVjOggj8jZLhoLITJ1/Kz54L3Y8E8QIqW012wVYn9p0fAQ0
         3Rldzo6MbRvGpBdv6Ubb5J4eQUjjp0RMHEEu7IN6kQAkc104zBggh35hMizZFmb/BlgB
         LSS/STDQXhYDiBjTW4DIJAXpvyJvrIiblWdOYQl1E4js2JDaEoqY9tYBccKOv1udDCUS
         8jO04nnekqE30fLOwvu8jSoQl64sA1INPXhF+x170K7etOjbD3hwzj1dYFsAXNCaBVsi
         +fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762272783; x=1762877583;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhPNKWXcOC4wz99nX7zOq9HMTheZCFEjaub0QmjufR4=;
        b=cKBciwGF/k8GngfL+U6lxdxazaLROr5mXoFXnYPrueu1PS5sxRv8BX2KPwNqnFSDWb
         qo67rrrJczcKcsLdoBGgrU/gMU2PcJi7pt6aSv02ZeW21OUopBSj08EIN7pt045oJRJ4
         MjOkvEuZgHtSx8aMa7qPr/dbymjd07QIL+NHu3Auz+oluHnRgdig8SbN7x27MmGqZcID
         x8vtWVCylHzS/95ZVDzuX4aAJO9jAUiAvX00UeEaHVE4+cBiYm/Z0ehpa3Y4GvG0bxZ+
         O41DRioO/7/+8R2vX//So5jIef9OqF36uy2jnmNQVo0NCFACri9ei2Re/vJYCvgBEQex
         SUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3VzQy4Ie/AiUA26O1p5D8XnWtMMlWg3Q1ooESUaEVHbiM0gxc8EWMVDEwFzb1kAbmWsxPAWfiXrIqaiV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3th6KvBXHUc6YrTJw6r3UDAcMsJBKnmQU7/5efoqmMRwwNwwH
	2MeT1PKV4tkDUXzEPopZ2n2RHXuf8kRsq+QXMG6X8jQ1+JLeyd3y1r5HURT+vNer5Us=
X-Gm-Gg: ASbGncsfsOhuHS4UDaFC5QvvOMewPYfD6opgfWZBZLvZjiZWUu6KyVhUoNgiDVlvjiK
	dajWuHA8HUW1L9Fs6mrz+LkvajFad5e5Wd3SL/mw93aThlOj+8CR4To+N3ehI4sOxdCR96OaEgu
	bBDbHZQRcISpuqz/+hbx3o0e6aZHFGeu13pgIzIqi1Jo3XQo5BXnPR+AmExuULpjg7uvRZodmcg
	3Y+eguXSv3yaJDntSVHgtHlHJfZMe0A/8R19corJXfpemiM/R2BzjS24mo8uP70QUjs334/3IrV
	VCWj9zAcEQ5w46i0cDpI9auoIPm/rhmfrXtXak7oNKOtoonH8hQkqttad6802/X6z9HLZ5S9SU1
	g1fxJoGSm6h9lxfTg4VcrPEKp4YtI0bhvh7m4QR3NHhyVbmMqDQ8csgz3pUDKFm4GRAwWKm9GR9
	+gYZ02ASqpb+yULTik
X-Google-Smtp-Source: AGHT+IHJNxRdepwmA70rIxH7CleHW+ih2OcQNUmhfvzupPYK5yYekte9k/E/acCX6TG/uH9ZccgQuw==
X-Received: by 2002:a05:620a:d8b:b0:8a1:eac9:a84d with SMTP id af79cd13be357-8b220b7f57dmr20914885a.44.1762272782998;
        Tue, 04 Nov 2025 08:13:02 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f51ecd3fsm216022085a.11.2025.11.04.08.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:13:02 -0800 (PST)
Message-ID: <b6e6881197dc4c83e43ef5eb1f20c2bf1887d395.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Date: Tue, 04 Nov 2025 11:13:01 -0500
In-Reply-To: <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
	 <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
	 <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_081305_648038_B8E1C592 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2008438677262814613=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2008438677262814613==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kJqvtTvIehm+17QzwcKF"


--=-kJqvtTvIehm+17QzwcKF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 octobre 2025 =C3=A0 19:47 +0800, Zhentao Guo a =C3=A9crit=C2=A0=
:
> Ran 54/135 tests successfully
>=20
> - 52 test vectors failed due to interlaced or mbaff clips: The Amlogic=
=20
> stateless
> =C2=A0=C2=A0 decoder driver only support bitstreams with frame_mbs_only_f=
lags =3D=3D 1.
> =C2=A0=C2=A0 Test Vectors:

Is there plan to support it ? Most of the legacy content, and why users wan=
ts
H.264 around is to handle interlaced content. Its also not really optional =
in
the ITU conformance spec.

regards,
Nicolas

--=-kJqvtTvIehm+17QzwcKF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQomDQAKCRDZQZRRKWBy
9G86AP9s4PfT2ZOEc7H8CSULI0fPz0RdFYmemyQn3wCh76IcygD6A5aq+z1GM0Eb
LOyvHiMpTuu/yzDSHPEMnVL2wN653Qc=
=yfQW
-----END PGP SIGNATURE-----

--=-kJqvtTvIehm+17QzwcKF--


--===============2008438677262814613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2008438677262814613==--

