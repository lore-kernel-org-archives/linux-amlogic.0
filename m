Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F03CD98EE
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYxDMk7tDCgBFc/91cUVaTImbdkAgtpfvRRfJnzU+Hc=; b=eHzVk8SoFMxFU3
	rOPoQJN2zTnv4sC22a/1OE9B91prNkDl1eJMM4vFFtAC76ns/TqK9BQ+S3VFAD5ixUaf+1zqI4+ne
	Vce8itKMOdDb6xukR2pER6JQdr/NlDUHGKOTFV3p449rapUXjf3vzn06u42dxnW+tJASHVbnmg0Jk
	VQej1tFutHZvNHWxOSXTrZGpgTEvYoQvHRqzI3yfiMsawt0R7ljOIIvLhScu6k2juYMs2Q8rJewcZ
	DepJmY2CzDPR0RP5mmm2gcoqyLkVcA6uX5/8jJ/zLHUlT+xb+0PQToUsdjCeen5NPPM5FIOPNBA21
	NsfK7tocBmUySbkY1BaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkgT-0000000GpCN-1Wr8;
	Wed, 17 Jun 2026 07:27:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkgR-0000000GpCD-3vGQ
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 922B643218;
	Wed, 17 Jun 2026 07:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFB61F00A3A;
	Wed, 17 Jun 2026 07:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781681255;
	bh=RFFMRNrDpr63REMYhT+UeN5XZg5St62F9FzMJ11+wag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9/LhKoamHwEu1prbA9qSzOmp7JY7GHRT7Qw9I6MaNWfxBPdAUMXFMZIzVgbsciRL
	 S9Zytq8/wTUnWAFlRXT0kTQYu85pPWoEW/NYm2rysKRHsQrICKuFo4F5agzJns2aRE
	 zvFdBg3mHT+h4Q4rvVC3nffqUzTA5AhwSwtSQHEFIaddS5aBU/NyHKslUMxM4ykQn/
	 xKVLcjFBVcxmF4xFpoTKEOW0xW5cDkASdK35ulPRnCm++7VFUJxviPz9PY8MUqKCpt
	 xonYau9Nia+7B0bXvYQ9w9x5JSjDenvPd38Lp/neB0peSqm9xc0+hEeCtlap7iDSiM
	 XxX50OpANPU8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260617071604.635627-5-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
 <20260617071604.635627-5-jerrysteve1101@gmail.com>
Date: Wed, 17 Jun 2026 07:27:34 +0000
Message-Id: <20260617072734.9BFB61F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBJbmNvbXBsZXRlIGZlYXR1cmUgZW5hYmxlbWVudCBjYXVzaW5nIHBlcm1hbmVudCBw
cm9iZSBkZWZlcnJhbCBmb3IgUENJZSBmdW5jdGlvbmFsaXR5LgotLQoKY29tbWl0IDIwMjM0OTAy
NGI1ODNkYzg3NDE1NWNlODEyZmI2NThkZGJhYjYyMjgKQXV0aG9yOiBKdW4gWWFuIDxqZXJyeXN0
ZXZlMTEwMUBnbWFpbC5jb20+Cgphcm02NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1heGctczQwMDog
RW5hYmxlIHBjaWVfcGh5CgpUaGlzIGNvbW1pdCBlbmFibGVzIHRoZSBwY2llX3BoeSBub2RlIGZv
ciB0aGUgQW1sb2dpYyBtZXNvbi1heGcgczQwMCBib2FyZApkZXZpY2UgdHJlZSB0byBzdXBwb3J0
IFBDSWUgZnVuY3Rpb25hbGl0eS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1heGctczQwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tYXhnLXM0MDAuZHRzCj4gaW5kZXggMjg1YzZhYzFkZDYxMy4uN2JhMjQ5Y2MzZDU2OSAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLXM0MDAu
ZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1zNDAwLmR0
cwo+IEBAIC00NDgsNiArNDQ4LDEwIEBAICZwY2llQiB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4g
IH07Cj4gIAo+ICsmcGNpZV9waHkgewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICt9OwoKW1NldmVy
aXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGlu
Y29tcGxldGUgZW5hYmxlbWVudCBjYXVzZSBhCnBlcm1hbmVudCBwcm9iZSBkZWZlcnJhbD8KClRo
ZSBhbWxvZ2ljLGF4Zy1wY2llLXBoeSBkcml2ZXIgdW5jb25kaXRpb25hbGx5IGNhbGxzIGRldm1f
cGh5X2dldChkZXYsCiJhbmFsb2ciKSBkdXJpbmcgcHJvYmUuIFRoaXMgbWFwcyB0byB0aGUgbWlw
aV9wY2llX2FuYWxvZ19kcGh5IG5vZGUgaW4KbWVzb24tYXhnLmR0c2ksIHdoaWNoIGlzIHNldCB0
byBkaXNhYmxlZCBieSBkZWZhdWx0OgoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWF4Zy5kdHNpOgptaXBpX3BjaWVfYW5hbG9nX2RwaHk6IHBoeSB7Cgljb21wYXRpYmxlID0gImFt
bG9naWMsYXhnLW1pcGktcGNpZS1hbmFsb2ctcGh5IjsKCSNwaHktY2VsbHMgPSA8MD47CglzdGF0
dXMgPSAiZGlzYWJsZWQiOwp9OwoKU2luY2UgbWlwaV9wY2llX2FuYWxvZ19kcGh5IGlzIG5vdCBh
bHNvIG92ZXJyaWRkZW4gdG8gIm9rYXkiIGhlcmUgaW4KbWVzb24tYXhnLXM0MDAuZHRzLCB3b24n
dCBkZXZtX3BoeV9nZXQoKSBwZXJtYW5lbnRseSByZXR1cm4gLUVQUk9CRV9ERUZFUiwKcHJldmVu
dGluZyBwY2llX3BoeSBhbmQgdGhlIGRlcGVuZGVudCBwY2llQS9wY2llQiBub2RlcyBmcm9tIGlu
aXRpYWxpemluZz8KCj4gKwo+ICAmcHdtX2FiIHsKPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgCXBp
bmN0cmwtMCA9IDwmcHdtX2FfeDIwX3BpbnM+OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxNzA3MTYwNC42MzU2MjctMS1qZXJy
eXN0ZXZlMTEwMUBnbWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
