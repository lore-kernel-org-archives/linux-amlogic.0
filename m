Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB8CD5BB0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeGvCkoNFgNCU+FthqZRRjZ3IvrJhlQAK6tQu1xDpGo=; b=hP6aBMKoUU8WxS
	PlYJ6i0XXL2bJzD1s08anAHjZSDYwVQz2mJ9Hm/S2EaD6ImaOQGEWwrljNdg4K8GsDmEhBxddY+uz
	oYIeFCmaMeczcrAV+ZDDGZtaPGjCV7VcoTE1QBojJZjQ1Tix2RRXVPPdeFQsmUp0WeZDsyu4QZ35A
	Ms+1G4YNlRagQ5TfmNvo6i8Ckkp2MU/bCh4KJpZ2e2RKtGroJqOYLU/NiUzzuuI0n2t9yHJh03JJk
	BBaGRRyEdkKbqiLztPrezkhtUZDYZPdXFvzHBmghKRSdj39wfulwVAGQpayLs9rg1A/yJA5qXksia
	RyYEEBwpin2XmgMvfFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyTa-000000074PL-0JZ4;
	Thu, 21 May 2026 08:09:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyTB-000000073p7-0LxL
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 08:09:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6050841933;
	Thu, 21 May 2026 08:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A3E1F000E9;
	Thu, 21 May 2026 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779350968;
	bh=QgEaQ26j8tM5SOhGl/YMDJSdQPuTGGZj0DJC910mg8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WWUxoGb2QhwDjE4xE0ZrSEcKIyL+YbfO8OTsyyRoRvowT9FOmtupdMihB3ZIRGVIo
	 1lgkhgCWnqxJyycAIhwUqeVGIG5a2Xno90FFwclw/PmfPSl6nIdnRhVbaIZEo8WEgB
	 z6NE6iogPAxjf5CZGSSKCtrkfGvQhgJsY81in1sHU+R0o5VCyix9SG4nApRcinWS6H
	 fUVk2flYC3BYGa92rexibFDC7ciVaBtEhiX9j8ptPQqzlAjKqYNobR0zxAbJkP5dRY
	 PvEH+gIfhGpgeF40HQtMMxiY+3A2MGs1Gc6Tc3e60M27cxPQdOE3W8/FOOCELTkczo
	 l8wCS76/yxMpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error
 path of vdec_open
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260521073449.10057-2-linux.amoon@gmail.com>
References: <20260521073449.10057-2-linux.amoon@gmail.com>
Date: Thu, 21 May 2026 08:09:27 +0000
Message-Id: <20260521080928.26A3E1F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_010929_153872_2658C428 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEluY29ycmVjdCB0ZWFy
ZG93biBvcmRlciBpbiBgdmRlY19jbG9zZSgpYCBjYXVzZXMgdXNlLWFmdGVyLWRlc3Ryb3kgb2Yg
dGhlIFY0TDIgY29udHJvbCBoYW5kbGVyJ3MgbXV0ZXguCi0tCgpjb21taXQgODJlOTE2NzcxYTc3
OWIwMjUwMGY5N2Q1OGUzNDRiYjkzY2E4ZTljYQpBdXRob3I6IEFuYW5kIE1vb24gPGxpbnV4LmFt
b29uQGdtYWlsLmNvbT4KCm1lZGlhOiBtZXNvbjogdmRlYzogRml4IG1lbW9yeSBsZWFrIGluIGVy
cm9yIHBhdGggb2YgdmRlY19vcGVuCgpUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgcHJvcGVyIGVy
cl9tMm1fY3R4X3JlbGVhc2UgbGFiZWwgaW4gdGhlIGVycm9yIHBhdGgKb2YgdmRlY19vcGVuKCkg
dG8gZW5zdXJlIHRoZSBtMm0gY29udGV4dCBpcyByZWxlYXNlZCBiZWZvcmUgcmVsZWFzaW5nIHRo
ZSBtMm0KZGV2aWNlLiBJdCBhbHNvIGF0dGVtcHRzIHRvIGZyZWUgdGhlIFY0TDIgY29udHJvbCBo
YW5kbGVyIG1lbW9yeSBpbgp2ZGVjX2Nsb3NlKCkgdG8gZml4IGEgcmVzb3VyY2UgbGVhay4KCkNs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTIwMDQ1OTA1LjZBQ0JBMUYw
MDBFOUBzbXRwLmtlcm5lbC5vcmcvI3QKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVj
L3ZkZWMuYwo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+
ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwoKWyAuLi4gXQoK
PiBAQCAtOTI2LDYgKzkyOCw3IEBAIHN0YXRpYyBpbnQgdmRlY19jbG9zZShzdHJ1Y3QgZmlsZSAq
ZmlsZSkKPiAgCj4gIAl2NGwyX20ybV9jdHhfcmVsZWFzZShzZXNzLT5tMm1fY3R4KTsKPiAgCXY0
bDJfbTJtX3JlbGVhc2Uoc2Vzcy0+bTJtX2Rldik7Cj4gKwl2NGwyX2N0cmxfaGFuZGxlcl9mcmVl
KCZzZXNzLT5jdHJsX2hhbmRsZXIpOwoKW1NldmVyaXR5OiBIaWdoXQpDb3VsZCB0aGlzIHNwZWNp
ZmljIG9yZGVyaW5nIGNhdXNlIGEgdXNlLWFmdGVyLWRlc3Ryb3kgb2YgdGhlIFY0TDIgY29udHJv
bApoYW5kbGVyJ3MgbXV0ZXg/CgpJZiBhbiBhcHBsaWNhdGlvbiBoYXMgc3Vic2NyaWJlZCB0byBh
IFY0TDIgY29udHJvbCBldmVudCwgdjRsMl9maF9leGl0KCkKdW5jb25kaXRpb25hbGx5IGNhbGxz
IHY0bDJfZXZlbnRfdW5zdWJzY3JpYmVfYWxsKCkuIFRoaXMgdW5zdWJzY3JpYmUgbG9naWMKZXZl
bnR1YWxseSBpbnZva2VzIHY0bDJfY3RybF9kZWxfZXZlbnQoKSwgd2hpY2ggYXR0ZW1wdHMgdG8g
bG9jayB0aGUKY29udHJvbCBoYW5kbGVyJ3MgbXV0ZXguCgpTaW5jZSB2NGwyX2N0cmxfaGFuZGxl
cl9mcmVlKCkgZGVzdHJveXMgdGhlIG11dGV4OgoKdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgpCiAg
ICBtdXRleF9kZXN0cm95KCZoZGwtPl9sb2NrKTsKCkNhbGxpbmcgaXQgYmVmb3JlIHY0bDJfZmhf
ZXhpdCgpIGNvdWxkIGxlYWQgdG8gb3BlcmF0aW5nIG9uIGEgZGVzdHJveWVkIG11dGV4CmFuZCBw
b3RlbnRpYWxseSBjYXVzZSBhIGtlcm5lbCBwYW5pYyBpZiBtdXRleCBkZWJ1Z2dpbmcgaXMgZW5h
YmxlZC4KClNob3VsZCB2NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCkgYmUgY2FsbGVkIGFmdGVyIHY0
bDJfZmhfZGVsKCkgYW5kCnY0bDJfZmhfZXhpdCgpIGluc3RlYWQ/Cgo+ICAJdjRsMl9maF9kZWwo
JnNlc3MtPmZoLCBmaWxlKTsKPiAgCXY0bDJfZmhfZXhpdCgmc2Vzcy0+ZmgpOwo+CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTIx
MDczNDQ5LjEwMDU3LTEtbGludXguYW1vb25AZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
