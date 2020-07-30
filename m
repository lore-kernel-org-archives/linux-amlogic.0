Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A78C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40F220829
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LlcWQl4s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEBcihMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40F220829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=APkf3VWmUsvJ/gCAJZyfdK2sPm9Qt8GZ2lhJl7a/CnQ=; b=LlcWQl4sS5sLLj2aKhG4G7EWX
	VSy324/G8PQ7VDzMGGVDqfEOovK29JqJbGLN3KpJvGGajxUdBhm5ObGXzR1M75OWiwrT2i3z9qfr1
	9aWZ+qZSi1WBez1aEtPNLVFaroDNSbh29i3fgL6HWQepPndmZ4TsM6BLse2WlizaG2lxuH0Ic5ZmZ
	x6XtjMCcQleNR7PFUJP+SWalMoju7S1yH6j00Y/p+XZJZarQY5JUw+HCTKTNWBBkNPjI8OHEza0+i
	l5DrUffscATKuElQizG5jufHP0zsBXGZgrPnrrFXnwAq/7qM/qYJJts1HPNZ9gSsshpxkbmP/bA8v
	0kMTw4LsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1D3Q-00080r-Bo; Thu, 30 Jul 2020 18:13:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1D3O-00080P-CQ
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 18:13:19 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5C6D20829;
 Thu, 30 Jul 2020 18:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596132797;
 bh=vIJFWrnXpMFHH8EimughuB8y+lmfzGjAgR03PPlEdOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qEBcihMz9YjzJB2lwWShh3zEfgGGSl291HW4Zvh8Bc18dbNAvzbYgPG/tHuiihSBU
 jjyvar5wpDBOzT+X6soS9Ny2YyOBoVvbauv+mEFSwlpyjzsq/Si73sVCsUvBl3ZzTG
 rGdennpMtSdGeT66ngzeEAffDlKV9bHKCyxk6RyY=
Date: Thu, 30 Jul 2020 19:12:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
Message-ID: <20200730181257.GF5055@sirena.org.uk>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_141318_552148_88AAA836 
X-CRM114-Status: GOOD (  22.11  )
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4736783088721397623=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4736783088721397623==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 11:04:53AM +0200, Jerome Brunet wrote:

> Carrying redundant information makes things complex and error prone.
> If you really want to update this, here is another proposition:
>  * Removing snd_soc_dai_link_set_capabilities()
>  * Removing both flags completely
>  * Let ASoC figure out what is needed based on the components present.

My understanding is that that was broadly where we were headed with this
stuff - snd_soc_dai_link_set_capabilities() is trying to figure things
out from the components already, it's storing the flags as a cache but
could be modified so we use it every time we need a value.

>=20
> >
> >>
> >> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>
> >>   Hi Mark,
> >>
> >>   Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture ch=
ecks')
> >>   introduced more than one problem, the change
> >>   "ASoC: core: use less strict tests for dailink capabilities" [0] is =
still
> >>   necessary but the change of semantic remains a problem with it.
> >>
> >>   This patch applies on top of it.
> >>
> >>   sound/soc/soc-pcm.c | 14 --------------
> >>   1 file changed, 14 deletions(-)
> >>
> >> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> >> index 00ac1cbf6f88..2e205b738eae 100644
> >> --- a/sound/soc/soc-pcm.c
> >> +++ b/sound/soc/soc-pcm.c
> >> @@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd=
, int num)
> >>   					break;
> >>   				}
> >>   			}
> >> -
> >> -			if (!playback) {
> >> -				dev_err(rtd->card->dev,
> >> -					"No CPU DAIs support playback for stream %s\n",
> >> -					rtd->dai_link->stream_name);
> >> -				return -EINVAL;
> >> -			}
> >>   		}
> >>   		if (rtd->dai_link->dpcm_capture) {
> >>   			stream =3D SNDRV_PCM_STREAM_CAPTURE;
> >> @@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd=
, int num)
> >>   					break;
> >>   				}
> >>   			}
> >> -
> >> -			if (!capture) {
> >> -				dev_err(rtd->card->dev,
> >> -					"No CPU DAIs support capture for stream %s\n",
> >> -					rtd->dai_link->stream_name);
> >> -				return -EINVAL;
> >> -			}
> >>   		}
> >>   	} else {
> >>   		/* Adapt stream for codec2codec links */
> >>
>=20

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jDagACgkQJNaLcl1U
h9AuXgf8C4yoy4FY4cfbvcLUvUftWpBQ68HnBjmmDssWMcnsYPZ7eZAuo12Pivif
aUOrt8CMxCHQ2wDuoSwzLRNhAIHNUMBwGqLwTiLtT5vivhKDjZjnZqjtkswHWb2T
fJMyArIjKroVQWjmOkarx4gjKfx5mfv1RZmS3xnNvyD+YVY6AcCaITZuEo7j86td
QN1iHXQ1TPJI0wcql4Y3PEVkLC0O7F+4pReUCugbsPAfjTPvUc63KMfbtqzpQeov
WYBOnSzQyhJyeaT7YC9AaiGLgWcHq8o1TrmtQT+DD/qZotxlGOcaxx9GgHdkM3mq
X1YVKyKa3/VCh1h9xxE1P38ZSeo0qA==
=y7TQ
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--


--===============4736783088721397623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4736783088721397623==--

