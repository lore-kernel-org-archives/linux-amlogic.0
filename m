Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD96606A32E
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjWdC3nE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+Ceox3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3nsBIWasVDeAIZlAeljAU2stHAQChFEIbnjsb681OCY=; b=jjWdC3nEsT/d4hUdY4cvVXduxW
	4148hIER3bs6S6/kYYT34kAeiBg3IVCbljaj7Sy80Vv9Z940WDWLRcnFOmfmL5TfP1Ul5HDidJOXx
	pEsM02gtXWy+9bTHyeTpeWgxr3e5YQrlfD3KAqpaBtrOKavNoX226HoyA5ffEJxgUnLafDRkrMVIR
	NqjrKnxhcrC/wlTzSwsTz5Sbb7ysDuWMhrr81JYkwM1S+lBYlbCz7UfwyECMCcXbDIUeBA2BVvQ2G
	5Sln3mwcDsLEYiwqJ+9Iu4OupUSAzmOr11zz2CuLjzfecs3V21oiO3FO9tW+Ui/D0lbpMXfzpHeEc
	cUR1AoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkAt-00000003epz-0pIe;
	Tue, 10 Nov 2026 11:38:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkAs-00000003epm-0K8j
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 11:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C12161D1D;
	Tue, 10 Nov 2026 11:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DD91F0089F;
	Tue, 10 Nov 2026 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310681;
	bh=d9v/Gp9iWIrqKOTJ5tYiU4Rd2P+nxR1EUTXeLPGgruo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+Ceox3xvxd9BAP+TDL4GvUKrokCM1KfN702TcZ5bpUWBjpOTnYO92VxkzqEV/8YR
	 SxTqszpgwt6oRFwhOoW6K24nYKt+wEsqMGto+/4iUjGzcuHAq65gMB5wBUSxp6vkWk
	 lOEezS3teSHHE3+pMRZP6z2YSmby5iD3suXx10EYfT8yv8gT+Z4fq8eU1kacC9TO56
	 7f/pzkhYj6vzc82TP/xVh5d/SsYyMnIXi0K3Zdoxu4Vvix+d8t5MSiNR0+SmZmQrG+
	 m3uDifWhyjeb20vca4iKpQInUj5fvgycW12voIMMiHo2+PF84CmpF1u/NkZ5hekMCF
	 CMB1ulfaLT5DA==
Date: Tue, 10 Nov 2026 12:37:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v2] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Message-ID: <20261110-colossal-piquant-narwhal-6487f4@quoll>
References: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMTE6MTk6MzVBTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gQWRkIGEgY29tcGF0aWJs
ZSBmb3IgdGhlIFM0IEdFMkQgYW5kIGFsbG93IGEgcG93ZXIgZG9tYWluLCB3aGljaCB0aGUgUzQK
PiBibG9jayBzaXRzIGluLgo+IAo+IFRoZSBBWEcgR0UyRCBpcyBhIHNwZWNpYWwgdmVyc2lvbiB0
aGF0IGRvZXMgbm90IHVzZSB0aGUgY2FudmFzIHRvIHJlYWQKPiBhbmQgd3JpdGUgYnVmZmVycywg
c28gdGhlIFM0IG9uZSBpcyBub3Qgc3RyaWN0bHkgY29tcGF0aWJsZSB3aXRoIGl0IGFuZAo+IGdl
dHMgbm8gZmFsbGJhY2suCj4gCj4gT25seSB0aGUgUzQgYmxvY2sgc2l0cyBpbiBhIHBvd2VyIGRv
bWFpbiBvZiBpdHMgb3duLCBzbyByZXF1aXJlIG9uZQo+IHRoZXJlIGFuZCBkaXNhbGxvdyBpdCBm
b3IgQVhHLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCA8Y2tvZXZlckBvdXRsb29rLmRlPgoKSSBzdGlsbCBzZWUgbm8gdXNlciBvZiB0aGlzLiBTaW5j
ZSBkZXZpY2UgaXMgbm90IGNvbXBhdGlibGUgd2l0aAphbnl0aGluZyAobm8gZmFsbGJhY2spIHRo
aXMgbWFrZXMgbm8gc2Vuc2UgYWxvbmUgYW5kIGNhbm5vdCBiZSB1c2VkCmFsb25lLiBBbHNvLCBE
VCBiaW5kaW5ncyBzdWJtaXR0aW5nIHBhdGNoZXMgZXhwbGljaXRseSBmb3JiaWRzIHNlbmRpbmcK
dGhpcyBhbG9uZS4KCgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTZXBhcmF0ZSBjb21wYXRp
YmxlLCBubyBhbWxvZ2ljLGF4Zy1nZTJkIGZhbGxiYWNrOiB0aGUgQVhHIEdFMkQgZG9lcwo+ICAg
bm90IHVzZSB0aGUgY2FudmFzLCBzbyB0aGUgdHdvIGFyZSBub3QgY29tcGF0aWJsZSAoTmVpbCku
Cj4gLSBwb3dlci1kb21haW5zIGlzIHJlcXVpcmVkIGZvciBhbWxvZ2ljLHM0LWdlMmQgYW5kIG5v
dCBhbGxvd2VkIGZvcgo+ICAgQVhHLCB3aGljaCBoYXMgbm9uZSAoS3J6eXN6dG9mKS4KPiAtIExp
bmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMjUxOTIzMDIuMjA5MzU0
LTEtY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQKPiAKPiBUb29sIHVz
ZSAoRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2dlbmVyYXRlZC1jb250ZW50LnJzdCk6Cj4gVGhpcyB3
b3JrIHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgY29kaW5nIGFzc2lzdGFudCwgQ2xh
dWRlCj4gKEFudGhyb3BpYyksIHVzZWQgdGhyb3VnaCBDbGF1ZGUgQ29kZSBvdmVyIG1hbnkgc2Vz
c2lvbnMuIEl0IGRpZCBhIGxhcmcKClRoZW4gYXNrIHlvdXIgQ2xhdWRlIHRvIGFjdHVhbGx5IFJF
QUQgc3VibWl0dGluZyBwYXRjaGVzIGRvY3VtZW50LiBJZgp5b3Ugd2FudCB0byB1c2UgQUksIGl0
J3MgZmluZSwgYnV0IGl0IGhhcyB0byBiZSBib3RoIHByb3BlciBvbmUgYW5kCnByb3Blcmx5IHBy
b21wdGVkIHRvIHJlYWQgZXhpc3RpbmcsIHdlbGwgZG9jdW1lbnRlZCBwcm9qZWN0IHJ1bGVzLgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
