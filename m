Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354F606A31E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ipWbBnrf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8+0R5Of
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hZOQoop3XYe5zxL8Cshi4emiG12Tfds2/A1F+CcdMdM=; b=ipWbBnrffq/Y9H6+HzEnc05XhD
	wJM3dXKYz2yILCqUiwoQZ5CcfODJKLnCcGoadFGUBYPTJOBjPFff5X9e3v3/T/WLYUHnYudU/YGhy
	EYNVOvMNvATmin4vgYbnaDf8mjqw6tuA0YMcAi/iCMMpqFQjJrbvlXV2gfZF4ytD376/kcgi3RCZs
	RslNQsSL9997MfFq7YkxE5Ie3qKaMVuMes0nmgGLSmVxmUVKwYM07tr+axJ3sZ3sVmwz1BH96c7zN
	8TX2+0aVQ/mxDzkfp89lTEaLOa/wBrRwyaM6zLsj86TmvJ+yNeV9bBWAOHJwZF5xDvtHqzcWmE2ac
	QVMEmEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1S-0000000Gs4p-317d;
	Fri, 27 Nov 2026 15:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWy1R-0000000Gs4D-13mm;
	Fri, 27 Nov 2026 15:38:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0767541A64;
	Fri, 27 Nov 2026 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088651F0089C;
	Fri, 27 Nov 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793880;
	bh=+WLLtnN2R5M/5/EnMLDzbwynr8R1odsEdwLSn/mSjI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8+0R5OfsFjO33opKrRKuW1ZOsc/GpwUnegecgpgPETJ1eAQbi4bMEmdO6CCD5DuY
	 WI+fpib9/uytV2K/6bysheAhgizkX7WWbIOzQN9lsBQU4HKTcDXwyRdaAO46OEavs2
	 pLzFHiwK+0CvNgWjraziYFUrxdvPMhr3tx8xWQWeCfGQzbBi2KM6xfbp+f+xE9FWmw
	 0bAL1aHQTQ+tKEAwyQIUdNyyUjxQkkZX9KwVKAlnjb/1m9/P9AUsPfSAZT1uyNXOAy
	 Vc20eKYwh5nTmm7urcZ0oDZ0RLjKtFHReVZm7Srid/M8mSg37GMAcodm6wzFh8jD8G
	 psMS6DLs9aqpA==
Message-ID: <sashiko-outbox-237759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] dt-bindings: soc: amlogic:
 meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261127-meson-drm-create-hdmitx-phy-v5-1-88c43eb95468@aliel.fr>
References: <20261127-meson-drm-create-hdmitx-phy-v5-0-88c43eb95468@aliel.fr>
 <20261127-meson-drm-create-hdmitx-phy-v5-1-88c43eb95468@aliel.fr>
Date: Fri, 27 Nov 2026 15:37:59 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IHNvYzog
YW1sb2dpYzogbWlzc2luZyBGaXhlcyB0cmFpbGVycyBmb3IKICBjb25kaXRpb25hbCBtYXRjaGlu
ZyBmaXgKLS0KCmNvbW1pdCAzYTZmODI0OTdhYzhiM2ViNTE4YjE0YzBiZmZlZWMzYjQ0NDdjMGY5
CkF1dGhvcjogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cgo+IGR0
LWJpbmRpbmdzOiBzb2M6IGFtbG9naWM6IG1lc29uLWd4LWhoaS1zeXNjdHJsOiBGaXggY29tcGF0
aWJsZSBtYXRjaGluZyBpbiBjb25kaXRpb25hbHMKPgo+IFRoZSBjb25kaXRpb25hbCBzY2hlbWFz
IHNlbGVjdCBvbiAiY29tcGF0aWJsZSIgd2l0aCBhIGJhcmUgZW51bS4gT24gYQo+IGxpc3Qgc3Vj
aCBhczoKPgo+ICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsIiwg
InN5c2NvbiIsICJzaW1wbGUtbWZkIjsKPgo+IGFuIGVudW0gYXBwbGllZCB0byB0aGUgd2hvbGUg
YXJyYXkgb25seSBtYXRjaGVzIHNpbmdsZS1lbnRyeSBsaXN0cywgc28KPiB0aGUgaWY6IGJsb2Nr
cyBuZXZlciBtYXRjaCBhcyBpbnRlbmRlZCBhbmQgdGhlIHBlci12YXJpYW50IGNvbnN0cmFpbnRz
Cj4gYXJlIG5vdCBhcHBsaWVkIHJlbGlhYmx5Lgo+Cj4gV3JhcCB0aGUgZW51bXMgaW4gImNvbnRh
aW5zIiBzbyB0aGF0IHRoZSBjb25kaXRpb25zIG1hdGNoIG9uIGFueSBlbnRyeQo+IG9mIHRoZSBj
b21wYXRpYmxlIGxpc3QuCj4KPiBEb2luZyBzbyBleHBvc2VzIHRoZSAicGh5IiBjaGlsZCBub2Rl
IG9mICJhbWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsIjoKPiBpdCB3YXMgZm9yYmlkZGVuIChw
aHk6IGZhbHNlKSwgYnV0IHNvbWUgRFQgbGVnaXRpbWF0ZWx5IGRlc2NyaWJlIGFuCj4gImFtbG9n
aWMsZzEyYS1taXBpLWRwaHktYW5hbG9nIiBQSFkgbm9kZSB1bmRlciB0aGlzIHN5c3RlbSBjb250
cm9sbGVyLAo+IHdoaWNoIHJlc3VsdGVkIGluIGR0YnNfY2hlY2sgd2FybmluZ3Mgc3VjaCBhczoK
Pgo+ICAgc3lzdGVtLWNvbnRyb2xsZXJAMCAoYW1sb2dpYyxtZXNvbi1neC1oaGktc3lzY3RybCk6
IEZhbHNlIHNjaGVtYSBkb2VzCj4gICBub3QgYWxsb3cgeydjb21wYXRpYmxlJzogWydhbWxvZ2lj
LGcxMmEtbWlwaS1kcGh5LWFuYWxvZyddLAo+ICAgJyNwaHktY2VsbHMnOiAwLCAuLi59Cj4KPiBB
bGxvdyB0aGUgcGh5IGNoaWxkIG5vZGUgZm9yIGFtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmwg
YnkgcmVmZXJlbmNpbmcKPiB0aGUgYW1sb2dpYyxnMTJhLW1pcGktZHBoeS1hbmFsb2cgYmluZGlu
ZyBpbnN0ZWFkIG9mIHJlamVjdGluZyBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2
ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKW1NldmVyaXR5OiBMb3ddClNpbmNlIHRo
aXMgZml4ZXMgdGhlIGJhcmUgY29tcGF0aWJsZSBlbnVtIGNvbmRpdGlvbmFscyBhbmQgdGhlCnBo
eTogZmFsc2UgY29uc3RyYWludCwgc2hvdWxkIGl0IGluY2x1ZGU6CgogIEZpeGVzOiA0ZDAyM2Jl
YjM5OTggKCJkdC1iaW5kaW5nczogc29jOiBhbWxvZ2ljOiBkb2N1bWVudCBTeXN0ZW0gQ29udHJv
bCByZWdpc3RlcnMiKQogIEZpeGVzOiA5NjBhNDE0MGFkZTggKCJkdC1iaW5kaW5nczogc29jOiBh
bWxvZ2ljLG1lc29uLWd4LWhoaS1zeXNjdHJsOiBEb2N1bWVudCB0aGUgU3lzdGVtIENvbnRyb2wg
cmVnaXN0ZXJzIGZvdW5kIG9uIGVhcmx5IE1lc29uIFNvQyIpCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3LW1lc29uLWRybS1j
cmVhdGUtaGRtaXR4LXBoeS12NS0wLTg4YzQzZWI5NTQ2OEBhbGllbC5mcj9wYXJ0PTEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
