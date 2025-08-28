Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E543DC8303F
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Aug 2025 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3ERU2Cl8DuVMxJZmRh9drV+kOHUgCabKZT9mVuFhss=; b=Cc+c1AvYUL/F1C
	8dJjlKHHV4KIclrWxSO6y/j995p9FJ0VDtCduScY9iWmi0DOshhiQ6PzNj5t+dcFbPYuU8Dl8acj0
	HuX6KIcVh+UY2UfAdqs+x+RMZimGJT2USFfMU+E+YkxI8UlLzStWKmf3whuF17G8s8d/aYkYTL2F+
	IKN7nGBLB/a/EX+15OP7SoL158TbC9tgBnVVoRp/h6pETLGzDpo03zmHLZ7vQ4PJtoJtwDKtgsw8Y
	6rABCy7jf31LxPK36TelPCpCiZGDQH6GipwY4QmE/i6SUKqRtW0hSMYtwcEUTjoMeSsYm+dCbC8GL
	mJtkzIzNnSAANssWw73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYrN-00000000wxw-32kS;
	Thu, 28 Aug 2025 09:23:57 +0000
Received: from mail.dealista.pl ([94.177.238.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXon-00000000lO2-1qTp
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Aug 2025 08:17:14 +0000
Received: by mail.dealista.pl (Postfix, from userid 1002)
	id C2EAF87417; Thu, 28 Aug 2025 10:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dealista.pl; s=mail;
	t=1756368704; bh=qcP5dcos5mZ8jV4yTLFLEHzXO5jTY/q0Nu8iMRmEEWE=;
	h=Date:From:To:Subject:From;
	b=DB37X+phftGYk/DmWlKb5PNbtypsJnyv65ok1Wh4fstEff5fhsTYASCj6ZskgpRsq
	 wEZ5ZlwZO0uBCJ6QjKHbV2NHtIgC0NCN+PMJNa9UdRwQjCE5UxjuHmoAPPRdhjSJL7
	 RTuRYOPB2RtP8hdFtI51ar8ksbVESPFb7jqi30a+kWqBLsxcpEqnu95BPjmbvVF3qB
	 fgf00lVlBLeDWeRQZP1PNIOYbRfO2r5x3yvukk/d0Pzq6VWqmGD0hnDfnrd5xy/mNu
	 ktg62/QZP5WEhVttQxgg0Lys2JkAB+ztHwqDFV/5XTu2FRKMcBz2DnIrTR5Ramiozu
	 zryiTFD2uc1kg==
Received: by mail.dealista.pl for <linux-amlogic@lists.infradead.org>; Thu, 28 Aug 2025 08:10:27 GMT
Message-ID: <20250828084501-0.1.bi.1bm8b.0.j8ta2tohbl@dealista.pl>
Date: Thu, 28 Aug 2025 08:10:27 GMT
From: "Robert Kozielski" <robert.kozielski@dealista.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Pozycjonowanie - informacja
X-Mailer: mail.dealista.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_011713_605737_B6D0B09B 
X-CRM114-Status: UNSURE (  -0.07  )
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

RHppZcWEIGRvYnJ5LCAKCmpha2nFmyBjemFzIHRlbXUgemfFgm9zacWCYSBzacSZIGRvIG5hcyBm
aXJtYSwga3TDs3JlaiBzdHJvbmEgaW50ZXJuZXRvd2EgbmllIHBvenljam9ub3dhxYJhIHNpxJkg
d3lzb2tvIHcgd3lzenVraXdhcmNlIEdvb2dsZS4gCgpOYSBwb2RzdGF3aWUgd3lrb25hbmVnbyBw
cnpleiBuYXMgYXVkeXR1IFNFTyB6b3B0eW1hbGl6b3dhbGnFm215IHRyZcWbY2kgbmEgc3Ryb25p
ZSBwb2Qga8SFdGVtIHdjemXFm25pZWogb3ByYWNvd2FueWNoIHPFgsOzdyBrbHVjem93eWNoLiBO
YXN6IHdld27EmXRyem55IHN5c3RlbSBjb2R6aWVubmllIGFuYWxpenVqZSBwcmF3aWTFgm93ZSBk
emlhxYJhbmllIHdpdHJ5bnkuICBEemnEmWtpIGluZHl3aWR1YWxuZWogc3RyYXRlZ2lpLCBmaXJt
YSB6ZG9ieXdhIGNvcmF6IHdpxJljZWogS2xpZW50w7N3LiAgCgpDenkgY2hjaWVsaWJ5IFBhxYRz
dHdvIHp3acSZa3N6ecSHIGxpY3pixJkgb3PDs2Igb2R3aWVkemFqxIVjeWNoIHN0cm9uxJkgaW50
ZXJuZXRvd8SFIGZpcm15PyAKCk3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgb2ZlcnTEmT8gCgoKUG96
ZHJhd2lhbQpSb2JlcnQgS296aWVsc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
