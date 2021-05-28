Return-Path: <SRS0=oj2F=KX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BE0C47087
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 21:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C76E611CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 21:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C76E611CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9x3+l7h0Lpu6/1rtUl5e7HSR3XKKpdpF0ik2EQPV8U=; b=hCzgdWmGOJnw8r2diMkDihDDzJ
	UGz0K5T3F5XxBIZHoqzkPyY/EBCGoQLJk6t0y9R5Zo6c3hoYdHahuA94mtqrmf64Vs8NKdg9wCLSn
	URmG5x+9wMfTjeilA1IZpTfyZ4dvpCMH66zRsynzxTtj/X6Swos/+f1L3/KJ/Mlhk2CPa+NMeMHH/
	tOzAYQkhzjzKqxQ6ixe5hpQvo5gl/m+E5oD5K3Tv+OA8DCHecrzx+u04/j4kU86oGhwD4IRx36r+9
	MXWPLVfwbTJx9PnQFaZn7TB00Ox4EVXM+KkC0f8hJIAplVSorJUdbL+8naBZ879yLxdjSh75ZX1NE
	4IZi0I/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmkWB-001MBu-JS; Fri, 28 May 2021 21:59:47 +0000
Received: from gimli.rothwell.id.au ([103.230.158.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmkW8-001M5Y-EW
 for linux-amlogic@lists.infradead.org; Fri, 28 May 2021 21:59:46 +0000
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FsJW16qXPzyQJ;
 Sat, 29 May 2021 07:59:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
 s=201702; t=1622239168;
 bh=amiXFdTtq//850g5uO38QHCYw6ktbdlwBdadTR8J7+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UL1gN+ghYAitXdHFK7/jHJzQzxb34/reN5fg2qNJvYcSc/cMdav3q/Sr10i1apkWl
 ZoJK+TufG9luT7odUJTrqbiTFrz/76EP3X5yzLf5RvohTZreEhdUuCaqRYyAmIaTS4
 1pUnb2F+QdHn7ejYnrP5xDgbL7jlqiatpEff1AA11eBYIVsYYyuNU464/Lc33hWrIG
 fCiAXaKWta7tw58ee7en+iu5Q/UEbBsDY89oVaTNjzhxrebghmKL/vjZWqIZc2aarj
 Aj1Otvf7IwTO5mbxM0CrWveV5L9URrXD1MuCjG2ygca4P7i0IBvvTKLLcWZess/rGH
 0zeY0Y/hBE0CQ==
Date: Sat, 29 May 2021 07:59:25 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Carlo Caione
 <carlo@caione.org>, Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: updated Amlogic repo used for linux-next
Message-ID: <20210529075925.0694d253@elm.ozlabs.ibm.com>
In-Reply-To: <7h8s3yso9q.fsf@baylibre.com>
References: <7hmtsgrpkt.fsf@baylibre.com>
 <20210528083821.72dda431@canb.auug.org.au>
 <7h8s3yso9q.fsf@baylibre.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_145944_672215_7BE1BC25 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: multipart/mixed; boundary="===============1302408016483667936=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============1302408016483667936==
Content-Type: multipart/signed; boundary="Sig_/goW/d7TRPBtLeAjiMOlOUHo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/goW/d7TRPBtLeAjiMOlOUHo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Fri, 28 May 2021 11:32:01 -0700 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> > I still have Carlo (cc'd) listed as a contact, is that correct? =20
>=20
> You can drop Carlo.  He stepped down as co-maintainer awhile back.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/goW/d7TRPBtLeAjiMOlOUHo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCxZ70ACgkQAVBC80lX
0GzHmwf/eKHLQpOd6jU+5sLrlnTYIWAoV5Dq3MeRDZrs31v6T9aID4BQB+p+m4OU
3KC1+S8WluyLeZlvgfA/mGVvnjQV2w5nclHw4J/XVq9aVf+QgQY10uOR1jEPcgbM
2yYoRuv59Cs2pfD40/wQwAVC9bgCMSsRmiA/TiOG+YgwEyx8Nod02wPiu6AuqmT7
2opk6jekcrEuggOZWzLX5pcI9HtArXxnzb3t3wGA4ZFUSQjdaM9tikwTfbQfOaV6
oMuYEIUYQkGD1xm7R6MizIlqqRxmzGiRcHgvLsBfuXN5Ikj/2gnDD7CWdheVwre8
+UO/4mV6QHbAXWzT4hFGlfhTzeR2gA==
=dNpK
-----END PGP SIGNATURE-----

--Sig_/goW/d7TRPBtLeAjiMOlOUHo--


--===============1302408016483667936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1302408016483667936==--

