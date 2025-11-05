Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA1ECCF9F8
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Nov 2025 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luTZcQIaHhzTHQ0R6/+9VrdMA6ZCmF1vqGdvL6aa+qA=; b=jFS3jUBq0O+Y8r920nQPYUENBU
	pQa0edZHCynCUZz92iIP9FHBU0vw6KPUQqFt8FUVgdeR1HxxCprT88zIy4L1Ac4Zd46zPf7Y9q8jZ
	y4/QYny9olpq9O3VkNhPIxEO4UtXVCCw+x9EuInyQDEvyRLpUaG5GvtTxk4BVQgJvU+xlZm6H3gGr
	FPLaJpKvKQW0gDiL+X29aNIOQVA0utC9Q0SDJJiX2LwO3FN08lO+TqwcR4DRhWiFtJL7qVevnEWlc
	+a8Kqcj6D+UqnGV1hukzl4cu20D1lCJoVO04WmEYPM5qxUSRlvPzxmWgIoSgD7Bo/g6J270og5uw/
	LEL90Y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGe0X-0000000DorL-0Xof;
	Wed, 05 Nov 2025 13:57:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGe0T-0000000Doqw-2kQT
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Nov 2025 13:57:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-340c1c05feeso3939086a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Nov 2025 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762351021; x=1762955821; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zP41Rmpn5mMZPXrAIAfE+G59N4Vqeo9bSbuVW5Vwl9E=;
        b=BDEogI1M/EbjJNjAlmkFLbza6/Gz2zQR2QMna+LnS1dwJLfllhZDd/lXLEbhxMTqS0
         giBHV/dk3UkLm3butIkxP8AcGk5Nf+aXMJf+cREDH/fJtlfqgDCrfjTmWtEJgvtv/pUK
         bjE7stO/1KrfdWF1jkQZXEtc6aqnTgxQhFz2ZK4jKDX79ubOyP0typcPSncQa2VWhvvD
         BE1M3ZQcZeicbbPizTq9GdxKzkDP9RjFhcLHosGbmGQyWUGta4dfblQzDmd/3ZwUgr+g
         7QQanfvbZJ8EdfGF6VURrtC4OUBizXzwaS290C5MNYrYIAdC7ZsP7IWkOpK4/PipZ9Sk
         BIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762351021; x=1762955821;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP41Rmpn5mMZPXrAIAfE+G59N4Vqeo9bSbuVW5Vwl9E=;
        b=vUt1/mZfvTqYPK01vfwSNGrb3Co+JSdr4zARhVBKDE138dbjpII3QJk6kmdW4wpzek
         ZgTam86pjsxCrY3kqQqJAjmgItBonnteIqnmfJNMA3uoBGQolKNBbDgUgTYPROtiGE87
         rdAv4MblO5YJ+8nGViUBTrAjxDvNP25FblOi6NydTbUoy3PekF7+RNtR0gVDr3v3ciWZ
         0hQJb7YRu4pYtau0qNMSFJZS9GxXU0B2NxPY+fiv1ADnbub7Z+O/C1hD6GRTieihUEgx
         lHUaUX5nv29p4iGqi8iMKd6ISavBb0p0fH/wp6rkgfgAWPiiTQnJW8Jlmkv28/THpwlH
         nKHg==
X-Forwarded-Encrypted: i=1; AJvYcCX7OW0ntPocAcshE0jCTmLO+NOJ6aVIjd6qtOFXBRNlv9CvI5/U5PFn2u5LTlwE7vdJ7vnx1FTRZYk7Itzl@lists.infradead.org
X-Gm-Message-State: AOJu0YxRMNoftXBAm8217Re21xLEjYRYAkEX5OJBH9yKpDxu5g8D0akj
	Fu50hp8axqDP9lExRVYL8RXWUS3FJMSZ4MxGT6za3k7FwN20x5UVanIR+QHdw+3ZAtHoAIA1oq+
	YbyQu
X-Gm-Gg: ASbGncvM8UtadV4pcj7ja2OzvyZZGt+SFZPO8OdHkfPwiIPkyJf25kEP2X2lVR6Vsck
	KG5Jp+nFbB1iP498WtvwEkHn9LhCS8d5xDxLqOqQijpF6/nRrqC4A3uA72bnDoH2WG9DpS9C2pS
	FIUUoJSk+pDq3VzTFZXIKinUf51m7foIIxqqSScpW0AN7KW2a+XzNKE+ZPtMbStrpyUCWo+n1Xp
	4SgRug/i+zdF7DE3wCjzIE+4Ipac1MH9qDGLE0jfjUWQKzXy3fRIOU6yHIFlNqZh11KJElh7dFB
	geawECFMxTcJNhhquRnsF0e/L8aOyL/eLqOje4TJpk4amZLDsQS0JAdw4WUgTdKDD8QDd9B+3t6
	eFvpHOZI2igIIQuGPUY+xKqqIItKNJX4nxmNNvbvmRte+WNLuPJwwWxWA8EuYFl6KTvW+qMNbMT
	W6Ox78EQ==
X-Google-Smtp-Source: AGHT+IHjDb17WJE5ovnji+ZuOA/1CxRvnHlgllSFFQ/L3BHsKI5wbhqVXzK9pnt8K5pFCIhkgw4W3A==
X-Received: by 2002:a05:620a:4045:b0:8b0:f8c4:a5fe with SMTP id af79cd13be357-8b220c001f8mr430100785a.89.1762350686452;
        Wed, 05 Nov 2025 05:51:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f5413f43sm432543785a.8.2025.11.05.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:51:25 -0800 (PST)
Message-ID: <6d046cef20dcef4eb14aba6fa89e30d303f6a1b5.camel@ndufresne.ca>
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
Date: Wed, 05 Nov 2025 08:51:23 -0500
In-Reply-To: <174ef722-99f0-440d-8eee-5dca086e13f0@amlogic.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
	 <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
	 <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
	 <b6e6881197dc4c83e43ef5eb1f20c2bf1887d395.camel@ndufresne.ca>
	 <174ef722-99f0-440d-8eee-5dca086e13f0@amlogic.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_055701_693886_DA1821BD 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: multipart/mixed; boundary="===============6758200530424718910=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6758200530424718910==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2cG765y6sSQkAAGLj2Ko"


--=-2cG765y6sSQkAAGLj2Ko
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 05 novembre 2025 =C3=A0 17:26 +0800, Zhentao Guo a =C3=A9crit=
=C2=A0:
>=20
> =E5=9C=A8 2025/11/5 0:13, Nicolas Dufresne =E5=86=99=E9=81=93:
> > [You don't often get email from nicolas@ndufresne.ca. Learn why this is
> > important at https://aka.ms/LearnAboutSenderIdentification=C2=A0]
> >=20
> > [ EXTERNAL EMAIL ]
>=20
> Yes, we plan to support the interlaced and mbaff streams in the=20
> following stages. The decoder hardware can support interlaced/mbaff.

Perfect, let's focus on the core for now then, I have additional feedback f=
or
you on top of Neil's review, hopefully I can get these ready this week.

regards,
Nicolas

--=-2cG765y6sSQkAAGLj2Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQtWXAAKCRDZQZRRKWBy
9C7bAP9Qs1rNKbRgDkazxpbW2p5TVrPLZK8wjWZLZUY+/CCltwD+LgR3cm+8x2UQ
D82jlWcSVIKc5R+xySP7dgFgB+WISQU=
=2auc
-----END PGP SIGNATURE-----

--=-2cG765y6sSQkAAGLj2Ko--


--===============6758200530424718910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6758200530424718910==--

