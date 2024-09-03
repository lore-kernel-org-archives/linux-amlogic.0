Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5235CD342A
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2024 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+oxpvVPN7+h+pJO6Dk0tGnXSFp4ak9iIv0hb7wFEFo=; b=xkTJb62LWGiQA9
	sxR3GhmxZaOwbmpB8ESsLrRsotlz911Qm4HBP3FCcHH7RWp/1pqYq3iJtOaHkpPoS/aABHKyrQ5J0
	HbIDnlB/97nxrsE6D+eCRTb38y6DrapJ9EcOCkovxBRrDISBwXkHKLvrmTZaVm7hhok974wjzSWWY
	pBtuZAN5fgEyfoG5TpzIecqGEzSgQGsldzgYy+j+yiOD9zjqSk5EjrP/wNZGcojYVU/gnPdW5c52q
	FK6KYo/h6EIGkCFKVn/bBEZC/C1zBJea7G0DrythKRXYO4AGcRRrVi1JVBh2fZXHpMmUaPQcGxrtx
	/HztFhHcH99snMLWpR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOVd-0000000Gp4o-298r;
	Tue, 03 Sep 2024 08:03:29 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOVa-0000000Gp37-0QOv
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Sep 2024 08:03:27 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 5194D256F0; Tue,  3 Sep 2024 10:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1725350497;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=gMJS7695xvpV0MKCMl5npjY1HTLYgeoVJPYeDOdCEg2oBD7VMf30w2VZGoa2sG3A6
	 0y66IlNc8EkZ1QzIL7FLMvd+JWpWBLqzTh4CczyKw/reQ9ZWXfrplnptE6piChyc+H
	 e/SM4K9BoqquwmdS9OL3qJ/W8r9UbGaLkSrQQvgKod7zv7sfsjCmfHe7H6KkoSiCUY
	 0ex+ruOhgH21qSVNbf9lVtN6H/xFmphaHNTFA90fNNRpaoswwPorNe7PlhUfTdkPBB
	 h8F+bHlYVMTD/Bgq/XjWoLz3wwwG0P87xSL4C4UZTzW1TLu1JDg2LLVcbOPp6ynHoF
	 p2SO6w/PUD8rA==
Received: by mail.synergyflux.pl for <linux-amlogic@lists.infradead.org>; Tue,  3 Sep 2024 08:00:42 GMT
Message-ID: <20240903084500-0.1.dp.3gdai.0.s2f9ipr9bn@synergyflux.pl>
Date: Tue,  3 Sep 2024 08:00:42 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_010326_308156_07A563FC 
X-CRM114-Status: UNSURE (   0.67  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
