Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366ADECE564
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MVwYOu6Z9FPl+gslMf7Mb4becNN9AUiB22PR8DMhiWM=; b=sNRQtUgp4DxHCG
	XNOgZtsmvoAxJdrI9sAzUrHz1HveUDeRv0pgHBubH7R+GFZ25hCZ/gEtrgGAp0Cv0gb+bOGiGrsqI
	JSSqkwyt/zvB2yhebxl+Y7OBbMgxLJq1Z/RS83L3mw1YuZGLAV4qEnt5hkLzOJp1AGQR+ssMZexlJ
	01CIFyffymWCa5/YPo/xHXCzpdkmee5iYQ7xVdaYB5VQmNoP0v83r9ZetylW/5Gx6bPqho91Dnc9t
	84nFPQgTe6vlEossjpLgvEIc951asJNeV6pn8EdRkHtEXLHoZ7Ls2mrMkMcaBnZ132plNB6QB5OG0
	qC0NM5fwUvTu5Xe3CPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvpF-00000004iWm-3pV9;
	Tue, 10 Sep 2024 08:02:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvoK-00000004i4w-0I9D
	for linux-amlogic@bombadil.infradead.org;
	Tue, 10 Sep 2024 08:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EywM+E+OIUr7RnYatSz3YfoNTVB6dOfImeA7tdj3yJA=; b=DmIzJmttUZPANLGXDNClPDxAOV
	jiy/NmEsqUp4X9ecCZbd/Y+CaJMzo8Ckcw9yBDs8mSt21ZepYOnnFL9oj1KNpA+hNYMZ6e+JFlUHC
	YxxhWX1IVFgtR85jwTb31Hf5CkNZFuyR80tWGdOTR1AvRFktT9KPOfaTaNQmJlDEzSRsZaw8VWqJL
	W/96JMr7OWneDAFKAfxF533kVl1+Q2WwqSIgbOGxALaD1zrzVDmt8afNGQjIWJlFS/NmwCjQtoioZ
	ecfGDzU2uyAgqM7dOOZqPOnOpNDgJw1++2Kb8BdN99RDLx8gJLu4Sbf4Wy3U4/80vjEjlLyZhZzct
	ysLPTdKQ==;
Received: from mail.originateinc.pl ([217.61.97.94])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snvoF-00000007AH2-409j
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 08:01:14 +0000
Received: by mail.OriginateInc.pl (Postfix, from userid 1001)
	id BD5B084DBF; Tue, 10 Sep 2024 09:01:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=OriginateInc.pl;
	s=mail; t=1725955263;
	bh=EywM+E+OIUr7RnYatSz3YfoNTVB6dOfImeA7tdj3yJA=;
	h=Date:From:To:Subject:From;
	b=UGHhidZnKHTB/OozpLyuvJsOXwtNi6KJtaKhgPIZMjtwLglVpuu7b88xGExFToiOh
	 6KWj1HwdO3GYz6PDVcTGXs9DDepeFqjoORFR+n/08aNUpRwmblQEWwnX3XKEiwc7YW
	 D5K/sIW6lzERJqD4WWsnmneIBGa/yGDE93Gxa1p3kR1Wblb78W6hi9mpyXh5evYiig
	 7e3dCtLQgnS+EkFeDgDMSVDKp9JMqWRrUlyiBjXsrkKwmzYQSZn0u9P79w85v3YFqQ
	 HpnG9yCdd2JnTpNblvvn0b5kvlRKa9hSzSkfVeuJhbm79ULpb4+9vwX+HhWW3IACVl
	 1I3zyYKXCMPJA==
Received: by mail.OriginateInc.pl for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 08:00:21 GMT
Message-ID: <20240910074501-0.1.f2.1ovjm.0.dcrlte6jwe@OriginateInc.pl>
Date: Tue, 10 Sep 2024 08:00:21 GMT
From: "Kamil Tralewski" <kamil.tralewski@originateinc.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.OriginateInc.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_090112_379039_5C8106AB 
X-CRM114-Status: UNSURE (   0.36  )
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
