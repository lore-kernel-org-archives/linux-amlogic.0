Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFA4C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCZpnFsAmmNlEg73a/IHGg9PjVN/XREFsFviNk8EbJg=; b=v24gEpkDuEPaAv
	+RSfbvo10RJZxeTRskYeDFoBlynm6qTrhiUgRso0c2a6gDDDV9j2HxdRCSisnoqf4zTjIABIxyMA2
	jd4Mo2Een4FiNBkKah64dXdiJiOSRt2SEv9xc3pTWw7zS5Nul6h6wrhn+BdE8ym0V6fLJnBqPuzBi
	KP+nbOnPDfjtTbA9IGfNpapgq8JkNiQZyZSZTJGGJ0wZIa5QdKlGCWaAlBjjpGysuO5JHQ1axrB4x
	ra8hocw7znjg7CSfQ7ieufF9+X8usICXwIajhjUDqLVZ8I3ww5n7O9iX+2zmdXAavO3BljO2wK2X/
	q7m+WLttIUfJ5EJcEEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk42N-0000000Fe3F-2OAJ;
	Wed, 15 Jul 2026 18:08:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk42M-0000000Fe37-2D89
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6EE161838;
	Wed, 15 Jul 2026 18:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6951F00A3A;
	Wed, 15 Jul 2026 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138929;
	bh=qLVMs8B/gmr0UI3ooxeeE+f9lVRysNVAG6rFR/DuA8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTclVIiKSIHjLg72d2o7caOz1gFEtQBjmwqtTQ7X260itzA9VuR8+EpaY0jNjBtBF
	 SEcYLJTdKKXZcztUrGoSRNn26ZyVYpm/PA9gCZXRraYDZLRzPc86s6GxnlxUV38R6f
	 DABnGqEXc2QSkrebl5sXbeQXspBRqxPAJAZU3D4D3ncECj+jvNvg6qd1haLtYGO4bb
	 belVsCsgbVUK4bg89nwnZdWakI9cyH91CCrkuUvcnEccyEXEcLCgVgYNuq08hiLZNF
	 SQAjci7kVnZOjr2wLAS+QZ3WsaI0rbWtxLIb10RuRJYbB7SFzBft5Pk8LgHX+nOyaa
	 Sa2cS9aKIbieg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] nvmem: make all reg_write callbacks take const void
 *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: Frank.Li@kernel.org, ojeda@kernel.org, imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev, lee@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260715175229.24672-3-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-3-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:08:48 +0000
Message-Id: <20260715180848.BD6951F00A3A@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gU3ludGF4IGVycm9yIGlu
IGBxZnByb21fcmVnX3dyaXRlYCBzaWduYXR1cmUgY2F1c2luZyBjb21waWxhdGlvbiBmYWlsdXJl
Ci0gW0xvd10gSW5jb21wbGV0ZSBBUEkgbWlncmF0aW9uIGNhdXNpbmcgd2lkZXNwcmVhZCBpbmNv
bXBhdGlibGUtcG9pbnRlci10eXBlcyBidWlsZCBlcnJvcnMgYWNyb3NzIG90aGVyIHN1YnN5c3Rl
bXMKLS0KCi0tLSBQYXRjaCBbMl06IFtQQVRDSCAyLzhdIG52bWVtOiBtYWtlIGFsbCByZWdfd3Jp
dGUgY2FsbGJhY2tzIHRha2UgY29uc3Qgdm9pZCAqIC0tLQpjb21taXQgN2UyZjQyZWE0Yzk5NTA3
Mzg5NzJiYzYwYWVjYTE5ZjE0YmQ5M2NlNApBdXRob3I6IExpbmsgTWF1dmUgPGxpbmttYXV2ZUBs
aW5rbWF1dmUuZnI+Cgpudm1lbTogbWFrZSBhbGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNv
bnN0IHZvaWQgKgoKVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSByZWdfd3JpdGUgY2FsbGJhY2tzIGlu
IHRoZSBudm1lbSBzdWJzeXN0ZW0gdG8gdGFrZSBhCmNvbnN0IHZvaWQgcG9pbnRlciBpbnN0ZWFk
IG9mIGEgbXV0YWJsZSB2b2lkIHBvaW50ZXIgZm9yIHRoZSB2YWx1ZSBidWZmZXIuCgo+ICAgICBu
dm1lbTogbWFrZSBhbGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKgo+ICAg
ICAKPiAgICAgVGhlIHByZXZpb3VzIGNvbW1pdCBzd2l0Y2hlZCBmcm9tIGEgcG9pbnRlciB0byBt
dXRhYmxlIGRhdGEgdG8gYSBwb2ludGVyCj4gICAgIHRvIGltbXV0YWJsZSBkYXRhLCBzbyBsZXTi
gJlzIGZpeCBhbGwgdXNlcnMgb2YgdGhpcyBBUEkuCgpbU2V2ZXJpdHk6IExvd10KQXJlIHRoZXJl
IHVzZXJzIG9mIHRoaXMgQVBJIG91dHNpZGUgb2YgdGhlIGRyaXZlcnMvbnZtZW0vIGRpcmVjdG9y
eSB0aGF0IHdlcmUKbWlzc2VkIGR1cmluZyB0aGlzIG1pZ3JhdGlvbj8KCkZvciBleGFtcGxlLCB3
aGVuIGJ1aWxkaW5nIGRyaXZlcnMgbGlrZSBkcml2ZXJzL3J0Yy9ydGMtY21vcy5jIG9yCmRyaXZl
cnMvbWlzYy9lZXByb20vYXQyNC5jLCB3aWxsIGFzc2lnbmluZyB0aGVpciB1bnVwZGF0ZWQgY2Fs
bGJhY2tzIHRvCm52bWVtX2NvbmZpZy5yZWdfd3JpdGUgdHJpZ2dlciBpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlcyBidWlsZCBlcnJvcnM/Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL3Fm
cHJvbS5jIGIvZHJpdmVycy9udm1lbS9xZnByb20uYwo+IGluZGV4IGE4NzJjNjQwYjhjNWEuLmJh
Y2RjYjU2MTBiYWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1lbS9xZnByb20uYwo+ICsrKyBi
L2RyaXZlcnMvbnZtZW0vcWZwcm9tLmMKWyAuLi4gXQo+IEBAIC0yNTMsMTMgKzI1MywxMyBAQCBz
dGF0aWMgaW50IHFmcHJvbV9lbmFibGVfZnVzZV9ibG93aW5nKGNvbnN0IHN0cnVjdCBxZnByb21f
cHJpdiAqcHJpdiwKPiAgICoKPiAgICogUmV0dXJuOiAwIG9yIC1lcnIuCj4gICAqLwo+IC1zdGF0
aWMgaW50IHFmcHJvbV9yZWdfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IHJlZywg
dm9pZCAqX3ZhbCwKPiArc3RhdGljIGludCBxZnByb21fcmVnX3dyaXRlKHZvaWQgKmNvbnRleHQs
IHVuc2lnbmVkIGludCByZWcsIHZvaWQgdm9pZCAqX3ZhbCwKPiAgCQkJICAgIHNpemVfdCBieXRl
cykKPiAgewoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBjYXVzZSBhIGNvbXBpbGF0aW9uIGZh
aWx1cmU/CgpUaGUgZG91YmxlIHZvaWQgdm9pZCBkZWNsYXJhdGlvbiBhcHBlYXJzIHRvIGJlIGEg
c3ludGF4IGVycm9yIHRoYXQgd2lsbCBicmVhawp0aGUgYnVpbGQgd2hlbiB0aGUgUXVhbGNvbW0g
UUZQUk9NIGRyaXZlciBpcyBlbmFibGVkLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxNTE3NTIyOS4yNDY3Mi0xLWxpbmttYXV2
ZUBsaW5rbWF1dmUuZnI/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
