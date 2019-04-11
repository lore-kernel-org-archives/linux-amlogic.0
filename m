Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141F9C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 17:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74E52084D
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 17:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlxKQQ1I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ndufresne-ca.20150623.gappssmtp.com header.i=@ndufresne-ca.20150623.gappssmtp.com header.b="joCx54FI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74E52084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5lA+CHf4q7kQcuVManWEqe/4U4OW1V2GqQyJIhYW9W8=; b=AlxKQQ1IC6Icehf09nd5E00o/
	o9Va6fIJL6Fidn1Td7XBeaf6EAQVq/lTu3XAJZVRmU4JHpnYgqYnCcgavJR/r8ICnUWszTcbkvUB9
	zth+HNnsuDwQeI0+vsWofnjOD5iTeMwUuIdJHK84cLaVNo7IVVyJjw3AZhQm+gPnQfrKHfhGgpl6r
	G/Up686UpAbiyjVnJLJ8qe19//kikMa9JIULWqOKBR+hzRBAK6hWMkUtIkcg4FwykzzKXMMc7eyQq
	OBGjHieT6ggd6N4F0JhQLx5yho1zEFSr91rIGqeA7gv6mZlldmkva6Jtjj6aygJ66xZ+qxq6ljSOo
	7Lmrwgn5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEdUP-0001HO-Ka; Thu, 11 Apr 2019 17:27:53 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEdUM-0001Gh-Pz
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 17:27:52 +0000
Received: by mail-qt1-x834.google.com with SMTP id w5so7986573qtb.11
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version; bh=0n2sntVxEuyxzVWAfCyoATF86Z9F59/3dGEdNdRNywo=;
 b=joCx54FIQNyEMDdeldA1YQDsINGUph7tIO98VI8IQEg125al8n+wnAMeJ2xRa1vBj2
 81XVJlP+d2QdMWO3nDf/F0neV/F6R7pHLAiS/aoT/E5oGxbQygXzGOW6iE1r69eaXAk7
 DY/7GyrHEIAffoheCa+FLO627pIHT1fMvOMs8Lr8G8oRoJA2NwI2mcFXqkXoeUU0whTf
 Aq2bSgx41Ss8V1eqWhL6rwBXYGI6AoV9Crwwa9TKQqEMQ0PIrUw61M5rqwn347M50GxM
 24kOrxmMlN5h1MzwR/hGtcSIkubo1OxcA++0WBffN9Hl3AcyYGU038inFNY+tN3tKsji
 8A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version;
 bh=0n2sntVxEuyxzVWAfCyoATF86Z9F59/3dGEdNdRNywo=;
 b=LaqepSQOVXHmWRLVBn2cayjam4c+ZILuYc7IluTDxAiSgXrghQPcZTLkpZKCkBO/GB
 9qu71NaLLoF4LVXCDfaURwGUYXk5AxZaCsFrSimzzQQCK/is/KcyXyMw/jzEls25CE67
 csiDNWEa8DRh8zKOuieiOOG9Lugmo7zHRj4YgqGc2fcEquNkk2yshEzBtnt7oY6G21mA
 AQgQbn2Odcakg0/dJZKhgK+VfnKZFTc2lAQAddLhdzi2fuGMp5wQ4ZehWQD+s2LHLCia
 SV+E4CT1UDJwbPCwJyrL0a8MXo/33bTIXO47pFGprRQrEf7PugjgfIBytpBRfchZ3nv+
 n2Nw==
X-Gm-Message-State: APjAAAVfdqtfC0jO0bqvbA1i19xpT7fg/FbNTAvY7o3cKAWAhi3GqoAm
 KMsblaDrDsJB0lT/oyCzOezYKw==
X-Google-Smtp-Source: APXvYqw5lIIj5+929uugNARQwq33NF53epl+NcWgZmku50OxBMnyuP1TNgZ7YiyCQr7C5zSTSp0HLQ==
X-Received: by 2002:a0c:9922:: with SMTP id h31mr40473243qvd.137.1555003669102; 
 Thu, 11 Apr 2019 10:27:49 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl
 (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
 by smtp.gmail.com with ESMTPSA id a188sm15224286qkf.34.2019.04.11.10.27.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Apr 2019 10:27:47 -0700 (PDT)
Message-ID: <c78ecdb2130e8ed68b4604b584e30e6e653f278a.camel@ndufresne.ca>
Subject: Re: v4l error on stretch c2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Carl Karsten <carl@nextdayvideo.com>, linux-amlogic@lists.infradead.org
Date: Thu, 11 Apr 2019 13:27:45 -0400
In-Reply-To: <CADmzSSjwqDgabEbzq3Co3oRVW=kJRE4Dnyyqvzw=RxBDTr7Z+g@mail.gmail.com>
References: <CADmzSSj+dm6siBGP-LPzJ=i1pZU3vK7z-VsR4Qf6HT2yu8Z-6Q@mail.gmail.com>
 <CADmzSSjwqDgabEbzq3Co3oRVW=kJRE4Dnyyqvzw=RxBDTr7Z+g@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_102750_905485_3A0DC224 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Type: multipart/mixed; boundary="===============7643407797559040732=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7643407797559040732==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-SkhkPgsaDMG7m7nvLKrT"


--=-SkhkPgsaDMG7m7nvLKrT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 11 avril 2019 =C3=A0 10:25 -0500, Carl Karsten a =C3=A9crit :
> Hmm, it magically fixed itself. maybe.
> even after a reboot.

You should have capture the kernel logs after the error. We still have
very fragile camera firmware around which Gst probing endup crashing
right before we start capturing. I have drastically reduced the number
of ioctl we do to reach capture state, which solves some of the
firmware crash issue fully or partially, I'm not sure what Gst version
you are on, but it's always worth trying a newer version.

In your code, if you catch an V4L2 error, then most of the time you
just have to wait between 15 and 30s before retrying while uvc driver
is resetting the camera.

>=20
> here is baseline of what works when the v4l device was erroring:
>=20
> More info:
> https://www.armbian.com/odroid-c2/ Stretch
>=20
> modprobe vivid
> dmesg
> [33294.994948] vivid-000: V4L2 capture device registered as video3
>=20
> root@odroid3:~# gst-launch-1.0 v4l2src device=3D/dev/video3 ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
>=20
> (no error)
>=20
>=20
>=20
>=20
>=20
>=20
> On Thu, Apr 11, 2019 at 1:16 AM Carl Karsten <carl@nextdayvideo.com> wrot=
e:
> > I'm getting errors reading a uvc video stream:
> >=20
> > Linux odroid3 4.19.20-meson64 #5.75 SMP PREEMPT Fri Feb 8 10:08:40 CET
> > 2019 aarch64 GNU/Linux
> >=20
> >  gst-launch-1.0 v4l2src device=3D/dev/hdmi2usb/by-num/all0/video ! fake=
sink
> > error: XDG_RUNTIME_DIR not set in the environment.
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
> > not read from resource.
> > Additional debug info:
> > gstv4l2bufferpool.c(1058): gst_v4l2_buffer_pool_poll ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > poll error 1: Invalid argument (22)
> > Execution ended after 0:00:18.608430528
> > Setting pipeline to PAUSED ...
> > Setting pipeline to READY ...
> > Setting pipeline to NULL ...
> > Freeing pipeline ...
> >=20
> >  gst-launch-1.0 v4l2src device=3D/dev/hdmi2usb/by-num/all0/video ! fake=
sink
> > Setting pipeline to PAUSED ...
> > ERROR: Pipeline doesn't want to pause.
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> > '/dev/hdmi2usb/by-num/all0/video' is not a capture device.
> > Additional debug info:
> > v4l2_calls.c(633): gst_v4l2_open (): /GstPipeline:pipeline0/GstV4l2Src:=
v4l2src0:
> > Capabilities: 0x4a00000
> > Setting pipeline to NULL ...
> > Freeing pipeline ...
> >=20
> > --
> > Carl K
>=20
>=20

--=-SkhkPgsaDMG7m7nvLKrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXK95EQAKCRBxUwItrAao
HEmYAKC8zvPqD/3ywmQphr1lkUmTQtsZEQCfa6r81et0LS9UauG0tRhfrCcKIP8=
=tbjg
-----END PGP SIGNATURE-----

--=-SkhkPgsaDMG7m7nvLKrT--



--===============7643407797559040732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7643407797559040732==--


