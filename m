Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6ACC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=uKdaN78IhKIRZc
	Dq1gqPGd1oFNzbuLgojQVvxUr6o2/cqATCSDGgW14RuFdJ3t8Pt4CHAbUcthkgSbHrUnJxZcu9S9P
	jeSoaIM3aLy1cQknBfTOnIbyvrC0pcBtkXiLGS7iAUmh3MogSO2nIcVv/EjfjRTHJdtINE6R6pQV4
	SgtN5v8hsnVtEeKqxDWPP6/KXx3pW+GG+4nseCKXaxdKhuQoZHJzqmHi+ko/fzykwdRnezMF0ZLte
	lk/nUs14Wy/n39u9ZeTsPVjqdBgy7uVvoCbXLC8NNI595s9MR/WghclP2Aqd5kyyOtR6CQZWpBZT1
	P1aXmuxRDorSD/SF+mQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p0b-00FPa4-2A;
	Tue, 14 Nov 2023 08:42:57 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2p0Y-00FPZM-0t
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 08:42:57 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id 72C6F2304C; Tue, 14 Nov 2023 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1699951294;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=n/k77LmdNFfzuEMUhFXEnbsboRAzbzC1uLrkzADy2Sdp07iFAXu/1INLProRo/Kar
	 fblGenijwcX/3zX/ikOL894ylluOCXSgNXcweIrExj+76lQ6KOZaGCyLzDQsXEAU0W
	 AQVqBmVc/1CLNsno7G8GMqt/S8SpqsiWcAeHyOIZW2g1rGH89lxGpXOEABlq3iTZCJ
	 C8XdEINmjnEdW6Sf2wgTx6eokzELli0bhkwYlNWPKIYuapJFv5E3xLdw0ep2ICr8sD
	 y2YfHEjEX2rJMDQo+CUBZ3JI7GI7HSjF20//GuIAMQdVVqW3ac/nDrDDipRUkeT2Db
	 1MPKI2YJrswxQ==
Received: by mail.commercesolutions.pl for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 08:40:40 GMT
Message-ID: <20231114074500-0.1.9w.206b1.0.uoc0l6dd3q@commercesolutions.pl>
Date: Tue, 14 Nov 2023 08:40:40 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_004255_071306_EB5B401E 
X-CRM114-Status: UNSURE (   1.27  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
