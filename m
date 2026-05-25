Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C38CCD5BD0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/NjRmi4Pzg+S4fgMN/idzmIxo8cUkJqCAbAwCxCvo4=; b=F/WUB6TGTq1jNJ
	isyNvlgbcPu7q9FjRHnp15kb4dc8wNvhaHpBucHQ/k3DaECwUBiXUlLLJFe8pLwWP6HN+FbXVp5VI
	2/XXNtHZEHM6eIIVjR1whu17kD72pHh6YlqMSHyqXzvSy1+q26SLMM062yRAly4KXgscPkFOJ58iJ
	K2cOFD9zVvUYq207F7YBExlYjf4sIEES19YKnapRdvLe31cm8vjNrn8lFKBibf2i3tz//1TW5KTi7
	UNqiHWIm8HSwSkV/YeXSG60BEJ6UFZXFmmvqwaWtgTqrapi9wH9vunGXe5AlFBLmUsyddeel3V9D0
	m3vnFL1vfA+J5xnOb5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSXG-0000000Gwot-3paj;
	Mon, 25 May 2026 10:27:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSXD-0000000GwoP-3Cao
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 10:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FD8A42B8B;
	Mon, 25 May 2026 10:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58861F00A3D;
	Mon, 25 May 2026 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704867;
	bh=/QngGngt6AT00cPlA7mJ99flmrzgOYVv15j5GdToFTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oi/VpDUuwiS4MW/m+YZoLvXVHhIoYC/1bXSjHWSbd0FdqjsQB+TBU/OJKeL470kEV
	 fV7VUQs2aQr3TasioE07HVL6C3weX5W0tuQ852fnXBjCMFjartStXTjFVz7QIpWS+4
	 0AbrMXAjGrPZpz0rLUNoEhGYhNbAaK3FODFyhI5KydtroeJv0v9BkBlFI0j6WLA2yP
	 zqG/MQgzQBxa63MvkEH97LHZgywNfY/h5UzU2keoDOHv1lgsL5Jg4Iy9c8wIJxYXi7
	 nNiz776OpiZX/yUX3KHoa5osJrhgWX+kxchg3zctfzOYzWYRiUSYxzeLEnZQPdg7l/
	 p3NDNZOsmkdvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error
 path of vdec_open
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260525095216.12078-2-linux.amoon@gmail.com>
References: <20260525095216.12078-2-linux.amoon@gmail.com>
Date: Mon, 25 May 2026 10:27:46 +0000
Message-Id: <20260525102746.B58861F00A3D@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_032747_823717_613B6AB4 
X-CRM114-Status: GOOD (  10.22  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtDcml0aWNhbF0gQWxsb2NhdGluZyBhbmQgZGVzdHJveWluZyBhIFY0TDIgbTJtX2RldiBvbiBl
dmVyeSBzZXNzaW9uIG9wZW4vY2xvc2UgY2F1c2VzIGEgVXNlLUFmdGVyLUZyZWUgd2l0aGluIHRo
ZSBWNEwyIE0yTSBjb3JlLgotIFtIaWdoXSBUaGUgaGFyZHdhcmUgaW50ZXJydXB0IGhhbmRsZXIg
dmRlY19pc3IoKSBkZXJlZmVyZW5jZXMgY29yZS0+Y3VyX3Nlc3Mgd2l0aG91dCBjaGVja2luZyBp
ZiBpdCBpcyBOVUxMLgotLQoKY29tbWl0IGJkZTY4NzA2ZmE2MzJlZmZhODc2YzMwY2VmMzNiMzUy
OGNkOTE3ZGEKQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+CgptZWRp
YTogbWVzb246IHZkZWM6IEZpeCBtZW1vcnkgbGVhayBpbiBlcnJvciBwYXRoIG9mIHZkZWNfb3Bl
bgoKVGhpcyBjb21taXQgaW50cm9kdWNlcyBhbiBlcnJfbTJtX2N0eF9yZWxlYXNlIGxhYmVsIGlu
IHZkZWNfb3BlbigpIHRvCnByZXZlbnQgYSByZXNvdXJjZSBsZWFrIHdoZW4gdmRlY19pbml0X2N0
cmxzKCkgZmFpbHMuIEl0IGFsc28gZnJlZXMgdGhlCnY0bDIgY29udHJvbCBoYW5kbGVyIG1lbW9y
eSBpbiB2ZGVjX2Nsb3NlKCkuCgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDUyMDA0NTkwNS42QUNCQTFGMDAwRTlAc210cC5rZXJuZWwub3JnLyN0Cgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMgYi9kcml2ZXJzL3N0
YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBpbmRleCA0Yjc3ZWMxYWY1YTc2Li4xOGEy
MmI3OWU4MzVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVj
L3ZkZWMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwpb
IC4uLiBdCj4gQEAgLTkxMyw2ICs5MTMsOCBAQCBzdGF0aWMgaW50IHZkZWNfb3BlbihzdHJ1Y3Qg
ZmlsZSAqZmlsZSkKPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4gK2Vycl9tMm1fY3R4X3JlbGVhc2U6
Cj4gKwl2NGwyX20ybV9jdHhfcmVsZWFzZShzZXNzLT5tMm1fY3R4KTsKPiAgZXJyX20ybV9yZWxl
YXNlOgo+ICAJdjRsMl9tMm1fcmVsZWFzZShzZXNzLT5tMm1fZGV2KTsKCltTZXZlcml0eTogQ3Jp
dGljYWxdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIGFsbG9jYXRpbmcg
YW5kIGRlc3Ryb3lpbmcgdGhlIG0ybV9kZXYKb24gZXZlcnkgc2Vzc2lvbiBvcGVuIGFuZCBjbG9z
ZSBjYXVzZSBhIHVzZS1hZnRlci1mcmVlPwoKU2luY2UgdGhlIHY0bDIgbTJtIGNvcmUgc2NoZWR1
bGVzIGpvYnMgdmlhIGEgd29yayBzdHJ1Y3QsIGlmIGEgam9iIGlzCnNjaGVkdWxlZCBqdXN0IGJl
Zm9yZSB0aGUgZmlsZSBkZXNjcmlwdG9yIGlzIGNsb3NlZDoKCnZkZWNfY2xvc2UoKQogICAgdjRs
Ml9tMm1fcmVsZWFzZShzZXNzLT5tMm1fZGV2KTsKICAgICAgICBrZnJlZShtMm1fZGV2KTsKCkNv
dWxkIHRoZSBzeXN0ZW0gd29ya2VyIGxhdGVyIGV4ZWN1dGUgdjRsMl9tMm1fZGV2aWNlX3J1bl93
b3JrKCkgb24gdGhlCmZyZWVkIG0ybV9kZXYsIGFzIHBlbmRpbmcgYmFja2dyb3VuZCB3b3JrIGlz
bid0IGNhbmNlbGxlZCBkdXJpbmcgcmVsZWFzZT8KClNob3VsZCBtMm1fZGV2IGJlIGFsbG9jYXRl
ZCBnbG9iYWxseSBvbmNlIGluIHByb2JlKCkgaW5zdGVhZD8KClsgLi4uIF0KCltTZXZlcml0eTog
SGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGxvb2tpbmcgYXQgdmRlY19p
c3IoKSwgc2VzcyBpcyBpbml0aWFsaXplZApmcm9tIGNvcmUtPmN1cl9zZXNzIGFuZCBpbW1lZGlh
dGVseSBkZXJlZmVyZW5jZWQ6Cgp2ZGVjX2lzcigpCiAgICBzZXNzID0gY29yZS0+Y3VyX3Nlc3M7
CiAgICBzZXNzLT5sYXN0X2lycV9qaWZmaWVzID0gZ2V0X2ppZmZpZXNfNjQoKTsKCklmIGEgc3B1
cmlvdXMgaW50ZXJydXB0IGZpcmVzIHdoaWxlIHRoZSBkZXZpY2UgaXMgaWRsZSBvciBpbW1lZGlh
dGVseSBhZnRlcgpzdHJlYW1pbmcgc3RvcHMsIGNvdWxkIGNvcmUtPmN1cl9zZXNzIGJlIE5VTEwg
aGVyZT8KClNob3VsZCB0aGVyZSBiZSBhIGNoZWNrIGJlZm9yZSBkZXJlZmVyZW5jaW5nIHNlc3M/
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNTI1MDk1MjE2LjEyMDc4LTEtbGludXguYW1vb25AZ21haWwuY29tP3BhcnQ9MQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
