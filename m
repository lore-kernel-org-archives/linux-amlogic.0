Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCCC43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2026 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FZh7hU0ki2jrLe3l78mm18HDviUqzpHt3J/IRbpvjk=; b=tbwb0eKPlCcm7O
	BX/t2Vfw0J1WtQGpKKj+PKHKZq/nLtuvgVb/8AOVtZUO1JzFDDnkELLNK3wQmm+C9TjBqA3BXjseI
	+trmi9F8qUTL+XGKnhcbFaKBqvbLQK/wHN8grPwy55Dfpmm8VjJFF4xyERlQnURUChLfZyFVHYoIG
	fWDS+64oLTR7QOeRVaJbPYMmE0IQZyyXC0BA1cjxeiki9RCipkD+/hnWGHGB1CwK7kqouQ02hWynd
	ytx2pGdATtqbTys/ousBFyoBnvkJZ7C5iYq95AEJ5wcm/w2WCAL4zqrZ8G9YFmAmwGmBL7NBmnvQp
	QJXCS0B4fknTlEnMnJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkEb-00000001RNd-0zLt;
	Thu, 09 Jul 2026 08:35:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkEZ-00000001RMm-2yY9
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Jul 2026 08:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA7646001A;
	Thu,  9 Jul 2026 08:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D61F000E9;
	Thu,  9 Jul 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586150;
	bh=idAOatRzGXp+QemK2en22gUSP+GVJMTDmEsRhDWMKL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NcxAmuWJbwJV07VmQIEv/UVRmlMcnUkR2aOviXR0/FKq45xuXTgKRNBFr6BohejvI
	 abQYbh3qsNyqXYkPUlyCgjLty1dEhyC4HqgE3uRa/AxTlmTeP9ujd/cD32w1wl7KhT
	 RqOqyTjqRYeFqa5jjElr6n831dGXA0QnZrJcvjvQHPHZf9r5gWdStGC1PbckqZ5t3A
	 5hpYOCIjozS6GpEkWElAee0Nh2dRJwin+4vVOw6+IJPIExm5Rm0MCoiTQDQ2j2fFmh
	 Kbo2tYx0RtQsTDH5YYC7ixi368dkFZsvGu66ZpHGtpG1YSdKHU/3DQyq61DiVQPElg
	 Noh1LE40X6UGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a9: Add reset controller
 support
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260709-a9-reset-v1-3-fd7cf039b853@amlogic.com>
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
 <20260709-a9-reset-v1-3-fd7cf039b853@amlogic.com>
Date: Thu, 09 Jul 2026 08:35:49 +0000
Message-Id: <20260709083550.403D61F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIEFPIHJlc2V0IGNv
bnRyb2xsZXIgbm9kZSB1c2VzIGEgbm9uLWdlbmVyaWMgbmFtZSAnYW8tcmVzZXQtY29udHJvbGxl
ckAyMDAwJyB3aGljaCBmYWlscyBzdGFuZGFyZCBzY2hlbWEgdmFsaWRhdGlvbi4KLS0KCi0tLSBQ
YXRjaCBbM106IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IGFtbG9naWM6IGE5OiBBZGQgcmVzZXQg
Y29udHJvbGxlciBzdXBwb3J0IC0tLQpjb21taXQgMGYwNDVmY2M2ODNkZTI1Nzg1YzZjYTFhNmRm
NGQ5ODNjMDdiYzliNApBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogYTk6IEFkZCByZXNldCBjb250cm9sbGVyIHN1cHBv
cnQKClRoaXMgY29tbWl0IGFkZHMgcmVzZXQgY29udHJvbGxlciBkZXNjcmlwdGlvbnMgZm9yIHRo
ZSBBbWxvZ2ljIEE5IFNvQy4KSXQgaW5jbHVkZXMgdGhlIGNvcnJlc3BvbmRpbmcgcmVzZXQgSURz
IGhlYWRlciBhbmQgZGV2aWNlIHRyZWUgbm9kZXMgZm9yCmJvdGggdGhlIG1haW4gYW5kIGFvIHJl
c2V0IGNvbnRyb2xsZXJzLgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTkuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9hbWxvZ2ljLWE5LmR0c2kKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1s
b2dpYy1hOS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMt
YTkuZHRzaQoKWyAuLi4gXQoKPiBAQCAtMjA0LDYgKzIxMiwxMiBAQCBhb2J1czogYnVzQGZmYTAw
MDAwIHsKPiAgCQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4gIAkJCXJhbmdlcyA9IDwweDAgMHgwIDB4
MCAweGZmYTAwMDAwIDB4MCAweDEwMDAwMD47Cj4gIAo+ICsJCQlhb19yZXNldDogYW8tcmVzZXQt
Y29udHJvbGxlckAyMDAwIHsKCltTZXZlcml0eTogTG93XQpDb3VsZCB0aGlzIG5vZGUgdXNlIHRo
ZSBnZW5lcmljIG5hbWUgcmVzZXQtY29udHJvbGxlckAyMDAwIGluc3RlYWQ/IFN0YW5kYXJkCmRl
dmljZSB0cmVlIHNjaGVtYSB2YWxpZGF0aW9uIGV4cGVjdHMgcmVzZXQgY29udHJvbGxlcnMgdG8g
bWF0Y2ggdGhlIGdlbmVyaWMKcGF0dGVybiBecmVzZXQtY29udHJvbGxlcihALiopPyQuIFVzaW5n
IGFvLXJlc2V0LWNvbnRyb2xsZXJAMjAwMCB3aWxsIGxpa2VseQp0cmlnZ2VyIGEgdmFsaWRhdGlv
biB3YXJuaW5nIHdoZW4gcnVubmluZyBtYWtlIGR0YnNfY2hlY2suCgo+ICsJCQkJY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLGE5LWFvLXJlc2V0IjsKPiArCQkJCXJlZyA9IDwweDAgMHgyMDAwIDB4MCAw
eGM+Owo+ICsJCQkJI3Jlc2V0LWNlbGxzID0gPDE+Owo+ICsJCQl9Owo+ICsKPiAgCQkJYW9idXNf
cGluY3RybDogcGluY3RybEA0MDAwIHsKPiAgCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxwaW5j
dHJsLWE5IjsKPiAgCQkJCSNhZGRyZXNzLWNlbGxzID0gPDI+OwoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwOS1hOS1yZXNldC12
MS0wLWZkN2NmMDM5Yjg1M0BhbWxvZ2ljLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
