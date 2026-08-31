Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D633FC61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8ufA4A6iVpXnAv9Xco8HCDNEtVH0WMy8RnYzE4vpg8=; b=JyQnACzEVjWm5R
	hKFvWHZ0IPyZlWtBlnAI1KiZY3hwaXa1VtnXa/AVZyJmeowLFO1zeP6nJ/BTUS6ylehEvJxLm6LF9
	G1IB5KGQCtBc8DSq2YTgtmh6suKDiDB96BodRaWg73d10PjIJNE52v2a1sAeIAPcukgHgADd7fWla
	2Rt974J0bGtoY8ws2cQKNVMynDoLVUwWL6BQ3Kv+oHud0uVSkgF4Zoj4LMofgwwQbPhWozxhY+N2A
	gju4l9DcL0zxCsy2CUPCliHHmeWMA6bs5O9b9qNq8gqfldd8Ao3N8VP3DucxvLo1NBT/NP24p+CyF
	og7Q03y1mEXwTFRrX78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xc6-00000008vsU-0QX6;
	Mon, 31 Aug 2026 08:43:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xc4-00000008vsG-42Qt
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 08:43:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4488A60120;
	Mon, 31 Aug 2026 08:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B4F1F000E9;
	Mon, 31 Aug 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165812;
	bh=/RB7u1Gx5WzI1965RAEtvOHVuqIDIvYsRQPq8xgHRWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aViXDaZIh/ZoLkAEsaBVS0IXL4wNKqp9rh5z1Xu47mkAQZu0BaBhI/rkj+T49gKaT
	 KCZaWrm9TDfX7mSm5VeuISFv0jKmPL/ZHP3Sl3xUMO/Nq3vBWGJYefhwVczv+WZiP8
	 JciIyJuQ09zP+zR3YAJTRwS180gmYGVgG2wKaNk/0SQKK2mV4rCKE2aE0mqn9mL0eu
	 KOf0/1Q/weNaTHpaWBqMDyxch5KMpbQe+MhxpG1xz/3Dl+1Mf+WV5uVqtjal2xslDE
	 mTaM8fLGQgKCZmiKWsAziYQXkTdkEZXzr+bWM/cTTOndQisv7qwQLsrTBtP9ucYaVM
	 1sYt9XdG4sZcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
Date: Mon, 31 Aug 2026 08:43:31 +0000
Message-Id: <20260831084331.86B4F1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBJbmZvcm1hdGlvbiBsZWFrIGluIGBzZXJpYWxfc2hvd2AgZHVlIHRvIHVuaW5pdGlh
bGl6ZWQga2VybmVsIGhlYXAgbWVtb3J5IGJlaW5nIGV4cG9zZWQgb24gc2hvcnQgcmVhZHMuCi0t
Cgpjb21taXQgMDI0NDk0NDA4ZmZkMzQ2NjAzM2E2MjgwZGQyOGE5NThmOTNmMTA3MgpBdXRob3I6
IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KCmZpcm13YXJlOiBtZXNvbjog
c206IHZpZGVvIGZpcm13YXJlIGxvYWRpbmcgdmlhIHNlY3VyZSBtb25pdG9yCgpBZGQgU01fTE9B
RF9WSURFT19GVyB0byB0aGUgc2VjdXJlIG1vbml0b3IgY29tbWFuZCBlbnVtIHRvIGFsbG93IGRl
Y29kZXIKZHJpdmVycyB0byBsb2FkIGZpcm13YXJlIHRocm91Z2ggdGhlIG1lc29uX3NtIGludGVy
ZmFjZS4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uaCBiL2luY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaAo+IGluZGV4IDNl
YmMyYmQ5YTk3NjAuLjNiOTBiNDlkMDU1MjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9maXJtd2FyZS9t
ZXNvbi9tZXNvbl9zbS5oCj4gQEAgLTE1LDYgKzE1LDcgQEAgZW51bSB7Cj4gIAlTTV9USEVSTUFM
X0NBTElCX1JFQUQsCj4gIAlTTV9BMV9QV1JDX1NFVCwKPiAgCVNNX0ExX1BXUkNfR0VULAo+ICsJ
U01fTE9BRF9WSURFT19GVywKPiAgfTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1l
eGlzdGluZyBpc3N1ZSwgYnV0IHdoaWxlIHJldmlld2luZyB0aGlzIHNlY3VyZSBtb25pdG9yCmFk
ZGl0aW9uIEkgbm90aWNlZCBhIHBvdGVudGlhbCBpbmZvcm1hdGlvbiBsZWFrIGluIHNlcmlhbF9z
aG93KCkgaW4KZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jLgoKQ291bGQgYSBzaG9y
dCByZWFkIGluIG1lc29uX3NtX2NhbGxfcmVhZCgpIGxlYWsgdW5pbml0aWFsaXplZCBrZXJuZWwg
bWVtb3J5CnRvIHVucHJpdmlsZWdlZCBsb2NhbCB1c2VycyByZWFkaW5nIHRoZSBzeXNmcyBzZXJp
YWwgYXR0cmlidXRlPwoKZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jOnNlcmlhbF9z
aG93KCkgewogICAgLi4uCglpZF9idWYgPSBrbWFsbG9jKFNNX0NISVBfSURfTEVOR1RILCBHRlBf
S0VSTkVMKTsKCWlmICghaWRfYnVmKQoJCXJldHVybiAtRU5PTUVNOwoKCXJldCA9IG1lc29uX3Nt
X2NhbGxfcmVhZChmdywgaWRfYnVmLCBTTV9DSElQX0lEX0xFTkdUSCwgU01fR0VUX0NISVBfSUQs
CgkJCQkgMCwgMCwgMCwgMCwgMCk7CglpZiAocmV0IDwgMCkgewoJCWtmcmVlKGlkX2J1Zik7CgkJ
cmV0dXJuIHJldDsKCX0KCglyZXQgPSBzcHJpbnRmKGJ1ZiwgIiUxMnBoTlxuIiwgJmlkX2J1ZltT
TV9DSElQX0lEX09GRlNFVF0pOwogICAgLi4uCn0KCklmIHRoZSBzZWN1cmUgbW9uaXRvciByZXR1
cm5zIGEgcG9zaXRpdmUgc2l6ZSBzbWFsbGVyIHRoYW4gMTYsCm1lc29uX3NtX2NhbGxfcmVhZCgp
IG9ubHkgY29waWVzIHRob3NlIGJ5dGVzLiBUaGUgY2hlY2sgZm9yIHJldCA8IDAgd2lsbApub3Qg
Y2F0Y2ggdGhpcyBzaG9ydCByZWFkLgoKQmVjYXVzZSBpZF9idWYgaXMgYWxsb2NhdGVkIHdpdGhv
dXQgemVyb2luZyBhbmQgdGhlIHN5c2ZzIGF0dHJpYnV0ZSBpcwp3b3JsZC1yZWFkYWJsZSAoREVW
SUNFX0FUVFJfUk8pLCBzcHJpbnRmKCkgd2lsbCB1bmNvbmRpdGlvbmFsbHkgZm9ybWF0IDEyCmJ5
dGVzIHN0YXJ0aW5nIGF0IFNNX0NISVBfSURfT0ZGU0VULCB3aGljaCBjb3VsZCBleHBvc2UgdW5p
bml0aWFsaXplZAprZXJuZWwgaGVhcCBtZW1vcnkuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODMxLWI0LXM0LXZkZWMtdXBzdHJl
YW0tdjgtMC04MzAxOTViOWJkOTFAYW1sb2dpYy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
