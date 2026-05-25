Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D76CD5BB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g57/mNqte+IznHjuT10kh8uCuQqH8PoU6yHf1MHJHLE=; b=1WMgFuX5X/+yQF
	s8GxyOLlakweU7H1SDRHQN7WVetP4PEQCEZUVSZS/JqaJ3B3JVu7H4GOhfTCN31yUyHVdNvn+d6zZ
	rkVhlVWtlmd55pXTX4NvyJ5C9bHNEqwsbqCFrWGaDWd9iJdNB5BmUgkjqRARQdjptK2QiBKbMZGv0
	IPGaFOBFkDeZ3sOPK0Ud4cZCNlw4dvvc6JdD+saHZPdFwEz69kRupCnNm/pYD8f0EitPWdQT5iQWA
	OXWuNzC7MNIbNuXzNdP/z1sTb4EWhnKOvAKAGNkMoiE762eWVclGrRho8umacR6doereO6TFfGS89
	O3bLGOeLiO1UVdVnnyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSmj-0000000Gy6i-0bVz;
	Mon, 25 May 2026 10:43:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSmh-0000000Gy6B-0IFP
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 10:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44F97601F3;
	Mon, 25 May 2026 10:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D501F00A3C;
	Mon, 25 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705826;
	bh=CUgh+bFUYqMszwwFsnn+rQENqi+anVPfCpXExy8NfIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+2Rq7xRFYl0ilSlMB7QTGGVD1uyIkelimhZihGv3YlcZMeE6bDhPVmAzjx/uiQ7F
	 1j8n6g5K6wReR2vLjMeh+cbPW1kIOjusLw8PtqZ9iQSnwRvaPs0ySuHU4/mAoC7vY5
	 9soWGJuRSLDMj7n2tY+h9kLjDCo3MLnZsWSkLmOjbZ/JOtf6sE10MIFkMMdg9LL5Xr
	 DFBJT90XNNy0DA1oUGIaUsl3g9UJkcCxfNPK1iRpQd1oWOS1z4OT7PyBF8+v46K/Sy
	 j5PStXSDl0x399iORYV/5jmSY/L8TYZEYsYbrg/Djte1xf19sFhJ6S4C3dWGebqxFJ
	 izkfnt6Si/ELg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] media: meson: vdec: Protect session exclusivity
 check with lock
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260525095216.12078-3-linux.amoon@gmail.com>
References: <20260525095216.12078-3-linux.amoon@gmail.com>
Date: Mon, 25 May 2026 10:43:45 +0000
Message-Id: <20260525104345.C8D501F00A3C@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBU
aGUgcGF0Y2ggZmFpbHMgdG8gcmVzb2x2ZSB0aGUgY29uY3VycmVudCBTVFJFQU1PTiByYWNlIGNv
bmRpdGlvbiwgbGVhdmluZyBhIFRpbWUtT2YtQ2hlY2sgdG8gVGltZS1PZi1Vc2UgKFRPQ1RPVSkg
dnVsbmVyYWJpbGl0eS4KClByZS1leGlzdGluZyBpc3N1ZXM6Ci0gW0hpZ2hdIFVucHJvdGVjdGVk
IG1vZGlmaWNhdGlvbiBvZiBgY29yZS0+Y3VyX3Nlc3NgIGluIGB2ZGVjX3N0b3Bfc3RyZWFtaW5n
YCBsZWFkcyB0byBhIGRhdGEgcmFjZS4KLSBbSGlnaF0gTWlzc2luZyBOVUxMIGNoZWNrIGZvciBg
Y29yZS0+Y3VyX3Nlc3NgIGluIGludGVycnVwdCBoYW5kbGVycyByaXNrcyBhIGtlcm5lbCBwYW5p
YyBmcm9tIHNwdXJpb3VzIGludGVycnVwdHMuCi0tCgpjb21taXQgN2Y1NWY0NzNmM2U3ZDc1NzIy
ZTM0NjY2NjAzNGJmNTQxNzUyZjJkMwpBdXRob3I6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdt
YWlsLmNvbT4KU3ViamVjdDogbWVkaWE6IG1lc29uOiB2ZGVjOiBQcm90ZWN0IHNlc3Npb24gZXhj
bHVzaXZpdHkgY2hlY2sgd2l0aCBsb2NrCgpUaGlzIGNvbW1pdCBhdHRlbXB0cyB0byBmaXggYSBy
YWNlIGNvbmRpdGlvbiBkdXJpbmcgY29uY3VycmVudCBTVFJFQU1PTiBjYWxscy4KSXQgd3JhcHMg
dGhlIHNlc3Npb24gZXhjbHVzaXZpdHkgY2hlY2sgaW4gdmRlY19zdGFydF9zdHJlYW1pbmcoKSB3
aXRoIGEKbXV0ZXggdG8gcHJldmVudCBtdWx0aXBsZSB0aHJlYWRzIGZyb20gYnlwYXNzaW5nIHRo
ZSBhY3RpdmUgc2Vzc2lvbiBjaGVjawphbmQgY29uY3VycmVudGx5IHRyaWdnZXJpbmcgaGFyZHdh
cmUgaW5pdGlhbGl6YXRpb24uCgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDUyMTA5MDk0NC5GMzU0MDFGMDBBM0RAc210cC5rZXJuZWwub3JnLwoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIGIvZHJpdmVycy9zdGFn
aW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gaW5kZXggMThhMjJiNzllODM1ZS4uZTcyZjU0
YWYwMjZlMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92
ZGVjLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBA
QCAtMjg2LDEwICsyODYsMTMgQEAgc3RhdGljIGludCB2ZGVjX3N0YXJ0X3N0cmVhbWluZyhzdHJ1
Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQpCj4gIAlzdHJ1Y3QgdmIyX3Y0bDJf
YnVmZmVyICpidWY7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCW11dGV4X2xvY2soJmNvcmUtPmxvY2sp
Owo+ICAJaWYgKGNvcmUtPmN1cl9zZXNzICYmIGNvcmUtPmN1cl9zZXNzICE9IHNlc3MpIHsKPiAr
CQltdXRleF91bmxvY2soJmNvcmUtPmxvY2spOwo+ICAJCXJldCA9IC1FQlVTWTsKPiAgCQlnb3Rv
IGJ1ZnNfZG9uZTsKPiAgCX0KPiArCW11dGV4X3VubG9jaygmY29yZS0+bG9jayk7CgpbU2V2ZXJp
dHk6IEhpZ2hdCkRvZXMgdGhpcyBjb21wbGV0ZWx5IHJlc29sdmUgdGhlIGNvbmN1cnJlbnQgU1RS
RUFNT04gcmFjZSBjb25kaXRpb24/CgpXaGlsZSB0aGUgbG9jayBwcm90ZWN0cyB0aGUgY2hlY2sg
aXRzZWxmLCBpdCBpcyByZWxlYXNlZCBpbW1lZGlhdGVseQphZnRlcndhcmQuIFRoaXMgbGVhdmVz
IGEgd2luZG93IHdoZXJlIHR3byB0aHJlYWRzIGNvdWxkIHNlcXVlbnRpYWxseSBhY3F1aXJlCnRo
ZSBsb2NrLCBvYnNlcnZlIGNvcmUtPmN1cl9zZXNzIGFzIE5VTEwsIGFuZCB0aGVuIGNvbmN1cnJl
bnRseSBwcm9jZWVkCndpdGggaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gaW4gdmRlY19wb3dlcm9u
KCkuCgpBIGxhdGVyIHBhdGNoIGluIHRoZSBzZXJpZXMgd3JhcHMgdGhlIGV2ZW50dWFsIGNvcmUt
PmN1cl9zZXNzID0gc2Vzcwphc3NpZ25tZW50IGluIHRoZSBsb2NrLCBidXQgZG9lcyB0aGF0IHN0
aWxsIGxlYXZlIGFuIHVucHJvdGVjdGVkIGdhcCBiZXR3ZWVuCnRoaXMgY2hlY2sgYW5kIHRoZSBh
c3NpZ25tZW50PwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3Vl
LCBidXQgZG9lcyBjb3JlLT5jdXJfc2VzcyBuZWVkIGxvY2sgcHJvdGVjdGlvbgppbiB2ZGVjX3N0
b3Bfc3RyZWFtaW5nKCkgYXMgd2VsbD8KClNpbmNlIFY0TDIgcXVldWUgbG9ja3MgYXJlIHVzZWQs
IFNUUkVBTU9OIGFuZCBTVFJFQU1PRkYgb24gZGlmZmVyZW50IGZpbGUKZGVzY3JpcHRvcnMgY2Fu
IGV4ZWN1dGUgY29uY3VycmVudGx5LiBJZiB2ZGVjX3N0b3Bfc3RyZWFtaW5nKCkgc2V0cwpjb3Jl
LT5jdXJfc2VzcyB0byBOVUxMIHdpdGhvdXQgYWNxdWlyaW5nIGNvcmUtPmxvY2ssIGNvdWxkIHRo
aXMgY3JlYXRlIGEKZGF0YSByYWNlIG9uIHRoZSBnbG9iYWwgcG9pbnRlcj8KCltTZXZlcml0eTog
SGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBpcyBp
dCBwb3NzaWJsZSBmb3IKY29yZS0+Y3VyX3Nlc3MgdG8gYmUgTlVMTCB3aGVuIGFuIGludGVycnVw
dCBmaXJlcz8KClNpbmNlIGNvcmUtPmN1cl9zZXNzIGlzIHNldCB0byBOVUxMIHdoZW4gbm8gZGVj
b2Rpbmcgc2Vzc2lvbiBpcyBhY3RpdmUsCmNvdWxkIGEgc3B1cmlvdXMgaGFyZHdhcmUgaW50ZXJy
dXB0IGFycml2aW5nIGR1cmluZyBhbiBpZGxlIHBlcmlvZCBjYXVzZQphIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBpbiB2ZGVjX2lzcigpIG9yIHZkZWNfdGhyZWFkZWRfaXNyKCkgaWYgdGhleQpi
bGluZGx5IGRlcmVmZXJlbmNlIGNvcmUtPmN1cl9zZXNzIHdpdGhvdXQgY2hlY2tpbmc/CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
NTI1MDk1MjE2LjEyMDc4LTEtbGludXguYW1vb25AZ21haWwuY29tP3BhcnQ9MgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
