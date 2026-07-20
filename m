Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8EC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iT3NyA4JVF/Yg6ahy9RuHn2NdjybqTae8mDBQk9bmhY=; b=1q1ts2FO55kWaB
	4xEs62ITCX86GfKPmdL1ED6a7uDfbATGCGZEcSiEZp058SXkzry+eXVHgNn338UF9gkfMOji4pbQt
	SbTAauLXDWaHmwrRtvi7lKw8cnksLnvz75Ei+blOCw5wgW/Aoo9fc5YfAw0bqUuanlsLL/B3Mm4Iu
	98NF1ZfjVs8KTJrBrtLS/VPVDEtroRWbybf1RHjpzVcKDJWGaF4875Fohwm8+JhE7x5uACMdUjL1z
	04W8VbWi6MuM5DBbZNVDFzPg1F7EU7VcPO/DTKbhH+Pvopz+RFzwjMxJBKI2oXCGZZNwtUD4v9uza
	eTYl4xeRE7PgoPCJB0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkO-000000079lo-3tZF;
	Mon, 20 Jul 2026 15:17:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkL-000000079ki-2qEm
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EDA760103;
	Mon, 20 Jul 2026 15:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9A41F00A3A;
	Mon, 20 Jul 2026 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560652;
	bh=mxxLC8eV66ZKFUyzucpluzk0eXBW6xfbc0sa5+LIdg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYH+uwBNlOne1kOTaBYyJlto6+IxlOYJRC32Nl6/XCOylwNcpH8uqoKpjnldUw8qj
	 x739yphb7/92m5DvbHpzrYgrzjce0y3iOSyWSgrHZj0V6n2myS04tpgE5Hr7ArUV7V
	 3UlFwIDxEg8Cypn0oXCmaI2w3IFni2gXxBdsB/CMuEr1XDhNAn/d+jZnv+UfLv9tSb
	 YhaoLU2iu2y4oiI0pzMhMaBPgiKeuQHUlKa/4YgP/0uu61OqROWcrgrQd3+7eJAhD1
	 iKroxeWDOBB8B38yGhRjDxWFXhRJPk3sGBLfAn6xnVDgpMwrqaDNSIkzKAsRh+mvY8
	 m6J0INEgfUnew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/16] PCI: dwc: Add pcie_cap field and helper in
 designware header
To: "Hans Zhang" <18255117159@163.com>
Cc: Frank.Li@kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260720150619.24733-2-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-2-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:17:32 +0000
Message-Id: <20260720151732.7B9A41F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gRGF0YSByYWNlIGFu
ZCBsb2dpY2FsbHkgZmxhd2VkIGNhY2hpbmcgaW4gZHdfcGNpZV9nZXRfcGNpZV9jYXAoKSBkdWUg
dG8gdW5wcm90ZWN0ZWQgcmVhZC1tb2RpZnktd3JpdGUgYW5kIGZhaWx1cmUgdG8gY2FjaGUgJ25v
dCBmb3VuZCcgc3RhdGUuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjMgMDEvMTZdIFBDSTog
ZHdjOiBBZGQgcGNpZV9jYXAgZmllbGQgYW5kIGhlbHBlciBpbiBkZXNpZ253YXJlIGhlYWRlciAt
LS0KY29tbWl0IGFiMjJkYzZmNTM0ZDc3YjM0ZGYxM2M5OWRkOTI5NzcxNTQ3ZjVmZjEKQXV0aG9y
OiBIYW5zIFpoYW5nIDwxODI1NTExNzE1OUAxNjMuY29tPgoKUENJOiBkd2M6IEFkZCBwY2llX2Nh
cCBmaWVsZCBhbmQgaGVscGVyIGluIGRlc2lnbndhcmUgaGVhZGVyCgpUaGlzIGNvbW1pdCBhZGRz
IGEgcGNpZV9jYXAgZmllbGQgdG8gc3RydWN0IGR3X3BjaWUgdG8gY2FjaGUgdGhlIG9mZnNldCBv
Zgp0aGUgUENJIEV4cHJlc3MgQ2FwYWJpbGl0eSBzdHJ1Y3R1cmUuIEl0IGludHJvZHVjZXMgZHdf
cGNpZV9nZXRfcGNpZV9jYXAoKQp0byBwZXJmb3JtIHRoZSBjYXBhYmlsaXR5IHNlYXJjaCBvbiB0
aGUgZmlyc3QgY2FsbCBhbmQgY2FjaGUgdGhlIHJlc3VsdC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmgKPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaAo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS5oClsgLi4uIF0KPiBAQCAtODI5LDYgKzgzMSwyMSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZHdfcGNpZV9kYmlfcm9fd3JfZGlzKHN0cnVjdCBkd19wY2llICpwY2kp
Cj4gIAlkd19wY2llX3dyaXRlbF9kYmkocGNpLCByZWcsIHZhbCk7Cj4gIH0KPiAgCj4gKy8qKgo+
ICsgKiBkd19wY2llX2dldF9wY2llX2NhcCgpIC0gUmV0dXJuIGNhY2hlZCBQQ0llIENhcGFiaWxp
dHkgb2Zmc2V0Cj4gKyAqIEBwY2k6IERXQyBpbnN0YW5jZQo+ICsgKgo+ICsgKiBGaW5kcyBhbmQg
Y2FjaGVzIHRoZSBvZmZzZXQgb2YgUENJX0NBUF9JRF9FWFAgb24gZmlyc3QgY2FsbC4KPiArICog
UmV0dXJucyAwIGlmIHRoZSBjYXBhYmlsaXR5IGlzIG5vdCBwcmVzZW50Lgo+ICsgKi8KPiArc3Rh
dGljIGlubGluZSB1OCBkd19wY2llX2dldF9wY2llX2NhcChzdHJ1Y3QgZHdfcGNpZSAqcGNpKQo+
ICt7Cj4gKwlpZiAoIXBjaS0+cGNpZV9jYXApCj4gKwkJcGNpLT5wY2llX2NhcCA9IGR3X3BjaWVf
ZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9JRF9FWFApOwoKW1NldmVyaXR5OiBNZWRpdW1d
CldpbGwgdGhpcyByZXBlYXRlZGx5IHNlYXJjaCB0aGUgY29uZmlndXJhdGlvbiBzcGFjZSBpZiB0
aGUgY2FwYWJpbGl0eSBpcwpub3QgZm91bmQ/IElmIGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KCkg
cmV0dXJucyAwIHdoZW4gdGhlIGNhcGFiaWxpdHkgaXMKbWlzc2luZywgcGNpLT5wY2llX2NhcCB3
aWxsIHJlbWFpbiAwLCBjYXVzaW5nIHRoZSBzZWFyY2ggdG8gYmUgcmVwZWF0ZWQKb24gZXZlcnkg
c3Vic2VxdWVudCBjYWxsIGluc3RlYWQgb2YgYmVpbmcgY2FjaGVkLgoKQWxzbywgc2luY2UgdGhp
cyBoZWxwZXIgbWlnaHQgYmUgY2FsbGVkIGNvbmN1cnJlbnRseSBieSBkaWZmZXJlbnQgdGhyZWFk
cywKY291bGQgdGhlIHVucHJvdGVjdGVkIHJlYWQgYW5kIHdyaXRlIHRvIHBjaS0+cGNpZV9jYXAg
Y2F1c2UgYSBkYXRhIHJhY2U/Cgo+ICsKPiArCXJldHVybiBwY2ktPnBjaWVfY2FwOwo+ICt9Cgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwNzIwMTUwNjE5LjI0NzMzLTEtMTgyNTUxMTcxNTlAMTYzLmNvbT9wYXJ0PTEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
