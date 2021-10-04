Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0CBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 12:23:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A13E6124C
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 12:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A13E6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZCKTiGmwADhKEMtuvZpZN35v8W+rcLPl+HYQ7gNRZY=; b=OOSnK9suRAQt437Y1uyd4+k4fx
	tT0/8dg/pOj2AuyXz/wpXUQEenxkA2RLnW5tEu34sX78ts4CueETOI+em2fePyIMlpKSYTdeM4RUr
	AK/QoVijlPNTTqXHl3cnc/CPrBvSyf1VtUVGSSTL5I9zXvutbhrukkapt6dYGEsKdya0jRS8Mmlrs
	JyYaE4RSuQ14C3LsZ2pbPyeAkSSzgIvOT5dD+WjbTwZlg8av9NLgi8u19+pnwnQDp0GFNHV3zjyOX
	jAQK4Xs8eEOPxMb19qCxrDoJq8dzIE9nZrohalica7nkINyK5brlDRorKYaDBTsfqXg3WlQhpW5q2
	hhBXVAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXN0K-006QkM-J2; Mon, 04 Oct 2021 12:23:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXN0G-006QjT-GQ; Mon, 04 Oct 2021 12:23:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89A736124C;
 Mon,  4 Oct 2021 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633350211;
 bh=ej7aJ0FW65oKsNtQjiH6FThlyKBsKax9Z2ffsEWdqTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8To3342g6UJ4vhD+OEmlMItibW536UAqAdbB+SVo6NVWWujgoLiFCBu3+FhKRHrq
 E2vD0eLdJXx+jZgCn9e+gmN+3aTBM7jUb8N/iUZH52RqRZfCFPp6r+uSOKC5+VTbVO
 h26tTuiC6+iTaaAfa0LyDzG90xPS/Ic88ckVvr4uxZz+sV06mwDvW5bb8MRfw1pTIH
 1kxRoZluNAVqZ5XIi2Bp4LGXjNgavrWtuvv6IigN6UgKStxSoqy6ifWvGNkyIGA+El
 7GDGK6r3NyAq5yX8EjpqzPAp8CkFEM0hercTJK15B81dfXmr6dzgVTcMCmB0jyn6oM
 Yrdceo7T4tL6g==
Date: Mon, 4 Oct 2021 13:23:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVryQb3myHBVcIAx@sirena.org.uk>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
X-Cookie: If it heals good, say it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_052332_618282_798D9691 
X-CRM114-Status: GOOD (  44.41  )
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
Content-Type: multipart/mixed; boundary="===============5036585040431342307=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5036585040431342307==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+Vq12Du1ArhJUSc"
Content-Disposition: inline


--/+Vq12Du1ArhJUSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 09:17:39PM +0200, Martin Blumenstingl wrote:

> old 32-bit u-boot sources from the Endless Mini do have some
> documentation on AIU_I2S_SYNC [0]:
> // 8'b0_000_1_1_10
> // A write to this register will cause the interface to repeat the current
> // sample. Can be used to regain synchronization.
> // A read from this register indicates that the next sample to be sent
> // out of the interface should go into the _left_ channel of the dac.

> There's also a note about AIU_I2S_MISC stating:
> // Bit 4 if true, force each audio data to left or right according to
> the bit attached with the audio data
> // This bit should be used with Register AIU_i2s_sync(0x511) together

> To be honest: to me this is not helpful since I don't understand
> how/why the left channel is of importance.

The left channel is important because for most (I think all?) audio
formats the first channel sent after each frame sync is the left
channel, if you're trying to resync it's useful to know when a left
frame is going to be sent.

>=20
> > At the time, It was completely new driver. Even if was not rock solid,
> > it was still progress and I opted to upstream it with an imperfect 8ch
> > support so people could help debug it. This was mentioned in the
> > original submission.
> >
> > The other solution is to restrict to 2ch mode and remove
> > AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC pokes. There will be no noise
> > anymore.
> I think Christian (Hewitt) agrees on this point as he mentioned that
> your earlier versions of the AIU code (before it got upstream) were
> not affected by the "machine gun noise" issue.
> Does the documentation from above give you any new ideas (assuming
> that it's correct since it's the best we have)? Should I try playing
> with AIU_RST_SOFT_I2S_FAST and AIU_I2S_SYNC to see if I can make a
> difference?
>=20
> [...]
> > Here you describe a DAI link (think of it as wires) between the SPDIF
> > encoder (output) and AIU_HDMI input PCM. This is not what the HW is and
> > it is not possible.
> >
> > Let's start from the HDMI controller.
> > The designware (on amlogic SoC) has 2 interface for audio input.
> > 1) PCM/I2S: a classic interface 2 clocks and N data line
> > 2) SPDIF: The Sony Philips 1 wire interface
> The Transwitch HDMI TX controller supports these two inputs so even
> though the IP is different the basic functionality (which we'll
> discuss below) is the same.
>=20
> > Whatever comes up on 1) has to be some sort of i2s signal. So SPDIF
> > won't fly there.
> I agree with this
>=20
> > AIU_HDMI output is Hardwired to 1). It is just just a digital mux,
> > implemented as an ASoC codec which allows to seleted one of 2 audio
> > sources:
> > A) the i2s output implemented as part of the AIU
> > B) the PCM output, part the AUDIN (yes, an output in AUDIN) block. This
> > is not implemented ATM.
> This is some interesting information, I thought that PCM was used
> because PCM audio can be transmitted over SPDIF.
>=20
> For A) my understanding is different though:
> - for AIU_HDMI_CLK_DATA_CTRL[5:4] (HDMI_DATA_SEL) your description
> matches my understanding. For me it makes sense that SPDIF data cannot
> be selected with this register since it's a one-wire protocol (and
> doesn't have separate data/clock lines). Value 0x2 selects the I2S
> data interface
> - for AIU_HDMI_CLK_DATA_CTRL[1:0] (HDMI_DATA_CLK_SEL) however I have a
> different understanding: 0x0 disables the clock signal to the HDMI TX
> controller, 0x1 selects the PCM clock (which now I have learned is
> related to the AUDIN block) and 0x2 selects the "AIU clock" (see
> below)
> - my understanding is that "AIU clock" comes from AIU_CLK_CTRL_MORE[6]
> (HDMITX_SEL_AOCLKX2) where 0x0 selects "cts_i958 as AIU clk to
> hdmi_tx_audio_master_clk" (SPDIF clock) and 0x1 selects
> "cts_aoclkx2_int as AIU clk to hdmi_tx_audio_master_clk" (I2S clock)
>=20
> So to me this means that there's three different muxes:
> - data mux to choose between 0x0 (all zeros), 0x1 (PCM) and 0x2 (I2S)
> - clock mux to choose between 0x0 (disabled), 0x1 (PCM) and 0x2
> (hdmi_tx_audio_master_clk)
> - hdmi_tx_audio_master_clk clock mux to choose between 0x0 (cts_i958)
> and 0x1 (cts_aoclkx2_int)
>=20
> Based on that I think that it's not possible to have AIU output the
> I2S and SPDIF signals at the same time to the HDMI TX controller and
> then letting the HDMI TX controller choose which one to use.
> Based on whichever signal (I2S or SPDIF) we want to use for HDMI we
> need to configure AIU accordingly (data and clock).
>=20
> [...]
> > It is not meant to. The dai_link and the endpoint are i2s.
> > Your HDMI controller should have 2 inputs and should have a way to
> > select one or the other. The format at each of the (internal) input does
> > not change
> ah, that makes sense.
> Let's say AIU has some internal muxing for the HDMI output then AIU
> would have two outputs as well (let's call them HDMI_OUT_I2S and
> HDMI_OUT_SPDIF).
> Then I'd wire up each of these to their corresponding inputs on the
> HDMI TX controller.
>=20
>=20
> Best regards,
> Martin

--/+Vq12Du1ArhJUSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa8kAACgkQJNaLcl1U
h9BMJwf/d07nv9RvNZHG5kWNU/JXFm14eDZ04SF4RdZ8I320a4C5dlJmNPw/jxwL
XXW9FK3/+o/D7tqAdZhXu+Jo1gng9/SzqhyEntA4mXZSit/QhFkbAtAFCHZe0fPa
X3/0ed3NpFqQ/kxXXrOKqT58xgd9YmzayJsOmphoqyg5CuwfjXQscOXEDpmmIqAV
Sa2lMR72R8hQM6LawLuRCctfrGzz27DHwmQU+y0le8rTzwtVY8irYYVRkK+w8R2a
grsSNGqLupzt5trqsX2vnfD4zaPkAiLlTVFrItxUSVKd/bGu4ibJDUb4l0Qlmwnu
uAkefotjbjTiYRhE46CruMibys76yQ==
=X6z2
-----END PGP SIGNATURE-----

--/+Vq12Du1ArhJUSc--


--===============5036585040431342307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5036585040431342307==--

