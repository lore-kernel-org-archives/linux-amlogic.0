Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BD606A323
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnkXcrL/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTzZDrlI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zTq7olNCvRyjuJ5OgjbtG8VHo6sO+4eKDPtSCMXydO4=; b=JnkXcrL/Vj3kyCmUa/YLmE+xuu
	SoO51eCMyD0FqfQpYO8lSNmA6UZCnD9RO1UM3+rbql/ciDfjbIExur1/ySU0CCh3No4RMMyqP8HmQ
	gY18Kon8uFqDG7kgLgLwc8t+EkJ3FX5cpGvGJSXT+mT+x7xH3kdCK52BB/kMaPerDTCaKv4oUCZzt
	RRf0h0zKRoRgHfE63NS1eQaLTRsoZ9+hGppv+AaceMmnKjVTq8Sodr62X6OfpakS5xdJzvS9UtKuy
	nRFEkDkQ5HsSe3WdOLmqXL3eTSwkNPskt1+6ut+jX9ORPJR12SHCQHBgNKwfgF+V3+32+eK0GVwDs
	W1NPWQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSisI-00000000gEs-3fyw;
	Sun, 15 Nov 2026 22:39:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSisH-00000000gEa-1BFk
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:39:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7748605C5;
	Sun, 15 Nov 2026 22:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6611F000C4;
	Sun, 15 Nov 2026 22:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782340;
	bh=XHCHy7OZT1R7rA1bR6Z09vKuX5lf+lW9UUs1aEHAANc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTzZDrlIesTx2iKsw8278wpqoH+Sm6pF8mzI8qXOKVp1lGQ5qEwQagapn4W0cbwCa
	 oHXNSdae+5MPCec9u9z9+qYu1xEmP8z4NzAcUcnmjaNat+XSrWLHiUendaGveRaQEZ
	 a/lW0HgJ057rsoHNKddQeKvLC2eTBwN+gzMIg2z8nuAAX85d8U1OkRNlgKZoKEys+b
	 NU1NW9X7L3t3SvRYZDyLJj1mR2+NqAZzM0j8PktLyuoVazRBx9n3fCrAx4JKecYbPS
	 5UKjUUGb0coae/d4py7hXGX2KkMyJfUPQDvuVmdwHKLiC7d9ujrXbaOGGxwkjIjN2u
	 hyw5NdmqceebA==
Message-ID: <sashiko-outbox-215883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: amlogic: axg: Add ranges to periphs
 pinctrl node
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
 <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
Date: Sun, 15 Nov 2026 22:38:57 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gYXJtNjQ6IGR0czogYW1sb2dp
YzogYXhnOiBjb21taXQgbWVzc2FnZSBvbWl0cyBhb2J1cyBwaW5jdHJsIGFuZAogIGV4cGxhbmF0
aW9uCi0tCgpjb21taXQgZGY5ZWY5MGE2NTIzN2ZkMDczNjAzNTM1MGZkMTZlMzE2ODNiM2QxMApB
dXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKPiBhcm02
NDogZHRzOiBhbWxvZ2ljOiBheGc6IEFkZCByYW5nZXMgdG8gcGVyaXBocyBwaW5jdHJsIG5vZGUK
Pgo+ICAgbWVzb24tYXhnLmR0c2k6MzYwLjMzLTEyNjIuNjogV2FybmluZyAodW5pdF9hZGRyZXNz
X3ZzX3JlZyk6Cj4gICAvc29jL2J1c0BmZjYzNDAwMC9waW5jdHJsQDQ4MDogbm9kZSBoYXMgYSB1
bml0IG5hbWUsIGJ1dCBubyByZWcKPiAgIG9yIHJhbmdlcyBwcm9wZXJ0eQo+ICAgbWVzb24tYXhn
LmR0c2k6MTYwOS4zMC0xNzE2LjY6IFdhcm5pbmcgKHVuaXRfYWRkcmVzc192c19yZWcpOgo+ICAg
L3NvYy9idXNAZmY4MDAwMDAvcGluY3RybEAxNDogbm9kZSBoYXMgYSB1bml0IG5hbWUsIGJ1dCBu
byByZWcKPiAgIG9yIHJhbmdlcyBwcm9wZXJ0eQo+ICAgbWVzb24tYXhnLmR0c2k6MzYwLjMzLTEy
NjIuNjogV2FybmluZyAoc2ltcGxlX2J1c19yZWcpOgo+ICAgL3NvYy9idXNAZmY2MzQwMDAvcGlu
Y3RybEA0ODA6IG1pc3Npbmcgb3IgZW1wdHkgcmVnL3JhbmdlcyBwcm9wZXJ0eQo+ICAgbWVzb24t
YXhnLmR0c2k6MTYwOS4zMC0xNzE2LjY6IFdhcm5pbmcgKHNpbXBsZV9idXNfcmVnKToKPiAgIC9z
b2MvYnVzQGZmODAwMDAwL3BpbmN0cmxAMTQ6IG1pc3Npbmcgb3IgZW1wdHkgcmVnL3JhbmdlcyBw
cm9wZXJ0eQo+Cj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1k
ZXZAYWxpZWwuZnI+CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoZSBj
b21taXQgc3ViamVjdCBvbmx5IG1lbnRpb25zIHRoZSBwZXJpcGhzIHBpbmN0cmwKbm9kZSBldmVu
IHRob3VnaCB0aGUgcGF0Y2ggYWxzbyB1cGRhdGVzIHBpbmN0cmxfYW9idXMgKHBpbmN0cmxAMTQp
LiAgVGhlCmNvbW1pdCBtZXNzYWdlIGJvZHkgYWxzbyBjb25zaXN0cyBvbmx5IG9mIHRoZSByYXcg
ZHRjIHdhcm5pbmdzIHdpdGhvdXQKZXhwbGFpbmluZyB3aHkgcmVwbGFjaW5nIHRoZSBlbXB0eSBy
YW5nZXMgcHJvcGVydGllcyB3aXRoIGV4cGxpY2l0IGFkZHJlc3MKcmFuZ2VzIHJlc29sdmVzIHRo
ZW0uCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYxMTE1LWZpeC1hbWxvZ2ljLWR0LXdhcm5pbmdzLXYxLTAtOTRjYmQ2N2EzMmVhQGFs
aWVsLmZyP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
