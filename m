Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5E9C4450A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFkqk/N1r73kHNa+fWPdJPt1MIC3ZowfskSNelGAf2Y=; b=REA2iaDT2sIhkw
	P6xuLK/wOYlHWNwoe3iJowoV2eO3aotp3PUhPWtsugPYiEWT/fZIlNc9FyIr878Q2M3TmZUvQjicq
	WOJ6EgONrtVp7kHuQEf04C1/9cV3t8zeqhdS+SczmssOR+3wJ1rHpG2uIfI055/rr3eAKc5H+3Jj4
	EeDPgPQRaoXfJ3UPiVEcdr5HovK+fY0Cik1TkvXAf1TyPpX9vWtPnLko425kA7+U0r+NtJzwKKuHE
	vDWxG5IFXhi6lyJ7+2hK8ksI2d2K9Zb3bjbJc4F/fYIg3Ro/8GhNjeH53KgEL0lR4khiDqunt/RhA
	BmKKhO+eVUmRTxjoubmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNCo-0000000HVta-1kxP;
	Thu, 16 Jul 2026 14:36:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNCm-0000000HVtP-2h61
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 14:36:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AAF06001A;
	Thu, 16 Jul 2026 14:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5741F000E9;
	Thu, 16 Jul 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212611;
	bh=cc/rUnB2f0Hj2xStKlqesGJ5W+XViSIpkOWjpFEnuzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TojUgrUmMMLlz8B5jvLBTSRtycWn5bZw4r5cx+Rc/j/nrp4fXHA/jZSuoyVGitBT/
	 QlkHcc+4MmmGJlqWdoawZ/QlY35mNrfekvM5w/bSFXMUCNoG9tNkZdtCQ0JdzuRMD3
	 kRGQbo2heD/o5VavCU46V0bXlb8YauCkyeZzPZ7O16FlmTXGydftou75DhOajh88Df
	 sODuxn5wN5wuxiSNFozG/8+VIjPf81XRHMfbehVK5B0BKZhS66oBmezI6/z8dDbMvL
	 qlNkVXp6JywAIqmQtjZJeKmGhSio3hVH3ohH94VrtlxLybDHY3hC8X2FWocgttC/Jg
	 pnRw9ydx8VRXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] firmware: meson: pass a const buffer to
 meson_sm_call_write()
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, Frank.Li@kernel.org, imx@lists.linux.dev, ojeda@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260716142415.28718-5-linkmauve@linkmauve.fr>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-5-linkmauve@linkmauve.fr>
Date: Thu, 16 Jul 2026 14:36:51 +0000
Message-Id: <20260716143651.6A5741F000E9@smtp.kernel.org>
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
IFtIaWdoXSBgbWVzb25fc21fY2FsbCgpYCBwcm9wYWdhdGVzIFNNQyBmYWlsdXJlcyB2aWEgaXRz
IG91dHB1dCBwYXJhbWV0ZXIgYCpyZXRgIGJ1dCB1bmNvbmRpdGlvbmFsbHkgcmV0dXJucyAwIG9u
IHN1Y2Nlc3MuIENhbGxlcnMgaW5jb3JyZWN0bHkgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBpbnN0
ZWFkIG9mIHZhbGlkYXRpbmcgdGhlIG91dHB1dCBwYXJhbWV0ZXIsIGxlYWRpbmcgdG8gc2lsZW50
bHkgaWdub3JlZCBlcnJvcnMgYW5kIHN0YXRlIGNvcnJ1cHRpb24uCi0gW0hpZ2hdIE1pc3Npbmcg
bXV0dWFsIGV4Y2x1c2lvbiBpbiBgbWVzb25fc21fY2FsbF9yZWFkYCBhbmQgYG1lc29uX3NtX2Nh
bGxfd3JpdGVgIHdoZW4gYWNjZXNzaW5nIHRoZSBzaGFyZWQgSU8gbWVtb3J5IGJ1ZmZlcnMgYGZ3
LT5zbV9zaG1lbV9pbl9iYXNlYCBhbmQgYGZ3LT5zbV9zaG1lbV9vdXRfYmFzZWAuCi0tCgotLS0g
UGF0Y2ggWzRdOiBbUEFUQ0ggdjMgNC80XSBmaXJtd2FyZTogbWVzb246IHBhc3MgYSBjb25zdCBi
dWZmZXIgdG8gbWVzb25fc21fY2FsbF93cml0ZSgpIC0tLQpjb21taXQgZGFmZWRkY2MwMGU2MGQ4
YmFmNGZjMjBlOGY4ZjJmNjI4NmEzM2RiMwpBdXRob3I6IExpbmsgTWF1dmUgPGxpbmttYXV2ZUBs
aW5rbWF1dmUuZnI+CgpmaXJtd2FyZTogbWVzb246IHBhc3MgYSBjb25zdCBidWZmZXIgdG8gbWVz
b25fc21fY2FsbF93cml0ZSgpCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBtZXNvbl9zbV9jYWxs
X3dyaXRlKCkgc2lnbmF0dXJlIHRvIGFjY2VwdCBhCmNvbnN0IHZvaWQgKmJ1ZmZlciBpbnN0ZWFk
IG9mIHZvaWQgKmJ1ZmZlci4gSXQgYWxzbyByZW1vdmVzIHVubmVjZXNzYXJ5CmNhc3RzIHRvICh1
OCAqKSBpbiBtZXNvbl9lZnVzZV9yZWFkKCkgYW5kIG1lc29uX2VmdXNlX3dyaXRlKCkgd2hlbgpw
YXNzaW5nIHRoZSBidWZmZXIgdG8gdGhlIFNNQyBjYWxsIGZ1bmN0aW9ucy4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYyBiL2RyaXZlcnMvZmlybXdhcmUv
bWVzb24vbWVzb25fc20uYwo+IGluZGV4IGFiOTc1MWE1OWI1NTIuLjVkNGRhMmUzYzNhOTQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCj4gKysrIGIvZHJp
dmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCj4gQEAgLTE5Niw3ICsxOTYsNyBAQCBFWFBP
UlRfU1lNQk9MKG1lc29uX3NtX2NhbGxfcmVhZCk7Cj4gICAqCj4gICAqIFJldHVybjoJc2l6ZSBv
ZiBzZW50IGRhdGEgb24gc3VjY2VzcywgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBlcnJvcgo+ICAgKi8K
PiAtaW50IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywg
dm9pZCAqYnVmZmVyLAo+ICtpbnQgbWVzb25fc21fY2FsbF93cml0ZShzdHJ1Y3QgbWVzb25fc21f
ZmlybXdhcmUgKmZ3LCBjb25zdCB2b2lkICpidWZmZXIsCj4gIAkJCXVuc2lnbmVkIGludCBzaXpl
LCB1bnNpZ25lZCBpbnQgY21kX2luZGV4LCB1MzIgYXJnMCwKPiAgCQkJdTMyIGFyZzEsIHUzMiBh
cmcyLCB1MzIgYXJnMywgdTMyIGFyZzQpCj4gIHsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBh
IHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHdoaWxlIHJldmlld2luZyB0aGlzIGZ1bmN0aW9uLCBp
cyB0aGVyZSBhCm1pc3NpbmcgbG9jayB3aGVuIGFjY2Vzc2luZyBzaGFyZWQgSU8gbWVtb3J5PwoK
SW4gbWVzb25fc21fY2FsbF93cml0ZSgpLCB3ZSBjb3B5IGRhdGEgdG8gc2hhcmVkIElPIG1lbW9y
eSBhbmQgZXhlY3V0ZQphbiBTTUMgY2FsbDoKCgltZW1jcHkoZnctPnNtX3NobWVtX2luX2Jhc2Us
IGJ1ZmZlciwgc2l6ZSk7CgoJaWYgKG1lc29uX3NtX2NhbGwoZncsIGNtZF9pbmRleCwgJndyaXR0
ZW4sIGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQpIDwgMCkKCklmIG11bHRpcGxlIHRocmVh
ZHMgY2FsbCBtZXNvbl9zbV9jYWxsX3dyaXRlKCkgb3IgbWVzb25fc21fY2FsbF9yZWFkKCkKY29u
Y3VycmVudGx5LCBjb3VsZCB0aGV5IGNsb2JiZXIgdGhlIHNoYXJlZCBJTyBtZW1vcnkgYnVmZmVy
cyBiZWZvcmUgdGhlClNlY3VyZSBNb25pdG9yIGV4ZWN1dGVzIHRoZSBjb21tYW5kPyBBY2Nlc3Mg
dG8gZnctPnNtX3NobWVtX2luX2Jhc2UgYW5kCmZ3LT5zbV9zaG1lbV9vdXRfYmFzZSBkb2VzIG5v
dCBhcHBlYXIgdG8gYmUgc2VyaWFsaXplZCB3aXRoIGEgbXV0ZXguCgpbU2V2ZXJpdHk6IEhpZ2hd
ClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcyBtZXNv
bl9zbV9jYWxsKCkgbWFzawpTTUMgZXhlY3V0aW9uIGZhaWx1cmVzPwoKTG9va2luZyBhdCBtZXNv
bl9zbV9jYWxsX3dyaXRlKCksIGl0IGNoZWNrcyB0aGUgcmV0dXJuIHZhbHVlOgoKCWlmIChtZXNv
bl9zbV9jYWxsKGZ3LCBjbWRfaW5kZXgsICZ3cml0dGVuLCBhcmcwLCBhcmcxLCBhcmcyLCBhcmcz
LCBhcmc0KSA8IDApCgkJcmV0dXJuIC1FSU5WQUw7CgpIb3dldmVyLCBtZXNvbl9zbV9jYWxsKCkg
dW5jb25kaXRpb25hbGx5IHJldHVybnMgMDoKCmRyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYzptZXNvbl9zbV9jYWxsKCkKCWxyZXQgPSBfX21lc29uX3NtX2NhbGwoY21kLCBhcmcwLCBh
cmcxLCBhcmcyLCBhcmczLCBhcmc0KTsKCglpZiAocmV0KQoJCSpyZXQgPSBscmV0OwoKCXJldHVy
biAwOwoKQmVjYXVzZSBpdCBhbHdheXMgcmV0dXJucyAwLCBjYWxsZXJzIGNoZWNraW5nIHRoZSBy
ZXR1cm4gdmFsdWUgaW5zdGVhZCBvZgp0aGUgb3V0cHV0IHBhcmFtZXRlciB3aWxsIHNpbGVudGx5
IGlnbm9yZSBlcnJvcnMuIENvdWxkIHRoaXMgY2F1c2UgZHJpdmVycwpsaWtlIG1lc29uLWVmdXNl
IG9yIGFtbG9naWNfdGhlcm1hbCB0byB0cmVhdCBlcnJvciBjb2RlcyBhcyB2YWxpZCBkYXRhIGFu
ZApjb3JydXB0IHN0YXRlPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDcxNjE0MjQxNS4yODcxOC0xLWxpbmttYXV2ZUBsaW5rbWF1
dmUuZnI/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
