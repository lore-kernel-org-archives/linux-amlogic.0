Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C07C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2026 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZDvQdBk/0NInIj9RO2zZmNZSCm4/UDBgW2DBb2xexA=; b=tTtXWAJXk3krQ5
	ssCY2Y3qz8Af3vK5oQCTEdIJiE7LHpE4ASCPxzNKHot+e0NLmAA93nH3QYwTarx3mhm766Y+clBqK
	brkg6OH27NKfEqRWo3cfP4TDHxDhOea7vjHfvJdXSkpu9dZYXbcCZVQub36rNYpdG1EZNViproBJ3
	9zfa0QjrcJSFOoG7fv4FDuenccxfk4qHaQ4kIX3ApNokOyl7KGLLKadydOcDcJKRML6rsBTSTPYpE
	o9s5e5GNlHT7j1gzgkhpdxWkuYsEEIEazoScUvI/edov9dL8SLB9CC1Xrf78PHwdKH9tcVN+wXV0B
	EBUiJgcSYavXJRQoMCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfar-00000000vZz-0U09;
	Thu, 09 Jul 2026 03:38:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfap-00000000vZr-4460
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Jul 2026 03:38:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8947743279;
	Thu,  9 Jul 2026 03:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669391F000E9;
	Thu,  9 Jul 2026 03:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783568311;
	bh=5xw2NXP8gLC/6h3mrgb/z+e7e2QmwnP6KpdPeV7f1mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bHnIQgWmG6BYYDfq188PYtH2A40UFKV2lgv7RWxYrJGiuLF2V+fBnsD4znTogo7Dd
	 o2Ks9CpU9ukza7AAB8ADd8k8my08kNznGcvHK+5vSSGo9NKKTAz7eHYuiISLsIEyk+
	 UF+h6pc23NlOeWCpNbjwGOEgFlIBNWUUzsH+KGc21ZdDPbgDxGqXLK1BnJhVGD6dYT
	 Vjmn7O1JGCm1Sa2+HuEwOZ1kZ2b8210vcZ/to2lTgZZ/eaDyN2E/F697j5j4hD5qHQ
	 4NwiGj06yE0R5iEGWX3+2QKwHVJW+/GdZnTe7R1V2wjoktI7w0xa9VKsESFSB1a28W
	 HBSfl9MNdO8BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: a9: Add IR controller
 support
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260709-a9-ir-v2-2-42c21d7a6ffc@amlogic.com>
References: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
 <20260709-a9-ir-v2-2-42c21d7a6ffc@amlogic.com>
Date: Thu, 09 Jul 2026 03:38:29 +0000
Message-Id: <20260709033830.669391F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gSW5jb3JyZWN0IGluZGVu
dGF0aW9uIGluIHRoZSBuZXdseSBhZGRlZCBgZnVuYy1pci1pbmAgRFQgbm9kZS4KLS0KCi0tLSBQ
YXRjaCBbMl06IFtQQVRDSCB2MiAyLzJdIGFybTY0OiBkdHM6IGFtbG9naWM6IGE5OiBBZGQgSVIg
Y29udHJvbGxlciBzdXBwb3J0IC0tLQpjb21taXQgMTcwMTE1MjQyYjRkY2M0NmUyNDYxZjc4ZGJj
M2EwODgyYThlODBmMQpBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogYTk6IEFkZCBJUiBjb250cm9sbGVyIHN1cHBvcnQK
ClRoaXMgY29tbWl0IGFkZHMgdGhlIElSIGNvbnRyb2xsZXIgbm9kZSBmb3IgdGhlIEFtbG9naWMg
QTkgU29DIGFuZCBkZXNjcmliZXMKdGhlIHJlbW90ZSBpbnB1dCBwaW4gY29uZmlndXJhdGlvbi4g
SXQgYWxzbyBlbmFibGVzIHRoZSBJUiBjb250cm9sbGVyIG9uIHRoZQpBbWxvZ2ljIEE5IEEzMTFZ
MyBCWTQwMSBib2FyZCB3aXRoIHRoZSBhcHByb3ByaWF0ZSBwaW5jdHJsIHNldHRpbmdzLgoKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTkuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE5LmR0c2kKPiBpbmRleCBiMGUw
ZmFkZWVkODIwLi5hYTg5YjMxYmZlMzBkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLWE5LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy1hOS5kdHNpClsgLi4uIF0KPiBAQCAtMjQxLDYgKzI0MSwxMyBAQCB0ZXN0
X246IGdwaW9AYzAgewo+ICAJCQkJCSNncGlvLWNlbGxzID0gPDI+Owo+ICAJCQkJCWdwaW8tcmFu
Z2VzID0gPCZhb2J1c19waW5jdHJsIDAgKEFNTE9HSUNfR1BJT19URVNUX048PDgpIDE+Owo+ICAJ
CQkJfTsKPiArCj4gKwkJCQlmdW5jLWlyLWluIHsKPiArCQkJCQkJcmVtb3RlX2lucHV0X2FvX3Bp
bnM6IGdyb3VwLXJlbW90ZS1pbnB1dC1hby1waW5zIHsKCltTZXZlcml0eTogTG93XQpUaGlzIGlz
bid0IGEgYnVnLCBidXQgZG9lcyB0aGlzIGluZGVudGF0aW9uIGFsaWduIHdpdGggc3RhbmRhcmQg
ZGV2aWNlIHRyZWUKZm9ybWF0dGluZz8gSXQgbG9va3MgbGlrZSB0aGUgcmVtb3RlX2lucHV0X2Fv
X3BpbnMgbm9kZSBpcyBpbmRlbnRlZCB3aXRoIGFuCmV4dHJhIHRhYiBjb21wYXJlZCB0byB0aGUg
c3Vycm91bmRpbmcgbm9kZXMgYW5kIGl0cyBvd24gaW50ZXJuYWwgcHJvcGVydGllcy4KCj4gKwkJ
CQkJCXBpbm11eCA9IDxBTUxfUElOTVVYKEFNTE9HSUNfR1BJT19ELCA1LCAxKT47Cj4gKwkJCQkJ
CWJpYXMtZGlzYWJsZTsKPiArCQkJCQl9Owo+ICsJCQkJfTsKPiAgCQkJfTsKCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MDktYTkt
aXItdjItMC00MmMyMWQ3YTZmZmNAYW1sb2dpYy5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
