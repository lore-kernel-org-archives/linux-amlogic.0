Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99381CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=145Tw4Q6GdbX4tVG6EhPbdqWEMbpP3Ayk8Eok/ltbgU=; b=HU/JgS9j1j1EmO
	2b58X1G1YIvjvTLP01EY2D2PJi+Bizp7agc+04Uw1xjAsk0DBLImYhzijdAIa+TQt/f2EoxUctoaa
	rpa7iTnGOCKQGPxcxtWbtl0jD7UnPivRSwJh2XeRlfMPV/K1OA1dKd8liiGWppdDK5JGZpvWbbSFL
	meRrkjZ65e14poKuaGblAt/gmaB/IeTvjHHCSOx16tHTtia5AzaQEei83OovkawuZysDC3kAgKOPj
	aUFHUJ98ZaqobWJJGsZdQwhb4stsGueDMgBthoJLV7lID7Cfp0C4kQYBUX2TDYHrd9fN4IPrtRRC9
	9mCn1JXbfFFG4Dy7l+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuOJ-0000000Etok-0M4K;
	Wed, 14 Oct 2026 08:31:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuOI-0000000Etnh-0pUo
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 08:31:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBCF542E84;
	Wed, 14 Oct 2026 08:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5A61F000FF;
	Wed, 14 Oct 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791966673;
	bh=tXNn+deNPznIegy6+MGWsYc7dphJ8Z6B9PltX1beX6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUC3UBLduKkIA6FI0FDksAQyUNMmigJFcL2ar3weSDljHGbNLK0x04RsGgqL6NAgv
	 Xl7YF2oKLYpFKhj5zJo07ZWeReEnn8js4dH7165vr9kMNA7KNM2Mo4ZKTjCmU1YDZV
	 lW7HkYg9E8nYLyHlTcwfiRWGQQrwzGcpw+jnjLHCY8mMZ6IwZYeIoTfelSM5zQKI14
	 Ssn+nr6QeTh8D9EFQyh68Iy47pdswfwxzhITwfQZtG95pALjpjfSpebfLg5PaOnHeL
	 Y0mHT86NXBIBzcsnCrZ2LmAPI6PUd9cGc+JFyHQIdBZsA39WpvmYz67JVnf2N/yZgl
	 E4P4MTefKk0PQ==
Message-ID: <sashiko-outbox-171010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261014082037.1774672-2-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-2-wenst@chromium.org>
Date: Wed, 14 Oct 2026 08:31:12 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IHVzYjogcG9ydEAwIHNjaGVtYSBjb25zdHJhaW50IGJ5cGFzc2VkCi0tCgpjb21taXQgYWFhNjEw
NzY2M2Y0ZDUyNGMyNjZjM2ExODI2NGM0MTZhODZhNGJiNApBdXRob3I6IENoZW4tWXUgVHNhaSA8
d2Vuc3RAY2hyb21pdW0ub3JnPgoKZHQtYmluZGluZ3M6IHVzYjogaGNkOiBBZGQgZG93bnN0cmVh
bSBVU0IgcG9ydHMKClRoaXMgY29tbWl0IGFkZHMgYSAicG9ydHMiIGNoaWxkIG5vZGUgdG8gdGhl
IFVTQiBIQ0QgYmluZGluZyB0byBzdXBwb3J0CmNvbm5lY3RpbmcgZG93bnN0cmVhbSBVU0IgY29u
bmVjdG9yIG5vZGVzIHZpYSBPRiBncmFwaC4gSXQgYXR0ZW1wdHMgdG8gZW5mb3JjZQp0aGF0IFVT
QiBkb3duc3RyZWFtIHBvcnQgbnVtYmVycyBzdGFydCBhdCAxLCBhbmQgdXBkYXRlcyB0aGUgYWRk
cmVzcyBtYXRjaGluZwpmb3IgaGFyZC13aXJlZCBkb3duc3RyZWFtIGRldmljZXMuCgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi1oY2QueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLWhjZC55YW1sCj4g
aW5kZXggNDVhMTlkNDkyOGFmYS4uMjRkZjk5ZGZiMjQzYyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYi1oY2QueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLWhjZC55YW1sCj4gQEAgLTI5LDgg
KzI5LDE2IEBAIHByb3BlcnRpZXM6Cj4gICAgIiNzaXplLWNlbGxzIjoKPiAgICAgIGNvbnN0OiAw
Cj4gIAo+ICsgIHBvcnRzOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVy
dGllcy9wb3J0cwo+ICsgICAgZGVzY3JpcHRpb246IFRoZSBkb3duc3RyZWFtIGZhY2luZyBVU0Ig
cG9ydHMKPiArCj4gKyAgICBwYXR0ZXJuUHJvcGVydGllczoKPiArICAgICAgIl5wb3J0QFsxLTlh
LWZdWzAtOWEtZl0/JCI6Cj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIGxvY2FsIGNvbnN0cmFp
bnQgYWN0dWFsbHkgcHJldmVudCBwb3J0QDAgZnJvbSBwYXNzaW5nIHZhbGlkYXRpb24/CgpTaW5j
ZSBKU09OIHNjaGVtYSBwYXR0ZXJuUHJvcGVydGllcyBvbmx5IHJlc3RyaWN0IG1hdGNoaW5nIG5v
ZGVzLCBhCm5vbi1tYXRjaGluZyBub2RlIGxpa2UgcG9ydEAwIHdpbGwgZmFsbCBiYWNrIHRvIHRo
ZSBnZW5lcmljIGdyYXBoLnlhbWwKcmVmZXJlbmNlLgoKQmVjYXVzZSBncmFwaC55YW1sIGV2YWx1
YXRlcyBhbnl0aGluZyBtYXRjaGluZyBecG9ydChALiopPyQsIHdvdWxkbid0CnBvcnRAMCBiZSBl
dmFsdWF0ZWQgYXMgdmFsaWQgYW5kIHNpbGVudGx5IHBhc3MsIGNvbXBsZXRlbHkgYnlwYXNzaW5n
IHRoZQppbnRlbnQgdGhhdCBkb3duc3RyZWFtIHBvcnQgbnVtYmVycyBzdGFydCBhdCAxPwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTAxNDA4MjAzNy4xNzc0NjcyLTEtd2Vuc3RAY2hyb21pdW0ub3JnP3BhcnQ9MQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
