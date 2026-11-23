Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6F606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZz6R3qs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvhsxErT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C1V8TEitl6zuZ0/aSmwaEKboPgs+Bj+gkYdV9UeKWRM=; b=tZz6R3qsW5uqEfsHtCsHl6fQCG
	XhkC9xDoJK3aGkogHO73ZsL/pHX1M7NrIjQ/sopELFKFkg+1PlaRX7BY12DMW34VmwS4R6dm+zDTN
	6m4i9GYXZyAsjixsVywudB8jlCJzPqdbm/TTGfC44yaivGirpTlOiTezOhcq9uPLUdGaYNLupLyMv
	DQcbWAIkoLusrt9ga1r/VDGZBo2WFV9UpDL2Zbb3osUK4Qe5pJnjNJ3BaeHQLudBtETwYzC5JqsOk
	cVPuu8+afzFVB+wj9j+4B+UeM5cqAQCas+7kI+mPH4+hHShF19NLJIJvusdB0oaFIZ61wu9kE0bwS
	wO374QGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZze-00000004k5w-1slQ;
	Mon, 23 Nov 2026 19:46:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZzb-00000004k4V-3uHq;
	Mon, 23 Nov 2026 19:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22FDC624B6;
	Mon, 23 Nov 2026 19:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B211F000CF;
	Mon, 23 Nov 2026 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795463182;
	bh=KE41Jy27ffz827pHQMFOPzKZ8B9e/3qLveo/Z2KJPcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvhsxErTE3cwKxdVFuZSnPngjpWN7dWNwsNGzx9Y7ZvMER2FkYRSTHy4aphsMAnUp
	 M30rnU2L2AHgYioi+sKcVXFci2RltrGjRULL8PiA6GXgzAfCYq/+sXJwO4ajhtJj3V
	 3O58Vb072H02/BM5FuvzfxIdfyt7q1jNl/T4db7/7+aRn5liTdEvJXoZuMGzZ9OD+X
	 aZtLcw8hT+UQJX7+MWdhmMPpv0NWrLp4YqQD9b4h8GdMknkCuDfM+b+o9qZMEt2Oi9
	 xsoxDhNYk2/7PXnUx7RGTqmt1sE9TnD6j7g1HvFRu+lmr86Ok4yZEua3jBhn3U5pxo
	 mTLPI+Qu7OEeQ==
Message-ID: <sashiko-outbox-229956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/11] dt-bindings: soc: amlogic:
 meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-1-3fb94f5534ca@aliel.fr>
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <20261123-meson-drm-create-hdmitx-phy-v4-1-3fb94f5534ca@aliel.fr>
Date: Mon, 23 Nov 2026 19:46:21 +0000
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
ZyBmaXgKLS0KCmNvbW1pdCAwY2RhMzU1ZDgxZmIxNGI3YThiMWM1ZGFmYzliNmQzZjIxMTRkNjc5
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
ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0
aGlzIGluY2x1ZGUgRml4ZXM6IHRhZ3MgZm9yIHRoZSBjb21taXRzIHRoYXQgaW50cm9kdWNlZCB0
aGUgYmFyZQpjb21wYXRpYmxlIGVudW0gY29uZGl0aW9uYWxzIGFuZCB0aGUgcGh5OiBmYWxzZSBy
ZXN0cmljdGlvbj8KCiAgRml4ZXM6IDRkMDIzYmViMzk5OCAoImR0LWJpbmRpbmdzOiBzb2M6IGFt
bG9naWM6IGRvY3VtZW50IFN5c3RlbSBDb250cm9sIHJlZ2lzdGVycyIpCiAgRml4ZXM6IDk2MGE0
MTQwYWRlOCAoImR0LWJpbmRpbmdzOiBzb2M6IGFtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmw6
IERvY3VtZW50IHRoZSBTeXN0ZW0gQ29udHJvbCByZWdpc3RlcnMgZm91bmQgb24gZWFybHkgTWVz
b24gU29DIikKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMjMtbWVzb24tZHJtLWNyZWF0ZS1oZG1pdHgtcGh5LXY0LTAtM2ZiOTRm
NTUzNGNhQGFsaWVsLmZyP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
