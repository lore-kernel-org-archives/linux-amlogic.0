Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD302606B962
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ac/d4zl4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlJ3GW5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O2S49s/4UgtZY6RNMf/6xlI3p5q8WtDMH4KvcUcDMuQ=; b=Ac/d4zl4XbkjwOfF1pUruynAx6
	6boV+KxrNmi6XVjUOBR+YpZVx0dG8haecm0TPHqUorsdFQzxBZuT3TroQ3O9KEET0M5u4kBDrNJ78
	TgcrvQ/e86aa7Z3zPdNuALYgw+z8bZ97hOvKarsi2ZMH50sN8Z6tBTLrZchFfAasqztqYJasQ7HTz
	MNTOOZccLTQdJ13qK0vOp+o8xHu+wQRSDGgsJRTmpklcS3U/VV0jIJ44XLUteVG9soWjcwRxG5aHc
	XbJzzP+MxSTKt7kVV8SeqzsnyOQVW3UhBmtnIvTYYV0YWhlqbOTnhiF0JuhrkKzqtgNC1mwcIgdfM
	vbJEyTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkId-0000000BTX6-01RD;
	Fri, 30 Oct 2026 10:57:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkIb-0000000BTWy-2CCp
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 10:57:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91905601EE;
	Fri, 30 Oct 2026 10:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AAD1F0093A;
	Fri, 30 Oct 2026 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357848;
	bh=nd1S1qGDMFy2LjhbOYktweIqH3jY/o2wTGMnO5tRhRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UlJ3GW5qrWNWW07RPi/VLcWesAvpBOFFW6OwaWvRvpA66hIIy8rYGSFbXxMpB+Hpn
	 w1nCtzTTpWXSTmcqZEMznbZTC7BaJdhjlYQab3KwXn2apml/ki3QL6tMRxpLkwopak
	 ms7GVaWSeEceBZS3fAYFOrZRLuu18SDMEhKZgG/byiw3MOVog3KvwV4F6KBTypka7O
	 2EeCkUhlCzXn8eGvWnIv416PKWNf94tchQFfWN7xsRpbH7Cm7Znf0GkAaYN0hyuYav
	 oZxXki44PfbWLixyHWpf/1aog2QNSLhbhWlG9MnvrZ8lntU0XzY5eyGfYHkHDJdzyW
	 aE02ArStD3A/Q==
Date: Fri, 30 Oct 2026 11:57:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: amlogic: add the S4 CPU sensor
Message-ID: <20261030-hopping-toucanet-of-prestige-0dbcdf@quoll>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192244.209256-2-christian.koever-draxl@student.uibk.ac.at>
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

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjI6NDJQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IENQVSB0ZW1w
ZXJhdHVyZSBzZW5zb3IgaXMgdGhlIEcxMkEgZGVzaWduLCBidXQgbGlrZSBvbiBUNyBpdHMKPiBj
YWxpYnJhdGlvbiB2YWx1ZSBpcyBvbmx5IGF2YWlsYWJsZSB0aHJvdWdoIHRoZSBzZWN1cmUgbW9u
aXRvcjogdGhlCj4gYW8tc2VjdXJlIHJlZ2lzdGVyIHVzZWQgb24gRzEyQSBob2xkcyB1bnJlbGF0
ZWQgZGF0YSBvbiBTNC4gQWRkIGEKPiBjb21wYXRpYmxlIGZvciBpdDsgaXQgdGFrZXMgYSBzaW5n
bGUgY2xvY2sgYW5kIHRoZSBzZWN1cmUgbW9uaXRvcgo+IHBoYW5kbGUgd2l0aCB0aGUgc2Vuc29y
IGluZGV4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+IC0tLQoKRmVlZGJhY2sgZnJvbSBTYXNoaWtvIGxvb2tz
IHJlYXNvbmFibGUgYW5kIEkgZG8gbm90IHNlZSBpdCBiZWluZwpyZXNwb25kZWQgdG8uIERyb3Bw
aW5nIGZyb20gRFQgUGF0Y2h3b3JrLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
