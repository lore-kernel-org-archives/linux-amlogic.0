Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A156C54E66
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2024 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5iq3w+7p25uX4tWecZraLMm6EQZxiOr72pRrXep9G5g=; b=OmuLecWo+Ejw+a
	WgEhVEGzhu3lFmph4Dqx1GvTgXyKrDuAAPu914zhWGRpdKbEIKS30APoBUaZaxG4WJtnGHpI52gKo
	lk951kWfAuqb1cZRSm0fYbawix79sxsz1zDCzR8VbY7s3ThCQejlihDs/V+TLKxnvKoyjEbjWcuV6
	0hveFpCQ8LvD3E4SHJ5F0qWIJ4Zg5CXZIqzMqwbBwHIYPhsYRH6cLejzp4HVNgnU6eL3d/RYVFdHA
	raniizDM0ZfE2J2a7H3Mj/8V4CuDmbFdUEA8q53i/BfYao/45VjjVVOgdvDxsYWYDJpYDUdV7u9in
	Jnzzc1RNE1CO58pTnXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqY-00000000oMZ-2Nkb;
	Mon, 11 Mar 2024 09:21:27 +0000
Received: from mail.buildbrigade.pl ([135.125.238.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqS-00000000oL5-3oba
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Mar 2024 09:21:24 +0000
Received: by mail.BuildBrigade.pl (Postfix, from userid 1002)
	id 66FE4A2B5A; Mon, 11 Mar 2024 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=BuildBrigade.pl;
	s=mail; t=1710148248;
	bh=EYN951LA1I6x2LqQG9SRvdSsS/DbVhjOvb+nDwRFhwc=;
	h=Date:From:To:Subject:From;
	b=nL1sOnTeeWX+JH73mOtDmuzQqgmLDn96RHLLwLFUrUh4B4tJT8XlmQZqwDr1hVWys
	 33OSXoxWOBO0QPWBCKfIbD0BimimVc+tjS/joPdISLX8ozKnCe/toijLP4tafuL0gw
	 CQBoVZeOZa5aHrqyoOGnpaqa/Rs54euY0o6dScKyC1Z4Pfw2B11l38/xHijpjUWWQ+
	 Gu1jSXS9KdYH8ZPcc1nG7cQkCJa7WmNds+oNcKS0Bl9bkzTDUjacNejCthVOTCbsFZ
	 fYTq6ZlWOwEDUpJXEYaZKnbx3CknXpb+ITYc6ReZG5dmPTvlVZuESNb7u2V/99EXY9
	 sqpNQiTBSvLuQ==
Received: by mail.BuildBrigade.pl for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2024 09:10:28 GMT
Message-ID: <20240311074500-0.1.c1.1gy6f.0.9u5r5ot7re@BuildBrigade.pl>
Date: Mon, 11 Mar 2024 09:10:28 GMT
From: "Tomasz Mrozowski" <tomasz.mrozowski@buildbrigade.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Niskokosztowa_modernizacja_o=C5=9Bwietlenia?=
X-Mailer: mail.BuildBrigade.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_022121_192968_483A08BC 
X-CRM114-Status: UNSURE (   1.03  )
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

V2l0YW0sIAoKamVzdGXFm215IHBvbHNraW0gcHJvZHVjZW50ZW0gb3ByYXcgb8Wbd2lldGxlbmlv
d3ljaCwgZG9zdG9zb3dhbnljaCBkbyBwb3RyemViIHNla3RvcmEgcHJ6ZW15c8WCb3dlZ28uCgpO
YXN6eW0gY2VsZW0gamVzdCBwb21hZ2FuaWUgZmlybW9tIHByemVteXPFgm93eW0gdyBvc3pjesSZ
ZHphbml1IGVuZXJnaWkgaSB6d2nEmWtzemFuaXUgZWZla3R5d25vxZtjaSBwb3ByemV6IG1vZGVy
bml6YWNqxJkgb8Wbd2lldGxlbmlhLgoKUHJ6ZXByb3dhZHppbXkgbmllem9ib3dpxIV6dWrEhWN5
IGkgYmV6cMWCYXRueSBhdWR5dCBvxZt3aWV0bGVuaWEgdyBQYW5pL1BhbmEgZmlybWllLCBrdMOz
cnkgcG9tb8W8ZSB6aWRlbnR5Zmlrb3dhxIcgcG90ZW5jamFsbmUgb3N6Y3rEmWRub8WbY2ksIGph
a2llIG1vxbxuYSBvc2nEhWduxIXEhyBwbyB6YXN0b3Nvd2FuaXUgbmFzenljaCBvcHJhdy4gCgpE
emlhxYJhbXkga29tcGxla3Nvd28sIHBvY3rEhXdzenkgb2Qga29uc3VsdGFjamkgbG9rYWxueWNo
LCBwb3ByemV6IHByb2pla3Rvd2FuaWUgb3B0eW1hbG5lZ28gbmF0xJnFvGVuaWEgxZt3aWF0xYJh
LCBhxbwgcG8gcHJvZmVzam9uYWxueSBtb250YcW8IG5hc3p5Y2ggcHJvZHVrdMOzdy4gCgpPcHJh
Y293YWxpxZtteSBpbm5vd2FjeWpueSBtb2RlbCBmaW5hbnNvd2FuaWEgaW53ZXN0eWNqaS4KClBy
b3N6xJkgbyBvZHBvd2llZMW6LCBqZcWbbGkgamVzemN6ZSBuaWUgd3ltaWVuaWxpIFBhxYRzdHdv
IG/Fm3dpZXRsZW5pYSBuYSBMRUQgaSBqZXN0ZcWbY2llIHphaW50ZXJlc293YW5pIG5hc3rEhSBw
cm9wb3p5Y2rEhS4KCgpQb3pkcmF3aWFtClRvbWFzeiBNcm96b3dza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
