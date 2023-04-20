Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83928C77B72
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Apr 2023 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=XCkwbfWwCAdI8y
	L2+F4VYByKYIAHTObn3mdRXNmdbyDfs9913YQeP698fFr/RqhbMfw4OjDfEcNjoKX44CF8r4HJWik
	gdVObi1IlI6PWMyWJuOeB74fDYu08T9qsw4fu8wBQatnDb49KJdqw6nnHRAaDB7/NmdDnDJe1OCSO
	ignd8hYzv/jEAf/3VuMsEDGQfyxxMbSemsnx4ycBt2rAQT9sWTo/61ASmX6w39gOPs7zTxP0RWnh5
	W63HtxZo2AzD1lwTFBJk/pHWvrc/DWL9pnTdxzECDcb4verMwXk23vrCvwd6RRhgR57plp4q2jjUQ
	y2kgtk43NpiZbdy9D7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPIx-007Lgj-0J;
	Thu, 20 Apr 2023 08:06:11 +0000
Received: from mail.craftsplex.pl ([162.19.155.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppPIv-007LgF-0d
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Apr 2023 08:06:10 +0000
Received: by mail.craftsplex.pl (Postfix, from userid 1002)
	id C6CC924123; Thu, 20 Apr 2023 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftsplex.pl;
	s=mail; t=1681977967;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=rMchEbC3na/LFFsaGri/PCoLtEXyCZqC61ES231o7aIA05OqR6ZJ+xrX9JXBW99Qr
	 C2FUTpU4kWFyu0IGTev8yU0GF6uoqDXrENJRawb0cOPZSL2oYCq3XaA3jyLx4T14kn
	 QR9SrL9uFHp9SuKu+rxt0Wyg6p4njnKIEyHj5gq/fVSD37l1pcfM1C373GMPjYKe6S
	 53aqzDGR2CsHOD2asWLdmmW7mABILvh7BjgHLG9OcT2gV7Ba/2ruBA/geN/KiwDeXa
	 nbW1ZzSaSSbv3bkK4A7NUHBLx6IxxdP2Vq62mLbBByvyGSq+WnBy+2PrGiYUJ1yd17
	 J/f8GVuCIuAsA==
Received: by mail.craftsplex.pl for <linux-amlogic@lists.infradead.org>; Thu, 20 Apr 2023 08:05:42 GMT
Message-ID: <20230420064500-0.1.5o.q9f6.0.t0v9e4alod@craftsplex.pl>
Date: Thu, 20 Apr 2023 08:05:42 GMT
From: "Kamil Tralewski" <kamil.tralewski@craftsplex.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.craftsplex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_010609_388398_9BED5163 
X-CRM114-Status: UNSURE (   0.84  )
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
