Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C555DCD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uxw58Eri+S4cqCeGH3RcyTUatKKtH+IIGMZAwwZh/qg=; b=b3nsd3T4qIhOOa
	Y7gBdgvEZv2YvS7td3VIQQhMoK0gj/AwTS/sm/7QEG8XVQ056Qw1hKpj46kIU9SLwLB/IKclI7px7
	2XqMGKV3+kOhThpyH8h5LRA54rtYRWTtL9hpUrLXjRvitYFj8fG1DhjsW/T89Fm4+TFEsY9xuD7as
	FJzVcVFJTzQwz0H+izljMfIvuwaKWmD4M+bW73f0Kq49HqYKmHr8gPdQqJDrQS3LVXct64OG+zwNX
	ZyWBWEWdGAh/Lq/k0HpC5aDcLuXJGQ/e14eOQBa599WbO43K8JxVYgsBJk3hHIrJuI/Xn7hw+e5D/
	fBXahCevNNdP4Jq4G4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlim-0000000GtI5-1Z4F;
	Wed, 17 Jun 2026 08:34:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlik-0000000GtHy-2TET
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:34:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD01541B2F;
	Wed, 17 Jun 2026 08:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8777A1F000E9;
	Wed, 17 Jun 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781685241;
	bh=tNMwyhx1Twibc9O3/WU7J/9P3UrJtpBu+ItQtrbxyyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UNqZDD9ws74UyAKdwiW1djrzWUBbd4j4A01HhIZXEx7Yuaus/FZOfTQ3Jrycv2CLP
	 9XeYX0u2smST+8kEIxJWTjbz8TxXAhwXPALV69YxSakZDc0/9KgSBpaKhEC88doeDi
	 nPV17bEDXTXcN9TuLbcJ5BxVAzawKTYhbFvrCVjB1gPbBtYpWIElCTKllFGuG9Z1Ow
	 XWtrWTpesLiUysYhzU/eNTpaRMzILNjxJ4EdpGScTmV0xPIUM9SuaCQW10wib8M2on
	 tECvAXW2XGR3oIkgJfCOiGubyVcme1QdhuAeKEOt6AzE85YONGmd46LhQKxqZtDUXL
	 PjUQlNxcu4dIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260617082239.645562-4-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
 <20260617082239.645562-4-jerrysteve1101@gmail.com>
Date: Wed, 17 Jun 2026 08:34:00 +0000
Message-Id: <20260617083401.8777A1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBFbmFibGluZyBgcGNpZV9waHlgIG9uIGBtZXNvbi1heGctczQwMC5kdHNgIGlzIGlu
c3VmZmljaWVudCB0byBzdXBwb3J0IFBDSWUgZnVuY3Rpb25hbGl0eSBiZWNhdXNlIGl0cyBoYXJk
d2FyZSBkZXBlbmRlbmN5IGBtaXBpX3BjaWVfYW5hbG9nX2RwaHlgIHJlbWFpbnMgZGlzYWJsZWQu
Ci0tCgpjb21taXQgY2Q5NGQwNjk2OWU5ZjlhMjNlYTMxOWY0MDZiOGU4NmU4ZWQ5ZWM0NApBdXRo
b3I6IEp1biBZYW4gPGplcnJ5c3RldmUxMTAxQGdtYWlsLmNvbT4KCmFybTY0OiBkdHM6IGFtbG9n
aWM6IG1lc29uLWF4ZzogRGlzYWJsZSBwY2llX3BoeSBub2RlIGJ5IGRlZmF1bHQKClRoaXMgcGF0
Y2ggZGlzYWJsZXMgdGhlIHBjaWVfcGh5IG5vZGUgYnkgZGVmYXVsdCBpbiB0aGUgbWVzb24tYXhn
IGR0c2kgZmlsZQp0byBzdXBwcmVzcyBkZWZlcnJlZCBwcm9iZSB3YXJuaW5ncyBvbiBib2FyZHMg
dGhhdCBkbyBub3QgdXNlIGl0LiBJdCB0aGVuCmV4cGxpY2l0bHkgZW5hYmxlcyBwY2llX3BoeSBp
biB0aGUgbWVzb24tYXhnLXM0MDAgYm9hcmQgZGV2aWNlIHRyZWUgdG8KcHJlc2VydmUgaXRzIFBD
SWUgZnVuY3Rpb25hbGl0eS4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1heGctczQwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tYXhnLXM0MDAuZHRzCj4gaW5kZXggMjg1YzZhYzFkZDYxMy4uN2JhMjQ5Y2MzZDU2OSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLXM0MDAuZHRz
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1zNDAwLmR0cwoK
WyAuLi4gXQoKPiBAQCAtNDQ4LDYgKzQ0OCwxMCBAQCAmcGNpZUIgewo+ICAJc3RhdHVzID0gIm9r
YXkiOwo+ICB9Owo+ICAKPiArJnBjaWVfcGh5IHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGlzIGl0
IHN1ZmZpY2llbnQgdG8gb25seSBlbmFibGUgcGNpZV9waHkKdG8gcmVzdG9yZSBQQ0llIGZ1bmN0
aW9uYWxpdHkgb24gdGhlIHM0MDAgYm9hcmQ/CgpUaGUgcGNpZV9waHkgbm9kZSBkZXBlbmRzIG9u
IHRoZSBtaXBpX3BjaWVfYW5hbG9nX2RwaHkgYW5hbG9nIFBIWSB2aWEgaXRzCnBoeXMgcHJvcGVy
dHkuIExvb2tpbmcgYXQgbWVzb24tYXhnLmR0c2ksIG1pcGlfcGNpZV9hbmFsb2dfZHBoeSBpcyBk
aXNhYmxlZApieSBkZWZhdWx0OgoKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4
Zy5kdHNpOgogICAgbWlwaV9wY2llX2FuYWxvZ19kcGh5OiBwaHkgewogICAgICAgIGNvbXBhdGli
bGUgPSAiYW1sb2dpYyxheGctbWlwaS1wY2llLWFuYWxvZy1waHkiOwogICAgICAgICNwaHktY2Vs
bHMgPSA8MD47CiAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKICAgIH07CgpJZiB0aGUgYW5h
bG9nIFBIWSBpcyBub3QgYWxzbyBvdmVycmlkZGVuIHRvICJva2F5IiBoZXJlIGluIG1lc29uLWF4
Zy1zNDAwLmR0cywKd2lsbCB0aGUgYW5hbG9nIFBIWSBkcml2ZXIgZmFpbCB0byBwcm9iZSwgY2F1
c2luZyBkZXZtX3BoeV9nZXQoZGV2LCAiYW5hbG9nIikKaW4gdGhlIHBjaWVfcGh5IGRyaXZlciB0
byBjb250aW51YWxseSByZXR1cm4gLUVQUk9CRV9ERUZFUj8KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTcwODIyMzkuNjQ1NTYy
LTEtamVycnlzdGV2ZTExMDFAZ21haWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
