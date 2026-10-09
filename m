Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB78CCA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgrAYYgtxWymdUp0VWVEnYPPh+b2Oxwul1RLEupmKV8=; b=SqtIz6OFSjuCS5
	tJpo4+XAQMUq8dZSvism2q9qxfbdIpLU/b/uNhyi4ULGJzv43QNYBVy8FxpDjFP9/LZftQjMVarrW
	ieMhWhRDJGvj4inlNBQj17R5zVkmmA9YvB0MYNmVp7qE/gBd/RtTtaHUySmytgYeiUuimH1KC6QsB
	c4pLxRMiae0q0kON8RN56FcCOjg1+cY/XopcFIOBLBcMk+/sCEqhjugIEYCmLhaQ0nnYEql0ru0d5
	VB5VBV3VwZ+73H5lMUFLfUvH/dWaSIEYeRJ7sC8ZozroE2wSymc1oAbyzPud5WVDhpvXuCCtVvpWB
	GGMdqct06O6yF+CNi8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Sz-00000005PQv-2OJr;
	Fri, 09 Oct 2026 03:40:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Sy-00000005PQa-1Mkl
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C20234321A;
	Fri,  9 Oct 2026 03:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7633F1F000FF;
	Fri,  9 Oct 2026 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517215;
	bh=6+BeSyE66oi6Opb4Ve20qWc2rsGI28zDIZHd3TrPof4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HEtXqCADjizLylngv/5Ucvaq46xehgzf1S3m7rlxbbdxsD9aXMWC1V0rpD+w7H4vM
	 ttQRmY6khBzauZAOr6Q2S5ThGxdV2pfJOfL+QEuz3vqBkxhiRl8g3WC4UpxxbDHLrq
	 5d/cMhLwcdmLhTi1F6ro2p0dsm6pQnwCpjjLDyC7sUQ/TeyX+vJNO9bhYN2Va5IYtM
	 sM4/URf+STP481jNPxzbDKxlb7mZ3D55tZ9Rv9oZPvMO5Nma95klRKb3hLJj+rL9bM
	 JwOmKTyavDKFI4H++KLghojkUlUncdNwphw5FfkNgbHtN2HII944gscm0xAVo4280T
	 gNrDmw9hzeciw==
Message-ID: <sashiko-outbox-164781@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/20] drm/msm/dp: Add static HDR metadata support
 for DP and eDP
To: "Xilin Wu" <sophon@radxa.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-20-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-20-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:40:15 +0000
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc20vZHA6IHVu
Y2xvY2tlZCBhY2Nlc3MgY3Jhc2ggaW4gbXNtX2RwX2Rpc3BsYXlfZGlzYWJsZSgpIGFmdGVyIGZh
aWxlZCBQSFkgdGVzdAotIFtNZWRpdW1dIGNsZWFudXA6IG1peGVkIGdvdG8gYW5kIHNjb3BlZF9n
dWFyZCBpbiBtc21fZHBfZGlzcGxheV9hdG9taWNfZW5hYmxlCi0tCgpjb21taXQgM2M0NGE5YmRj
MmQzNzkyNzczZDExMWRmMjA5ZjZjZDE5ZTAyYTdkNgpBdXRob3I6IFhpbGluIFd1IDxzb3Bob25A
cmFkeGEuY29tPgpTdWJqZWN0OiBkcm0vbXNtL2RwOiBBZGQgc3RhdGljIEhEUiBtZXRhZGF0YSBz
dXBwb3J0IGZvciBEUCBhbmQgZURQCgpFeHBvc2UgSERSX09VVFBVVF9NRVRBREFUQSBhbmQgdmFs
aWRhdGUgYW5kIHBhY2sgaXQgZHVyaW5nIGF0b21pYyBjaGVjay4KUHJvZ3JhbSBHZW5lcmljMiBm
cm9tIHRoZSBjaGVja2VkIGJyaWRnZSBzdGF0ZSBvbiBldmVyeSBzdHJlYW0gZW5hYmxlLgpSZXVz
ZSB0aGUgRFJNIG1ldGFkYXRhIGNvbnZlcnNpb24gYW5kIGluZm9mcmFtZSBwYWNraW5nIGhlbHBl
cnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCj4gaW5kZXggYzUxZDAzMzU5OGE1
Yi4uNzEwNDgyMmIwM2UwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2Rw
X2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jClsg
Li4uIF0KPiBAQCAtODgwLDEwICs5MDMsMTMgQEAgc3RhdGljIGludCBtc21fZHBfZGlzcGxheV9k
aXNhYmxlKHN0cnVjdCBtc21fZHBfZGlzcGxheV9wcml2YXRlICpkcCwKPiAgCj4gIAlsb2NrZGVw
X2Fzc2VydF9oZWxkKCZkcC0+cGx1Z2dlZF9sb2NrKTsKPiAgCj4gKwlkcC0+dmlkZW9fdGVzdF9i
bG9ja2VkID0gZmFsc2U7Cj4gKwo+ICAJaWYgKCFtc21fZHBfZGlzcGxheS0+cG93ZXJfb24pCj4g
IAkJcmV0dXJuIDA7Cj4gIAo+ICAJbXNtX2RwX3BhbmVsX2Rpc2FibGVfdnNjX3NkcChtc21fZHBf
cGFuZWwpOwo+ICsJbXNtX2RwX3BhbmVsX2Rpc2FibGVfaGRyX3NkcChtc21fZHBfcGFuZWwpOwoK
W1NldmVyaXR5OiBIaWdoXQpDYW4gdGhpcyB1bmNvbmRpdGlvbmFsbHkgYWNjZXNzIGhhcmR3YXJl
IHJlZ2lzdGVycyB3aGVuIHRoZSBEUCBsaW5rIGNsb2NrcwphcmUgZGlzYWJsZWQ/CgpJZiBhIERQ
IHNpbmsgcmVxdWVzdHMgYSBQSFkgdGVzdCBwYXR0ZXJuLAptc21fZHBfY3RybF9wcm9jZXNzX3Bo
eV90ZXN0X3JlcXVlc3QoKSBpbnRlbnRpb25hbGx5IGRpc2FibGVzIHRoZSBsaW5rCmNsb2NrcyB2
aWEgbXNtX2RwX2N0cmxfb2ZmX2xpbmsoKS4KCklmIG1zbV9kcF9jdHJsX29uX2xpbmsoKSBzdWJz
ZXF1ZW50bHkgZmFpbHMsIGl0IHJldHVybnMgZWFybHkgbGVhdmluZyB0aGUKbGluayBjbG9ja3Mg
ZGlzYWJsZWQsIGJ1dCB0aGUgZGlzcGxheSBwb3dlcl9vbiBmbGFnIHJlbWFpbnMgdHJ1ZS4KCldo
ZW4gbXNtX2RwX2Rpc3BsYXlfZGlzYWJsZSgpIGlzIHRoZW4gY2FsbGVkIChlLmcuIG9uIG1vbml0
b3IgdW5wbHVnKSwgaXQKcHJvY2VlZHMgYmVjYXVzZSBwb3dlcl9vbiBpcyB0cnVlLCBhbmQgY2Fs
bHMgbXNtX2RwX3BhbmVsX2Rpc2FibGVfaGRyX3NkcCgpCmFuZCBtc21fZHBfcGFuZWxfZGlzYWJs
ZV92c2Nfc2RwKCkuIFRoZXNlIGZ1bmN0aW9ucyB3cml0ZSB0byBoYXJkd2FyZSBsaW5rCnJlZ2lz
dGVycyAobGlrZSBNTVNTX0RQX1NEUF9DRkcpLgoKQWNjZXNzaW5nIHRoZXNlIHJlZ2lzdGVycyB3
aGlsZSB0aGUgbGluayBjbG9ja3MgYXJlIG9mZiBjYW4gY2F1c2UgYQpzeW5jaHJvbm91cyBleHRl
cm5hbCBhYm9ydCAoa2VybmVsIHBhbmljKSB3aGljaCBpcyByZWFjaGFibGUgdmlhIGEgZmF1bHR5
Cm9yIG1hbGljaW91cyBEUCBzaW5rLgoKWyAuLi4gXQo+IEBAIC0xNzc0LDYgKzE4MDAsNyBAQCB2
b2lkIG1zbV9kcF9kaXNwbGF5X2F0b21pY19lbmFibGUoc3RydWN0IG1zbV9kcCAqbXNtX2RwX2Rp
c3BsYXksCj4gIAkJbXNtX2RwX2hwZF91bnBsdWdfaGFuZGxlKGRwKTsKPiAgCW1zbV9kcF9kaXNw
bGF5X3VucHJlcGFyZShkcCk7Cj4gIAlzY29wZWRfZ3VhcmQobXV0ZXgsICZkcC0+cGx1Z2dlZF9s
b2NrKSB7Cj4gKwkJZHAtPnZpZGVvX3Rlc3RfYmxvY2tlZCA9IGZhbHNlOwo+ICAJCWRwLT5saW5r
X2ZhaWxlZCA9IHRydWU7Cj4gIAkJLyogS2VlcCByZXBvcnRpbmcgQkFELCBidXQgbm90aWZ5IG9u
bHkgb25jZSB1bnRpbCByZWNvdmVyeS4gKi8KPiAgCQlzY2hlZHVsZV93b3JrKCZkcC0+bGlua19z
dGF0dXNfd29yayk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIG1peCBnb3RvLWJhc2Vk
IGVycm9yIGhhbmRsaW5nIGFuZCBzY29wZS1iYXNlZCBjbGVhbnVwIGluIHRoZSBzYW1lCmZ1bmN0
aW9uPwoKVGhlIG1zbV9kcF9kaXNwbGF5X2F0b21pY19lbmFibGUoKSBmdW5jdGlvbiB1c2VzIHRy
YWRpdGlvbmFsIGdvdG8tYmFzZWQgZXJyb3IKaGFuZGxpbmcgKGdvdG8gZXJyOyBnb3RvIGVycl9w
cmVwYXJlOykgYnV0IGFsc28gaW5jbHVkZXMgYSBzY29wZWRfZ3VhcmQoKQpibG9jayBhdCB0aGUg
ZW5kLgoKQWNjb3JkaW5nIHRvIGtlcm5lbCBjbGVhbnVwIGd1aWRlbGluZXMgKGluY2x1ZGUvbGlu
dXgvY2xlYW51cC5oKSwgbWl4aW5nCmdvdG8gYW5kIHNjb3BlLWJhc2VkIGNsZWFudXAgd2l0aGlu
IHRoZSBzYW1lIGZ1bmN0aW9uIGlzIGV4cGxpY2l0bHkKcHJvaGliaXRlZCBiZWNhdXNlIGl0IGNy
ZWF0ZXMgY29uZnVzaW5nIG93bmVyc2hpcCBzZW1hbnRpY3MgYW5kIGluY3JlYXNlcwp0aGUgcmlz
ayBvZiBkb3VibGUtZnJlZSBvciBsb2NraW5nIGJ1Z3MgZHVyaW5nIG1haW50ZW5hbmNlLgoKQ291
bGQgdGhpcyBiZSBjb252ZXJ0ZWQgdG8gdXNlIHNjb3BlLWJhc2VkIGNsZWFudXAgZW50aXJlbHks
IG9yIHVzZQp0cmFkaXRpb25hbCBsb2NraW5nIGZvciB0aGlzIGJsb2NrIHRvIG1hdGNoIHRoZSBy
ZXN0IG9mIHRoZSBmdW5jdGlvbj8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMDktbXNtLWRwLWhkcjEwLXYyLTAtMTgzNWQ0OTY2
ZGEzQHJhZHhhLmNvbT9wYXJ0PTIwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
