Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFF3C44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVJim48SSnPRjbY1RvZA+qQQGRw42At2v/un4JG2tmk=; b=w2QvHz0g0gk3Sx
	y/vL5LTZV41OiBjgtBuRpYn6d3QHPnELPvLDDrng2FIOqWcjUln9d9hUFdRIGwMgLUy2U84OPO9em
	qNt9xbrbyF+BsOOwic669q9U4aLEodP1VOkOH8CRuRYh1NO2SkxbaNozlqhqhLfAqT2FXpCgTUIvI
	VvLjyvWDJhfT1UGVTNc1qYx2gN5GF9r1NjePOd9dcW21Ae//8eJu8jVLcHsUktNCuhZVE/U1zgVeR
	gVySKIp2CL92dcEJCHlb3CXiIwrIXnqUwqjRWMwvSOXhtCE5NCHyO9X4USkofvZ1hnueAytlnwqIE
	Ksb6pefMKaoFN4MR9Y4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFtA-00000009DAO-47ut;
	Mon, 13 Jul 2026 12:36:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFt9-00000009DA8-35WT
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:35:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69FD843220;
	Mon, 13 Jul 2026 12:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB271F000E9;
	Mon, 13 Jul 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783946159;
	bh=0zQftI8gXC+XES+wMoyUMPji3VVBgZY1MuF+lSepCsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bl/X/ES9mKCRcfWnYjfivGM3DoI84jXSk8+gCDlk+lOzXlfVlH4qgKCh1w+0oZmlN
	 /1KaLH09nws18FS1yV6Gfsv3hx15aTV9eLm+w5gaHw5VxQqihWL7ImPJoVtBFojhMu
	 dZRcmn8HFbJHYrtTUKAOdUBJ842/Li9EbYC0+DxxcZlUM3D2XEKFcca9ZGKPGl+Zpc
	 Tpo/wQueYgBo55bHxFR/UAQBBzhqZgnAjxmdGm+4ltTaO3hHfN3Rd/BQwrWmiXn/cN
	 klTcEPDbbltMRc0FEq2JLRR2GLKCC/pn472+WvTEODjQj2WUI6AJ/GN5ZB/gEBdI1x
	 WjIsS1UumGILw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/19] media: meson: vdec: Fix m2m device lifetime
 and cleanup path
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260713120840.17427-2-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <20260713120840.17427-2-linux.amoon@gmail.com>
Date: Mon, 13 Jul 2026 12:35:58 +0000
Message-Id: <20260713123559.0CB271F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBN
b3ZpbmcgYHY0bDJfbTJtX2RldmAgYWxsb2NhdGlvbiB0byB0aGUgZHJpdmVyIGNvcmUgaW50cm9k
dWNlcyBhbiBleHBsb2l0YWJsZSBVc2UtQWZ0ZXItRnJlZSAoVUFGKSBkdXJpbmcgZGV2aWNlIHJl
bW92YWwgd2hlbiBmaWxlIGRlc2NyaXB0b3JzIHJlbWFpbiBvcGVuLgoKUHJlLWV4aXN0aW5nIGlz
c3VlczoKLSBbSGlnaF0gVGhlIGBhbXZkZWNfY29yZWAgc3RydWN0dXJlIGlzIGltcHJvcGVybHkg
YWxsb2NhdGVkIHVzaW5nIGBkZXZtX2t6YWxsb2NgLCBsZWFkaW5nIHRvIFVzZS1BZnRlci1GcmVl
IGJ1Z3Mgd2hlbiB0aGUgZGV2aWNlIGlzIHVuYm91bmQuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFU
Q0ggdjcgMDEvMTldIG1lZGlhOiBtZXNvbjogdmRlYzogRml4IG0ybSBkZXZpY2UgbGlmZXRpbWUg
YW5kIGNsZWFudXAgcGF0aCAtLS0KY29tbWl0IGY5N2RjM2E0M2RhNWM3OGNiYWU3ZjcxMGViNzc3
MDU5M2E3NWZmM2UKQXV0aG9yOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Cgpt
ZWRpYTogbWVzb246IHZkZWM6IEZpeCBtMm0gZGV2aWNlIGxpZmV0aW1lIGFuZCBjbGVhbnVwIHBh
dGgKClRoZSB2ZGVjIGRyaXZlciB3YXMgaW5jb3JyZWN0bHkgaW5pdGlhbGl6aW5nIGEgbmV3IHY0
bDJfbTJtIGRldmljZQppbnN0YW5jZSBwZXIgc2Vzc2lvbiBpbnNpZGUgdmRlY19vcGVuKCkgYW5k
IHJlbGVhc2luZyBpdCBpbiB2ZGVjX2Nsb3NlKCkuClRoaXMgZGVzaWduIGlzIGZhdWx0eSBiZWNh
dXNlIHRoZSBtMm0gZGV2aWNlIG1vZGVscyB0aGUgY29yZSBoYXJkd2FyZQplbmdpbmUgYW5kIG11
c3QgcGVyc2lzdCBhY3Jvc3MgbXVsdGlwbGUgc2Vzc2lvbnMuCgpDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyMDA0NTkwNS42QUNCQTFGMDAwRTlAc210cC5rZXJuZWwu
b3JnLyN0Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92
ZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBpbmRleCBh
MDM5ZDkyNWMwZmU1Li42YWUzNDcxMTU1YTg3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9t
ZXNvbi92ZGVjL3ZkZWMuYwoKWyAuLi4gXQoKPiBAQCAtMTEwNSw2ICsxMTA2LDcgQEAgc3RhdGlj
IHZvaWQgdmRlY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVj
dCBhbXZkZWNfY29yZSAqY29yZSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAKPiAg
CXZpZGVvX3VucmVnaXN0ZXJfZGV2aWNlKGNvcmUtPnZkZXZfZGVjKTsKPiArCXY0bDJfbTJtX3Jl
bGVhc2UoY29yZS0+bTJtX2Rldik7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgcmVsZWFzaW5nIHRo
ZSBtMm0gZGV2aWNlIGhlcmUgaW50cm9kdWNlIGEgdXNlLWFmdGVyLWZyZWUgaWYgYSBmaWxlCmRl
c2NyaXB0b3IgcmVtYWlucyBvcGVuPwoKSWYgYSB1c2VyIHVuYmluZHMgdGhlIGRyaXZlciwgdmRl
Y19yZW1vdmUoKSBzeW5jaHJvbm91c2x5IGZyZWVzIGNvcmUtPm0ybV9kZXYuCkhvd2V2ZXIsIGlm
IGFuIGFwcGxpY2F0aW9uIHN0aWxsIGhvbGRzIGEgZmlsZSBkZXNjcmlwdG9yIG9wZW4sIGl0IHdp
bGwKZXZlbnR1YWxseSBjbG9zZSBpdCwgdHJpZ2dlcmluZyB2ZGVjX2Nsb3NlKCk6Cgp2ZGVjX2Ns
b3NlKCkKICB2NGwyX20ybV9jdHhfcmVsZWFzZShzZXNzLT5tMm1fY3R4KQogICAgdjRsMl9tMm1f
Y2FuY2VsX2pvYigpCiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZtMm1fZGV2LT5qb2Jfc3Bpbmxv
Y2ssIGZsYWdzKTsKClNpbmNlIGNvcmUtPm0ybV9kZXYgd2FzIGFscmVhZHkgZnJlZWQgZHVyaW5n
IHVuYmluZCwgY291bGQgdGhpcyBkZXJlZmVyZW5jZQpjYXVzZSBtZW1vcnkgY29ycnVwdGlvbiBv
ciBhIGNyYXNoPwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3Vl
LCBidXQgZG9lcyByZXR1cm5pbmcgZnJvbSB2ZGVjX3JlbW92ZSgpIHdpdGhvdXQKd2FpdGluZyBm
b3Igb3BlbiBmaWxlIGRlc2NyaXB0b3JzIHRvIGNsb3NlIGxlYWQgdG8gYSB1c2UtYWZ0ZXItZnJl
ZSBvZiB0aGUKY29yZSBkcml2ZXIgc3RydWN0dXJlPwoKVGhlIGNvcmUgc3RydWN0dXJlIGFuZCBp
dHMgbXV0ZXggYXJlIGFsbG9jYXRlZCB2aWEgZGV2cmVzIChkZXZtX2t6YWxsb2MpCmR1cmluZyB2
ZGVjX3Byb2JlKCkuIElmIHRoZSBkZXZpY2UgaXMgdW5ib3VuZCwgZGV2cmVzIHdpbGwgYXV0b21h
dGljYWxseSBmcmVlCnRoZSBjb3JlIHN0cnVjdHVyZSBhcyBzb29uIGFzIHZkZWNfcmVtb3ZlKCkg
cmV0dXJucy4KCklmIGFuIGlvY3RsIGlzIGN1cnJlbnRseSBibG9ja2VkIHdhaXRpbmcgb24gdmRl
di0+bG9jayAod2hpY2ggcG9pbnRzIHRvCmNvcmUtPmxvY2spLCBpdCB3aWxsIGF0dGVtcHQgdG8g
dW5sb2NrIGEgZnJlZWQgbXV0ZXggd2hlbiBpdCByZXN1bWVzLgoKQWRkaXRpb25hbGx5LCBpZiB0
aGUgYXN5bmNocm9ub3VzIGVzcGFyc2VyX3F1ZXVlX3dvcmsgcnVucyBhZnRlciB1bmJpbmQsIGl0
CndpbGwgZGVyZWZlcmVuY2UgdGhlIGZyZWVkIHNlc3MtPmNvcmUuCgpDb3VsZCB0aGUgZHJpdmVy
IHN5bmNocm9uaXplIGFjdGl2ZSBzZXNzaW9ucyBvciB1c2UgYSBkaWZmZXJlbnQgbGlmZWN5Y2xl
IGZvcgp0aGUgY29yZSBzdHJ1Y3R1cmUgdG8gcHJldmVudCB0aGlzPwoKPiAgCXY0bDJfZGV2aWNl
X3VucmVnaXN0ZXIoJmNvcmUtPnY0bDJfZGV2KTsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxMzEyMDg0MC4xNzQyNy0x
LWxpbnV4LmFtb29uQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
