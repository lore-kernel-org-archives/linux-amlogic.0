Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0FC04A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=gqPfeoJvzdQBDZ
	mKNFjke60eH/FPTYTxotGsu5e3ohxuNuIAzeYmry8UWN/3rYx8h/L7EYuk82k0LGXRhc1p+Y5alX/
	pWg7zRnj+RcFPgTmpNigC25QIXHtIvYkUD6U7sxgcTXSLcCQDJ2Q2ONQK66bdANYWKVAYoaBWvJST
	IYv6/1FFVAQq7j9H1K35Sr36GsOUicxrZrqk9vbqI+2Nvd49Rl/NqZNItk2j5apVan2uh7PpQS8Gm
	NjYoa7CvkqDbE2qB0juyXsn4JOvQLEN228u6sBq3j5iMVo6CCfOU8UzqFBXLDH0TSZjGAtf/lYxlF
	qO57pVL/NNeNKXUM90Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSRE-00GQ6K-2g;
	Mon, 14 Aug 2023 07:56:32 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSRA-00GQ58-1N
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Aug 2023 07:56:30 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id DD205228AA; Mon, 14 Aug 2023 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1691999780;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=aHO3WIvVF2A928CnYZBLSe7MsC2fjuzKZTHz2L+F8GWLl5SK/gDFfDa2OauvRQsw7
	 TGSWqPj+FnmyyGN6rj7DtcUOyXgIS6iQvoIYdSgqaDW7bDylIKgfKXg69pfcANr2jE
	 4GDYOzOTcuv+x+9wlTc45oITlNYzEg39viCz7SiiFYe0YdSRzRDji0mAKyvZ2kdH5A
	 CKhUum93Irsbl7xutAU0NUNR7rYW8acJinc2zdS3+1SFCMJhHwsd0fJwPW3L143Iph
	 +RWXxaBeQxXjCLBZXyPLff0T9yF8TGXmO9Z1f1D90hmQ0zRxwvWYYBh0ydc6Ix7fna
	 s6qVIE57vV2Dw==
Received: by mail.commercesolutions.pl for <linux-amlogic@lists.infradead.org>; Mon, 14 Aug 2023 07:56:12 GMT
Message-ID: <20230814064500-0.1.80.1fltg.0.lb2a3sw4i5@commercesolutions.pl>
Date: Mon, 14 Aug 2023 07:56:12 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_005628_641323_E8C01D6C 
X-CRM114-Status: UNSURE (   1.28  )
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
