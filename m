Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90094E810A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=zljJEUcDeXMa5d
	MjXx1IGXwA6Yvu0r2fB9tRTMlz+af3jnJ4Vh07v9e6gGnZhyyu32kV4InHfSOa8szFWvbANyWDMVG
	PpaZJMsLaWOlEjtLYOoBC3IWKfY+rrmTa91uiXM5Z6D7XpdyXIeVUyah8l0Ug3BAxukefluuLKZdV
	KoFntErgewYcerQ1Zv1R9EZ6ZAiy8CKqx1fmEq1nLiJn4ieZsgXZfeqWpDkU67JM5Kh/KDYaislju
	d7wo1XandjqTHE/SAkiyNoYVr/MaGxconohHakQZX+bP3HfnaKnYBQvr9lK1WhgQaP8OeY3//5f0W
	2rd4tEC5kvIJT3LbxjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPeK-000JXM-0H;
	Wed, 27 Sep 2023 08:12:00 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPeH-000JW2-0C
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 08:11:58 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id D473323ED5; Wed, 27 Sep 2023 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1695802288;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=O1SkprXz2C1Pq+jwDPIgBkV5B0WNzNBVbKltJXguc2AdyW0rdsigjsic9J0gpnPV+
	 pPzTka3/8bKtZGD/dNh5oznXg2EHJ+A0Kc86QqjaNKGqPnb6pTByPl9ukI41rZoFgU
	 mum9XqYL+F0sSvIup/CtYhBA1nAX89FtSxDLL9FeP0hZemaiwte4mSbsjjDflkIys3
	 FS3vh/uM3NSy+4hlFqtLnH4RllYD5w3Xm5au0ZwU0LXMr7j/fck/dXUD5MpW/TPo/j
	 OKrtdIMhjUxtYB2hSxt+DWE2jAerLs0F1dDktNocM3e6FM38I+dRCjlT4WsWAcQDqi
	 LqsMI2InAWN0g==
Received: by mail.commercesolutions.pl for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 08:11:00 GMT
Message-ID: <20230927064500-0.1.8x.1px8f.0.ohhe57m0qb@commercesolutions.pl>
Date: Wed, 27 Sep 2023 08:11:00 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_011157_257454_CF3FC222 
X-CRM114-Status: UNSURE (   1.34  )
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
