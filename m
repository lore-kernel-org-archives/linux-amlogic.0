Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EFEC02182
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2025 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QbR/P3tp+Xvifvd4zec21QAc9LzZzgDvYEsbutEhSyc=; b=lweP1WSnvcgpfK
	GTPlUGto8LEW3PAtpW6D42CVPcmFG6x/ktCy5j3gz70m63/GJWKp2NakvnTADRlExse4OEqvvpT1d
	3gYaQiQl3kt9bieRd33k8VEODN0H5HFRL3Xb9dBQznFKV7+7tjW0ZcNrYk+dtL8aGoinNYjiLkrdL
	74vgClALCFO7OPdsAe2qrkjQV0Zv2atVfId2be/xzHVQ9Ps5BVQe05Yw3uk1Rcpv2wsbF/t3pVLiL
	RwIIZTBiCAYJVLsmb5s7iqNdsyBDNwX9ELD4QJEa1AVuA2kbG276UzfRBlInxWnUd8njp25eU7uKw
	D5Ku4eCvmquNBMmBLHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9q7-00000007I0B-2v1Y;
	Tue, 21 Jan 2025 08:42:27 +0000
Received: from mail.zyskento.pl ([94.177.230.237])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9pe-00000007Hyh-49tm
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Jan 2025 08:42:01 +0000
Received: by mail.zyskento.pl (Postfix, from userid 1002)
	id AD83082A06; Tue, 21 Jan 2025 09:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zyskento.pl; s=mail;
	t=1737448913; bh=QueUkPpGIdH4dHXXuyMmUFm7m9Ovl4HSasK15DTt+X0=;
	h=Date:From:To:Subject:From;
	b=MJ2EyVv4Fj2iY0nOx0zXYNmB/7hxJucX+KaCvw+RQt7Y3FUN+Ki7EThsVd2W0YUrO
	 XWrtlsINg7otIgLiyfCkQO5WScwES/EQ74FYJWpVLDUAKssUmpIVi3vuG6eDhMiC6I
	 Qpp+h3kGDBWE3xzqvZbkblAsEDH8udoh9eioGc/lVwS7LSIODYDO5C5rY9RsowSflQ
	 qbFoORItGpYbqraGR8RpgxDkv2nxJNUlHru47nOWxt2sQ3/Zn06JrmD6xIHnY+U5o0
	 kUfRrmgHvC3KzZSQOMGV9ir9m2LduCAuV6TCmSbL19ZbiFYcTq9+y1cm9/BTf9JI5Y
	 vRpAl2D6s2LYA==
Received: by mail.zyskento.pl for <linux-amlogic@lists.infradead.org>; Tue, 21 Jan 2025 08:40:47 GMT
Message-ID: <20250121084500-0.1.6u.gqah.0.xmk9v13m7c@zyskento.pl>
Date: Tue, 21 Jan 2025 08:40:47 GMT
From: "Robert Paczkowski" <robert.paczkowski@zyskento.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.zyskento.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004159_703304_DCD66746 
X-CRM114-Status: UNSURE (   1.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClog
cG93YcW8YW5pZW0KUm9iZXJ0IFBhY3prb3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
