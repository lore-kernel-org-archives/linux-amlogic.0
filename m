Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E17C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70C861493
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70C861493
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEWEJD91UInazvIVRVhCElqsv+g4nI62vksaohGjDHw=; b=QB9Czk2D35omIkiGyvN3yEgxU0
	oOFRqkY7gNqkI3oAzoyFtIytk+8lNWrWRpn+2RRyhcA2nXk1nJCcH9J27StQZIhgZ40S5heWGSjLO
	K9Zgf+DaAmEvb6uNniZi2USAsse9JPsz/h7jvCsKRLuQh0xK8FmOxu9ToGQDB8IH/quQ+btom868O
	uMBVbm8WmYj7TaVUFdrhtx5b94TBcFgGQI7qjXcJ7eDqwYiKYRPec2Wf3eddRKp/RaU342XPZMvnn
	NezE0mc0qzbvUt8CiZ92lKrhgAs3ayE0p27cGhzwLjg2qfWD+fSjqPo9TNOTtGmhgoA4+8OgPDmbe
	JsGAri7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UO8-00H86Y-Rv; Thu, 08 Jul 2021 13:48:24 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UO5-00H85T-PB; Thu, 08 Jul 2021 13:48:23 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A32522386;
 Thu,  8 Jul 2021 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625752100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAkLkcemREm+lrBukA5TYpxggBw7GUW1D7NBfa4F72U=;
 b=NINyR7DM+IfbtVaL6lnf1KtWMiox4H1RdwjiCritwMc/vJ4Nj+/dFYhPHqNa32yXe/381R
 tAYvjPlojsbRjUPT+8KBUGuQ/J57mHYh/Hli/1Uk9WO8yylNl0BHI8NyE+HdU0GHGei5sG
 EZFhYogVJJTxYqV8Y3R1zGXIuOP+xhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625752100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAkLkcemREm+lrBukA5TYpxggBw7GUW1D7NBfa4F72U=;
 b=OXqiJrJXjv0CfnderL6u+BI69zdtDVpXuspJz83apOUa0c4nQNHtzYT/FSHPNyH1L/rTKk
 UxS5SLvtBtEs/PCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B60E13B00;
 Thu,  8 Jul 2021 13:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A+FXESQC52BLcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 13:48:20 +0000
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
References: <20210706074545.8763-1-tzimmermann@suse.de>
 <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <248d2ec3-eb13-7e6b-8f8d-567988e4067f@suse.de>
Date: Thu, 8 Jul 2021 15:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_064822_032286_775818FD 
X-CRM114-Status: GOOD (  22.01  )
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
Content-Type: multipart/mixed; boundary="===============3382656357079697466=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3382656357079697466==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq
Content-Type: multipart/mixed; boundary="WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Message-ID: <248d2ec3-eb13-7e6b-8f8d-567988e4067f@suse.de>
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
References: <20210706074545.8763-1-tzimmermann@suse.de>
 <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
In-Reply-To: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>

--WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.21 um 15:31 schrieb Martin Blumenstingl:
> Hi Thomas,
>=20
> On Tue, Jul 6, 2021 at 9:45 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> and also (although I am no drm subsystem expert):
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>=20

Oh, just when I committed the patch. But thanks for your reply.


> [...]
>> -       ret =3D drm_irq_install(drm, priv->vsync_irq);
>> +       ret =3D request_irq(priv->vsync_irq, meson_irq, 0, drm->driver=
->name, drm);
> I'd like to use dev_name(dev) instead of drm->driver->name in the
> future as that'll make it much easier to identify the corresponding
> IRQ in /proc/interrupts for example
> your patch makes this possible - thanks for this!

I also thought about this, but every driver in DRM and apparently most=20
drivers in general pass the driver's name here. I think the change would =

make a lot of sense, but it's probably worth a kernel-wide effort.

Best regards
Thomas

>=20
>=20
> Best regards,
> Martin
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD--

--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDnAiMFAwAAAAAACgkQlh/E3EQov+B5
Wg/8CWkpUGkNltHOYEPmJqBvQbagB09fuF1j0Sp/qPJ3+dBmYx+ZQpwUv0/n9dwH+lFEiongrj/+
PqZeRiRmN4345mgxy29AqUoeoghfuHdU0VoOeKcvJWI8uBtO3yuOyvOZLQovynWKRdohBPw4sYtr
BfIq6p/rjOh91Lmv2HWPRCzWs1UVpZ9+uGhSQrVP+Mmx9UiHgQ74LqULMBGInljWLULWlpWF3Wo3
yMXCZfcRQ8/j1u49upjaOoCtGZlcZVa8La98ECG32Hu0Ofy3Kd5y3rKAVBSTVq9owYolTnVl3udD
JSFPExmW+QaXgelrLJYHwS29OZQyZUE/iE3A7dNoQQeM9rAn8cGGWs4zbuh8wVHivUMFfNz2G3E8
b8ooZP6GT4h/CJ3oCs9P32bFF5VF9OwGHI8RfYmBEG4005S7ywyonZbPaZHPeT1i3gjz0mNiYHta
4n3r35nNacM1MPhpwt37DiBaStZ17r1ozABZmleQpx4dL8O822qmoMOUfhvS3EQc9mS/qZsMjcRS
JatfbK5FNljpeDa71pZUORLx7qpuiN0iqDlH9MUi08KlFy/usm6VLSIa5KYsTqrcPz4E4B6y5plp
tMwbLaqiYN0kZOHIbJ9SLw5EBjJ4Zs7psjdstagfZe1wIXGpT2q6YRd/k/Z92ntU5cdmJepmEstY
Ay0=
=zUAy
-----END PGP SIGNATURE-----

--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq--


--===============3382656357079697466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3382656357079697466==--

