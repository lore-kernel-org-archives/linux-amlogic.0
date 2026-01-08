Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC7D148AB
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jan 2026 06:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gdURQQZjfuOaDCKki/Lty5E3TbMJN2gCbX4pHS2nfns=; b=VHx82PxGfAZy6Q
	c1td7KuiLhZsASe9Iu13CtBNYKmfh1HFweRh5Mg618QMcl4JspyLEszbsMdJZ6hnRcyBR8dSubzQv
	0r9Bo1IcABrvxm/aHhg59dZ0DH/oAX1QZTl7Jf7ORJigZ9nT4RrwwOFg4iEi0+NZ39Ofc7KjRKLBe
	p9hGfxcWqHhu/5bGWreIapxMO75UB+Toik2o+8Pn0P2OJpX7UuHbfUm2+UhC+o2DeG37avjdsu8Rq
	W6q5DAFQLOvdcow0oJkAwqP4v377tQH1ujx1wU02cjKcxRivf5Qj7qRNP+kHQQdwUer/+vLscweDK
	tKD9El+rYdW7gwuhQ6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjCB-0000000Fymj-15Hj;
	Thu, 08 Jan 2026 06:08:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjC6-0000000Fyi1-3PQt;
	Thu, 08 Jan 2026 06:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E664943FC7;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD732C116C6;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852505;
	bh=RYHvBenPbSd/Yi3PszJcY9ayngdFIumRsmnQpcNICxs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EgcrzXvR+e6GdnT9wqdYucJ55Yn8fILi9I1o//ol91/F9HPZ+3GGneZBNE15oFUvI
	 vyMLAeQ8z1rRnChp2BxJM0Kv5azww5PW8W+naQ37vD7xu4hFAzZhErkmv9JGfQa7L9
	 pzLj255i7aPaLsBSutm/wAHaIzuwEeGqMKqmfnRNJixA3AQ7IipgcXWASLXkhsqLnX
	 LGH4luQ3mGr15NCUStnxkt/5h8jEE6W3ZA7yv2ZcXZmaW7aH65+Euf3mQnWF3ZnThx
	 /gntxcmzBXf4b7JKtoQdGXWL0lWeWZFQ+Wc++a0YILgfqtQESDNzbT+3BzeuLcN4mo
	 4x520nP8p4czQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7C2D1489F;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v5 0/8] clk: amlogic: Add A5 SoC PLLs and Peripheral clock
Date: Thu, 08 Jan 2026 14:08:14 +0800
Message-Id: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM5JX2kC/2XMTQqDMBCG4atI1k3JjIloV71H6SKOo4b6U0wJL
 eLdGwWF0uU3zPPOwvPk2ItLMouJg/NuHOIwp0RQa4eGpaviFqhQqwJAWiOpe8jUkC4slalmEPH
 5OXHt3lvodo+7df41Tp+tG2C97gm9JwJIJQ0zkq6hVDldbd+NjaMzjb1YIwEPCIDqgBhh3HmGw
 EUG1T/UOzSgMD+gjpAzJKusZdTpL1yW5QsTZL2sEAEAAA==
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=3239;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=RYHvBenPbSd/Yi3PszJcY9ayngdFIumRsmnQpcNICxs=;
 b=bNmkHioG5afqUsiyHyWBmdJF5FymiZB8FvlwfnAAkHB9zBkDq58F6ck1JB+W3dKVC1+97bR+2
 Zk8BKItr/F+AHr7k7GgC+5esELm5Wny+ymECuG/t+DPCW3Rp3PBtvmD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220826_894547_1E4733BD 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIHBlcmlwaGVyYWwgYW5kIFBMTCBjbG9j
ayBjb250cm9sbGVyCm9uIHRoZSBBbWxvZ2ljIEE1IFNvQyBmYW1pbHksIHN1Y2ggYXMgQTExM1gy
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNv
bT4KU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+
ClNpZ25lZC1vZmYtYnk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgoKLS0tCkNo
YW5nZXMgaW4gdjU6Ci0gQWRkIOKAnENvLWRldmVsb3BlZC1ieeKAnSB0YWcgZm9yIFhpYW53ZWku
Ci0gQ2hhbmdlIHJ0Y19jbGsgZmxhZ3MgdG8gQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5ULgotIE9w
dGltaXplIHRoZSBtYWNybyBkZWZpbml0aW9ucyBmb3IgY2xvY2sgY29uZmlndXJhdGlvbi4KLSBV
bmlmaWVkIG5hbWluZyBvZiBjbG9jayBwYXJlbnQgcmVsYXRlZCB2YXJpYWJsZXMuCi0gTGluayB0
byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTAyOC1hNS1jbGstdjQtMC1lNjJj
YTBhYWUyNDNAYW1sb2dpYy5jb20KCkNoYW5nZXMgaW4gdjQ6Ci0gZHQtYmluZGluZyBmb3IgcGVy
aXBoZXJhbCBjbG9ja3MgKGtlcHQgUm9i4oCZcyAnUmV2aWV3ZWQtYnknIGhlcmUpOgogIC0gQWRk
ZWQgb3B0aW9uYWwgY2xvY2sgc291cmNlIHJ0YyBwbGwuCiAgLSBSZW5hbWVkIHJ0Y19jbGvigJlz
IGNsa2lkIHRvIGJldHRlciByZWZsZWN0IGl0cyBmdW5jdGlvbi4KLSBQTEwvQ2xvY2sgZHJpdmVy
OgogIC0gQWRhcHRlZCB0byBKZXJvbWXigJlzIHJlZmFjdG9yZWQgZHJpdmVyIGludGVyZmFjZSwg
bmFtaW5nCmNvbnZlbnRpb25zLCBhbmQgbWFjcm9zLgogIC0gVXBkYXRlZCByZWxhdGVkIENPTkZJ
RyBlbnRyaWVzIGluIEtjb25maWcuCi0gQWRkZWQgZHRzIHBhdGNoIG9mIFBMTC9DbG9jay4KLSBM
aW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMTAzLWE1LWNsay12My0w
LWEyMDdjZTgzYjllOUBhbWxvZ2ljLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBSZW5hbWUgeHRhbF8y
NG0gdG8geHRhbCwgYW5kIG1vZGlmeSBzb21lIGRlc2NyaXB0aW9uIG9mIEtjb25maWcuCi0gRHJv
cCBzb21lIGNvbW1lbnQgb2YgUExMIHNvdXJjZSBjb2RlLgotIE1vdmUgZGVmaW5pdGlvbiBvZiBB
NV9DTEtfR0FURV9GVyBmcm9tZSBjb21tb24gY29kZSBpbnRvIEE1IHBlcmlwaGVyYWwgc291cmNl
IGNvZGUuCi0gVXNlIGh3IGluc3RlYWQgb2YgbmFtZSB0byBkZXNjcmliZSBwYXJlbnRfZGF0YS4K
LSBNYWtpbmcgU0NNSSBiaW5kaW5nIHRoZSBmaXJzdCB0byBzdWJtaXQuCi0gTGluayB0byB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTEyMC1hNS1jbGstdjItMC0xMjA4NjIxZTk2
MWRAYW1sb2dpYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gTW92ZSBzb21lIHN5cyBjbG9jayBhbmQg
YXhpIGNsb2NrIGZyb20gcGVyaXBoZXJhbCB0byBzY21pIGltcGxldGVtZW50LgotIFJlbW92ZSAg
QVJNX1NDTUlfUFJPVE9DT0wgaW4gS2NvbmZpZyBhbmQgY29ycmVjdCBuYW1lIEE1IGJ1dCBub3Qg
QTQuCi0gQWRkIHR3byBvcHRpb25hbCBjbG9jayBpbnB1dHMgZm9yIHRoZSBwZXJpcGhlcmFsKGRk
ciBwbGwgYW5kIGNsay1tZWFzdXJlKQotIE1ha2Ugc29tZSBjaGFuZ2VzIGFuZCBhZGp1c3RtZW50
cyBhY2NvcmRpbmcgdG8gc3VnZ2VzdGlvbnMuCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDkxNC1hNS1jbGstdjEtMC01ZWUyYzRmMWIwOGNAYW1sb2dpYy5jb20K
Ci0tLQpDaHVhbiBMaXUgKDgpOgogICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBbWxvZ2lj
IEE1IFNDTUkgY2xvY2sgY29udHJvbGxlciBzdXBwb3J0CiAgICAgIGR0LWJpbmRpbmdzOiBjbG9j
azogQWRkIEFtbG9naWMgQTUgUExMIGNsb2NrIGNvbnRyb2xsZXIKICAgICAgZHQtYmluZGluZ3M6
IGNsb2NrOiBBZGQgQW1sb2dpYyBBNSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyCiAgICAg
IGNsazogYW1sb2dpYzogQWRkIEE1IFBMTCBjbG9jayBjb250cm9sbGVyIGRyaXZlcgogICAgICBj
bGs6IGFtbG9naWM6IEFkZCBBNSBjbG9jayBwZXJpcGhlcmFscyBjb250cm9sbGVyIGRyaXZlcgog
ICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIHNjbWktY2xrIG5vZGUKICAgICAgYXJt
NjQ6IGR0czogYW1sb2dpYzogQTU6IEFkZCBQTEwgY29udHJvbGxlciBub2RlCiAgICAgIGFybTY0
OiBkdHM6IGFtbG9naWM6IEE1OiBBZGQgcGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIG5vZGUK
CiAuLi4vY2xvY2svYW1sb2dpYyxhNS1wZXJpcGhlcmFscy1jbGtjLnlhbWwgICAgICAgICB8IDEz
NCArKysrCiAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1wbGwtY2xrYy55YW1sICAgICAg
ICB8ICA2MyArKwogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaSAg
ICAgICAgfCAgODYgKysrCiBkcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyNyArCiBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2Nsay9tZXNvbi9hNS1wZXJpcGhlcmFscy5j
ICAgICAgICAgICAgICAgICB8IDc5NiArKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvY2xr
L21lc29uL2E1LXBsbC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDc4ICsrKysrKysrKysr
KysKIC4uLi9jbG9jay9hbWxvZ2ljLGE1LXBlcmlwaGVyYWxzLWNsa2MuaCAgICAgICAgICAgIHwg
MTMyICsrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1wbGwtY2xrYy5o
ICAgIHwgIDI0ICsKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1zY21pLWNs
a2MuaCAgIHwgIDQ0ICsrCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNzg2IGluc2VydGlvbnMoKykKLS0t
CmJhc2UtY29tbWl0OiBmMGI5ZDhlYjk4ZGZlZThkMDA0MTlhYTA3NTQzYmRjMmMxYTQ0ZmIxCmNo
YW5nZS1pZDogMjAyNDA5MTEtYTUtY2xrLTM1YzQ5YWNiMzRlMQoKQmVzdCByZWdhcmRzLAotLSAK
Q2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
