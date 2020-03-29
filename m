Return-Path: <SRS0=Hgg4=5O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27563C43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 10:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE43920675
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Mar 2020 10:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXUZoCga";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+6jrG6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE43920675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tIPv1rxgXPE1umcw7IUfCqID1sewwr7CHBeZXAoIkow=; b=FXUZoCgaZiLNv+fG/BR7e92jS
	SDFzAhDxdh7BSIIgri5ajeBb4g/HEYX0kcpaC5DDz9r2xXCArJPSrrN+ODb1Ew4XmRqXSJnj/SCkc
	86nGHvmsWUrJui+qz6fIQutf8bttD84tA8T/vHEuQhcSu5SoXcI6a+D9lle47tDzDHdTzcqjpnGzR
	5FzwtfeQ/cl5pSVymXe4JvXyXDX2iX/tmM9sxrn33sXTl+hw+ROwyHdl3tHbKT3fRdbG/JWCr6WH8
	/rqXsyN41za3E5v+XhyZ9qCFQEMXAQoFa0KF+Etx1WpYCx243JSveXZZQYE+XVVeigZuWEu5ltlHd
	lNphoSWpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIVCz-0007ga-Rg; Sun, 29 Mar 2020 10:30:25 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIVCo-0007Zo-SF; Sun, 29 Mar 2020 10:30:17 +0000
Received: by mail-lj1-x241.google.com with SMTP id k21so14747145ljh.2;
 Sun, 29 Mar 2020 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=N3NqZnJ/CxQz+vgNsvaAHWGkQWp4JEs+xGk3PJVLusw=;
 b=W+6jrG6CBhLnlYGkAOJDbZ7SHq4ouY7T1YUPiP9PcofJuFJgtKpaaFWbkA6mhqr3w5
 wXhxJcdc+ZOSitnxl3+MEfB5kQHpDvIZuX8O3OfvkCmtxAUBgR6LnCh+0fpxuhcDIs5P
 QI1r+lSrE9ONAI2VwG86GljK+V0i+afoN+uI4Yg8rjIjdskpBqE2HcAwyLDhRWeYKWNP
 waa4sRGz04xikLcM5l5fgiptWD1YkkL80G8q2RI8iHvkN563BB+d3uVhst6G3CPAZSvn
 WLQvNalAXxnUfrGm5flsL94DudT1AjPE0XUPY678Ck0S9IguY0hdAc6KkBoy7oe6kkA/
 Z5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=N3NqZnJ/CxQz+vgNsvaAHWGkQWp4JEs+xGk3PJVLusw=;
 b=s9V2yIHDsOnaaJuV3+RbH3E0X6+n6H2NIqX0RafjGEKWZhl92dhZx/igEnxw8UhGqP
 qZZFwmWZqRQ+k5jZphzQEs1xIVwGmZbO1BgamsplF2+yvgtc1m+7EBSTkBS/WQ+lqp3J
 a+RIunxXRGZitcqhOBw6DHM5L7WKK3Sh9yrf0gvpFg9Coz0uO9lsr6dK31b53UOERUFO
 kJX4/Uk9CiXzohcOky3RexDM5/rZ1TUvAVq1WvZUI51ELPxRMBZbKGMg5xWJEi5K83uw
 7qicNCQuTSjEf8vDsVKPbg/PE8JUiMqyA5mAGo+P1QReodthb7ZFb9cYjn2txtsDKkhc
 zecA==
X-Gm-Message-State: AGi0PubNK1rPTxBQxHT8hiJsMsVyVRBKSrQlxvLiyOZPRJcxG8RjltuM
 tpMBGk1UV7ZsR+RvCX9ciUo=
X-Google-Smtp-Source: APiQypL26pRPoTg8hmK0zo9sxRXo65MAqpvyF6aUMysm+aHZ4u2UZCTAa1IwphYZOi+xJmhaZznDkw==
X-Received: by 2002:a2e:9146:: with SMTP id q6mr4211254ljg.240.1585477810916; 
 Sun, 29 Mar 2020 03:30:10 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id r10sm5229827ljk.13.2020.03.29.03.30.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Mar 2020 03:30:10 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 00/13] usb: dwc3: meson: add OTG support for GXL/GXM
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
Date: Sun, 29 Mar 2020 13:30:06 +0300
Message-ID: <87369rfo7l.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_033015_912855_35B6B6A6 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: multipart/mixed; boundary="===============5994350478904330459=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============5994350478904330459==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Neil Armstrong <narmstrong@baylibre.com> writes:

> The USB support was initialy done with a set of PHYs and dwc3-of-simple
> because the architecture of the USB complex was not understood correctly
> at the time (and proper documentation was missing...).
>
> But with the G12A family, the USB complex was correctly understood and
> implemented correctly.
> But seems the G12A architecture was derived for the GXL USB architecture,
> with minor differences and looks we can share most of the USB DWC3 glue
> driver.
>
> This patchset refactors and adds callbacks to handle the architecture
> difference while keeping the main code shared.
>
> The main difference is that on GXL/GXM the USB2 PHY control registers
> are mixed with the PHY registers (we already handle correctly), and
> the GLUE registers are allmost (99%) the same as G12A.
>
> But, the GXL/GXM HW is buggy, here are the quirks :
> - for the DWC2 controller to reset correctly, the GLUE mux must be switch=
ed
>   to peripheral when the DWC2 controlle probes. For now it's handled by s=
imply
>   switching to device when probing the subnodes, but it may be not enough
> - when manually switching from Host to Device when the USB port is not
>   populated (should not happen with proper Micro-USB/USB-C OTG switch), it
>   makes the DWC3 to crash. The only way to avoid that is to use the Host
>   Disconnect bit to disconnect the DWC3 controller from the port, but we =
can't
>   recover the Host functionnality unless resetting the DWC3 controller.
>   This bit is set when only manual switch is done, and a warning is print=
ed
>   on manual switching.
>
> The patches 1-8 should be applied first, then either waiting the next rel=
ease
> or if the usb maintainer can provide us a stable tag, we can use it to me=
rge
> the DT and bindings.

it's unclear to me if this series is ready to be merged. Can someone
confirm? If it is, can you resend with all reviewed by tags in place?

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AeK4ACgkQzL64meEa
mQaBrg/9HlcRQjYQsutKmZuRscMQWwFrkkYrNIRYUYOM13FibjrTl8YEv/ocy2Gk
huJi0X7JUcERQoCZsvkP6aORdnZ7LNdc/qLJ8uuaBGWCYcIy1uHZnMbqLsESrIXr
VaSBjW9v4Qon/YAKnQbb3JTo2sa9yBOdaJx4B/t0g0ke4QD2zaF9g+8UsAgU8HQX
DyE89wAn92AC399gPwF4U6xIPEXSHesRH4dSFcFajiaIEfG/rTleN+gZZYy/1Jag
owp+mE38Gr3nvNeYRUNsW5vJVibvVKv8pTv6CO4CZj3ZuACLqAm/zHmHZS1ML/pV
QoU02X9uK8O6hLl/coAvDQwwou9fvJ9c68dbgdkRMGC9M4Y0QqDkjYEWdyAHgdZN
TE0wmGkOZvVTrEorWSyrUDQGDSwp/mFJinYnAVMuZZPfLEHala6uUpojD1dvuCvj
A7Ljwj5ya84mbY+D5RbAoWfFayeDMoJcla7HHtz0wb9g+WzV6JwhZVJP4vaLbDDw
EeeSt6vBXOuh24lFVcGeKwrACbT38z9c+ZrbBKujrkYERR3zC5jQsoudxI2nSgb9
U/dew4yKRT1VUbK8y+mbneesrFSDcPDZO+uTkoKzSdW6NnbWM0Lnc2klmt1iYrYa
aplBe2DwyMcCIBFfqQo4NYj0HMzFzGqeG7qxX2E+0vI661nDE+k=
=LsIt
-----END PGP SIGNATURE-----
--=-=-=--


--===============5994350478904330459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5994350478904330459==--

