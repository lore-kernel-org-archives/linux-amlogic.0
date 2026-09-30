Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB466CA5FC7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeLAeJpdY2YTiwC+JDXtubO1WjY+YvHyrdK8TuDxyxA=; b=Rd6aeai094HLHm
	Yc/1EZe+vuPEXaV5X3aHEV2aYamZRb/YRkNJ5OhNnkhcTcBkT3QGbXz8nCOjU5iop6XxJXpWTf3jO
	svfKAL14JD/Mr4JwYdMn4xNsikLI2tFjP7fs7EM40WNJdCN+tcxHFGNEMXDW3+9+e0iSbHqyMvsCC
	JIIoiOq13h3XejmSqaqPARWH20cAn3nxNAEMPWCwXfXEHukPrdUGrReBYaklGPnDC/SbKn4Rs9kI/
	JPNkJJtnRjgnQ9152+jH93QxTopHmzZxQ85owyYGaCTHYNuQcwdEvAr2YS4uev+RIsZ7jD8G2/0NS
	pCETCNdXvmV2ifaj9THg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvsy-00000006QQe-16Uv;
	Wed, 30 Sep 2026 15:06:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvsx-00000006QQU-1Ewj
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 15:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65E1660008;
	Wed, 30 Sep 2026 15:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE88A1F000FF;
	Wed, 30 Sep 2026 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780778;
	bh=Q9QfSuVvRZW99z8e8L2TYXnqUAq9jufmC8kej6tIPIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2OfiafdlavXjAQ7CGObUxCzd7UylPzkKcsrMOwQSmT/e5iXr2t5yYawJP3kP39PD
	 4+XeSJBWw9JuT5A3t91wYtKnFjKzycfiT+OjLPSZNb+ErowS/IMUDHJlodeHZg2Hiz
	 HBX5CWYmFQqhP7+AWgBrExZi8LLcbyJ93fATJwmXh7uzdoW83R73T2Pse0jMjeyXpF
	 6PHTEwavz2VIlKuNx+IapQJmScmaRCMyqtpXlsI6ZC6Kvvr+jwUGDhICT6GRF79gqH
	 0im1Rq/UxgF0PaX3hOg1HoKO0uBx3atekRLQ5MluhxCUHWpK8vXtNziBktO8Hdn9X7
	 R6B95rJqhfF4A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/4] PCI: Configure Root Port MPS after scanning its
 hierarchy
To: "Niklas Cassel" <cassel@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, linux-pci@vger.kernel.org
In-Reply-To: <20260930145017.1356088-9-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
 <20260930145017.1356088-9-cassel@kernel.org>
Date: Wed, 30 Sep 2026 15:06:17 +0000
Message-Id: <20260930150617.CE88A1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcGNpOiBpZ25vcmlu
ZyBwY2llX3NldF9tcHMoKSBmYWlsdXJlcyBjYXVzZXMgaWxsZWdhbCBNUFMgdG9wb2xvZ3kKLS0K
CmNvbW1pdCA2ZGFjOTlmNDc2ZmY3MzBhYjdkZDE0MDUxYjYyZTk0MDI4MDZiMzM5CkF1dGhvcjog
TmlrbGFzIENhc3NlbCA8Y2Fzc2VsQGtlcm5lbC5vcmc+CgpQQ0k6IENvbmZpZ3VyZSBSb290IFBv
cnQgTVBTIGFmdGVyIHNjYW5uaW5nIGl0cyBoaWVyYXJjaHkKClRoaXMgY29tbWl0IGludHJvZHVj
ZXMgbG9naWMgdG8gcmFpc2UgdGhlIE1heGltdW0gUGF5bG9hZCBTaXplIChNUFMpIGZvciBSb290
ClBvcnRzIGFuZCB0aGVpciBkb3duc3RyZWFtIGhpZXJhcmNoaWVzIHRvIHRoZSBsYXJnZXN0IHN1
cHBvcnRlZCB2YWx1ZSBkdXJpbmcKc2Nhbm5pbmcgb3IgcmVzY2FuLiBJdCBhcHBsaWVzIHRvIFBD
SUVfQlVTX0RFRkFVTFQgY29uZmlndXJhdGlvbnMgdG8gaW1wcm92ZQplZmZpY2llbmN5LiBJdCBh
bHNvIGVuYWJsZXMgdGhlIEludGVsIHJlYWQgY29tcGxldGlvbiBjb2FsZXNjaW5nIHF1aXJrIGZv
ciB0aGUKZGVmYXVsdCBNUFMgc3RyYXRlZ3kuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9w
cm9iZS5jIGIvZHJpdmVycy9wY2kvcHJvYmUuYwo+IGluZGV4IGQ4ZTU4ZTVlZjczMDkuLjVmMzdi
NDgwYjUxZGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvcHJvYmUuYwo+ICsrKyBiL2RyaXZl
cnMvcGNpL3Byb2JlLmMKClsgLi4uIF0KCj4gQEAgLTMwODMsNiArMzA4Myw4MiBAQCBzdGF0aWMg
aW50IHBjaWVfYnVzX2NvbmZpZ3VyZV9zZXQoc3RydWN0IHBjaV9kZXYgKmRldiwgdm9pZCAqZGF0
YSkKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHBjaWVfcmFpc2VfbXBzKHN0
cnVjdCBwY2lfZGV2ICpkZXYsIHZvaWQgKmRhdGEpCj4gK3sKPiArCWludCBtcHMgPSAqKGludCAq
KWRhdGE7Cj4gKwo+ICsJLyogTVBTIGlzIG9mIHR5cGUgJ1JzdmRQJyBmb3IgVkZzICovCj4gKwlp
ZiAoIXBjaV9pc19wY2llKGRldikgfHwgZGV2LT5pc192aXJ0Zm4pCj4gKwkJcmV0dXJuIDA7Cj4g
Kwo+ICsJaWYgKHBjaWVfZ2V0X21wcyhkZXYpIDwgbXBzICYmIHBjaWVfc2V0X21wcyhkZXYsIG1w
cykpCj4gKwkJcGNpX2VycihkZXYsICJjYW4ndCBzZXQgTWF4IFBheWxvYWQgU2l6ZSB0byAlZFxu
IiwgbXBzKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKW1NldmVyaXR5OiBNZWRpdW1dCldoZW4g
cGNpZV9zZXRfbXBzKCkgZmFpbHMgaW4gcGNpZV9yYWlzZV9tcHMoKSwgdGhpcyBlcnJvciBpcyBs
b2dnZWQgYnV0CnN3YWxsb3dlZCBieSByZXR1cm5pbmcgMCB0byB0aGUgcGNpX3dhbGtfYnVzKCkg
Y2FsbGJhY2sgbG9vcC4gRG9lcyB0aGlzIGFsbG93CnRoZSBsb29wIHRvIGNvbnRpbnVlIGFuZCBw
b3RlbnRpYWxseSBjcmVhdGUgYW4gaWxsZWdhbCBNUFMgdG9wb2xvZ3kgd2hlcmUgYQpkb3duc3Ry
ZWFtIGRldmljZSBpbmhlcml0cyBhIGxhcmdlciBNUFMgdGhhbiBpdHMgdXBzdHJlYW0gYnJpZGdl
PwoKPiArCj4gKy8qCj4gKyAqIFdpdGggUENJRV9CVVNfREVGQVVMVCwgcGNpX2NvbmZpZ3VyZV9t
cHMoKSBvbmx5IG1hdGNoZXMgZWFjaCBkZXZpY2UgdG8gaXRzCgpbIC4uLiBdCgo+ICsgKiBsZWF2
ZSBoaWVyYXJjaGllcyBhbG9uZSBvbmNlIGFueSBvZiB0aGVpciBkZXZpY2VzIG1heSBoYXZlIGEg
ZHJpdmVyIGJvdW5kLgo+ICsgKi8KPiArc3RhdGljIHZvaWQgcGNpZV9idXNfcmFpc2VfZGVmYXVs
dF9tcHMoc3RydWN0IHBjaV9idXMgKmJ1cykKPiArewo+ICsJc3RydWN0IHBjaV9kZXYgKnJwID0g
YnVzLT5zZWxmOwo+ICsJdTggc21wc3MgPSBycC0+cGNpZV9tcHNzOwo+ICsJaW50IG1wcywgb2xk
X21wczsKPiArCj4gKwlpZiAocGNpX3BjaWVfdHlwZShycCkgIT0gUENJX0VYUF9UWVBFX1JPT1Rf
UE9SVCB8fAo+ICsJICAgIGxpc3RfZW1wdHkoJmJ1cy0+ZGV2aWNlcykgfHwgcGNpX2J1c19pbl91
c2UoYnVzKSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcGNpX3dhbGtfYnVzKGJ1cywgcGNpZV9maW5k
X3NtcHNzLCAmc21wc3MpOwo+ICsJbXBzID0gMTI4IDw8IHNtcHNzOwo+ICsJb2xkX21wcyA9IHBj
aWVfZ2V0X21wcyhycCk7Cj4gKwlpZiAobXBzIDw9IG9sZF9tcHMpCj4gKwkJcmV0dXJuOwo+ICsK
PiArCXBjaWVfcmFpc2VfbXBzKHJwLCAmbXBzKTsKPiArCXBjaV93YWxrX2J1cyhidXMsIHBjaWVf
cmFpc2VfbXBzLCAmbXBzKTsKCltTZXZlcml0eTogTWVkaXVtXQpJZiB0aGUgY2FsbCB0byBwY2ll
X3JhaXNlX21wcygpIGZvciB0aGUgUm9vdCBQb3J0IChycCkgZmFpbHMgdG8gc2V0IGl0cyBNUFMs
CmRvZXMgdGhpcyBkYW5nZXJvdXNseSBwcm9jZWVkIHRvIGNhbGwgcGNpX3dhbGtfYnVzKCkgYW5k
IHNldCB0aGUgTVBTIG9mCmRvd25zdHJlYW0gZGV2aWNlcyBhbnl3YXk/IENvdWxkIHRoaXMgcmVz
dWx0IGluIGEgUENJZSBwcm90b2NvbCB2aW9sYXRpb24KbGVhZGluZyB0byBNYWxmb3JtZWQgVExQ
IGVycm9ycyBhbmQgcGFja2V0IGRyb3BzPwoKPiArCXBjaV9pbmZvKHJwLCAiTWF4IFBheWxvYWQg
U2l6ZSBvZiBoaWVyYXJjaHkgc2V0IHRvICVkICh3YXMgJWQpXG4iLAo+ICsJCSBtcHMsIG9sZF9t
cHMpOwo+ICt9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwOTMwMTQ1MDE3LjEzNTYwODgtNi1jYXNzZWxAa2VybmVsLm9yZz9wYXJ0
PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
