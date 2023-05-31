Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C13C7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRhLc2CqVWZkstdqIOlejqYj1AWcYCKWymmrdZzWZrQ=; b=wZ3CHj65k0OVo1
	Pn54YVr7nZTXW1VOkg2DO8+wydPRTzyi+RbqfDIaNj30qYgzqXJ396zODTHCKq8FmhasDZZ1t/bS3
	93KCSy+3DFpB243rnZkPMyrxEcoe0s/qxbQUweqoaqzy5z+g3/8AhM8pF6JIJ7NpfUVLkBCjnICcU
	3m2WeRDDxF40FnVLCYVEpQfBI//OEM8YmwjFxPcAvzsCBn9KmD7BbEzxA4o+iyKMuOBmDVX0VsJMa
	aSRZHjEOJONZ6qXR2Vq0W/0i3uUU3OjK1jrU+P519f8LmTUp/q5NXwnaypFHGDL5hbllNBS9sZtHv
	mmnlyOuRlBmZzNXT5hkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M8b-0000fe-1d;
	Wed, 31 May 2023 13:45:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M8Y-0000dy-2n;
	Wed, 31 May 2023 13:45:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 699F863BA0;
	Wed, 31 May 2023 13:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291D4C433A8;
	Wed, 31 May 2023 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540714;
	bh=Nf+EEm4yf++Yq1PKdsJm/77YM2mQX2jNhNCV8vtzWGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhYW4Ljm616xR1LVbNf/EdZPi40oDpzuS7VXOsow6qnVhpN4YEpbGwqrrWX2FbjHF
	 rdvkZZ9E8mvDZfcEtSovH1+IGEhSdouCIT4v8NHv+qGA+BAi/5Al/9uCptl7mlKOBJ
	 OM4w3s7NX9Tm/hheUcR87goLYb1o7FguD533P2ThK6EwHFONWHFBqLtuna4mpzHPOd
	 NFVeenmFww3jtpxST3hSLZfWlSZ29uew8loEJlLEWwaivZ7B+3j0zlkFYttdozXZCw
	 F4R4q95Npw39RAnS3eFUYpDOq1BpoosoFgzPXNEcBA76+WX44gNoZGIfaVEWBfXg1L
	 eZnlSq6t3AviQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 08/17] irqchip/meson-gpio: Mark OF related data as maybe unused
Date: Wed, 31 May 2023 09:44:52 -0400
Message-Id: <20230531134502.3384828-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134502.3384828-1-sashal@kernel.org>
References: <20230531134502.3384828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_064514_979889_674BBA74 
X-CRM114-Status: GOOD (  14.09  )
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

RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PgoKWyBVcHN0cmVhbSBjb21taXQgMTQxMzAyMTFiZTUzNjZhOTFlYzA3YzMyODRjMTgzYjc1ZDhm
YmExNyBdCgpUaGUgZHJpdmVyIGNhbiBiZSBjb21waWxlIHRlc3RlZCB3aXRoICFDT05GSUdfT0Yg
bWFraW5nIGNlcnRhaW4gZGF0YQp1bnVzZWQ6CgogIGRyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24t
Z3Bpby5jOjE1MzozNDogZXJyb3I6IOKAmG1lc29uX2lycV9ncGlvX21hdGNoZXPigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KCkFja2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA1MTIxNjQ1MDYuMjEyMjY3LTEt
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8u
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKaW5kZXggODI5MDg0YjU2OGZhOC4uZmZkMDNkMjQ4NzM3
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKQEAgLTcwLDcgKzcwLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtZXNvbl9ncGlvX2lycV9wYXJhbXMgc20xX3BhcmFtcyA9IHsKIAkuc3VwcG9y
dF9lZGdlX2JvdGggPSB0cnVlLAogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbWVzb25faXJxX2dwaW9fbWF0Y2hlc1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbWVzb25faXJxX2dwaW9fbWF0Y2hlc1tdIF9fbWF5YmVfdW51c2VkID0gewogCXsg
LmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjgtZ3Bpby1pbnRjIiwgLmRhdGEgPSAmbWVzb244
X3BhcmFtcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjhiLWdwaW8taW50YyIs
IC5kYXRhID0gJm1lc29uOGJfcGFyYW1zIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1l
c29uLWd4YmItZ3Bpby1pbnRjIiwgLmRhdGEgPSAmZ3hiYl9wYXJhbXMgfSwKLS0gCjIuMzkuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
