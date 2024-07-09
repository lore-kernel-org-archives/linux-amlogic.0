Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F05C3DA42
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Oqqi0mBdInyuRy4k0vyKRLLo2KR/WFilT0wE+ZnHQA=; b=DZsSJpcbSl64As
	IfrJE4yIlfrznyShL0pOk/gZ7VXm3mHPAclP47SfM4g8kGoxvUHBAcLdle8Ew475GOcyeJQ8XqCdX
	Lfu8QUQKvGspGTSqqRh+LtF/IoAe4FJWZ9hSYgB5/xGwm4P5ry6gW76oBtG/wLQ3Y4tU3Kq4QENpt
	XN42WhrlKydmrP0yy/tsANeYzbR/jKS9IhLLZaBr3gAcrFXbywgiNLUquiEWAXIhbbKr+YHD9WEN5
	o5zHSU4oriF1TKHuzAxbTByn4DaKlQv+lilwfvOlLAPuDGWSTnkPkj65qkrtLDdcWEq2ARixkAAi7
	1bMkvDovODPvZ284xM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65T-00000006N1K-3kTQ;
	Tue, 09 Jul 2024 08:20:35 +0000
Received: from mail.creationavenue.pl ([217.61.16.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65R-00000006N0A-3rxA
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 08:20:35 +0000
Received: by mail.creationavenue.pl (Postfix, from userid 1002)
	id B5AB284E5D; Tue,  9 Jul 2024 10:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=creationavenue.pl;
	s=mail; t=1720513053;
	bh=ChscJKp3Om3FoG8SjFzTAmp7diEPSUZN/W3lUPFw6JM=;
	h=Date:From:To:Subject:From;
	b=nkcJlZ+3cKf6Ma2F0kt9a0hw9BNzSNth24JdAi99y4fARB1tnyWwUneS66TmYp6YQ
	 my/lJIOleSG4Kq1snaYdKyXzOuQzOkrkr3IDZkXsefZXoOBXnLR8FxEScgenUaUFz8
	 70XUjz8QnPZ3+p1NnFnXWmvK+Eym6EJiyx/Mpd29dAL03ivpudJW+YNyjwPDEaf/Me
	 NY3vJAjk3eEEmnHksWSItAdUnEpQLYna42SDZORNrkbmMMrMSS9dRs+7lWhSygHvvq
	 pX7Vwu0/DCRV0trKVVp7k/6WvvRAZmtdNZLpilviY+4243YRP3tmPWC/mXTDrg7z5X
	 uS+b8aPte6JDQ==
Received: by mail.creationavenue.pl for <linux-amlogic@lists.infradead.org>; Tue,  9 Jul 2024 08:15:57 GMT
Message-ID: <20240709084501-0.1.4o.mibp.0.kci0rorkqv@creationavenue.pl>
Date: Tue,  9 Jul 2024 08:15:57 GMT
From: "Karol Winiarski" <karol.winiarski@creationavenue.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.creationavenue.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_012034_107988_FA57C44E 
X-CRM114-Status: UNSURE (   0.03  )
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
YXdpYW0KS2Fyb2wgV2luaWFyc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
