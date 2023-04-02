Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E800C76196
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Apr 2023 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2CkT3HuXu5+L4vCusnzXNnGb0hSi7YbAtr5qqCtYyY=; b=RJeNkqDCswRG03VQyz0f1fEslL
	NwneES2i+oQQ6belRk7wFpK5lhiFFKAcWx97pfkMTC/dbDyj9FUq4cF1V9wRqsZZ4+46GHbVkwRMi
	j5DSGDQRZjCWugLYpNCU3bywHE/Ano4a4yjeGyVcnyCJOwrEHCe9dUXIjFkMJj8loV9H+R6jPBBNN
	OT39FbLpXgZ3CdQu6N+0YACzY4yMsOrYajRowpw87OzJW2Ama3cfUKgS9WbAPRXL6a9AamUHfktaU
	MDT7sWI1RX3Ei8LlEkbolWLiKT2xXaNf4kuqXZhiEt7zBIebLdVgA6+QQ7jSa3/OjawwACJVZ0wTy
	nMjWhuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pixF1-00CTgP-26;
	Sun, 02 Apr 2023 12:55:27 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pixEx-00CTfe-1y
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Apr 2023 12:55:25 +0000
Received: by mail-pj1-x1029.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so29933523pjb.4
        for <linux-amlogic@lists.infradead.org>; Sun, 02 Apr 2023 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680440121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BpzI7Au0Q9dN4lD4MrjFVfTVGtzJnGuXlYcSG+gzAgM=;
        b=YRm7lKLzpWSTbjXr7/lR2eKETP18fhNBuZf4Z4FzVLBRsgmWVJ0KU07DRToZeZvcUt
         QRP3SSkWTkhAzZmMkI0cE1NINqjbS8K6c0vJWE4zDyRNb0KQnQlv5gFTl3WwrgGEqdwk
         0gYjSRKIwXqvR0Q8HNH+EkM+uUXcffaFLpa/q7XVTLmQ9ztzCRKttIOtO/1v4TJckkox
         CZoePAq9JMJad4uJyc27enzTyNviWi7Y81GucQi5c9AA3vTYXr9APemFODPGTYwwg9d/
         ZC1nx+ZG+I55QJibqC4Ync7u33OvqTMh56uVr3muA6nqjzayqDwXcgY7+szrgN93yZt3
         Cf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680440121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpzI7Au0Q9dN4lD4MrjFVfTVGtzJnGuXlYcSG+gzAgM=;
        b=sZ6RxaIOfZgNbPkD5Cu1wOBd+qDdfT1FG+DdnFmKXFMCgnBPs/1MUd4SrM9cZrt9bA
         8fOZNJA22UG3k7OB+XnQSbgJ4wvpnXmFfG4AHfQoDWxloEl2WCoDRyhrMLQAwtP5Ho6F
         Eie1L39Xz6pMzjmPj6BwDzFRq1/DwnyQfP8ML2MEw7gxQNiBw3+augpgRegMGnQXrIaI
         sC08igi9kbj1Oi4t7FdPIBRXJrZmVlpELGuwEE32F8DVGHC/FmATuIWJ0gmg2yeERqcN
         iK4Ui/OTln4L66ozEUUYWr/P82ybFD4zLEutEu17kEykveJMKT4t+yKVdVbmWP0lWNpp
         zjcA==
X-Gm-Message-State: AO0yUKUzq3nU18LiMEq5JdaGGni3dANDfGy134G7vDnzyeFXbcSvhBmm
	7GmjYXgHSIZOs0Q29fxSSEM=
X-Google-Smtp-Source: AK7set9J/bkXp2IenXpcl+alnaEaJ4zMy00BFKY8+Lxc7qyJBXhV5hWxvqaGDWqoua6UVYXpUpoStg==
X-Received: by 2002:a05:6a20:4d94:b0:cc:d514:62cf with SMTP id gj20-20020a056a204d9400b000ccd51462cfmr24024616pzb.43.1680440120717;
        Sun, 02 Apr 2023 05:55:20 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-38.three.co.id. [116.206.12.38])
        by smtp.gmail.com with ESMTPSA id u16-20020aa78490000000b006242f4a8945sm5004103pfn.182.2023.04.02.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 05:55:20 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id A138010665A; Sun,  2 Apr 2023 19:55:16 +0700 (WIB)
Date: Sun, 2 Apr 2023 19:55:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Lucas Tanure <tanure@linux.com>,
	kernelnewbies <kernelnewbies@kernelnewbies.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: Kernel Panic - V6.2 - Reseved memory issue
Message-ID: <ZCl7NFN5igCkIaLz@debian.me>
References: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_055523_675703_940767F4 
X-CRM114-Status: GOOD (  16.88  )
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
Content-Type: multipart/mixed; boundary="===============8964041566512855779=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8964041566512855779==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wq5IN3qnESGv29nn"
Content-Disposition: inline


--Wq5IN3qnESGv29nn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 09:10:36AM +0100, Lucas Tanure wrote:
> Log:
>=20
> [ 9.792966] SError Interrupt on CPU3, code 0x00000000bf000000 -- SError
> [ 9.792980] CPU: 3 PID: 3471 Comm: kded5 Tainted: G C 6.2.0 #1
> [ 9.792985] Hardware name: Khadas VIM3 (DT)
> [ 9.792987] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [ 9.792991] pc : kmem_cache_free_bulk.part.98+0x1f0/0x528
> [ 9.793004] lr : kmem_cache_free_bulk.part.98+0x2f8/0x528
> [ 9.793008] sp : ffff80000a2eb7f0
> [ 9.793009] x29: ffff80000a2eb7f0 x28: ffff00001f358518 x27: ffff00000000=
8800
> [ 9.793016] x26: ffff00000262b300 x25: ffff00000262b300 x24: 000000000000=
0001
> [ 9.793019] x23: ffff00000262b000 x22: 0000000000000000 x21: ffff00001f35=
8538
> [ 9.793022] x20: fffffc0000098ac0 x19: 0000000000000004 x18: 000000000000=
0040
> [ 9.793025] x17: 0000000000000018 x16: 00000000000007f8 x15: 000000000000=
0003
> [ 9.793028] x14: 0000000000000006 x13: ffff800008e48550 x12: 0000ffff9dc9=
1fff
> [ 9.793031] x11: 0000000000000004 x10: 0000000000000001 x9 : ffff000007e9=
3680
> [ 9.793035] x8 : 0000000000000020 x7 : ffff000001d2b100 x6 : 000000000000=
0007
> [ 9.793037] x5 : 0000000000000020 x4 : ffff000000008800 x3 : 000000000000=
0001
> [ 9.793040] x2 : 0000000000000007 x1 : 0000000000000000 x0 : ffff00001f35=
8540
> [ 9.793045] Kernel panic - not syncing: Asynchronous SError Interrupt
>=20
> This doesn't happen with downstream Khadas 6.2 kernel, and that's
> because the downstream kernel removed this from
> early_init_dt_reserve_memory (drivers/of/fdt.c):
>=20
> /*
> * If the memory is already reserved (by another region), we
> * should not allow it to be marked nomap, but don't worry
> * if the region isn't memory as it won't be mapped.
> */
> if (memblock_overlaps_region(&memblock.memory, base, size) &&
>     memblock_is_region_reserved(base, size))
>           return -EBUSY;
>=20

What commit on downstream kernel that fix the issue? Can you reproduce
on mainline with above conditional removed? Alternatively, can
you post the downstream fix here?

Also, can you find last working commit on mainline? If so, this is
regression.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Wq5IN3qnESGv29nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCl7LwAKCRD2uYlJVVFO
o9EWAQCPtYrbWdu3QEMuqKyChX9q9UnlkrbF0Vwm/6YqiqGRAgEAwqg0FslXEiJE
jh7cVhCBy9zWyiCJf+XjOLmQ9SPjTQA=
=w4gz
-----END PGP SIGNATURE-----

--Wq5IN3qnESGv29nn--


--===============8964041566512855779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8964041566512855779==--

