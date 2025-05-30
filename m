Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B4C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 May 2025 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sY8fTHI4zGMrlRLvD/gT6do/bkM9dTETvqBoKf+3v3c=; b=LIGOXzJFqVabn/
	dlcLwinfRrr/FZ28zav74xlp5igOf19zOCcKufthLbG4g+LSXM3THK7wVYO5+Hu1WAWs38Ov+8V73
	MB4DiAkEoUArpnMWGFWI/LvkoekCe4NsRb7taFRsie+eXZ0a/IPOrMAfx+Cwf2ly/LQHtxSsojjcY
	ex1JHgHNQKPNZAmLVTho4TOaijYkWDuQNVuX54T1lG2g4zRjrO+RpmyBQRT8UEct98+VY+tsTjnne
	LeW17svaXRpfRmlS95//4au9CCvS4kzYY6320I0rfnJVCoo8sM8MANb3qjGqOKdLjsA8q/l/JKK+L
	dVBsXLuF2CXEhdY5onQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv0o-0000000Hadd-0uyu;
	Fri, 30 May 2025 08:22:46 +0000
Received: from mail.successa.pl ([162.19.205.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKucD-0000000HX1t-0M7o
	for linux-amlogic@lists.infradead.org;
	Fri, 30 May 2025 07:57:23 +0000
Received: by mail.successa.pl (Postfix, from userid 1002)
	id B7B93279BE; Fri, 30 May 2025 09:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=successa.pl; s=mail;
	t=1748591835; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=nsieAWD4wTTQr9435n5UIjyQpv5CnzW9eATgK6G6Z5xKlJeJAQ5IRoYQiEV9bPhne
	 uYuhIqL8r0ROFGn+RONcmq8vMowiglH775OijneHsrj7rGxTrqrBl+B2a43yIcQlxQ
	 zpUvY3FBm42tGJ8KK+D2C0W545KozJ+Ryswa+cVwiYX+kIbo7uLDRwSFLQBXi5Aywb
	 9sVwLoVRIRNGROEsfDOKdtcY4Hg2fNXmRriQm9SWD0U+bvVk/g46Q3ZmNmPNa1i27t
	 i8hAPHs3INUdTkKm2mT7uuufBH54BEzsJJMIOF8dFGtfxU3LOiLyh8s2l9zwe98Akc
	 GX7C/uhg1+wMQ==
Received: by mail.successa.pl for <linux-amlogic@lists.infradead.org>; Fri, 30 May 2025 07:55:27 GMT
Message-ID: <20250530084500-0.1.ii.1o2y2.0.8bri7oo1cc@successa.pl>
Date: Fri, 30 May 2025 07:55:27 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@successa.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.successa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_005721_804619_7EC76B11 
X-CRM114-Status: UNSURE (   0.41  )
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
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
