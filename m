Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593C9C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 18:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7A02082F
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 18:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJeTTI8N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yeey/Uk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7A02082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8b/WJKVDMTlP/cYgNdwRE1NlIPsImDHmN2ETZysZi4=; b=EJeTTI8NkDC+06
	kxR+O/N6sbWXUqAw6uKsEp+UP8/67TAq1auZqXcRlRg4ExSM+FC0e6hTuW2NTyPMmdLGT4E+KHRvj
	2bfL0/2Hw8mjYKTfA7/KNbH05krI5hDEJXXMUUKU7b01poGVp2C6JfLia1wRHZ/EQOSV36ERI9DSM
	DprxKJFNj3tFXcePLDbXgppNZejpSg9zqUAkNt+PWjkzvNcnKqr5ZI1Yv+erLzVf5jbpe1NmPk83X
	AzlB5GplYOQ9bpJOzbuKtgQOy3WirPoR4CIrmB9tzEMpekU9hLsdL3TtGNisDWrEJZ8ujrJ6b2/NY
	A+czZff9Cv+euolg3cVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9D3j-000350-KO; Wed, 27 Mar 2019 18:13:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9D3P-0002pa-Ug
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 18:13:48 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B133217F9;
 Wed, 27 Mar 2019 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553710415;
 bh=JxLXit/T9/yTVJD/bDaWlJaU2Wa8dmz2mtJ5EawYd30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yeey/Uk/3zVW0cq7NgRm5UXuxm7mIGAaQAnrX+iYbBi8xTcGkguh3t0p/mck1rW9t
 UlLHWaMjgfzKMjT5f+F8bvUlTMx7y24sQvXVxa7GvVhIaM9IS18zjZtgkHT8g5ptxd
 Q3Bv4It+rlwW0VKWib3FiWZ+q0NI5s6sRp1E+FrQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 108/192] ARM: dts: meson8b: fix the Ethernet data
 line signals in eth_rgmii_pins
Date: Wed, 27 Mar 2019 14:09:00 -0400
Message-Id: <20190327181025.13507-108-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190327181025.13507-1-sashal@kernel.org>
References: <20190327181025.13507-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_111336_023300_085BB1BE 
X-CRM114-Status: GOOD (  13.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDI5ZjAwMjNkMDFmMDYzZmVhY2ZjNDA0ZjA0NDY5MDVh
ZWU0ZjgyZWUgXQoKQWNjb3JkaW5nIHRvIHRoZSBPZHJvaWQtQzErIHNjaGVtYXRpY3MgdGhlIEV0
aGVybmV0IFRYRDEgc2lnbmFsIGlzCnJvdXRlZCB0byBHUElPSF81IGFuZCB0aGUgVFhEMCBzaWdu
YWwgaXMgcm91dGVkIHRvIEdQSU9IXzYuClRoZSBwdWJsaWMgUzgwNSBkYXRhc2hlZXQgc2hvd3Mg
dGhhdCBUWEQwIGNhbiBiZSByb3V0ZWQgdG8gRElGXzJfUCBhbmQKVFhEMSBjYW4gYmUgcm91dGVk
IHRvIERJRl8yX04gaW5zdGVhZC4KClRoZSBwaW4gZ3JvdXBzIGV0aF90eGQwXzAgKEdQSU9IXzYp
IGFuZCBldGhfdHhkMF8xIChESUZfMl9QKSBhcmUgYm90aApjb25maWd1cmVkIGFzIEV0aGVybmV0
IFRYRDAgYW5kIFRYRDEgZGF0YSBsaW5lcyBpbiBtZXNvbjhiLmR0c2kuIEF0IHRoZQpzYW1lIHRp
bWUgZXRoX3R4ZDFfMCAoR1BJT0hfNSkgYW5kIGV0aF90eGQxXzEgKERJRl8yX04pIGFyZSBjb25m
aWd1cmVkCmFzIFRYRDAgYW5kIFRYRDEgZGF0YSBsaW5lcyBhcyB3ZWxsLgpUaGlzIHJlc3VsdHMg
aW4gYSBiYWQgRXRoZXJuZXQgcmVjZWl2ZSBwZXJmb3JtYW5jZS4gUHJlc3VtYWJseSB0aGlzIGlz
CmR1ZSB0byB0aGUgZXRoX3R4ZDAgYW5kIGV0aF90eGQxIHNpZ25hbCBiZWluZyByb3V0ZWQgdG8g
dGhlIHdyb25nIHBpbnMuCkFzIGEgcmVzdWx0IG9mIHRoYXQgZGF0YSBjYW4gb25seSBiZSB0cmFu
c21pdHRlZCBvbiBldGhfdHhkMiBhbmQKZXRoX3R4ZDMuIEhvd2V2ZXIsIEkgaGF2ZSBubyBzY29w
ZSB0byBmdWxseSBjb25maXJtIHRoaXMgYXNzdW1wdGlvbi4KClRoZSB2ZW5kb3IgdS1ib290IHNv
dXJjZXMgZm9yIE9kcm9pZC1DMSB1c2UgdGhlIGZvbGxvd2luZyBFdGhlcm5ldApwaW5tdXggY29u
ZmlndXJhdGlvbjoKICBTRVRfQ0JVU19SRUdfTUFTSyhQRVJJUEhTX1BJTl9NVVhfNiwgMHgzZjRm
KTsKICBTRVRfQ0JVU19SRUdfTUFTSyhQRVJJUEhTX1BJTl9NVVhfNywgMHhmMDAwMDApOwpUaGlz
IHRyYW5zbGF0ZXMgdG8gdGhlIGZvbGxvd2luZyBwaW4gZ3JvdXBzIGluIHRoZSBtYWlubGluZSBr
ZXJuZWw6Ci0gcmVnaXN0ZXIgNiBiaXQgIDA6IGV0aF9yeGQxIChESUZfMF9QKQotIHJlZ2lzdGVy
IDYgYml0ICAxOiBldGhfcnhkMCAoRElGXzBfTikKLSByZWdpc3RlciA2IGJpdCAgMjogZXRoX3J4
X2R2IChESUZfMV9QKQotIHJlZ2lzdGVyIDYgYml0ICAzOiBldGhfcnhfY2xrIChESUZfMV9OKQot
IHJlZ2lzdGVyIDYgYml0ICA2OiBldGhfdHhfZW4gKERJRl8zX1ApCi0gcmVnaXN0ZXIgNiBiaXQg
IDg6IGV0aF9yZWZfY2xrIChESUZfM19OKQotIHJlZ2lzdGVyIDYgYml0ICA5OiBldGhfbWRjIChE
SUZfNF9QKQotIHJlZ2lzdGVyIDYgYml0IDEwOiBldGhfbWRpb19lbiAoRElGXzRfTikKLSByZWdp
c3RlciA2IGJpdCAxMTogZXRoX3R4X2NsayAoR1BJT0hfOSkKLSByZWdpc3RlciA2IGJpdCAxMjog
ZXRoX3R4ZDIgKEdQSU9IXzgpCi0gcmVnaXN0ZXIgNiBiaXQgMTM6IGV0aF90eGQzIChHUElPSF83
KQotIHJlZ2lzdGVyIDcgYml0IDIwOiBldGhfdHhkMF8wIChHUElPSF82KQotIHJlZ2lzdGVyIDcg
Yml0IDIxOiBldGhfdHhkMV8wIChHUElPSF81KQotIHJlZ2lzdGVyIDcgYml0IDIyOiBldGhfcnhk
MyAoRElGXzJfUCkKLSByZWdpc3RlciA3IGJpdCAyMzogZXRoX3J4ZDIgKERJRl8yX04pCgpEcm9w
IHRoZSBldGhfdHhkMF8xIGFuZCBldGhfdHhkMV8xIGdyb3VwcyBmcm9tIGV0aF9yZ21paV9waW5z
IHRvIGZpeCB0aGUKRXRoZXJuZXQgdHJhbnNtaXQgcGVyZm9ybWFuY2Ugb24gT2Ryb2lkLUMxLiBB
bHNvIGFkZCB0aGUgZXRoX3J4ZDIgYW5kCmV0aF9yeGQzIGdyb3VwcyBzbyB3ZSBkb24ndCByZWx5
IG9uIHRoZSBib290bG9hZGVyIHRvIHNldCB0aGVtIHVwLgoKaXBlcmYzIHN0YXRpc3RpY3MgYmVm
b3JlIHRoaXMgY2hhbmdlOgotIHRyYW5zbWl0dGluZyBmcm9tIE9kcm9pZC1DMTogNzQxIE1iaXRz
L3NlYyAoMCByZXRyaWVzKQotIHJlY2VpdmluZyBvbiBPZHJvaWQtQzE6IDE5OSBNYml0cy9zZWMg
KDE3MTMgcmV0cmllcykKCmlwZXJmMyBzdGF0aXN0aWNzIGFmdGVyIHRoaXMgY2hhbmdlOgotIHRy
YW5zbWl0dGluZyBmcm9tIE9kcm9pZC1DMTogNjY3IE1iaXRzL3NlYyAoMCByZXRyaWVzKQotIHJl
Y2VpdmluZyBvbiBPZHJvaWQtQzE6IDc1MCBNYml0cy9zZWMgKDAgcmV0cmllcykKCkZpeGVzOiBi
OTY0NDY1NDFkODM5MCAoIkFSTTogZHRzOiBtZXNvbjhiOiBleHRlbmQgZXRoZXJuZXQgY29udHJv
bGxlciBkZXNjcmlwdGlvbiIpClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkNjOiBFbWlsaWFubyBJbmdyYXNzaWEg
PGluZ3Jhc3NpYUBlcGlnZW5lc3lzLmNvbT4KQ2M6IExpbnVzIEzDvHNzaW5nIDxsaW51cy5sdWVz
c2luZ0BjMGQzLmJsdWU+ClRlc3RlZC1ieTogRW1pbGlhbm8gSW5ncmFzc2lhIDxpbmdyYXNzaWFA
ZXBpZ2VuZXN5cy5jb20+ClJldmlld2VkLWJ5OiBFbWlsaWFubyBJbmdyYXNzaWEgPGluZ3Jhc3Np
YUBlcGlnZW5lc3lzLmNvbT4KU2lnbmVkLW9mZi1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJh
eWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaSB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIu
ZHRzaQppbmRleCAwOGY3ZjZiZTcyNTQuLjViM2U1YzUwYzcyZiAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvbWVzb244Yi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIu
ZHRzaQpAQCAtMjA3LDkgKzIwNyw3IEBACiAJCQkJZ3JvdXBzID0gImV0aF90eF9jbGsiLAogCQkJ
CQkgImV0aF90eF9lbiIsCiAJCQkJCSAiZXRoX3R4ZDFfMCIsCi0JCQkJCSAiZXRoX3R4ZDFfMSIs
CiAJCQkJCSAiZXRoX3R4ZDBfMCIsCi0JCQkJCSAiZXRoX3R4ZDBfMSIsCiAJCQkJCSAiZXRoX3J4
X2NsayIsCiAJCQkJCSAiZXRoX3J4X2R2IiwKIAkJCQkJICJldGhfcnhkMSIsCkBAIC0yMTgsNyAr
MjE2LDkgQEAKIAkJCQkJICJldGhfbWRjIiwKIAkJCQkJICJldGhfcmVmX2NsayIsCiAJCQkJCSAi
ZXRoX3R4ZDIiLAotCQkJCQkgImV0aF90eGQzIjsKKwkJCQkJICJldGhfdHhkMyIsCisJCQkJCSAi
ZXRoX3J4ZDMiLAorCQkJCQkgImV0aF9yeGQyIjsKIAkJCQlmdW5jdGlvbiA9ICJldGhlcm5ldCI7
CiAJCQl9OwogCQl9OwotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
