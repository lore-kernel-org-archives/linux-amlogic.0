Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE3EE8FDD8
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RynkUrdDEltEDehKXytpwEGUWTsuagOa9khAYf+Gf0g=; b=PNf85Kwd96p9qZ
	q9Rk7uVhxywHugkdv9StbwyKC5wa5wywCXqGXOqlZYN8CeKNupmx/aBYpf8GU/kNI+AodcLiKmuFT
	Qs+Bj80cBrsZKDym2y6ccf4V74ygwnfSBpDpF3FZWjx7ayYg0swVgOZPgABfh3h/sS8qoIFUxBnjg
	0XWDz83XumqOXrDbShqJU5VYA8yfxV3HPpixjm9WMkN6idX+RiBksCXgFJYxvLCjWkCOd/jYmRFOM
	H12BK90ryTjlL/KOZ8y6EoJjKnufO75zHFCKH3aSuRdn+gnzWVcusIrPDJVxliP61DBxniXr8KVo+
	dKEkT8TUbPNpByykZ71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwVR-00Ge65-1O;
	Wed, 04 Oct 2023 07:41:17 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwVN-00Ge2r-2q
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Oct 2023 07:41:15 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 15C621F460; Wed,  4 Oct 2023 09:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1696405264; bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=;
	h=Date:From:To:Subject:From;
	b=GWJP+lYJcoIkF03r4OGOmubB8DfcdL1HVa33u0R4pO115SrU+ZufDZor6iThNSe6i
	 JYFJZX2weiZFF8pHL8e/VIYfM34e0DyKxydo3jMW1ZUjeGSzkjIn41Oyxr/oSBe6hm
	 pBRr2elYfSerjDc8vmK/cYWZou6sA02ZfpLX0ntDJVizHmkZD+fi2CbGfjZcj01wY3
	 i8Z/6z+KsmWJAvII7Z1hf//gbaKT45kOsJoBhmTS9TRqgknYZ7V8zfIkzqYgl45jjn
	 6N3vH7ZFTZj93ZFiKz6S/SIlzM2DiGuIj9zekxpxvC4HJoY6oIb9oo9mfC4ao0EzHl
	 ZmnyDHTyY+w1A==
Received: by mail.citycodes.pl for <linux-amlogic@lists.infradead.org>; Wed,  4 Oct 2023 07:40:44 GMT
Message-ID: <20231004084500-0.1.7v.j0nw.0.654a4axn9h@citycodes.pl>
Date: Wed,  4 Oct 2023 07:40:44 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Rozszerzenie_Programu_M=C3=B3j_Pr=C4=85d_5.0?=
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_004114_160665_E9B2510E 
X-CRM114-Status: UNSURE (   0.86  )
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

U3phbm93bmkgUGHFhHN0d28hCgpXIHJhbWFjaCBub3dlaiBlZHljamkgcHJvZ3JhbXUgTcOzaiBQ
csSFZCBtb2fEhSBvdHJ6eW1hxIcgUGHFhHN0d28gZG9maW5hbnNvd2FuaWUgbmEgemFrdXAgaSBt
b250YcW8IGZvdG93b2x0YWlraSBpL2x1YiBtYWdhenludSBlbmVyZ2lpLiBNYWtzeW1hbG5hIGt3
b3RhIGRvZmluYW5zb3dhbmlhIHd5bm9zaSA1OCB0eXMuIHrFgi4gCgpKYWtvIGZpcm1hIHd5c3Bl
Y2phbGl6b3dhbmEgdyB0eW0gemFrcmVzaWUgemFqbWllbXkgc2nEmSBQYcWEc3R3YSB3bmlvc2tp
ZW0gbyBkb2ZpbmFuc293YW5pZSBvcmF6IGluc3RhbGFjasSFIGkgc2Vyd2lzZW0gZG9wYXNvd2Fu
eWNoIGRvIFBhxYRzdHdhIGJ1ZHlua3UgcGFuZWxpIHPFgm9uZWN6bnljaC4KCkLEmWTEmSB3ZHpp
xJljem55IHphIGluZm9ybWFjasSZIGN6eSBzxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmkuCgoK
UG96ZHJhd2lhbSwKS2FtaWwgTGFzZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
