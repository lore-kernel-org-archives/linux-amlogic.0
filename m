Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3880BCD5BD0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 11:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4I+UFZEHSuVky1Hbw/duobhbvzVWZrvO9bKYm1M6QQ=; b=MrAOSWp7dVqi4/
	L6iyFlerpeGAJCgjMHLbABcwS0M4ZPTPuApK0ku+w0fIzpuERBltVl6hDl1qTgjgchNwAyh4glk+K
	XY4voqTmTkrtEEw0fUqBy71pDdizdYdDeSfebmJbGpQDsB3204vh9RuPofqqRf3uOs+CQAlnNSz0Q
	n+3Adi+tGUUFJ1WQCM2TQdR0a514H2XNUOf29OQvSBUnICJ4Nv0ih9BJKlunVGGYPkg/8LAT8h15z
	BK9ODO3jDwfBcGHEieqrzWQjQeyYFoApGSO4i1awgq5ZYZPMWyVjqNjBEaUvBSqCIh3gi3xVSmOwQ
	56WEWRiNjfYYaEf0571g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHaE-00000008fXu-3AWz;
	Sat, 30 May 2026 11:10:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHaB-00000008fXV-4Bc4
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 11:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C6D940194;
	Sat, 30 May 2026 11:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D71F00893;
	Sat, 30 May 2026 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780139423;
	bh=cRidFqpaHYJwIgtkoGwGJAGfQh466yyG3vrix1ctLvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3YU0GSJ3vEJvpjuF5qE+6zz37Ya7Iow9ybJp/xzhEmwl9kfzFYOf31VH4x+/IBoU
	 LCyEjPNSAbr76mYhj0JD2sXlb3dCj6HGrvUMuJaXwleK8NZ3UfThPxbwswAaafWV9K
	 xAtBCf/ZyajOpXzjbD7fA8pqUsOWy9b0apnb79FplU0XnAXkcSsCOAxT3ASat7NhYk
	 6PsDOE7iV/TIBKkBCusupxNMht7LI4dboY9BnLJXsTpGAdIlHH5jGtY4Z8a8teMSmO
	 DGLD2yY6ZgyCR3PSz4Xtm2YbVlV9RKfieGaFmdXVMeGAW/5lpxIscdMLQhQPyE/n0p
	 9ywOSZnbbsmZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and
 segment size in probe
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-media@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-7-linux.amoon@gmail.com>
References: <20260530094326.11892-7-linux.amoon@gmail.com>
Date: Sat, 30 May 2026 11:10:22 +0000
Message-Id: <20260530111022.9C6D71F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_041024_114017_24F37B86 
X-CRM114-Status: GOOD (  16.41  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtDcml0aWNh
bF0gQXBwbHlpbmcgYSA2NC1iaXQgRE1BIG1hc2sgY2F1c2VzIHNpbGVudCBwaHlzaWNhbCBhZGRy
ZXNzIHRydW5jYXRpb24gYW5kIG1lbW9yeSBjb3JydXB0aW9uLCBhcyB0aGUgaGFyZHdhcmUgYW5k
IGRyaXZlciBvbmx5IHN1cHBvcnQgMzItYml0IGFkZHJlc3Nlcy4KClByZS1leGlzdGluZyBpc3N1
ZXM6Ci0gW0hpZ2hdIFRoZSB2ZGVjIGRyaXZlciBzdG9yZXMgYSByYXcgcG9pbnRlciB0byB0aGUg
YG1lc29uX2NhbnZhc2AgZGV2aWNlIHdpdGhvdXQgbGlua2luZyB0aGUgZGV2aWNlcyBvciBob2xk
aW5nIGEgcmVmZXJlbmNlLCBsZWFkaW5nIHRvIGEgVXNlLUFmdGVyLUZyZWUgaWYgdGhlIGNhbnZh
cyBwcm92aWRlciB1bmJpbmRzLgotLQoKY29tbWl0IDg5NWVmNDUzZDljNzVkZjA0ZmQ0MDM2NzEw
MmY4ZWFmY2U3NmUwMTMKQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+
CgptZWRpYTogbWVzb246IHZkZWM6IENvbmZpZ3VyZSBETUEgbWFzayBhbmQgc2VnbWVudCBzaXpl
IGluIHByb2JlCgpUaGUgdmRlYyBwcm9iZSByb3V0aW5lIGRpZCBub3Qgc2V0IGV4cGxpY2l0IERN
QSBjb25zdHJhaW50cywgbGVhdmluZyB0aGUKZHJpdmVyIGRlcGVuZGVudCBvbiBwbGF0Zm9ybSBk
ZWZhdWx0cy4gVGhpcyBjb3VsZCBjYXVzZSBhbGxvY2F0aW9uIGZhaWx1cmVzCm9yIGZyYWdtZW50
ZWQgYnVmZmVyIGhhbmRsaW5nIG9uIHN5c3RlbXMgd2l0aCBzdHJpY3RlciBETUEgbGltaXRzLiBU
aGlzCmNoYW5nZSBjb25maWd1cmVzIGEgNjQtYml0IERNQSBtYXNrIGFuZCBzZXRzIHRoZSBtYXhp
bXVtIGNvbnRpZ3VvdXMgc2VnbWVudApzaXplIHRvIFVJTlRfTUFYLgoKQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MjEwOTA5NDQuRjM1NDAxRjAwQTNEQHNtdHAua2Vy
bmVsLm9yZy8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVj
L3ZkZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+IGluZGV4
IDQ4ODRlZTA0YjM1MjkuLmY5OTMzNWVmZmUxNzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlh
L21lc29uL3ZkZWMvdmRlYy5jCj4gQEAgLTEwNjQsNiArMTA2NCwxNSBAQCBzdGF0aWMgaW50IHZk
ZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChJU19FUlIoY29y
ZS0+Y2FudmFzKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihjb3JlLT5jYW52YXMpOwoKW1NldmVyaXR5
OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNh
biB3ZSBleHBlcmllbmNlIGEKdXNlLWFmdGVyLWZyZWUgaGVyZSBpZiB0aGUgY2FudmFzIHByb3Zp
ZGVyIHVuYmluZHM/CgpMb29raW5nIGF0IG1lc29uX2NhbnZhc19nZXQoKSwgdGhlIHJlZmVyZW5j
ZSB0byB0aGUgcHJvdmlkZXIgZGV2aWNlIGlzCmRyb3BwZWQgaW1tZWRpYXRlbHkgYmVmb3JlIHJl
dHVybmluZyB0aGUgaW50ZXJuYWwgY2FudmFzIHBvaW50ZXI6Cgpkcml2ZXJzL3NvYy9hbWxvZ2lj
L21lc29uLWNhbnZhcy5jOm1lc29uX2NhbnZhc19nZXQoKSB7CiAgICAuLi4KICAgIHB1dF9kZXZp
Y2UoJmNhbnZhc19wZGV2LT5kZXYpOwogICAgcmV0dXJuIGNhbnZhczsKfQoKU2luY2UgdGhlIHZk
ZWMgZHJpdmVyIHN0b3JlcyB0aGlzIHBvaW50ZXIgaW4gY29yZS0+Y2FudmFzIGJ1dCBkb2VzIG5v
dAplc3RhYmxpc2ggYSBkZXZpY2UgbGluayBvciBob2xkIGEgbW9kdWxlIHJlZmVyZW5jZSwgd2hh
dCBwcmV2ZW50cyB0aGUKY2FudmFzIG1lbW9yeSBmcm9tIGJlaW5nIGZyZWVkIGJ5IGRldnJlcyB3
aGlsZSB0aGUgdmRlYyBkcml2ZXIgaXMgc3RpbGwKdXNpbmcgaXQ/Cgo+ICAKPiArCXJldCA9IGRt
YV9zZXRfbWFza19hbmRfY29oZXJlbnQoZGV2LCBETUFfQklUX01BU0soNjQpKTsKCltTZXZlcml0
eTogQ3JpdGljYWxdCldpbGwgc2V0dGluZyBhIDY0LWJpdCBETUEgbWFzayBjYXVzZSBzaWxlbnQg
cGh5c2ljYWwgYWRkcmVzcyB0cnVuY2F0aW9uPwoKVGhlIE1lc29uIFZERUMgaGFyZHdhcmUgbmF0
aXZlbHkgdXNlcyAzMi1iaXQgcmVnaXN0ZXJzIGZvciBETUEgYWRkcmVzc2VzLAphbmQgdGhlIGRy
aXZlcidzIGhlbHBlciBmdW5jdGlvbnMgc3RyaWN0bHkgYWNjZXB0IDMyLWJpdCB2YWx1ZXM6Cgpk
cml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjX2hlbHBlcnMuaDoKdm9pZCBhbXZk
ZWNfd3JpdGVfZG9zKHN0cnVjdCBhbXZkZWNfY29yZSAqY29yZSwgdTMyIHJlZywgdTMyIHZhbCk7
CgpJZiB0aGUgRE1BIEFQSSBhbGxvY2F0ZXMgbWVtb3J5IGJ1ZmZlcnMgYXQgcGh5c2ljYWwgYWRk
cmVzc2VzIGFib3ZlIDRHQiwKdGhlaXIgNjQtYml0IGFkZHJlc3NlcyB3aWxsIGJlIGltcGxpY2l0
bHkgdHJ1bmNhdGVkIHRvIDMyIGJpdHMgd2hlbiBwYXNzZWQKdG8gdGhlIGhhcmR3YXJlIHJlZ2lz
dGVycy4KCkNhbiB0aGlzIGxlYWQgdG8gdGhlIGhhcmR3YXJlIHJlYWRpbmcgb3Igd3JpdGluZyB0
byBpbmNvcnJlY3QgcGh5c2ljYWwKbWVtb3J5IGxvY2F0aW9ucyBpbiB0aGUgbG93ZXIgNEdCPwoK
PiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQg
dG8gc2V0IERNQSBtYXNrXG4iKTsKPiArCj4gKwlyZXQgPSB2YjJfZG1hX2NvbnRpZ19zZXRfbWF4
X3NlZ19zaXplKGRldiwgVUlOVF9NQVgpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwKPiArCQkJCSAgICAgIkZhaWxlZCB0byBzZXQgRE1BIG1heCBzZWdt
ZW50IHNpemVcbiIpOwo+ICsKPiAgCW9mX2lkID0gb2ZfbWF0Y2hfbm9kZSh2ZGVjX2R0X21hdGNo
LCBkZXYtPm9mX25vZGUpOwo+ICAJY29yZS0+cGxhdGZvcm0gPSBvZl9pZC0+ZGF0YTsKCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1
MzAwOTQzMjYuMTE4OTItMS1saW51eC5hbW9vbkBnbWFpbC5jb20/cGFydD02CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
