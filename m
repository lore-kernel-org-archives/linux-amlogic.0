Return-Path: <SRS0=mdIi=KW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098A8C4707F
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 May 2021 22:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31E4A611BD
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 May 2021 22:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31E4A611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIeMVDEhZaVYnwGUh53OsCbgczbXtMZisKPXNp7yLr0=; b=3ptOC61yXZtgXOnKuxp2INXd9t
	mmXJjraa1o70EPUQUxBqp0CoKwiyRBBqvh/h2iF+PQ7LP3/lGEFeP9MWHL2FEVaPpjt1LLDlWk2e7
	Pb7MIbgKZSkdt8EUHklhv1sQDEcyXVjPrJ4myNmj5IyQKuVU5nyniWjNLOa2K8PBrQkx/FnrX8P/l
	nbl6CfJ8LzWPGyb22DP0JPhlpyfgCrlpJmQkWEkXb+zpIgRWVSkLOA0o+Y3t8cZN5yxhRQzoo+Qdf
	z/6Kti0cExvfZC35L9B1NmH5TijVM/J5LCwd7vzDhPQzV2epGM5PuJVJdYNFy8L8iQFlaapOSKvjf
	LwUNYWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmOe6-009wPQ-Ro; Thu, 27 May 2021 22:38:30 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmOe3-009wMt-F1
 for linux-amlogic@lists.infradead.org; Thu, 27 May 2021 22:38:29 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FrjQQ1rV8z9sRK;
 Fri, 28 May 2021 08:38:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622155103;
 bh=B5qRpsD89HaPKiiUG/2tkOG72u7aUVMp0xq9Zi6VWFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BqACpUKEd0NuRGEMffFgTXt/PvC/O/8zjlo8bsMPtqvLdNgckDHfZZR5InJVlbNe/
 NwG7SAmACSmLzcPxeqfCoRo+kP+ZfHGsYlcpD0AKyI997I61T03rn8K1Rm0MKty26f
 Xpo5fuWhuah77ZLWcFV3k7xWY3KCXLdWMF5Z2oXDur9fe6/HTLc2twKlWVqdIIffwj
 hBHBYJ1ytTJBVYFISWrLNNIon2j91DTcqpx9j4jamXk3VjqH90BrGhXABslG67Ihnu
 A0FRPLaKL3YDhVj/giHGq0pDiUOy2J9oR3iILHUpSdEe1P2ChBmaDgzH/NHJKpBUHr
 5dYgFXw5gjUxg==
Date: Fri, 28 May 2021 08:38:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-amlogic@lists.infradead.org, Neil
 Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
Message-ID: <20210528083821.72dda431@canb.auug.org.au>
In-Reply-To: <7hmtsgrpkt.fsf@baylibre.com>
References: <7hmtsgrpkt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_153827_750155_21005E3C 
X-CRM114-Status: GOOD (  17.31  )
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
Content-Type: multipart/mixed; boundary="===============3092229472081181217=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============3092229472081181217==
Content-Type: multipart/signed; boundary="Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Thu, 27 May 2021 11:36:50 -0700 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> Please update the tree used for Amlogic SoC kernel development
> (suggested patch below[1].)
>=20
> We've switched to a maintainer group for this tree which is now
> co-maintained by myself and Neil (cc'd)
>=20
> [1]
> diff --git a/Next/Trees b/Next/Trees
> index 2d22ca1d2911..1794b9144f3a 100644
> --- a/Next/Trees
> +++ b/Next/Trees
> @@ -103,7 +103,7 @@ arm64		git	git://git.kernel.org/pub/scm/linux/kernel/=
git/arm64/linux#for-next/co
>  arm-perf		git	git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.g=
it#for-next/perf
>  arm-soc		git	git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#f=
or-next
>  actions		git	git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-ac=
tions.git#for-next
> -amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux=
-amlogic.git#for-next
> +amlogic		git	git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux=
.git#for-next
>  aspeed		git	git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.gi=
t#for-next
>  at91		git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#a=
t91-next
>  drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/=
linux-mem-ctrl.git#for-next

I have updated the tree URL and added Neil as a contact.  I still have
Carlo (cc'd) listed as a contact, is that correct?

[The following for Neil's benefit]

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCwH10ACgkQAVBC80lX
0GyD9wgAlCOJVWafrzL8wiCxZw0mxBuboVNgc85DWbsNk2J5BtjZZm1iZWrFV1/a
ZwZAKQmyQvr2KDu1NgBupDq5HI1ELi1o8Uy+YXUSGkdT8HdATpbillTaiC9Mo9N8
f+3StzJAV24SVz7cVjZg9UIS7mWgSW29nrSa6/Q5yq5zacfoh2vsVWOaAsykdMH5
FZzFOkixvxtOuGoc4+MXc0QFnfLtuPLYXvgXUjPTtFbniLuhZuOdAB56jaXqCl9w
TgjzOBJ6lHsKbBfvEXGVb+87pP2fQS3dnfuRN8zW23n7IYpS8pXHQ2eo85PLqALP
MIfm9SaXGyFm6ColDqzC3U+LbipXoA==
=ftyd
-----END PGP SIGNATURE-----

--Sig_/Fhl1dbjAXh5Y/_qBzL7cgkW--


--===============3092229472081181217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3092229472081181217==--

