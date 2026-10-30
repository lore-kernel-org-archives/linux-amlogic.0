Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E9606A324
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NqCV9wN0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RjVIgmCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=TJVujAzKJOP+TENZ8Hl1S/NDwbZaGIGb4TEcAAcGg8E=; b=NqCV9wN0Kd+hXVUkO2o8UNIyEi
	FQhHVofbdlF/Rs497zwYTkuqf5dQagxpEPnaOYbOK9b5rs/wOHOBe1XaHQqs/mSkzchfKnC2zf3CQ
	zNy5gdkhPgYjpaSmwVWuhFPdY5PjspGwTRfuoYai4goqQjUCdGYx0p8/AHC3GO8tRtVZ/MGEu9BFM
	N52eZ4e3m6TQpkYTnhyiB2vPz66Z1rbSyrXH6HxVp8zP2QIVOo9/TVPNFbdOt4/BtqHio3zrJXHcD
	UKTMr/kVOWhX7L0raUiYjvONQTxIc1K50yzLA0EuJOM3JDyAQqrlVcNLIhuTv9KrAhCzrWs7D0EZf
	6SkQu8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoFI-0000000Bwus-2NJy;
	Fri, 30 Oct 2026 15:10:20 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoF8-0000000BwtM-1ziz;
	Fri, 30 Oct 2026 15:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793373005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l2OyCf0tiJGeMLyKQmnA/k2lxLUpwrcd2F0ZIhifaSwLHHwqO2KwHSNcEFQpMaHNlYXTTJmdI4iXw7+aD3N2MvLd5y0Y8iO8ZnnjGYh0DyLnD9faRyAY6x3awEiSP477+CaGgqH9vDi5HkTsQ0hCFI9IowA8iq6Z/gd3C6b5ofc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793373005; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; 
	b=PcEaetO0knlMfJket7z8i/SkBEKduaSB3zdNn06toYxnhktOvh4EG9Inp3qU4HlaU8CxLTFnAfKAQSi0R0jnaMYv5aBjPreHyesqyo5IPJVLkbtUxTVCj71A88bAh/EA38pKCble0x+fSCThZ1r++s5lYbd4RkZZtr3loVMxAMU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=RjVIgmCEUVFEGqO23Co1WdR+lY69arY5m0Q8U+3SjKSU/Brnadrsm7sYS17Iw9KScewwqMR0KLb05GRdukcIsbITDeUsSNpJfH97wpAkA46COQoNUJUjgQUeauPSSTX96wUwBg7tWlK24Q7A4ly+XwJXKtCxl/HgNyfg3+eOS20=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1793373003647307.92338041764765; Fri, 30 Oct 2026 08:10:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:10:03 -0400
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <wbieganski@baylibre.com>
Cc: <zhentao.guo@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
In-Reply-To: <179337024629.131241.9227206619077693683.b4-reply@b4>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com> <179337024629.131241.9227206619077693683.b4-reply@b4>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081010_566580_AC8C3FA5 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

SGksCgoKLS0tLSBMZSB2ZW4uLCAzMCBvY3QuIDIwMjYgMTA6MjQ6MDYgLTA0MDAgd2JpZWdhbnNr
aUBiYXlsaWJyZS5jb20gYSDDqWNyaXQgLS0tLQoKCj4gSGksCj4gSSB0ZXN0ZWQgdjEyIHNlcmll
cyBvbiBBUTIyMiBib2FyZCB3aXRoIHY3LjItcmMxLiBGaXJtd2FyZSB2ZXJzaW9uOgo+ICd2MC40
LmZmLkkwYzgzNDk1Ljc1NDQ0YjMnIGJ1aWxkICdUaHUgQXByIDE2IDE4OjE4OjU1IDIwMjYnLgoK
ClRoYXQgcmVtaW5kZWQgbWUsIGlzIHRoYXQgZmlybXdhcmUgaW4gbGludXgtZmlybXdhcmU/CgoK
Tmljb2xhcwoKPgo+IFJBVyBOVjEyIGZyYW1lcyBhdCB0aGUgZGVjb2RlciBvdXRwdXQgd2VyZSB2
aXN1YWxseSBPSyBhY3Jvc3MgdHlwaWNhbAo+IHJlc29sdXRpb25zIGFuZCBILjI2NCBwcm9maWxl
cyAobWFpbiwgaGlnaCwgYmFzZWxpbmUpIHdpdGggYW5kIHdpdGhvdXQKPiBCLWZyYW1lcyBpbiB0
aGUgc3RyZWFtLCBhbHNvIHdpdGggSS1mcmFtZXMgb25seSBzdHJlYW1zLiBJIHVzZWQgR3N0cmVh
bWVyJ3MKPiAodmVyLiAxLjI2KSAndjRsMnNsaDI2NGRlYycgZWxlbWVudCBvbiBUcml4aWUgd2l0
aCBib3RoIG1tYXAgYW5kIERNQS1idWZzCj4gYnVmZmVyaW5nIChvbiB0aGUgY2FwdHVyZSBxdWV1
ZSBvbmx5KS4gSW5wdXQgYml0c3RyZWFtcyB3aGVyZQo+IEZGbXBlZy1nZW5lcmF0ZWQgKHRlc3Rz
cmMyICsgbGlieDI2NCkgb3IgcHVibGljbHkgYXZhaWxhYmxlIHRlc3QgdmlkZW9zLgo+Cj4gRGVj
b2RlciAoYW5kIHRoZSBvdXRwdXQpIHJlbWFpbmVkIHN0YWJsZSB3aXRoIHNpbXVsYXRlZCAobm9u
IGtleSkgZnJhbWUKPiBkcm9wIGF0IG1heCByZXNvbHV0aW9uICgxOTIweDEwODgsIG5vaXNlIGdl
bmVyYXRlZCBieSBGRm1wZWcncyBiaXRzdHJlYW0KPiBmaWx0ZXIpLgo+Cj4gVGhlIHBlcmZvcm1h
bmNlIGF0IG1heCByZXNvbHV0aW9uLCB0ZXN0ZWQgd2l0aCAnZmlsZXNyYyAhIHBhcnNlYmluICEK
PiB2NGwyc2xoMjY0ZGVjICEgZmFrZXZpZGVvc2luaycgcGlwZWxpbmUgd2FzIH44NSBmcHMgKGZp
eGVkIG51bWJlciBvZgo+IG91dHB1dHRlZCBmcmFtZXMgZGl2aWRlZCBieSB0aGUgdG90YWwgZXhl
Y3V0aW9uIHRpbWUpLgo+Cj4gVGVzdGVkLWJ5OiBXb2pjaWVjaCBCaWVnYcWEc2tpCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
