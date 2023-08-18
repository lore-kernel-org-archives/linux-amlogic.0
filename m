Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DA6C001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Aug 2023 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jb/3AanWd9/nIG/uzBTX/ERiNkShaRfoc5DjlcZf0To=; b=mSjj0oHG8E+Ylj
	du939MxtEZLQ4CYEgLwiZ2EDT7hqqww3l1k5SYUTsozionUjCKACzuk4UhQZRZGUcp/8dt/IrHtkG
	dPjhYo0GitFz3Nwy+aQ/HM01lGeiO+SGyCgE7W7qAGZz2DGXITHocYnj/z20mEQ9K30Zfd9hJ9CrQ
	QxNGy3OY0HOo2LC9j8rAFYcB/acu3LYliKRmrVTq9IMCiB5fbYN99lG/E92O0fF7v+0qQ7vgoC/08
	Dl4Ta2usA5TnKCJuPC7tSyz0ZL4FgWibpoCHNCmjmVxJEex0rGqcsC1fcfKWJjFFnWW1tKBjiIe9p
	fh2eNF4v0T7PQ2yWYfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWucQ-007y1l-0P;
	Fri, 18 Aug 2023 08:14:06 +0000
Received: from mail.leachkin.pl ([217.61.97.203])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWucJ-007y00-2T
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Aug 2023 08:14:04 +0000
Received: by mail.leachkin.pl (Postfix, from userid 1001)
	id EBDD884809; Fri, 18 Aug 2023 09:12:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
	t=1692346338; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
	h=Date:From:To:Subject:From;
	b=q4WwbE6+Sp+fAMiFdWSpwQOswc/I0UCgWkFxuX/nOs4+ewgqNi7OgZGovvqxgDRHC
	 yGuEBUmcrYYcXhYnpdueBn092MyAH+JXdetZn2vICXl1jeOsJBG47FycvaUlzXJS0k
	 9nwwReen3Ntzin2sOFq76+1z2IuixGMR04XKdifb8vdWmYZ1V2rKwTi9G+n/BC5rtO
	 ZgzauznC45thM7cajvlJbpzLiF4wBSjuhJnY/UWPa+LMT2Zcx2Ls0d3VOo1e3wRZbI
	 FdT9wYAYTFc24V0HbYc489QqzDA4De1f1FNy8XiGTQjs5adIP8My5zkqePXKUszSRm
	 R9Jpzl9DdOQ3Q==
Received: by mail.leachkin.pl for <linux-amlogic@lists.infradead.org>; Fri, 18 Aug 2023 08:11:05 GMT
Message-ID: <20230818074501-0.1.4u.cti8.0.wi3ig215lr@leachkin.pl>
Date: Fri, 18 Aug 2023 08:11:05 GMT
From: "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011400_517261_306F92A9 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtLApKYWt1YiBM
ZW1jemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
