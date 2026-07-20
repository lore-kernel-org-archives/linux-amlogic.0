Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF00C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaMYk95dbH7fj0wRZgCiq5phLxP0O+Psh9oSmgVC6VM=; b=JjeuBHHxzFB9nU
	KxkSvvDhCPs3AuSSkUUproa0nLehAWanvd3eAfIbUf6nvnx1NiP6RuEBomg8Ye9zqYZKZKOJ0wkar
	spAhB+AfpXaNDe0/geclMvXpWt6Wr5AY1v2mP808FRBIqO9zR2LOz+zovCvn3qSlDd4aOX+kbcaYf
	okFsj2AaOooW8pSsaBy+qeX5dqcWtXt8U+2fVqlZfVssp7xuHF3HnTImWJxBYzYO7urR3Ha4grtBI
	CQ3KfAuWCcGMsw2/cWmKIFGs1yegevY7ZhZCO8id8S8upA1pec+Br3QGVLk0VIAwmacDj7aM9zuPu
	rNUGHfjscUEi16IqEKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpx9-00000007CNc-2DXE;
	Mon, 20 Jul 2026 15:30:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpx8-00000007CNR-2VK6
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:30:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACA2760A5C;
	Mon, 20 Jul 2026 15:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FF01F000E9;
	Mon, 20 Jul 2026 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561445;
	bh=mQbar/d8QGB/uSbQHJ47j+oqs0sNVVWb1ltrpfOdz+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=menUWW6TR0NQtE9XHTCF1PSlH07STB+kjy8nk5SFGbA9UB4lgTCgShl3FJeiiulmK
	 vQlklLjEzafQrrxjrOtHAGP/mowrcJL6rWPtX67WrmYKSWd4WH60ozChPU2tYqrxvz
	 Vg3OvfR9knYo6roNiSYsVJwojW8kUXUmRL4u562cKPEeBVjoiu5aP5HKiDfQMceeLn
	 m9AejmbYuHCcTs2TCOQQs3N07AP/qNmIFz92Z+8ahmn4My0Yz7hPkaGZ402HKJTYjb
	 3bwBTZ2lGEpDElGuRQtVPFJWK0lYnBu7lLqUBK2xJ9dB2N0lfXoOkQURzDrNTRq6Z2
	 sAcquC/tnZlgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/16] PCI: dwc: tegra194: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260720150619.24733-16-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-16-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:30:44 +0000
Message-Id: <20260720153045.13FF01F000E9@smtp.kernel.org>
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

PiBJbiBob3N0IG1vZGU6IHRlZ3JhX3BjaWVfZHdfaG9zdF9pbml0KCkgcnVucyBpbnNpZGUgLnN0
YXJ0X2xpbmssIHdoaWNoIGlzCj4gY2FsbGVkIGFmdGVyIGR3X3BjaWVfaG9zdF9pbml0KCkgaGFz
IGNhY2hlZCB0aGUgb2Zmc2V0LiBIb3dldmVyLCB0aGUKPiBkcml2ZXIncyBvd24gaW5pdGlhbGl6
YXRpb24gYWxyZWFkeSBlbmFibGVzIGhhcmR3YXJlLCBzbyBjYWxsaW5nCj4gZHdfcGNpZV9nZXRf
cGNpZV9jYXAoKSBpcyBzYWZlIGFuZCB3aWxsIHJldHVybiB0aGUgY2FjaGVkIHZhbHVlLgo+IAo+
IEluIGVuZHBvaW50IG1vZGU6IHBleF9lcF9ldmVudF9wZXhfcnN0X2RlYXNzZXJ0KCkgcnVucyBh
ZnRlciBoYXJkd2FyZSBpcwo+IGVuYWJsZWQgKFBFUlNUIyBkZWFzc2VydCkuIEJlY2F1c2UgdGhl
IGNvcmUgbm8gbG9uZ2VyIGNhY2hlcyBhdXRvbWF0aWNhbGx5LAo+IHdlIGNhbGwgZHdfcGNpZV9n
ZXRfcGNpZV9jYXAoKSBoZXJlIHRvIGNhY2hlIHRoZSBvZmZzZXQgZm9yIHN1YnNlcXVlbnQKPiBh
Y2Nlc3Nlcy4gVGhlIGhlbHBlciBwZXJmb3JtcyB0aGUgREJJIHJlYWQgb25seSB3aGVuIGhhcmR3
YXJlIGlzIHJlYWR5Lgo+IAo+IFRodXMsIHRoZSBwcml2YXRlIHBjaWVfY2FwX2Jhc2UgaXMgYWx3
YXlzIHZhbGlkIGFuZCBjYW4gc3RpbGwgYmUgdXNlZCBmb3IKPiByZWdpc3RlciBhY2Nlc3Nlcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFpoYW5nIDwxODI1NTExNzE1OUAxNjMuY29tPgoKU2Fz
aGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29r
cyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA3MjAxNTA2MTkuMjQ3MzMtMS0xODI1NTExNzE1OUAxNjMuY29tP3BhcnQ9
MTUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
