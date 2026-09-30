Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCA7CA5FC5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPlnUsq60U8QF43zprkN6RXt2Cw8jmNZzkSG+iZGgFw=; b=AF+EgILZ7N3lxr
	zO+uCYkvdd3cq+3BDHnxe5qBSM0482/mEcL2fcbHUarqzzHiOdetUAr0Ce2+M90ZD1oKRcKtxHuXN
	ByMe66yYWXO1rUziZ9/GNjh4q92ELj+ElRLwCXmyE6FeU920XU47bUpMmrwtQ23+Ireui4Pu3+dNq
	eLTp1j0ckA47HlpC0ZO/ntvqU+3ufdmymNYPdPo+QYzQFlKiu86A8I0ORCJPT5om34fVWARXrXSm3
	ChOwaSIrSZJpU/ANl2oCR5JDXKB+lWpSPDZTIyR6oDIzbIrtKaDwgptpXQWx1MaiyolR6wtz5q8gF
	f+FEMskdVXK7Q2XEGE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvkq-00000006OtO-1Wgw;
	Wed, 30 Sep 2026 14:57:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvko-00000006Osl-0cB6
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 14:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9728D43789;
	Wed, 30 Sep 2026 14:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F4A1F00898;
	Wed, 30 Sep 2026 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780273;
	bh=zeczajftE7m4hge0KmE3dUIK4JSk8WdnAPf0ngXwdNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eTT8rSESlkwe6pl12uTYzZueZAphGZA9WW+fLTgGSIL8ZlVWzKIbZVUSILQ3dz08m
	 lZBUf7f0qXSVISPqWq7Ty5+TNlvjolEAH9J09dUdRVP83tVXaxgJ4ny+W725TLhRwX
	 V6CmG2eISJII9d6UHU5iUOOvbyQOjKYNgxEw4LkOF9+97FWE8Kv2sCOZxp/E1Y8a9q
	 Xc3wnLswRxs3na9xjfh8p++VcFNyNErtPPPqZzVrZHVXvLFVt63akhco9o2SAXzISd
	 cI7WIQ/PCtWk0q+s+bEsOcDKwJkHARCBqpilz62/dthJVnjV6OgdK7AYq+KjHnUogU
	 9EyRrGyWqazsg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/4] PCI: Match the hierarchy's MPS to a device's
 MPSS as necessary
To: "Niklas Cassel" <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260930145017.1356088-8-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
 <20260930145017.1356088-8-cassel@kernel.org>
Date: Wed, 30 Sep 2026 14:57:53 +0000
Message-Id: <20260930145753.56F4A1F00898@smtp.kernel.org>
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

PiBGcm9tOiBIYW5zIFpoYW5nIDwxODI1NTExNzE1OUAxNjMuY29tPgo+IAo+IHBjaV9jb25maWd1
cmVfbXBzKCkgZW51bWVyYXRlcyB0b3AtZG93biBhbmQgcHJvZ3JhbXMgZWFjaCBkZXZpY2UncyBN
YXhpbXVtCj4gUGF5bG9hZCBTaXplIChNUFMpIHRvIG1hdGNoIGl0cyB1cHN0cmVhbSBicmlkZ2Uu
ICBXaGVuIGEgZGV2aWNlJ3MgTVBTCj4gU3VwcG9ydGVkIChNUFNTKSBpcyB0b28gc21hbGwgdG8g
bWF0Y2gsIGNvbW1pdCA5ZjBlODkzNTk3NzUgKCJQQ0k6IE1hdGNoCj4gUm9vdCBQb3J0J3MgTVBT
IHRvIGVuZHBvaW50J3MgTVBTUyBhcyBuZWNlc3NhcnkiKSByZWR1Y2VzIHRoZSB1cHN0cmVhbQo+
IGJyaWRnZSBpbnN0ZWFkLCBidXQgb25seSB3aGVuIHRoYXQgYnJpZGdlIGlzIGEgUm9vdCBQb3J0
Lgo+IAo+IFRoYXQgY292ZXJzIGFuIGVuZHBvaW50IGRpcmVjdGx5IGJlbG93IGEgUm9vdCBQb3J0
IGFuZCBub3RoaW5nIGVsc2UuICBXaXRoCj4gYSBTd2l0Y2ggaW4gYmV0d2VlbiwgdGhlIFN3aXRj
aCBwb3J0cyBoYXZlIGFscmVhZHkgaW5oZXJpdGVkIHRoZSBSb290Cj4gUG9ydCdzIGxhcmdlciBN
UFMsIHRoZSByZWR1Y3Rpb24gaXMgc2tpcHBlZCBiZWNhdXNlIHRoZSB1cHN0cmVhbSBicmlkZ2Ug
aXMKPiBhIFN3aXRjaCBEb3duc3RyZWFtIFBvcnQsIGFuZCBwY2llX3NldF9tcHMoKSB0aGVuIGZh
aWxzIHdpdGggLUVJTlZBTCBmb3IKPiB0aGUgZW5kcG9pbnQuICBUaGUgZW5kcG9pbnQgaXMgbGVm
dCBiZWxvdyBhIHBvcnQgcHJvZ3JhbW1lZCBmb3IgYSBsYXJnZXIKPiBNUFMsIHNvIGFueSBsYXJn
ZXIgVExQIGl0IHJlY2VpdmVzIGlzIHRyZWF0ZWQgYXMgTWFsZm9ybWVkLgo+IAo+IFsgLi4uIF0K
PiBGaXhlczogOWYwZTg5MzU5Nzc1ICgiUENJOiBNYXRjaCBSb290IFBvcnQncyBNUFMgdG8gZW5k
cG9pbnQncyBNUFNTIGFzIG5lY2Vzc2FyeSIpCj4gU2lnbmVkLW9mZi1ieTogSGFucyBaaGFuZyA8
MTgyNTUxMTcxNTlAMTYzLmNvbT4KPiBBc3Npc3RlZC1ieTogTExNCj4gQ28tZGV2ZWxvcGVkLWJ5
OiBOaWtsYXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOaWts
YXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMg
cGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTMwMTQ1MDE3
LjEzNTYwODgtNi1jYXNzZWxAa2VybmVsLm9yZz9wYXJ0PTIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
