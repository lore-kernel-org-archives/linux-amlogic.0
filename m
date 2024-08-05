Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792ABC3DA7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2024 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MVwYOu6Z9FPl+gslMf7Mb4becNN9AUiB22PR8DMhiWM=; b=vnVoH9O4rvEVl7
	noELokNGE7YCQf1nnS1fAcxLGD1LlSGHZjp2NqOh52oj8DKNL0d1t/KvZR37vy3BfDYOEepv48J34
	Bzj0M8bT7o7uwtmlxRdwuE0h4GZhJhgtksqgeu73I8iG9SUgY0eJhkWCXu3i04xXwrHHPewofwIIF
	cudAHQwJRqlcUxSXKA2Ga+SSVqiQgfxcPDAloH/dNa9GOmbAwgaVnlNORnpf+aiyx1oh1jtXkkP9o
	cTUGox8DJvvuA4hTqUV/sFcs3+2T6/nK8eXIGSdi6UC8pmC66lyflnZ7e5klk7MWoPTTaHVMdRUXG
	cXbceVqjM9m11DGJf4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasUv-0000000F0Gr-02xC;
	Mon, 05 Aug 2024 07:51:17 +0000
Received: from mail.originateinc.pl ([217.61.97.94])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasUs-0000000F0Fe-0IGM
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Aug 2024 07:51:15 +0000
Received: by mail.OriginateInc.pl (Postfix, from userid 1001)
	id 7903D83A90; Mon,  5 Aug 2024 08:50:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=OriginateInc.pl;
	s=mail; t=1722844272;
	bh=EywM+E+OIUr7RnYatSz3YfoNTVB6dOfImeA7tdj3yJA=;
	h=Date:From:To:Subject:From;
	b=a/JiSR9B5mmn2fBNbn5BaamaNxTdn1kVl93lFwhQEre/6C1/Fqp8844a+VsOP2Kno
	 Ucs4CKmGR/4uNzoCM80bkjfiKKEoy8uoQr0XbTRRi1WokQgVcEvQnQO+lop0fQwduq
	 BLybe+Ep3yI68cdmRF8LZPevJIyax4Jv3dfaEqThDNrulYj5UOIHVSImHfpafbvueJ
	 H2tlRIdsiH+jPKttbCk9BxS6QlASuNuysUaMsVe4G9SYwUQuGn/hCgRc4FslkQhC+a
	 EB23kpvKqfAyPcaj/+Gom8CvhGs2gB4u5rQBEj45t5k3oEBsySWyb9c4fnGV/+CWmo
	 KQOfUCV5tZpMA==
Received: by mail.OriginateInc.pl for <linux-amlogic@lists.infradead.org>; Mon,  5 Aug 2024 07:50:08 GMT
Message-ID: <20240805074500-0.1.ed.1he2s.0.nmb4nkn9ep@OriginateInc.pl>
Date: Mon,  5 Aug 2024 07:50:08 GMT
From: "Kamil Tralewski" <kamil.tralewski@originateinc.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.OriginateInc.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_005114_256363_A3D5898D 
X-CRM114-Status: UNSURE (   1.72  )
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
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KS2FtaWwgVHJhbGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
