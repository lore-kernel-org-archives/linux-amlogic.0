Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2829AC7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT9UlIEWPAMMFqaYLB8gvdxUPQVNhJnoEAT1ZwzJ+WQ=; b=HOQCEnXCyve9bc
	gs+3gjehOWOmhE8not1GBAZ0fI80J06Hx/PbaXpcKEI3s7Y5aW+Bo87cPdcIQvEnP6hKk8zdglJes
	cwRxT9gQ3b16S/FBtPkJysviJeorI1RWj0lcsLG5cNvn9ilr2b9aVXu40woZmhCm6LcjoVa0pA352
	0Nxb13CVWXgmpsy7TTiMB/UMR3BfLHrJDraPA7LzQ1fAQBOJJxE7FxvpHbh1gftIgNZeRxb3lgtIy
	7+xfIKaCmDrQtxPvBdV51iPkxw/6TnYqdhAd4eXMpAbFBaA4HiYij8wQH5vhjDeRapiWcfI5yLjy8
	GXYT1JygCcuEGn1+G9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M9C-0000wb-2I;
	Wed, 31 May 2023 13:45:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4M99-0000uW-0b;
	Wed, 31 May 2023 13:45:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBCA363B60;
	Wed, 31 May 2023 13:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AD7C4339E;
	Wed, 31 May 2023 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540750;
	bh=ZSnVp4a4e+iHgVyv368Tui9Sw5ExoFu7ZROVjxxXJS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2qDa1TH+/j5oJ1YM+8CEnRvwjn7KfZjmXECxEUfY3CaNDExS11GePQGWICBx6I9Q
	 bs8cx94k3VQ+HT7/cE87ya1hCALkgEBhsdg7AYejC7JHl894U6uX6ohFiK8lwJ+kEP
	 VVMWuJlJgCP7oWpz/hwakJskQ2r/IamlfhrAu6uUQliXrw4vpA53DovENFOLs4eTIW
	 qGrHh+0gXYqMWiKvnQIEOzGyKmfDNxCJWC4tsXJ60DVifBd/pI+346B378Cpai4klF
	 znNJq2TioPOGGJm7u1BIdWm+oNC2iFAc1x+7ZnIrYIKrjdQoe21GrQifRTCX6iuGSy
	 gYLi7s/300KuA==
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
Subject: [PATCH AUTOSEL 4.19 06/13] irqchip/meson-gpio: Mark OF related data as maybe unused
Date: Wed, 31 May 2023 09:45:34 -0400
Message-Id: <20230531134541.3385043-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134541.3385043-1-sashal@kernel.org>
References: <20230531134541.3385043-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_064551_295998_53FF3BBB 
X-CRM114-Status: GOOD (  13.49  )
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
cnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKaW5kZXggNzU5OWIxMGVjZjA5ZC4uZGNiMjJmMjUzOWVm
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtZXNvbl9ncGlvX2lycV9wYXJhbXMgYXhnX3BhcmFtcyA9IHsKIAkubnJfaHdp
cnEgPSAxMDAsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9p
cnFfZ3Bpb19tYXRjaGVzW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBt
ZXNvbl9pcnFfZ3Bpb19tYXRjaGVzW10gX19tYXliZV91bnVzZWQgPSB7CiAJeyAuY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLG1lc29uOC1ncGlvLWludGMiLCAuZGF0YSA9ICZtZXNvbjhfcGFyYW1zIH0s
CiAJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uOGItZ3Bpby1pbnRjIiwgLmRhdGEgPSAm
bWVzb244Yl9wYXJhbXMgfSwKIAl7IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3hiYi1n
cGlvLWludGMiLCAuZGF0YSA9ICZneGJiX3BhcmFtcyB9LAotLSAKMi4zOS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
