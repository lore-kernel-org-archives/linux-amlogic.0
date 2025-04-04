Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E1C3601E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WXipX3ox6l41u0kbCCRe2m4LD5wE9/GCsFTDExUjk1s=; b=OR2j1cWmuj1hT2
	XmN3nThFBLcvxN/4v1NKlPspIdB3e7gtkTXYSaa6YsXc//zJghPrqRZcLMLfwHSLrwvfS8lCcs7kN
	KKDiNMam3z0lncs/YaTHw68MIU11p2EdLOgyP8XJfbhIHPc7h4GhMMwvs9vjYfcjjBkTct+EiR8qT
	oxxUBRE/7DlqMSSmNdaA/6Bi1DWUzBs9PGd81rQSc6q3/hI2/vMUbQ3TFDCmrImFZaW5c0e0fWyyZ
	d2LFsHeWEew9eo5Tf4ciTllz56Z+wah+BrQT1ajbTrvtEOmEA4agN9A1dg+uxQ4aMiC67ph2mlAOY
	OutcUUX4oJLiz1/1udsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bzd-0000000B5aQ-1aca;
	Fri, 04 Apr 2025 08:01:37 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bza-0000000B5Yb-2tUO
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 08:01:35 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 4AF2C25C3D; Fri,  4 Apr 2025 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743753693; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=HfkQ8Eb2Vd2IIi2/N7fkb2QpX+VVkCTsFxG2pOwwQJdLPOb66FUuCICjMsh4xX3TV
	 BLQSZ/nMP8d8q/bNNsAy8OiKrTcd0gekKXUgQ4LQwX3mGNHisb9e/IkVVoMSsHjMDt
	 kJgTH1alk6xMQSa7uU9ZYJXhRUoKXcUoXJ26KTjmCL5gQvHFiGIZLtDW4FgxIB9g5t
	 wdt6Z2bLG1Il7Ysam23Am9rdOTr2qaRSFkydkbl/jUeC2cs+QbbhwO026lFxPdQ56Z
	 nUkEkoC9qOiX9KysuTMdYLTus8GhOsVE2+yYklv8q+e/SC+NGa0WTJsNORDRQWcQEi
	 koNskoHgdFKjA==
Received: by mail.ventrixor.pl for <linux-amlogic@lists.infradead.org>; Fri,  4 Apr 2025 08:00:53 GMT
Message-ID: <20250404064500-0.1.6b.1c95p.0.24sep3f0k5@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:00:53 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_010134_862564_4D2709E3 
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
CkphbiBBZGFtY3p5awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
