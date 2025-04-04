Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1835CC3601E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WXipX3ox6l41u0kbCCRe2m4LD5wE9/GCsFTDExUjk1s=; b=ury48FUS153GBk
	MLfz4FJdUp0hE1PhczOhjoQO4UGNtnTFMmthcdPx58tVn5e/zqliuJMmCmUhcPAkfVqYRwHrgAE0q
	neKPhqGZDlICeMAsfYvVs0J0uFxPfQwkqKQJ4qG5n/wZrekjgKFIYloWEDW52OEeu7avaAicyfzQ2
	u6zetYZRl6S/Hnb1VR6IWcQVh7fQqUCvFjElTnsiZoyb7LIJioaad1RZYEEMwJa+QywIgMO22G7Ss
	FNWKH1i6qjGOT2AuqiAhRnRWF+nLg6omanotA8mcBluyndJYLylDD1cYAijMvuMeu5tFAXIYnFzgl
	LwP5KCoCXbLMAgIvjTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cRl-0000000B9N0-1Ki2;
	Fri, 04 Apr 2025 08:30:41 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cRi-0000000B9L5-14kP
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 08:30:39 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 9D25726237; Fri,  4 Apr 2025 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743755345; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=yrmL6SaWXq06hVBdwyWf8mJukpnZiGVcMkNtMVms67HLRc68Du0crw2lyTHlErKaO
	 WoF9kLFfV9Ukn3xDYJ0hcHinAdUWqG2rTdD6QUAM11xEhG5LzzKXD5QThc71flRMTy
	 unau5sEvgVj6XjRvoAwwDKogJMdPGvYEYDyJC37C1fWy0yugHgyM4ucibW+WVVr9e1
	 aaS8PsqNSsxdaWEvOtGgKAZeHdJSIrs+A+/UsRui4CCtG2T30aHwZQQBnpanHYn9kf
	 V/a13ckTEjuhydXhK6axHWYadP0GTAJogXNIFgiUcbfgx724M5v2Nik2ZiUk/t/1XA
	 jpDdPwtFSBihA==
Received: by mail.ventrixor.pl for <linux-amlogic@lists.infradead.org>; Fri,  4 Apr 2025 08:28:10 GMT
Message-ID: <20250404074859-0.1.6c.1c95p.0.opsyfr4r2o@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:28:10 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_013038_451335_7C92C882 
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
