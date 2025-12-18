Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D493ED68BF6
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Dec 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QalJlQsAsJta9+aDbGGozxDloLicUKKALsPJNZpOpHs=; b=MxVH6gwlPsx/UZ
	rZy3/W7xjeAzmMX/YfQYyV/ruMnf+C+uubp2oeauJ61KSC13ssq+vbXTHwzwMPCGFUwE0tfKy9Wl+
	+QmpsHTn/HJ3Dy65ni5W8NLIJ3QNkig1fFvEYTGSrazVVO23CKImh6f/kj90gw6IZZ44yhGl/vK+I
	FsOpffUZGhi8kby5BUgdOQIy1gqHPdQAGCcOrV37cIfgJ4c7VH2ijh9arZd/QHvkmQ56HBnuLFyXP
	98HHDG1vIkoT6PIlC2r7VI4OfMCxUZFyoO5PzMW2RpzTbBbPB/3zHZ0snounDH7bv0QOoGrpelL1z
	1DYV2GNo4FjOXK/LGr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9j7-0000000864G-3PCY;
	Thu, 18 Dec 2025 08:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9j6-0000000863x-3RXi
	for linux-amlogic@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=mtZQz7rHYGlSI0ytRPSj4m5++R
	pVC09qEXzSFg1T3IwMKlTq76khd/9ZnOupTYLgO3n9QNfLbNq3PNS3aFG2H/NnCRHpy0uwfUCvTCh
	mS3RDWuvjSCMOZ7Pc8pWrW8oT9bR2i2YD96EzjTDFPNzS3JKOofJNhtIXHgmlcL9bLRB7AC87h7VG
	wukItInt8uvZX9KJCakZUonmro840o0Rel0JF1fJFFl8tCF4HMJ36InXuVfIdXFISB0Xt+//e07ce
	x2I4iR2aIa/umCcf1FIu94ADNG0ssjqkhYukLkWccOu+fJ+nTdh2UobRwADwYpZl/lGCYFjIjyNHN
	c88wlIKw==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8ra-00000008OXg-3sn5
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Dec 2025 07:55:56 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id 53E36AB92B; Thu, 18 Dec 2025 09:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047665; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=l7BQ5ctJ3ImSbxAPN/9ufCxwRfm6xwHCzr2UHFFWoaWyJUoOHeD+af2/rGbNF6Qbf
	 984k8eqDSkwUnueL1tOl9RMR8369kQ0waRZSYF9tzENJYL3Lgy2CS3OS0hrfOXfnxq
	 hVIQDiKsk1Yq2E9voEegyalHjRXg8dozVQ/Nk2dF0Rqx711+rbcAx594YmI0JWZ+Nx
	 nEaMe9/H2zl4nmlE9xJNOUfyC/K+AXWHrJ4Z3INdT4j9giguEpLR0+dTphs2q1UR1m
	 3jhsgEPbURaJXFIX+q9haQZh8SOvUFI40chtnx7TLKr6r6cfvhnKwNU7TN3AHkW4S7
	 Gj83CogVnET7Q==
Received: by mail.torqly.pl for <linux-amlogic@lists.infradead.org>; Thu, 18 Dec 2025 08:46:01 GMT
Message-ID: <20251218084500-0.1.tu.d9jg3.0.hkyt5o4mij@torqly.pl>
Date: Thu, 18 Dec 2025 08:46:01 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075555_241343_1835DB00 
X-CRM114-Status: UNSURE (   0.05  )
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

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJieW0gd3NrYXphxIcgUGHFhHN0d3UgbW/FvGxpd2/Fm8SH
IHphcnrEhWR6YW5pYSBiZW5lZml0YW1pIHcgxYJhdHd5IHNwb3PDs2IsIHBvcHJ6ZXogbmFzemUg
aW50dWljeWpuZSBuYXJ6xJlkemllLCBqYWtpbSBqZXN0IGthcnRhIGx1bmNob3dhLiAKCk5hc3pl
IGthcnR5IG9mZXJ1asSFIHd5Z29kxJksIG9zemN6xJlkbm/Fm2NpIGkgemRyb3dlIHd5Ym9yeSDF
vHl3aWVuaW93ZS4gRG9maW5hbnNvd2FuaWUgcG9zacWCa8OzdyBqZXN0IGtvcnp5c3RuZSBkbGEg
b2J1IHN0cm9uLiBLYXJ0eSBsdW5jaCB0byBkbGEgcHJhY29kYXdjeSByZWFsbmUgb3N6Y3rEmWRu
b8WbY2kgdyBwb3N0YWNpIHp3b2xuaWVuaWEgeiBaVVMgZG8gNDUwIHrFgiBtaWVzacSZY3puaWUg
bmEgcHJhY293bmlrYS4gCgpLYXJ0xJkgbW/FvG5hIGRvxYJhZG93YcSHIGRvd29sbsSFIGt3b3TE
hSwgYSBuaWV3eWtvcnp5c3RhbmUgxZtyb2RraSBuaWUgcHJ6ZXBhZGFqxIUsIGxlY3ogcHJ6ZWNo
b2R6xIUgbmEga29sZWpueSBtaWVzacSFYy4gCgpNb2fEmSBwcnplZHN0YXdpxIcgb2ZlcnTEmSwg
a3TDs3JhIHBvendvbGkgem9wdHltYWxpem93YcSHIGtvc3p0eSBpIHphcGV3bmnEhyBwcmFjb3du
aWtvbSBwb8W8xIVkYW55IGJlbmVmaXQ/CgoKUG96ZHJhd2lhbQpUb21hc3ogSmF3b3Jza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
