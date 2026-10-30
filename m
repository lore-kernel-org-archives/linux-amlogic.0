Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172AB606A322
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aGJBVL5E;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKE/9gn8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+oo8C4vsdFht8uRMV/ctXfPNtcPk6En7VIBRXuMBlqQ=; b=aGJBVL5EO6Lw1R0WRRI7SnJjnW
	Km5qgcGdiLOziBNvYKIBnPGgJtTg0AUP2PsT+KtKWaygkw1my8QZPohRvfKhjuiBv4FQZBany/ois
	rC9GoC+AbOnF5zvObH3cha9/aQE2+jFxSonAjExp/DycEZ+nbxynoMy9zAq+u+dGrvQltVYmxpEbs
	Fzt+cR8mMXAbhxgS6yzOgGNOrFl+mTuZwHb0Tq5mhbwCqkhuIBa23hunAC7KhsoLqGCcN/bOpSJqQ
	QuesbBwDJN3LyfwpkzkU72w96ELlqj0X6VhW1IZPfcKVPS7l4yT8q4RKnAKqxh0ZcnED/NnEi7cYo
	m75Fb4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkaO-0000000BWEa-3Jbi;
	Fri, 30 Oct 2026 11:15:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkaN-0000000BWEA-3B8l;
	Fri, 30 Oct 2026 11:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CC4605C4;
	Fri, 30 Oct 2026 11:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B431F000C1;
	Fri, 30 Oct 2026 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358950;
	bh=HWU9fFp652U4xTY6i7RlylLzrPsnJZJWAWqkWZithbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKE/9gn8bHSQVea58VLpEheSWIBby85i5/M/Jg8F86ZXLMp4dimxi0Hc9J4Uiw9t4
	 6GVKb2Sa0lSdoSgaPadeHA3Buu8uok/nP+khOeyl2vVe31w/Fdt99FZbXVjsIOeTfz
	 7gVtQnMQ171kq3KhTyjzNMLfXNWlPq7ESNvxspt/L0vv5MZWn+Ptlea82dP63o2ki2
	 Rn4NlJEYoFGcjqxGfi0JKvlklmLdhFqLUmI16NvPfgUdqqW3/zpa9tda5XlDuT0LQb
	 yBn6mAhY1Yx8Wt5hvklTdicXPeDOzQc8hAPFLcOT20tlZWzXCF8x61XZsaGp6FtKbX
	 0gJpNeB+qZxOw==
Date: Fri, 30 Oct 2026 12:15:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add
 amlogic,meson-s4-sm
Message-ID: <20261030-tunneling-wyvern-of-plenty-ed4f19@quoll>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMDg6MjE6NDNQTSArMDEwMCwgY2hyaXN0aWFuLmtvZXZl
ci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZh
biBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gCj4gVGhlIFM0IHNlY3VyZSBt
b25pdG9yIGltcGxlbWVudHMgdGhlIEdYQkIgaW50ZXJmYWNlLCBidXQgaXRzIFBTQ0kKPiBTWVNU
RU1fT0ZGIG5lZWRzIGFuIGV4dHJhIGZpcm13YXJlIGNhbGwgZmlyc3QgKGEgc2h1dGRvd24gZmxh
ZyksIHNvIHRoZQo+IGRyaXZlciBoYXMgdG8gdGVsbCBpdCBhcGFydC4gQWRkIGFuIFM0IGNvbXBh
dGlibGUgd2l0aCB0aGUgR1hCQiBvbmUgYXMKPiBmYWxsYmFjay4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvYW1sb2dpYyxtZXNvbi1neGJi
LXNtLnlhbWwgICB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBvc3MucXVhbGNvbW0uY29tPgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
