Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F68C02193
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Feb 2025 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHN3wZC13s9aGtW0lbxCmDaaFEL1ffV75SBm4U2QhmI=; b=uyd6g+UOG/MP+U
	A92ookVU/W0qhhOxCrrbymhgRglmJ6R6BBl9Zr89ef1YLAZHl9MHEu5UwRpCnJYkI7TazW52CMnGA
	NFj7Sl1Ln12XywS6/JJ8/+mTkX2Ly4i+f9o8ncDhTa3U2lEcWkQD1BdZoTxhsaFOxZ0Z540MZnxrx
	mHSLkjTynxcRmzL1xmSGdeTTC0HKd+FMULV8wHcKocbAtio+K1NPTW1uHCMbJqnB69dHxTlVH35C+
	r2nx47KDVF84t/24SkQFuX00MVasPjjSowHqg9v3fJk/swlzORDz0AgmQA5779CIHnBo3lwNErnJm
	LxhcZ9mPL7ikEHGDSJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaQX-0000000DpQm-3Wuz;
	Sun, 02 Feb 2025 13:54:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaQU-0000000DpQL-3ve2;
	Sun, 02 Feb 2025 13:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B215CA40BDF;
	Sun,  2 Feb 2025 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BF1C4CEE3;
	Sun,  2 Feb 2025 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504457;
	bh=NJbQEhdRphOevzblAXb4WZu9Pe0ok04Io7JS0PPxMrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaWYKT5gxQMaF1jyfn5v7U6RcVb15LvzykdzWu7X4te/Yy66zmvzKM1+XC9SjQhxQ
	 GJaWcVPvqivyxwE9A886vlFOyEFlFA7RAcp3EWaYNlAsGQkYeCJ5bp65T6hEP/9VeN
	 zyDqNtv62Pz8S2zm2mnDA3tusFDPIUij8ofPOQB/6ax81D3QuUDgZklny1Ekr7KUvx
	 A6OaSyzY9O64ZNc3b1RjtO7vs57RIX3dh+WkY5+RDHGtwDwRmh5fgL/D/sbf1Zh5HI
	 62ArNwJyV1hOgeJU9rB4z3UJVCW4sCtyrSpvWxVhJ9ogTGAtDvCDphdHLNyKBloosS
	 oINuBc5jNPo2g==
Date: Sun, 2 Feb 2025 14:54:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
Message-ID: <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250201193044.28856-2-funderscore@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_055419_039740_A29B681E 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Karl Chan <exxxxkc@getgoogleoff.me>, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMDc6MzA6NDNQTSArMDAwMCwgRmVyYXNzIEVsIEhhZmlk
aSB3cm90ZToKPiBGcm9tOiBGZXJhc3MgRWzCoEhhZmlkaSA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtl
dG9zLm9yZz4KPiAKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgUzgwNVkgU29DIGFuZCB0
aGUgWGlhb21pIE1pIFRWIFN0aWNrIChha2EuCj4geGlhb21pLWFxdWFtYW4pLiAgVGhlIFM4MDVZ
IGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUzgwNVgsIHdpdGgganVzdCBhCj4gZmV3IG1pbm9yIGRp
ZmZlcmVuY2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZlcmFzcyBFbMKgSGFmaWRpIDxmdW5kZXJz
Y29yZUBwb3N0bWFya2V0b3Mub3JnPgoKUGxlYXNlIHJ1biBjaGVja3BhdGNoLiBZb3UgaGF2ZSBm
cm9tL1NvQiBtaXNtYXRjaC4KCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
