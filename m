Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0A7C624D3
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IV6m9aOvK04iWAvEcyRLY+TxPA1Mg2lvP05RfwQUzc=; b=B9jCYHLwvt3W8M
	q/XNQBcPNBfJafZC2lYV9RmBs/Wko4BoJ6jRv47F8/YbJ8LCMX0NoUhMlIU1m0pVcFNkR7jkVHqSm
	cfZCT61PK04QcOjwpRjeXQEcO0t0E7Sp0EVFc3/GCKR95c6gdZitBQ5fgsEdkZ5Xap02LqVhVyPIM
	Zm9Vc/yALBP3D9mP7dfk9zWIv29oTPvyglIR1g0rd5Pe1w6B+7REeSPKxvIq9GAzxuDbLqp9Cn9UX
	j3yRJv/WBYp3hy8NAilRlmKquwvgua93MMj639QCrkaBStiw39y1opBWgq2vaT0075xOqPXOvfuCH
	+lO3YoCjug1peV8PjZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kmq-0000000EmB3-2wnk;
	Wed, 02 Sep 2026 13:13:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kmp-0000000EmAw-2rBp
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Sep 2026 13:13:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C912F600D1;
	Wed,  2 Sep 2026 13:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197C61F000E9;
	Wed,  2 Sep 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354834;
	bh=uuhR4rCRRh1/YU6F1GDxAhFo130zKI80x0wn37Qgem8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FaFfFGM/d+HI7JA3MNo5kNWLQGcgAe1bM1ko+oucfr4Rl/prXcImP+ugL9gRueZf+
	 sBcRKSstSYwVhk+AHOWR8FenCiiHOBHToHIY6CRMvklOzoFiwlSjdCNSLpOpWTzLnE
	 vxa831UVAFyuIXyAsjE8xrVEb2IBoP1bOgncJ1qtUyhv+yWqQwQUqLLleNlLM/aeuU
	 tDTjXzGGzx7TAXcBTRliZAAUS6l+e2thbqH/e1Q6dDHj2E2fRuCfJxklh5RaV0ILCo
	 GJD7xqdViaGxaEaoBKZdb2vFngKUEnQ+R4cMkAYt883peK5ASKDuzcPKVvbnWOqVzy
	 Ih8fKBNnUSk7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-4-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-4-5f1610d83bf0@aliel.fr>
Date: Wed, 02 Sep 2026 13:13:53 +0000
Message-Id: <20260902131354.197C61F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAKPiBS
ZWFkIHRoZSBmYW4gcmVnaXN0ZXIgYW5kIGxldmVsIHRhYmxlIGZyb20gcGxhdGZvcm1fZGF0YSAo
ZmFuX3JlZywKPiBsZXZlbHNbXSBhbmQgbmxldmVscykgaW5zdGVhZCBvZiBoYXJkY29kaW5nIGEg
c2luZ2xlIHJlZ2lzdGVyIGFuZAo+IGxldmVsIGNvdW50LCBhcyBuZXcgTUNVcyBuZWVkIGRpZmZl
cmVudCB2YWx1ZXMuIE1BWF9MRVZFTCBpcyBrZXB0Cj4gYW5kIGJ1bXBlZCBmcm9tIDMgdG8gNSB0
byBtYWtlIHRoZSBzcGVlZCBjaGFuZ2UgbW9yZSBncmFkdWFsIHdpdGgKPiB0aGUgbmV3ZXIgTUNV
cy4KPiAKPiBUaGUgY29vbGluZyBkZXZpY2UncyBzdGF0ZSBpcyBzdG9yZWQgYXMgYW4gaW5kZXgg
aW50byBsZXZlbHNbXSwKPiBhbmQga2hhZGFzX21jdV9mYW5fc2V0X2xldmVsKCkgd3JpdGVzIGxl
dmVsc1tzdGF0ZV0gdG8gZmFuX3JlZywKPiByYXRoZXIgdGhhbiB3cml0aW5nIHRoZSByYXcgc3Rh
dGUgdmFsdWUgYXMgYmVmb3JlLgo+IAo+IE9wdGlvbmFsbHkgYWNxdWlyZSBhbmQgZW5hYmxlIGEg
ImZhbiIgcmVndWxhdG9yIHN1cHBseQo+IGF0IHByb2JlIHRpbWUgYW5kIG9uIHJlc3VtZSwKPiBz
byBib2FyZHMgdGhhdCBnYXRlIGZhbiBwb3dlciB0aHJvdWdoIGEgcmVndWxhdG9yIGFyZSBoYW5k
bGVkLgo+IFRoZSByZWd1bGF0b3IgaXMgcmVsZWFzZWQgdmlhIGEgZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCkKPiBjYWxsYmFjay4KPiAKPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUg
PGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBh
dGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkwMi1hZGQtbWN1
LWZhbi1raGFkYXMtdmltNC12MTEtMC01ZjE2MTBkODNiZjBAYWxpZWwuZnI/cGFydD00CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
