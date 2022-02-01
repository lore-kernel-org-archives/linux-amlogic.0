Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C5C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Feb 2022 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5dv+1n3+R4S2KNvh3nxGA/K2Xp6KfVP6rrL1cd/TlY=; b=wJscIgChmQwhGqE/0Ymtb2fWeD
	zU1Vxcyp2gY4EortHz3J/FB1lfMqAI6GHIQAckXYOQJRV46l/cVM00KFPxAAVtvOHkIa19QGW+ScD
	r79r6JeMw26zYqaXx8rbMCDdL1rcGPwZluseS4O5SzZmojcEXJf+y3b7y+6KI+Xk9pD47UyOC4bkq
	JcuMLd4ktnGLqzrHWaelXwMeUWHecNVRPdGHoC59xqPVxSSGRuo/WRfBvqEEG5slDNqnUxUfvVlNM
	mzdAPtp+ruJqT7o51/nSwhjdkFT9fvbkoq7liRGy7Bmdx7a7tR6KFb1lYNPx8ECIdYlWNFAUb4OKs
	hXNiVTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEntM-00BPwC-HR; Tue, 01 Feb 2022 07:47:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEntJ-00BPv2-LV
 for linux-amlogic@lists.infradead.org; Tue, 01 Feb 2022 07:47:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id w14so32378033edd.10
 for <linux-amlogic@lists.infradead.org>; Mon, 31 Jan 2022 23:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OXwpypPprCxtY8e/4CjGLn2XMhoDuhJcb90FFRfLVgU=;
 b=h/joRXNroSiXYcyfh67qOX2sLX0JSoI3XZbePNcNWg0M91aHnnqkJupcxgi+AFooo2
 aVBK+SoktuifyfsOQgvCC/iNtgDQryBouSERmxTIFNHrGoi9bMEoA2SmDME5+LvyHJ1U
 vowActs2EUb+GlstTJXVrdFTvV4CWOwUcjDzxjGHZbgb1OwH3McnFROHK8KJohIHgdBS
 4RNc0Zy64y6oF1ULDf3PJWhq8BPcjzptXW1JBx1xUCdFAKM14HdjbBv29D9q6Pr5PL3G
 44SbPnTgbDg5wr/3f0Y2C+/21Mk9u2t3CMJO/4RcUtNw81P6qGXXIRGPydUO6Rwf2s1q
 c9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OXwpypPprCxtY8e/4CjGLn2XMhoDuhJcb90FFRfLVgU=;
 b=okwd8FLe/JF1p+5mL4uOPXL2QvQPbgulUnBfZhgdZnSfAaAV4SbnmwOi3q0ZuQbGzD
 YK1QMlqCp6Z6x2Vn4A1tkQ/VWnnK2gv5AJc6p5xOU1vnhhf60oeFaTHC2TaUElDDFx64
 riUB1/qX2REyCrgZQH+7bHb4WbHj5UqD+ygsPk+DCYU5862rmVLKtg6DjiTNnYL5w/wz
 xFPhdRBAUP50JEE1kzcxzxCsNHSCQpRG3McQI8IJx2mirf2LucZ57Zl4Gvl4+TqwbdDi
 jn02B9LanfrJS6CrllSCWnSI7oZWzD3tbSUw795UKIPK8/8fOhHNOH8YAPJJ0+uXP6Go
 i7fw==
X-Gm-Message-State: AOAM531zizpHWjI8wOxssQ1nwB3SjjmIAWlVttGiwf2jmtQiSfBqAidR
 pZ3qCymsgb95F2ug3hPKhLOQtxH4sgRosw==
X-Google-Smtp-Source: ABdhPJyULq4LQsDquOdq0yp0fUfXhyRLb8xd289UxduZB2vpdOJHotkGNbk9xEgyoKTlo/kOK/S42A==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr23802731edp.229.1643701670985; 
 Mon, 31 Jan 2022 23:47:50 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id cr8sm18726443edb.47.2022.01.31.23.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 23:47:50 -0800 (PST)
Date: Tue, 1 Feb 2022 08:47:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee.jones@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 1/4] pwm: meson: Drop always false check from .request()
Message-ID: <Yfjlo4JS490V95hM@orome>
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.1.5 (31b18ae9) (2021-12-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_234753_792214_41EE867B 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============1718074609037029376=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1718074609037029376==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pV92kODRvCrKSof2"
Content-Disposition: inline


--pV92kODRvCrKSof2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 02:46:24PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> In .request() pwm_get_chip_data() returns NULL always since commit
> e926b12c611c ("pwm: Clear chip_data in pwm_put()"). (And if it didn't
> returning 0 would be wrong because then .request() wouldn't reenable
> the clk which the other driver code depends on.)
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/pwm-meson.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

All four patches applied, thanks.

Thierry

--pV92kODRvCrKSof2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmH45aMACgkQ3SOs138+
s6Fh9w//Ql8gqrdnYtrBphgXpsXa+yk/FR7NA5zyU+eSjy2ofl1u5wzR4KiOoXqX
/ieJL7czibRQSwCAiLymde6Fcd5u+wQCIzIQDTh+qX1AB/CUINB41rnBGW363r3y
SZLxiXyW8gG8XfNeiDHGMeT/16kdrOmmR/MecHyQ7hFfll65NdXkE6HRc72JKBS0
fK19zqYeeUDlP5nEvOByEeYjWAHmDsV5t7uZhurCILELTKWovkaUtpfrxl6hZFCg
fTuySv2AZ5uwKtkt2XhP5F+m/r6pC5DX+7HmbRTLhoboi8p7GHo0ruYp0GuLdYtC
9bqSSF29eLLzbeLXHsQnJds8L7cetQMHfskq2J34k68BAZnIiGnUKRgcKMvBKb8w
QomZtdaOLN+0K7s3jj0utSHzrG4qYSKg3qBixg3rOgSbSWfEY2kW9aZpzT6M0FuG
O2UpmKlBPD8zg2PNSmiMXGISoCwF2OlzDk46ucSTcC15a/Qg091SeghDf0CJNs//
5GUWcFwUY0p3FJPYeamdcV/00zWJiWpvwqo9J2L+/8Iv7Atax3jvYeUam6CXhtTQ
eCU5JOfKcmIXHxbKA7vng1P88jPCqhAboO+xEa8gkAeyRgcXNNvABSw0oOet08ze
sBNSnmONY8dzWELPtJLAsEVUuqoKXOTtmDfH2LwRzOhuuU++k28=
=p3pi
-----END PGP SIGNATURE-----

--pV92kODRvCrKSof2--


--===============1718074609037029376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1718074609037029376==--

