Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67870C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DvQNgwegXUycEXS5Q90E2IHvMWj84Un0bC6NOh46ac=; b=u5O0lEOwm0IPVRWjMeu0Sx6Lvk
	YyhFiEGDDl9f4LQAItsrxL28/FfjOuIzHrJujM5NEHh1/hrGn1KL35Yn/1T+x4je3M5scsvObBWsb
	mqxh74tfp7J6KiY4KPGVbIjzBlv3Rtrbrb2ukLDBazHiIXf/2pf10bkKV+P0I6wtC+AwtIJvsMmrh
	y5QP840nnwr+uDl6CbRz2h9LtHOTZ2IKyPGmN2ge5IRrm9BbTCWLcF+u7Zlvs4frbh9bFMro+BSUB
	quvdSSMkrLKT3rrCDtDkuPE6fhlUhiix3zvVDiKgO3kY/mPSyVltKFepwrsW6WzHuGCCBBdqKQ0Yp
	ZjMcFoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovE5Q-001KYb-Hm; Wed, 16 Nov 2022 08:48:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovE5O-001KVT-4D; Wed, 16 Nov 2022 08:47:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id y203so16867433pfb.4;
        Wed, 16 Nov 2022 00:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n8bxFFOTwAuVXsEjTKys7ZF36ry2UF1nmF7gmPiaf9o=;
        b=cswWX4fVf+OYUo4g2DPif2BNP9U1p/zKsMBGouJImvNtg9sdnhCAv45pOnRUIpznDB
         fqmSa4dhOanbi4To6od+FvWYGgxL1LJ515+jBvpYzw/+8qpZuYO44qeSkMjH4eS8Dazy
         cU3t7ppwiqr3lZ/rs0SK2cMsp2BAp9wP2W5Xb+4jbVWJHOITSsjJQ6Mve0wl9CaRx1C9
         bHpj/Fy21aVwvj3epbjTALL1CTL8Wec8xvbdKKTp2iVyWX81kmP73JCSI//PJAk+Dr0M
         6fz3Wwnp4tZOw5G0bQ6bSlwyW5HN+iJc/0WwaLKCndak7wSbH6IaJvJkhIw8fjPA8ntp
         +Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8bxFFOTwAuVXsEjTKys7ZF36ry2UF1nmF7gmPiaf9o=;
        b=Sp7zbOtgccXT9pf4jOhqs0/25krItDx1qleGuj8/3Y52anMwsrAKQPPu+MFUsO+pdX
         xJNE1j6SS6JOrCZVBCmMrx8zPJiInffJsLKxQTRv50kQa7yuEu35M8uYZZUDka0+el48
         imPRdXoSnv6BlC/aX82yqhg6tXvLrrRxm+mjKwekg5bcss17rSPGO2mJ0qMnEDo2qncJ
         lHH9ITjpKU8qiSny6xvDHoALZNr7he7xYVZutJMh0UAQH71pnzDvM1srhQ8vpJN7jx8e
         0e1cOE4eAHY6WBeE4r2udFDTBITkEx9zQN5v4tW5fXUiFKP6F7yEFaIkp98oPSfQKPal
         IlMg==
X-Gm-Message-State: ANoB5pmrnyoCak1l6HVMGFVppap4p1ujUeavp7NXXTzpacsWnI7lrrmU
	T2xW4Ci2wN/Cz8nbY9PH2QM=
X-Google-Smtp-Source: AA0mqf5KolT+bzCO7+iur+0PeUF6229A02uPI0FAOcLd0+RPSIFBvapn+NMe4maSWGkH6dyQtMU5bQ==
X-Received: by 2002:a63:181e:0:b0:470:f0c:96da with SMTP id y30-20020a63181e000000b004700f0c96damr19053000pgl.544.1668588476021;
        Wed, 16 Nov 2022 00:47:56 -0800 (PST)
Received: from debian.me (subs02-180-214-232-81.three.co.id. [180.214.232.81])
        by smtp.gmail.com with ESMTPSA id t2-20020a170902e84200b00185507b5ef8sm11589693plg.50.2022.11.16.00.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:47:55 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 9C007103FF6; Wed, 16 Nov 2022 15:47:52 +0700 (WIB)
Date: Wed, 16 Nov 2022 15:47:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	John Garry <john.garry@huawei.com>,
	Wan Jiabing <wanjiabing@vivo.com>, Chris Healy <cphealy@gmail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <healych@amzon.com>
Subject: Re: [PATCH v10 1/2] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Message-ID: <Y3SjuC6xHn1uz2zX@debian.me>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_004758_195702_67BA6775 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: multipart/mixed; boundary="===============0758766462487066851=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0758766462487066851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rd8PJiydnsGM+b5x"
Content-Disposition: inline


--rd8PJiydnsGM+b5x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2022 at 08:31:32AM +0800, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
>=20
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.
>=20

Please write the patch description in imperative mood (no "This patch/commit
does foo" but "Do foo" instead).

What about this description below?

```
Add support for Amlogic Meson G12 Series SOC - DDR bandwidth PMU driver
framework and interfaces. The PMU can not only monitor the total DDR
bandwidth, but also individual IP module bandwidth.
```

> Example usage:
>=20
>  $ perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
>=20
> - or -
>=20
>  $ perf stat -a -e \
>    meson_ddr_bw/total_rw_bytes/,\
>    meson_ddr_bw/chan_1_rw_bytes,arm=3D1/ -I 1000 \
>    sleep 10
>=20
> g12 SoC support 4 channels to monitor DDR bandwidth
> simultaneously. Each channel can monitor up to 4 IP modules
> simultaneously.
>=20
> For Instance, If you want to get the sum of DDR bandwidth
> from CPU, GPU, USB3.0 and VDEC. You can use the following
> command parameters to display.
>=20
>  $ perf stat -a -e \
>    meson_ddr_bw/chan_2_rw_bytes,arm=3D1,gpu=3D1,usb3_0=3D1,nna=3D1/ -I 10=
00 \
>    sleep 10
>=20
> Other events are supported, and advertised via perf list.

The demo example should have been outside the patch description, though
(more appropriate documentation as in patch [2/2]).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--rd8PJiydnsGM+b5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY3SjsgAKCRD2uYlJVVFO
o+XjAQDRA87SSby3+T5aH+WfpuopGJByRRFMiYzJCseiyFilngEAmlWqahhkpQR8
76Yig+rYcpJSwsnPILG8mXd9eIiXGAM=
=CPHZ
-----END PGP SIGNATURE-----

--rd8PJiydnsGM+b5x--


--===============0758766462487066851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0758766462487066851==--

