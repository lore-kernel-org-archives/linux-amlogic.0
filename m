Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA0C28B30
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Mar 2025 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dz3amlWkb7FfE4DVWI/Of6Ng3gcS7IHncP0iafZ6N4=; b=h0PhXl+AztiO1g
	JDFU9iMd5iP6HvWxTEqgjkD1SKzkls79Gqrvdzwl6SGnZiseg1nH+vaun1lborULcQCdFMeQYQ4fR
	DSak8ZEXxS8ol5Ip3099W37tIQPGoH0tvykhwbK9tGlVw3PmZ79RPMjkRaKHqNA9PyCpcKDngiyPB
	YpIPDGwlWpqOlEH8USDUxbSipoU9AEICbe/SChlPxzp2gw/OImld2gTdJwWxV9JcPfpwRT2v++UG8
	rUX/SIFzpK6pX+gQWS6RdbYung3TVRJaDpWk7sjAQViyEl0i+BvjUGUdg/mnn+hAXgyiPxW0uykC4
	xSBFLxA4v6eIsTLJQzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twPDS-00000001WYj-2Pdl;
	Sun, 23 Mar 2025 17:34:30 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twPAh-00000001WFQ-2wrX
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Mar 2025 17:31:41 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 417D5240101
	for <linux-amlogic@lists.infradead.org>; Sun, 23 Mar 2025 18:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1742751096; bh=OurAn6aCCufPe8wONOg+FSpmWM5jwOYj7w2wk4Opzkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=G/uY2jL1PE533O1u4zduFu4e6dBRq+0kcII5VaF9w3jFjrhC4Sdh7+h4LErbtI5Ee
	 hiqpWS5HyIYVTTsoSwKXyRMkut15BxxAMHy5eq089cwCeVzLo13UAAtLfSkhQFjU/M
	 cPtuT6qfu7ajezaUP+4jSsZMG8zPzR4DsovNzg8L6Tb7pGFVz6k9gTod8T5oQ15YT0
	 Nhp9hDSwQRa8LBXsN94uTa1tV+tMSKKtTO4zheGCOI5BQFor/DzpLgDa+MVvvS9f4C
	 9BKxSSeFuNfI0Hvi8lVqZS6dN/G/t88cwjDaDm5x4G6T+zigm4J8wMX5PgFx4oDsgb
	 8iDhNNG2zmSxw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZLNX531ncz9rxG;
	Sun, 23 Mar 2025 18:31:32 +0100 (CET)
Date: Sun, 23 Mar 2025 17:31:32 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: HDMI output (Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee
 3.0)
Message-ID: <Z-BFdMfqVCX4T3NB@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_103139_880857_85D603EE 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgMDE6Mzc6NTJQTSArMDEwMCwgSi4gTmV1c2Now6RmZXIg
dmlhIEI0IFJlbGF5IHdyb3RlOgo+IEZyb206ICJKLiBOZXVzY2jDpGZlciIgPGoubmVAcG9zdGVv
Lm5ldD4KPiAKPiBGZXJuc2VoZmVlWzFdICgiVFYgZmFpcnkiKSAzLjAgaXMgYSBzZXQtdG9wIGJv
eCB3aXRoIEhETUkgaW5wdXQgYW5kCj4gb3V0cHV0IHBvcnRzLiBJdCBvcmlnaW5hbGx5IHJhbiBB
bmRyb2lkIDQuNCBhbmQgYSBMaW51eCAzLjEwIGtlcm5lbC4KPiAKPiBUaGUgZm9sbG93aW5nIGZl
YXR1cmVzIGFyZSB0ZXN0ZWQgYW5kIGtub3duIHRvIHdvcms6Cj4gCj4gLSBFdGhlcm5ldAo+IC0g
UG93ZXIgTEVEIChzd2l0Y2hpbmcgYmV0d2VlbiBncmVlbiBhbmQgcmVkKQo+IC0gUG93ZXIgYnV0
dG9uCj4gLSBlTU1DCj4gLSBTRCBDYXJkCj4gLSBVU0IKPiAtIFdpZmkKPiAKPiBUaGUgZm9sbG93
aW5nIGZlYXR1cmVzIGFyZSB1bnRlc3RlZCBvciBub3Qgd29ya2luZzoKPiAKPiAtIEhETUkgaW5w
dXQgYW5kIG91dHB1dAo+IC0gSW5mcmFyZWQgcmVtb3RlIGNvbnRyb2wgaW5wdXQgYW5kIG91dHB1
dAoKRldJVywgd2l0aCBNYXJ0aW4gQmx1bWVuc3RpbmdsJ3MgbWVzb24tbXgtaW50ZWdyYXRpb24t
Ni4xMy0yMDI1MDExMgpicmFuY2gsIEhETUkgb3V0cHV0IHdvcmtzIChhbGJlaXQgbm90IGF0IGFs
bCByZXNvbHV0aW9ucykuCgoKQmVzdCByZWdhcmRzLApKLiBOZXVzY2jDpGZlcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
