Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD64C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWWAi2HZ9m+5YQCj6lo7gyA7ZqNGjd9o+egvIRV7tpU=; b=E4tAFPv03/ttRUmvsnRZiDQXqB
	Y20M1B5sYCojugYmoGKgNSexBZ4gKNjL5XS2m2+vzhmac3H3208k4FQdEn7KzDGDAMclaeoaPZszQ
	wtpYIENS4FX6WYrGwmaOmiXjEkoLksl5iXwb6xL7ci8YcF8qO1hXHYbwsibG3+G0BZzhDrL/KVzOd
	tS1c/bWdl7xzT4dBHlDCMy5tJuIs84/5bf+o+GQZj5izRSGSq267ysxP243IZv25l/tgqgF+RhfJz
	nnDaVmO3DH5bMGwCv06+JlbjQeLL0y9iCdUFTjdcV9aDRzosU2jn8m7hY/gapkem21tNt0hM7IXkT
	ibTu2l0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naK5V-006XK1-SB; Fri, 01 Apr 2022 16:25:25 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naK5J-006XHD-Lj
 for linux-amlogic@lists.infradead.org; Fri, 01 Apr 2022 16:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=AcBPC6b8Ow54uIrFRglU9gzXaSUC
 Q4cd7DaZDtjcLyQ=; b=Tep0sd+ZQs/pV7W17OP62Su2NA/HIveSPhneZhKmB3yr
 EFlsmnQ5J+3HzyhQ8LEt7EK1iocP9C2nrggkVq47g0R2v2ipR57zJ83uApFUonar
 qZ9hKdd71rBIwi6WhnPuU9lacp/q/XseyT093J/wJcxudPOdGVdA1ORY6mfVvpY=
Received: (qmail 801843 invoked from network); 1 Apr 2022 18:25:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 1 Apr 2022 18:25:03 +0200
X-UD-Smtp-Session: l3s3148p1@tUKLOJrbdqYgAQnoAGGbAFirbAEmXd1u
Date: Fri, 1 Apr 2022 18:25:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com
Subject: Re: [RFC PATCH 00/10] mmc: improve API to make clear {h|s}w_reset is
 for cards
Message-ID: <YkcnXxNjMNdDgEBt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_092514_021455_9DED031B 
X-CRM114-Status: UNSURE (   6.57  )
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
Content-Type: multipart/mixed; boundary="===============2733656036408694168=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2733656036408694168==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PxhwHXhOFLOXfgmr"
Content-Disposition: inline


--PxhwHXhOFLOXfgmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I tested it with my Renesas boards, so far no regressions. Buildbots are

Wishful thinking, the patches crash now when booting. Still checking
what is the difference to when I send the patches out.

Still, looking forward to comments on the general approach.


--PxhwHXhOFLOXfgmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHJ1oACgkQFA3kzBSg
KbYPGw//YUU0c/TCXVii8TbBtVaxFJ+SFYjCQiY3RhhVPIrWlCF7+1v7BKyWdqz+
I/ctuhs3uUutw1dE3/WI12HevWANnVdw6EI8D0+aJOrxaCfMueJpEugMYguwpk8t
ZWB8Kh+8Lozg55uOn7i4byGA5UThrrbV9k6/IwKnfbGS+fKUVWL9uJxMKssYx0uM
ZjgVIKF0bSg0As+UuQBiFhKqJQybnBa27DHtl1n8Co3zX79M5T//aB/SvLbeyyKM
MhsVF3xd7LxdWDVTkXEdjQqVtApNlGAp9+2iYdb86V0dd+hz0PWO9Acp9VB2ZOEv
OcIhc8r0iExSdFITQeSevS5LdnRhyxv8mA0K4pS2ndbIPwut0dmHSSU4PnseFcAy
khFA8jDujq1jz83z0ucAlCsr3U/u0Yrb7CGyLA3zKTCP05RLvPsbAxyymT2EOfen
S9+LsJhEXiQ2KstNsFqWch/PebTxMkyrVvCo+US+HhCsDTP01WvqxwtC0TkB69Zk
cjVeDWo5QkggA1nYKPntr9OIyqeHCmowWHW+2V4zmWAgI1qodhPfQnFsUuzwbbXy
j8cavhOoe3ZKwLeH5X1gP0mOClgbRWFEzOBEFq2W94rLvt8gMp85Md8l2Y1MMUO2
5byHakN0xAIFBbcv+tGO6SAK9ld3vFtWIoPtyYHnDKjmKQwU1GE=
=v18S
-----END PGP SIGNATURE-----

--PxhwHXhOFLOXfgmr--


--===============2733656036408694168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2733656036408694168==--

