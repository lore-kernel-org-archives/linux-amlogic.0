Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA24CD37AC
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 May 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slw46se3O5mlVmCKeE60b0TqubhZXc3e9eTGBF8MdPc=; b=Cdh2f+KrC7jYrx
	XRxsnBuxoB7Y7BLUr2LsJZj0BMHx7xIoZLRDlFiYjZhtGK27+YKeviacqbwMdiDfi+ZTxvcjRR9uf
	JRlObmA/gzfK75iTjAJDzN47tSZWaBOLC062pWn/gF6F+LstFhuHTRGFqv5wo8YRFpgU3b/dZMhA2
	yfN5MVua8HOTmYuaRLs0USyx3XRqG3br0AneCXrQc9tXIh/R4qorCuSkNrMBpuYUkSOFr8msG4dvF
	r0pfNz7H4+HRKv4WUwNqvjkSc81jrfUI0QKPrIofdSCyB1jOO5fi4atUu/rLAL+9vTxflQdnn7lxq
	Tfy+vTPHI2LueOCjGuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOad5-0000000Ch8Z-1Wdt;
	Sun, 17 May 2026 12:29:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOad2-0000000Ch83-08gb
	for linux-amlogic@lists.infradead.org;
	Sun, 17 May 2026 12:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E6524005A;
	Sun, 17 May 2026 12:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29299C2BCB0;
	Sun, 17 May 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779020995;
	bh=za96MwCYhI/B/AaZrELRzd33nfgttPOx5WfappJRNdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=izLhmVBJ8DvaNSKTdHtDDcLy1b8BqNnUK+FMK61grDXyMoPHFBL2p54eZ8Z4xBh4r
	 nSD//NFR9XdoSLPVBMiLlLa4BXiDkabQBarYRRXDlA8HT4xyajACfY8k7CCktB+tpp
	 rO3BIVi1kBHBsNxPacDx6DB7UFBHeQoQxO0vPYdR3I7C2HWMZv5vf5ARUnynPHitr5
	 /n8dQ2zt8nCxfQtBg+Wqbm6wa8oIoqSSXU8rkHXvomfCsMufZ0UzEe5fPnEPGqTGuc
	 rzFjVbU55Ouojr6oy6ZNfNcYMeICnPZJ2wQVg0wU5ocQUeAxy5USfF+uSpYsz7JhJg
	 0YnXlQKoV1krg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: meson: ge2d: avoid double free on video register
 failure
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260517115343.955015-1-lgs201920130244@gmail.com>
References: <20260517115343.955015-1-lgs201920130244@gmail.com>
Date: Sun, 17 May 2026 12:29:54 +0000
Message-Id: <20260517122955.29299C2BCB0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_052956_115363_6BEC0176 
X-CRM114-Status: GOOD (  12.09  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBwYXRjaCdzIHdv
cmthcm91bmQgZm9yIGEgZG91YmxlIGZyZWUgdmlvbGF0ZXMga29iamVjdCBsaWZlY3ljbGUgcnVs
ZXMsIGludHJvZHVjaW5nIGEgVXNlLUFmdGVyLUZyZWUuCi0gW0hpZ2hdIFByZS1leGlzdGluZyBV
c2UtQWZ0ZXItRnJlZSBkdWUgdG8gZGV2aWNlLW1hbmFnZWQgKGRldm0pIG1lbW9yeSBsaWZlY3lj
bGUgbWlzbWF0Y2ggd2l0aCBhc3luY2hyb25vdXMgY2hhcmFjdGVyIGRldmljZSBvcGVyYXRpb25z
LgotLQoKY29tbWl0IDdlZDZjZTBlYTExNmNkOGRjZDVmZjJlMTgzN2Y1ZDMzOWNkYTkwZmEKQXV0
aG9yOiBHdWFuZ3NodW8gTGkgPGxnczIwMTkyMDEzMDI0NEBnbWFpbC5jb20+CgptZWRpYTogbWVz
b246IGdlMmQ6IGF2b2lkIGRvdWJsZSBmcmVlIG9uIHZpZGVvIHJlZ2lzdGVyIGZhaWx1cmUKClRo
aXMgY29tbWl0IGF0dGVtcHRzIHRvIGZpeCBhIGRvdWJsZSBmcmVlIHdoZW4gdmlkZW9fcmVnaXN0
ZXJfZGV2aWNlCmZhaWxzIGJ5IHRlbXBvcmFyaWx5IGFzc2lnbmluZyB2aWRlb19kZXZpY2VfcmVs
ZWFzZV9lbXB0eSB0byB0aGUgdmlkZW8KZGV2aWNlIHJlbGVhc2UgY2FsbGJhY2suIEl0IHJlc3Rv
cmVzIHRoZSBvcmlnaW5hbCBjYWxsYmFjayBpZiByZWdpc3RyYXRpb24Kc3VjY2VlZHMuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtbG9naWMvbWVzb24tZ2UyZC9nZTJk
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtbG9naWMvbWVzb24tZ2UyZC9nZTJkLmMKPiBp
bmRleCBjNWRjMDM5MDVjZTBmLi5iMzY3MTY5ZTZhZDg0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYW1sb2dpYy9tZXNvbi1nZTJkL2dlMmQuYwo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYW1sb2dpYy9tZXNvbi1nZTJkL2dlMmQuYwo+IEBAIC05ODMsNiArOTgz
LDcgQEAgc3RhdGljIGludCBnZTJkX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIAl9Cj4gIAo+ICAJKnZmZCA9IGdlMmRfdmlkZW9kZXY7Cj4gKwl2ZmQtPnJlbGVhc2UgPSB2
aWRlb19kZXZpY2VfcmVsZWFzZV9lbXB0eTsKCkNhbiB0aGlzIHdvcmthcm91bmQgaW50cm9kdWNl
IGEgdXNlLWFmdGVyLWZyZWUgcmVncmVzc2lvbiBpbiB0aGUga29iamVjdCBjb3JlPwoKV2hlbiBf
X3ZpZGVvX3JlZ2lzdGVyX2RldmljZSBmYWlscyBpbnNpZGUgZGV2aWNlX3JlZ2lzdGVyLCBpdCBj
YWxscwpwdXRfZGV2aWNlIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSBjb3VudC4gVGhlIGRyaXZlciBj
b3JlIGV4cGVjdHMgdGhlIHJlbGVhc2UKY2FsbGJhY2sgdG8gZnJlZSB0aGUgY29udGFpbmluZyBz
dHJ1Y3R1cmUuCgpCeSB0ZW1wb3JhcmlseSBzdWJzdGl0dXRpbmcgdmZkLT5yZWxlYXNlIHdpdGgg
dmlkZW9fZGV2aWNlX3JlbGVhc2VfZW1wdHksCnB1dF9kZXZpY2Ugd2lsbCBub3QgZnJlZSB0aGUg
bWVtb3J5IHN5bmNocm9ub3VzbHkuIFRoZSBkcml2ZXIgdGhlbiBleHBsaWNpdGx5CmZyZWVzIHRo
ZSB2aWRlb19kZXZpY2UgaW4gdGhlIGVycm9yIHBhdGggdmlhIHZpZGVvX2RldmljZV9yZWxlYXNl
LgoKSG93ZXZlciwgcHV0X2RldmljZSBpcyBub3QgZ3VhcmFudGVlZCB0byBleGVjdXRlIGNsZWFu
dXAgc3luY2hyb25vdXNseS4gSWYKYXN5bmNocm9ub3VzIGtvYmplY3QgcmVsZWFzZSBkZWJ1Z2dp
bmcgaXMgZW5hYmxlZCwgaXQgc2NoZWR1bGVzIGNsZWFudXAKYXN5bmNocm9ub3VzbHkgb24gYSB3
b3JrcXVldWUuCgpFeHBsaWNpdGx5IGZyZWVpbmcgdGhlIHZpZGVvX2RldmljZSBzdHJ1Y3QgaW1t
ZWRpYXRlbHkgYWZ0ZXIgcmVnaXN0cmF0aW9uCmZhaWxzIGNvdWxkIGRlc3Ryb3kgdGhlIGVtYmVk
ZGVkIGRldmljZSBzdHJ1Y3QgbWVtb3J5IHdoaWxlIHRoZSBrb2JqZWN0IGNvcmUKc3RpbGwgaG9s
ZHMgYW4gYXN5bmNocm9ub3VzIHJlZmVyZW5jZS4KCj4gIAl2ZmQtPmxvY2sgPSAmZ2UyZC0+bXV0
ZXg7Cj4gIAl2ZmQtPnY0bDJfZGV2ID0gJmdlMmQtPnY0bDJfZGV2OwoKRG9lcyB0aGUgdXNlIG9m
IGRldm0gbWVtb3J5IGZvciB0aGUgbWVzb25fZ2UyZCBzdHJ1Y3QgY3JlYXRlIGEgbGlmZWN5Y2xl
Cm1pc21hdGNoIHdpdGggdGhlIHZpZGVvIGRldmljZT8KClRoZSBnZTJkIGNvbnRleHQgaXMgYWxs
b2NhdGVkIHZpYSBkZXZtX2t6YWxsb2MsIHdoaWNoIGF1dG9tYXRpY2FsbHkgZnJlZXMKdGhlIG1l
bW9yeSB3aGVuIHRoZSBkcml2ZXIgdW5iaW5kcy4gSG93ZXZlciwgdGhpcyBjb250ZXh0IGVtYmVk
cyBmaWVsZHMKbGlrZSB2NGwyX2RldiBhbmQgbXV0ZXggdGhhdCBhcmUgcmVmZXJlbmNlZCBieSB0
aGUgdmlkZW9fZGV2aWNlLgoKSWYgYSB1c2VyIHByb2Nlc3Mgb3BlbnMgdGhlIHZpZGVvIGNoYXJh
Y3RlciBkZXZpY2UgYW5kIGhvbGRzIHRoZSBmaWxlCmRlc2NyaXB0b3Igb3BlbiwgdGhlIHZpZGVv
X2RldmljZSByZW1haW5zIGFjdGl2ZSBldmVuIGFmdGVyIHRoZSBkcml2ZXIKdW5iaW5kcyBhbmQg
dGhlIGRldm0gbWVtb3J5IGlzIGZyZWVkLgoKSWYgdGhlIHVzZXIgbGF0ZXIgY2xvc2VzIHRoZSBm
aWxlIGRlc2NyaXB0b3IsIHRoZSBmaW5hbCByZWZlcmVuY2UgZHJvcAppbnZva2VzIHY0bDJfcmVs
ZWFzZSwgd2hpY2ggZGVyZWZlcmVuY2VzIHZkZXYtPnY0bDJfZGV2IGFuZCBhdHRlbXB0cwp0byBs
b2NrIHRoZSBmcmVlZCBnZTJkLT5tdXRleCwgcmVzdWx0aW5nIGluIGEgdXNlLWFmdGVyLWZyZWUg
cmVncmVzc2lvbi4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA1MTcxMTUzNDMuOTU1MDE1LTEtbGdzMjAxOTIwMTMwMjQ0QGdtYWls
LmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
