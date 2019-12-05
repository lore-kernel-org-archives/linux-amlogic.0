Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF3EC43603
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDBD206DB
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQONJ80q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ndufresne-ca.20150623.gappssmtp.com header.i=@ndufresne-ca.20150623.gappssmtp.com header.b="sHhQYvEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFDBD206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/cBDXh4DqE9Vina314Fc6U5bnSQPEIvqSLsTpV1Vwo=; b=uQONJ80qowmwSvfWFJmnQDy35
	HHFGg1Pq2yyOplTEk2gf6L3m0m1Cbd3iXFI66mSdZfKJxZaR2uf58iByFfqTQdJ+Dijl9kr7nqlmw
	vfdwg4CLUC/hrFtfSJOjpldCGWGc5WSaXJJgnF8SROXvyF3aiaXSBZ45xL2GgJv0Tx+gKgzGGNlR2
	kmiVb1e15LVbLN5crTeeiLgmjh28bPZ8uCW6sSasQmxyKRbVRjZEO/ZVwkTceIrPSCX2Ol2v8DkIP
	p9Hrcj5IwYORon20GYnOYfxA2wpeZkupQUCc+vUfwB4xwUgrZH+gEZPU9cmL+qK6ETR6kW6zc4jyQ
	+GxDo3DFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ictGq-0008An-Du; Thu, 05 Dec 2019 15:42:24 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ictGe-0007uv-9C
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:42:14 +0000
Received: by mail-qt1-x842.google.com with SMTP id j5so3902821qtq.9
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=OwOsp0F/TuvXuBAZVWFLSRxPXxk36KcaT4hqJzt5etw=;
 b=sHhQYvEKZdpVgz+KkBfGyzTB1ZFIImEe0xnXX4IWG7/7VZ0REpiuhiM0nBf/9TYqXY
 zZjAxQgdB0mZ1SlVRRho7P456XyC31q/08A0QZmhA9NOKlPfEltWBnGiUxNU7DS0foXY
 IMq4HRDe9GJt0isPwnOIL+0C00a0JFUMq7VcD5I42vjJOmPfah9Ud4n1HVN5EdY+HO0Q
 uB/1vlRyQgIKkaeNBdgUruAfwRTvF0MBFsyRUoaIy2EFZCta0k+y6KXkE89o6qyeOOJS
 mpedKMcVhsRFhBHxkQlZAbnhMZ42XGe40YeiYrhQc1wAzG1P+C39frNT8AGTvl55eQaq
 rYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=OwOsp0F/TuvXuBAZVWFLSRxPXxk36KcaT4hqJzt5etw=;
 b=RTQplAcB4dmOFB1zCO9zVr2LbTtmjOo+jLaSl8fe3bRyZSVel5V0oGu37wVPh59l9d
 ODrR0k/HoNk/GYR4r0/um1jJFtJ6eOFtVXiIg/lV57OLxU2ha2pZghWNsTfFa+Upj5Z5
 0tv6Wq0LhaGEjj2UJuuQP0dG/3+gk+Hc1nLPnCisglIwwtpQYeyDr1cQWRwyPQ0PyDuY
 3pqvjPNqE7iPQxEU5QFFvS3yaPu90Yeyxw/xkWPOy5IxMqeRFz9hBxSLXNqvo4s+UboN
 81sIQ9VJsoxcc+RbRaR44msfh4dB1nYkKiINGhJgUJFmOdMCoeIQYB6qrLRHeqKnrIjg
 5tfA==
X-Gm-Message-State: APjAAAWOXoynCE+NBBv801+M36ptJuyNv1a0qnx727MvaA21UplGy36j
 GJPiQhC2yjF1hsPowrUxSK6SlQ==
X-Google-Smtp-Source: APXvYqxhgq9S3eqxIsafZmc422I3ktIWTflCu9l5FHoEmq6ZHKX4QXZyBnGD/72JxAfxFWgOiTdcTA==
X-Received: by 2002:ac8:2201:: with SMTP id o1mr8155339qto.247.1575560527076; 
 Thu, 05 Dec 2019 07:42:07 -0800 (PST)
Received: from tpx230-nicolas ([2610:98:8005::650])
 by smtp.gmail.com with ESMTPSA id q73sm5026681qka.56.2019.12.05.07.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:42:05 -0800 (PST)
Message-ID: <4ee20fdf5182b7bfe338e9ae044424b6125fed15.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] media: meson: vdec: Add VP9 decoding support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org, 
 hans.verkuil@cisco.com
Date: Thu, 05 Dec 2019 10:42:04 -0500
In-Reply-To: <20191205092454.26075-1-narmstrong@baylibre.com>
References: <20191205092454.26075-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_074212_318517_973AB0D3 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: linux-amlogic@lists.infradead.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4228382203363098511=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4228382203363098511==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-zFAtbRJdW+9MLmbh/mcs"


--=-zFAtbRJdW+9MLmbh/mcs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Le jeudi 05 d=C3=A9cembre 2019 =C3=A0 10:24 +0100, Neil Armstrong a =C3=A9c=
rit :
> Hello,
>=20
> This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & S=
M1
> platforms for the amlogic stateful video decoder driver.
>=20
> With this, it passes v4l2-compliance with streaming on Amlogic G12A and
> Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
> pyv4l2compliance script for VP9 at [2].
>=20
> The original script kept the IVF headers in the stream, confusing the
> decoder. The fixed script only extracts the payload from the IVF containe=
r.
>=20
> The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yu=
v420
> samples, passing 82 resolutions test streams, with 13 fails by pixel
> differences and 3 timeouts.

How do you handle resolution changes on delta frames ? It's a bit of a
challenge since the reference frames are not at the same resolution as
the frames to be decoded. This breaks the assumption for the resolution
changes mechanism as described in the spec.

On stateless side, Boris is introducing DESTROY_BUFS, so we can free
the references when they are not used anymore. But the reference are
managed by userspace and are not queued. While on stateful side so far,
it was assumed that references are queued, and the semantic of S_FMT is
that it must apply to the entire set of queued buffer.

I think most streams will work and won't use this feature, but I'm
worried that writing a compliant VP9 decoder is currently not possible.

>=20
> This patchset depends on :
> - G12A enablement at [3]
> - SM1 enablement at [4]
> - H.264 and compliance at [5]
>=20
> [1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jell=
yfish_1080_10s_5MB.vp9.hdr
> [2] https://github.com/superna9999/pyv4l2compliance
> [3] https://lore.kernel.org/linux-media/20191120111430.29552-1-narmstrong=
@baylibre.com
> [4] https://lore.kernel.org/linux-media/20191121101429.23831-1-narmstrong=
@baylibre.com
> [5] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong=
@baylibre.com
>=20
> The compliance log is:
> # v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
> v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
>=20
> Compliance test for meson-vdec device /dev/video0:
>=20
> Driver Info:
> 	Driver name      : meson-vdec
> 	Card type        : Amlogic Video Decoder
> 	Bus info         : platform:meson-vdec
> 	Driver version   : 5.4.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Decoder
>=20
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
>=20
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
>=20
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 2 Private Controls: 0
>=20
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
>=20
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
>=20
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
>=20
> Test input 0:
>=20
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture Multiplanar: Captured 200 buffers  =20
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 200 buffers  =20
> 	test MMAP (epoll): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
>=20
> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Wa=
rnings: 0
>=20
> Maxime Jourdan (4):
>   media: meson: vdec: add helpers for lossless framebuffer compression
>     buffers
>   media: meson: vdec: add common HEVC decoder support
>   media: meson: vdec: add VP9 input support
>   media: meson: vdec: add VP9 decoder support
>=20
> Neil Armstrong (1):
>   media: meson: vdec: align stride on 32 bytes
>=20
>  drivers/staging/media/meson/vdec/Makefile     |    4 +-
>  .../media/meson/vdec/codec_hevc_common.c      |  285 ++++
>  .../media/meson/vdec/codec_hevc_common.h      |   77 ++
>  drivers/staging/media/meson/vdec/codec_vp9.c  | 1192 +++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>  drivers/staging/media/meson/vdec/esparser.c   |  142 +-
>  drivers/staging/media/meson/vdec/hevc_regs.h  |  218 +++
>  drivers/staging/media/meson/vdec/vdec.c       |   10 +-
>  .../staging/media/meson/vdec/vdec_helpers.c   |   31 +-
>  .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
>  drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++++
>  drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>  13 files changed, 2245 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
>  create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
>  create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
>=20

--=-zFAtbRJdW+9MLmbh/mcs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXeklTAAKCRBxUwItrAao
HB2IAKCwgusKW/k4VswQH6w3Jw59uL+q0gCgy5robqQi/K53oHyU3gtI9MC3ugY=
=6Yaq
-----END PGP SIGNATURE-----

--=-zFAtbRJdW+9MLmbh/mcs--



--===============4228382203363098511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4228382203363098511==--


