Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B5CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS+SbuPGI7EKBXrFtSfYimUlaRA+lVjj5e4FFiwxK9o=; b=T+ETlmqTPIqYps
	8rIB1IQRwiZpGoyZOXHfN/NpABJ6Ayuv8K+7+vXTvtF+1ogwoOQuyPq3yLlLao7FNY0t/U3+nRnVO
	fHjRsKZOE6rfo3isyY7Q5mEijE56Q3R1oms+imDR/MTGxW4KAClWkVBiKeCSBhKt0uim6K36gmngk
	GwKP8MvBnW74o2rPPv+hvUkMCFNlILyc/27lHk4YFkEGBlIigRlxnp2WOGWmLL8vf7K5nG+Q0ZZiy
	tKtaJ9K8JReCZHhSelcACHvVdU4s3HpugcErlcNC1hbiy53N59icmWF8ctTJWfkFl1yHtJfJ5ZRUW
	TQ+LXaZRSyxzh6yI0jvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyu9-00000007e5b-2jOC;
	Fri, 29 May 2026 15:13:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyu8-00000007e5T-0i7R
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 15:13:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B2DF605CF;
	Fri, 29 May 2026 15:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13DA1F00893;
	Fri, 29 May 2026 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780067623;
	bh=8kfEqScAplCk6ub4bmSQiLCAy4ZZ21YWmsaJSbrbIRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B2+RcjW6HZWh9c35XgZLvqdQXEm7VIOkf/VcSLw0z4EHJnZBDUEn9RaJ4Lx+SyvxC
	 bzUay1Q22MXFzcX0pPYhoBuvNSI+eog20/z4Zwxnw9Ynk18rmrRQtkV/hpTR9mW9E8
	 DjkuOt4TpNTlIJE7AmNksTSLxw+wiyGQwTaVnlJQrzvwAGTS+OVWmWtGJQJnRq3Ft4
	 2wBtAWFEhq+Oh7EOPfQkdZeHWBfXv+RNihWAA8UpMENL3kZ5EKkASdZ4Rc2Uoa5pB7
	 qx0z4VUpFHtOOs9W7yNjAJ+tckS57EDAK/uYF021uhdtQwT7wqZZi1gXKqGDcXRdyg
	 aWRoAzb+0SUiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
Date: Fri, 29 May 2026 15:13:42 +0000
Message-Id: <20260529151342.E13DA1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBjb21taXQgZW5h
YmxlcyBgJnBjaWVfcGh5YCB0byBzdXBwb3J0IFBDSWUgb24gdGhlIGBtZXNvbi1heGctczQwMGAg
Ym9hcmQsIGJ1dCBmYWlscyB0byBlbmFibGUgaXRzIHJlcXVpcmVkIGFuYWxvZyBQSFkgZGVwZW5k
ZW5jeSBgJm1pcGlfcGNpZV9hbmFsb2dfZHBoeWAsIGxlYXZpbmcgUENJZSBjb21wbGV0ZWx5IG5v
bi1mdW5jdGlvbmFsLgotLQoKY29tbWl0IDY1NWYyNjEzNjJjMjlkYzU2YzE3MjNmMzQ2OWIzMjI4
MWQ4ZmZmYjgKQXV0aG9yOiBKdW4gWWFuIDxqZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+Cgphcm02
NDogZHRzOiBhbWxvZ2ljOiBtZXNvbi1heGctczQwMDogRW5hYmxlIHBjaWVfcGh5CgpUaGlzIGNv
bW1pdCBlbmFibGVzIHBjaWVfcGh5IG9uIHRoZSBtZXNvbi1heGctczQwMCBib2FyZCB0byBzdXBw
b3J0IFBDSWUKZnVuY3Rpb25hbGl0eSwgYXMgaXQgaXMgbm93IGRpc2FibGVkIGJ5IGRlZmF1bHQg
aW4gdGhlIG1lc29uLWF4ZyBkdHNpLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWF4Zy1zNDAwLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1heGctczQwMC5kdHMKPiBpbmRleCAyODVjNmFjMWRkNjEzLi43YmEyNDljYzNkNTY5
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGctczQw
MC5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLXM0MDAu
ZHRzCj4gQEAgLTQ0OCw2ICs0NDgsMTAgQEAgJnBjaWVCIHsKPiAgCXN0YXR1cyA9ICJva2F5IjsK
PiAgfTsKPiAgCj4gKyZwY2llX3BoeSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307CgpbU2V2
ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBub2RlIGFsc28gbmVlZCB0byBlbmFibGUgdGhlIG1pcGlf
cGNpZV9hbmFsb2dfZHBoeSBkZXBlbmRlbmN5PwoKSW4gbWVzb24tYXhnLmR0c2ksIHRoZSBwY2ll
X3BoeSBub2RlIGRlcGVuZHMgb24gbWlwaV9wY2llX2FuYWxvZ19kcGh5IHZpYQp0aGUgcHJvcGVy
dHkgcGh5cyA9IDwmbWlwaV9wY2llX2FuYWxvZ19kcGh5Pi4gQmVjYXVzZSB0aGUgYW5hbG9nIFBI
WSBpcwpkaXNhYmxlZCBieSBkZWZhdWx0LCB0aGUgY29yZSBkcml2ZXIgbW9kZWwgZG9lcyBub3Qg
aW5zdGFudGlhdGUgaXRzIHBsYXRmb3JtCmRldmljZSBhbmQgbm8gUEhZIHByb3ZpZGVyIGlzIHJl
Z2lzdGVyZWQuCgpUaGlzIGNhdXNlcyBkZXZtX3BoeV9nZXQoZGV2LCAiYW5hbG9nIikgdG8gcmV0
dXJuIC1FUFJPQkVfREVGRVIgZHVyaW5nCnRoZSBwcm9iZSBvZiBwY2llX3BoeSwgd2hpY2ggaW4g
dHVybiBjYXVzZXMgdGhlIFBDSWUgY29udHJvbGxlcnMgKHBjaWVBCmFuZCBwY2llQikgdG8gaW5m
aW5pdGVseSBkZWZlciBwcm9iaW5nIGFzIHdlbGwuCgo+ICsKPiAgJnB3bV9hYiB7Cj4gIAlzdGF0
dXMgPSAib2theSI7Cj4gIAlwaW5jdHJsLTAgPSA8JnB3bV9hX3gyMF9waW5zPjsKCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1Mjkx
NDA2MDUuMTA3MDc2NC0xLWplcnJ5c3RldmUxMTAxQGdtYWlsLmNvbT9wYXJ0PTMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
