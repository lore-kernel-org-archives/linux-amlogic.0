Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E5C2D0CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 May 2025 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IYF9NOnoKLLfT7fJZI47Z85+z/fkGyR3jr7BfTTopaQ=; b=pI1TI6tEdJWYDc
	FemQWPm49SaV7uOrcabQzf91Ix76M0riGl8+O5/wOleanzK1d8HP8OIeW3cKf4HADBYjmuMsxSpzA
	/WtVTRG8J2WL2jF6has54FJ397IOQj64HvorcHsnFI4sG9SRK9VuEBiWxLUcJUCUuSAkzBYPjUEuv
	+NwYzM0cqMOTtpP+5zNfIfWp9ZTXWs3N+WodGk151Sipt430HEyNDpYIh5QOyiWri9qHt83ATLXH5
	a0etNKleXU5VyOmIzX6uQjRpMi6z0+2GkbnvN/i5Xpac6FgboPpq27/lKkRuZwiyi3Pv78qK5iLZI
	l+s9PBMjXd+Qtwbs9ocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYD-0000000HRI1-0FEU;
	Thu, 15 May 2025 08:02:45 +0000
Received: from mail.growdeal.pl ([141.95.55.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTW9-0000000HQvC-0Z3S
	for linux-amlogic@lists.infradead.org;
	Thu, 15 May 2025 08:00:39 +0000
Received: by mail.growdeal.pl (Postfix, from userid 1002)
	id DB7AE25005; Thu, 15 May 2025 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growdeal.pl; s=mail;
	t=1747295859; bh=nU0fzD5wnLwbt9yoUSBeMInFHzMm7DGirLXtUO2ZpV8=;
	h=Date:From:To:Subject:From;
	b=rI5iNzbbKiiqOh6EqszpLdnX1A6yNke1fSoTuxsrOop9X/DTVSXo687IWQVoOeXzS
	 aDRtYPcOAQyULL0JMFfaCvjFG9f85zHfM7ZhU+tmtF2E9+QbYD2MKIP6j5rlhDJj18
	 l1iETilmsRBXKEY2HURiGdt1mlNPUIWATGJAxh7i7Uhf2ujCeak6SC6rRhrO6SkOGX
	 VKX3w16YjTYNFp34ctR5+DJWwWMmxysYhOaL02QMoD1gMJEvlMy/m2FMnXxwvt3yHS
	 HhdP42pogZncCZ9GYK2wjqs/CdH6wYjRjvrbIVCtnr4KV9KdKGl3pWGp4Kgo4fVodH
	 R+Js0jCtQNaww==
Received: by mail.growdeal.pl for <linux-amlogic@lists.infradead.org>; Thu, 15 May 2025 07:55:57 GMT
Message-ID: <20250515064500-0.1.2c.12jsc.0.i8t5v5t8am@growdeal.pl>
Date: Thu, 15 May 2025 07:55:57 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Zajdlicz"?= <pawel.zajdlicz@growdeal.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.growdeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010037_856764_479F451B 
X-CRM114-Status: UNSURE (   0.65  )
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
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGF3ZcWCIFphamRsaWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
