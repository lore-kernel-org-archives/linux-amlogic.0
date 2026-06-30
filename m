Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45898C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 02:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0BghgMXj6Ei15pEfjQC52YKm8TLB/NDD0IlxjfB9Lc=; b=Z+hm8LAr/RyPF0
	ssY/+YPIhXIF53d+AdBHqBgJCoZ3g3MAxuL8QYo9ltU3KfWz5JPt80wMxaygVihId3UVWnAikf5Qu
	eX2dimwvVM0oX+lsOnhP/PD93HBoPIMQavFtG5SLxQXh10AXsuQix9D1A4D/ay9GXMRniQFfWmVwY
	sELhmBx1skGQQHlobGEI6Sg7YgKSDqYHgSvr2UkrknuLa8ogl1yD0TqB/jNp5/v7Fy3J+jZ5tBxQv
	1qYSMq04PNYPKLQF8Tap0uTkpTSKt9shJq2z/v1nQ1huzkT9jarZ5aqvQcKYCNM2ad+w95Xsfgkfm
	HEZv6xLUkd6quqW/Q4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOXH-0000000FjCq-1LVi;
	Tue, 30 Jun 2026 02:49:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOXG-0000000FjCi-0Sc4
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 02:49:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FDD6600BB;
	Tue, 30 Jun 2026 02:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9971F000E9;
	Tue, 30 Jun 2026 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782787756;
	bh=5YS2XUlEvVcUkPDZiWjVK7gB7qY2+dJUTkoUV+Xa4Eo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnOhJoWviXP3xnZJBXengjeS0jAK6Q7X718Hx7gXvN5h26vQOtvX5ZIx6kHSHECON
	 OsFjZTdQ6ONbdMv/OVAjOxLf5mgKttlx6pQa+HFYXjkTGl6VLnb99x17TS2JZlROYm
	 CYYqrteIGTTzSgttIW1oCYjusnMDkGaxYxBtah2nnpDEj7ZVAFbFNJHOhLy4NE8yA8
	 7pNG/8HcWYOJX9y+xyQN42a8UNifN4Qj2XRfYR/LMKKugoy/TdAsFx2Ohuij0NrwJF
	 PbOxrYR8HHlBzctO1jsF+k4j1A9DxSYRQlqOWaR5zOW9DAPHMNNEUDDawKhEZMn3qQ
	 FfZSY6oeT0Znw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260630-a9_peripherals-v5-2-bc4019730354@amlogic.com>
References: <20260630-a9_peripherals-v5-0-bc4019730354@amlogic.com>
 <20260630-a9_peripherals-v5-2-bc4019730354@amlogic.com>
Date: Tue, 30 Jun 2026 02:49:16 +0000
Message-Id: <20260630024916.7C9971F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIEtjb25maWcg
c3ltYm9sIENPTU1PTl9DTEtfQTlfUEVSSVBIRVJBTFMgaW1wbGllcyB0aGUgbm9uLWV4aXN0ZW50
IHN5bWJvbCBDT01NT05fQ0xLX0E5X1BMTC4KLS0KCmNvbW1pdCA0YWM3MDUxOTRjNDRlNTJlNTBi
ZTY5NmQ1NDljZDY3ZmNmZTU4MDQyCkF1dGhvcjogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNv
bT4KCmNsazogYW1sb2dpYzogQWRkIEE5IHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgZHJp
dmVyCgpUaGlzIGNvbW1pdCBhZGRzIHRoZSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIGRy
aXZlciBmb3IgdGhlIEFtbG9naWMKQTkgU29DIGZhbWlseS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL21lc29uL0tjb25maWcgYi9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4gLS0tIGEv
ZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL0tjb25m
aWcKPiBAQCAtMTMyLDYgKzEzMiwyMSBAQCBjb25maWcgQ09NTU9OX0NMS19BMV9QRVJJUEhFUkFM
Uwo+ICAJICBkZXZpY2UsIEExIFNvQyBGYW1pbHkuIFNheSBZIGlmIHlvdSB3YW50IEExIFBlcmlw
aGVyYWxzIGNsb2NrCj4gIAkgIGNvbnRyb2xsZXIgdG8gd29yay4KPiAgCj4gK2NvbmZpZyBDT01N
T05fQ0xLX0E5X1BFUklQSEVSQUxTCj4gKwl0cmlzdGF0ZSAiQW1sb2dpYyBBOSBTb0MgcGVyaXBo
ZXJhbHMgY2xvY2sgY29udHJvbGxlciBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBBUk02NCB8fCBD
T01QSUxFX1RFU1QKPiArCWRlZmF1bHQgQVJDSF9NRVNPTgo+ICsJc2VsZWN0IENPTU1PTl9DTEtf
TUVTT05fUkVHTUFQCj4gKwlzZWxlY3QgQ09NTU9OX0NMS19NRVNPTl9DTEtDX1VUSUxTCj4gKwlz
ZWxlY3QgQ09NTU9OX0NMS19NRVNPTl9EVUFMRElWCj4gKwlzZWxlY3QgQ09NTU9OX0NMS19NRVNP
Tl9WSURfUExMX0RJVgo+ICsJaW1wbHkgQ09NTU9OX0NMS19TQ01JCj4gKwlpbXBseSBDT01NT05f
Q0xLX0E5X1BMTAoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhlIGNvbmZpZyBzeW1ib2wgQ09N
TU9OX0NMS19BOV9QTEwgZXhpc3QgaW4gdGhlIGtlcm5lbCB0cmVlPyAKUmVmZXJlbmNpbmcgYSBu
b24tZXhpc3RlbnQgc3ltYm9sIGluIGFuIGltcGx5IHN0YXRlbWVudCB3aWxsIHNpbGVudGx5IGZh
aWwKdG8gcHVsbCBpbiB0aGUgZXhwZWN0ZWQgZGVwZW5kZW5jeSBkdXJpbmcgY29uZmlndXJhdGlv
bi4gSXMgaXQgcG9zc2libGUgdGhpcwpjb25maWcgd2FzIG1pc3NpbmcgZnJvbSB0aGUgcGF0Y2gg
c2VyaWVzLCBvciBpcyB0aGlzIGEgdHlwbz8KCj4gKwloZWxwCj4gKwkgIFN1cHBvcnQgZm9yIHRo
ZSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIG9uIEFtbG9naWMgQTMxMVkzIGJhc2VkCj4g
KwkgIGRldmljZSwgQUtBIEE5LiBQZXJpcGhlcmFscyBhcmUgcmVxdWlyZWQgYnkgbW9zdCBwZXJp
cGhlcmFsIHRvIG9wZXJhdGUuCj4gKwkgIFNheSBZIGlmIHlvdSB3YW50IEE5IHBlcmlwaGVyYWxz
IGNsb2NrIGNvbnRyb2xsZXIgdG8gd29yay4KPiArCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjMwLWE5X3BlcmlwaGVyYWxzLXY1
LTAtYmM0MDE5NzMwMzU0QGFtbG9naWMuY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
