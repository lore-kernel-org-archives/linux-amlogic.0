Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E660C7EE31
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atS3GHIBusgY/RYV5iaq4FhCirbEvx3js7epn01Esuk=; b=Mq6hVFJK2SaGQo
	wboaRZ2f7KE06UODRN4BQxHjUOYWwhLuvhePzMAhsZ+5Kcbqd0XiCNOTTfs0w/wj6aarMbgbkMQVQ
	6Tcl6sdlky7mFD/EzP1qoVmhRlNYjsg03IJmJFxJ8mfhZ6JdYfqAIZEHR6WhbODAjjKyKZJekML0U
	4Zg6XbFFepTRRFLiNg9nO2Q8TzTqnh7y6yzcZfHAmBmP5wf63aqUPgdzlU0BnyPqP7VJq+yxm6+1I
	Jbq34ozaWIkVSiUbwVXUv5yJfcBuBQEPOOtBAgQKY80F34YkgRkaRHnCrPu5R6NfBTeJHngpbfdGO
	NCK4a1xDRy2Jb0wo9tWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M4L-00HZqX-38;
	Wed, 31 May 2023 13:40:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M4B-00HZlq-1U;
	Wed, 31 May 2023 13:40:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D12C63B12;
	Wed, 31 May 2023 13:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F2C43446;
	Wed, 31 May 2023 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540442;
	bh=+Uc/69FxdQG6Cx4lTgPkXnqoeB2Ro0Egv3BZI2vb6mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uetn8Pqca5VUX6gKBltUIG25c8qPIBcl2sHjBlqXv2A1jB9gHx7g8UnJCL8jSFQvd
	 Ntyau8wA+N42Omn9nfYzsdfYI4G1hPCUUvKQKt/Mmu7HOkIB0gJW3V2LdMZJoFdZOq
	 YaKKSidCXhwv982eHTfkh0JsNvPgSqI2h4KOOZkbK/qtidqaCdaeYHykY+K/zDnjJw
	 VdUAS8ZtM4vqzDVjRP2x+oewQZn61roXA9PX8rAAQ60jLRLbWRsjzXraLXNvglWdUo
	 fmGAg296P/oojNIbh+ANlEP18uu588RTzGmlbMUL5NfkFuJ63cegiGb+j4MN8bGSBp
	 LzQqyjyRKGfgw==
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
Subject: [PATCH AUTOSEL 6.3 13/37] irqchip/meson-gpio: Mark OF related data as maybe unused
Date: Wed, 31 May 2023 09:39:55 -0400
Message-Id: <20230531134020.3383253-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134020.3383253-1-sashal@kernel.org>
References: <20230531134020.3383253-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_064043_544227_2A0607ED 
X-CRM114-Status: GOOD (  13.40  )
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
cnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKaW5kZXggMmFhYTlhYWQzZTg3YS4uN2RhMThlZjk1MjEx
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKQEAgLTE1MCw3ICsxNTAsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG1lc29uX2dwaW9faXJxX3BhcmFtcyBzNF9wYXJhbXMgPSB7CiAJSU5JVF9N
RVNPTl9TNF9DT01NT05fREFUQSg4MikKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIG1lc29uX2lycV9ncGlvX21hdGNoZXNbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG1lc29uX2lycV9ncGlvX21hdGNoZXNbXSBfX21heWJlX3VudXNlZCA9IHsK
IAl7IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb244LWdwaW8taW50YyIsIC5kYXRhID0gJm1l
c29uOF9wYXJhbXMgfSwKIAl7IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb244Yi1ncGlvLWlu
dGMiLCAuZGF0YSA9ICZtZXNvbjhiX3BhcmFtcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiYW1sb2dp
YyxtZXNvbi1neGJiLWdwaW8taW50YyIsIC5kYXRhID0gJmd4YmJfcGFyYW1zIH0sCi0tIAoyLjM5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
