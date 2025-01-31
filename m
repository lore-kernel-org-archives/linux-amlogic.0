Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B601C0218F
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jan 2025 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i8zXSYmHmKZ4i/1ZMI0b74qW2xf9vJYBts1/LtxKhgk=; b=opiV6IOnXNPBcV
	Jly8pfGQHMRUOumzFpM/UFu1ZHGqmpEujofqaT/IdUOykNU68y3tDeS22QX9ZrpVdG/JAtDPpP5wW
	PUFf5pULLFcQfSf4ENby1JVCYYvsaMrL1R3vturCJDY602S0gV15cR0WJ4DhJMDFayHI1hYY09mP2
	Qwm7abGhrzQ2Ah51c8R1dC7yaL0XyCvHDAqDkHmLqrUkO4lQcuSUGoMMJa0p6GzgCaMwKj+IOWUDc
	MpGOGqON3j9oLb428aCeWyx7ygq4/52JgyF51lbce1ewjFJGpoCRllZKyIcev0fzduzW9Z14mXCAV
	Ek6xGre0DG971pUTs7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGZ-0000000BLNe-3she;
	Fri, 31 Jan 2025 20:05:27 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGW-0000000BLNG-3A6O
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jan 2025 20:05:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5H6l7E3aEB09Gr5Jf/JwrLVFXYb4G8ESjD4h4tWwSZ8=;
	b=louedIrhltO6zW6cURWyNiMUL7cviQQgu9NZtF/LIhyyvvEmkSV/hFPwaeBQy9obxK0YQk
	yZCCtF8i8eAi+qWv88jwnm4ciwmP6IBHJ+HD38ujpcKUHhEXNq3NBCNIGzhpCYoISEc+5Q
	5Hn8fzD2sYYXh1Y2aS8VQdX6iCkMzX3ex7IxFf+v3f8GGEPBHgLw3pLh/YRDp0RUBka81u
	/NXIlDw+lqYh0chABIANQyKzZ1Bwq5TRhCSB51JFqKHnFDnqMBJ+qEVVIBabxFdAtX7ivf
	DRnmDvaESEw9eaWr8arXbXJdETroANgev8G6V2H5osolpftI2DrLub3k6cvKQQ==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:17 +0000
Message-ID: <20250131200319.19996-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_120525_352419_0454B164 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogRmVyYXNzIEVswqBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+CgpU
aGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBYaWFv
bWkgTWkgVFYKU3RpY2suCgpYaWFvbWkgTWkgVFYgU3RpY2sgaXMgYSBzbWFsbCBBbWxvZ2ljLWJh
c2VkIEFuZHJvaWQgVFYgc3RpY2sgcmVsZWFzZWQgaW4gCjIwMjAsIGFuZCBrbm93biBhcyBgeGlh
b21pLWFxdWFtYW5gIGludGVybmFsbHkgKGluIHRoZSBkb3duc3RyZWFtIGtlcm5lbCwKdS1ib290
LCAuLi4pCkl0cyBzcGVjaWZpY2F0aW9ucyBhcmUgYXMgZm9sbG93czoKICogQW1sb2dpYyBTODA1
WSBTb0MgKGJlbGlldmVkIHRvIGJlIG1vc3RseSBpZGVudGljYWwgdG8gUzgwNVgpCiAqIDggR0Ig
ZU1NQwogKiAxIEdCIG9mIFJBTQogKiBBbmRyb2lkIFRWIDksIHVwZ3JhZGFibGUgdG8gQW5kcm9p
ZCBUViAxMAoKVGhlcmUgYXJlIG11bHRpcGxlIHZhcmlhbnRzOgogKiAxLiBHcmVlbiBQQ0IsIG1h
bnVmYWN0dXJlZCBpbiAyMDIwLCBrbm93biBVQVJUIHBpbm91dCAoaGVscGZ1bGx5IAogICBsYWJl
bGVkIG9uIHRoZSBib2FyZCkKICogMi4gQmx1ZSBQQ0IsIG5vdCBtdWNoIGRvY3VtZW50YXRpb24g
YWJvdXQgaXQsIHByZXN1bWFibHkgbWFudWZhY3R1cmVkCiAgIGJldHdlZW4gMjAyMSBhbmQgMjAy
MwogKiAzLiBHcmVlbiBQQ0IsIG1hbnVmYWN0dXJlZCBpbiAyMDIzLCBrbm93biBVQVJUIHBpbm91
dCwgc29tZSBsYXlvdXQKICAgY2hhbmdlcyBjb21wYXJlZCB0byB0aGUgMjAyMCB2YXJpYW50CgpB
bW9uZyB0aGVzZSB2YXJpYW50cywgdGhlcmUgYXJlIG1hbnkgYm9hcmRzIHVzaW5nIG11bHRpcGxl
IGRpZmZlcmVudApXaS1GaSBjaGlwcy4gIFN1cHBvcnRpbmcgYWxsIG9mIHRoZW0gaXMgb3V0IG9m
IHNjb3BlIGZvciB0aGlzIHBhdGNoCnNlcmllcy4KCkFzIG9mIHRoZSB0aW1lIG9mIHdyaXRpbmcg
dGhpcyBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiB0aGUgM3JkIHZhcmlhbnQuCkl0IGlzIGJlbGll
dmVkIHRoYXQgc29mdHdhcmUtd2lzZSBhbGwgdGhyZWUgd29yayBtb3N0bHkgdGhlIHNhbWUgKGlm
IHdlIApkb24ndCBjb3VudCBXaS1GaSksIGJ1dCB0ZXN0aW5nIG9uIHRoZSBvdGhlciB2YXJpYW50
cyB3b3VsZCBzdGlsbCBiZQphcHByZWNpYXRlZC4KClRoZSBkZXZpY2V0cmVlIGlzIGJhc2VkIG9u
IHRoZSBBbWxvZ2ljIFAyNDEgRFRTLgoKRmVyYXNzIEVswqBIYWZpZGkgKDIpOgogIGR0LWJpbmRp
bmdzOiBhcm06IGFtbG9naWM6IGFkZCBYaWFvbWkgTWkgVFYgU3RpY2sKICBhcm02NDogZHRzOiBh
bWxvZ2ljOiBhZGQgc3VwcG9ydCBmb3IgeGlhb21pLWFxdWFtYW4vTWkgVFYgU3RpY2sKCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sICAgICAgfCAgIDEgKwogYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAgIHwgICAxICsKIC4uLi9tZXNv
bi1neGwtczgwNXkteGlhb21pLWFxdWFtYW4uZHRzICAgICAgICB8IDMxMSArKysrKysrKysrKysr
KysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzEzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM4MDV5LXhpYW9taS1h
cXVhbWFuLmR0cwoKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
