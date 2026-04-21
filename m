Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913AAF8FA9A
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmN8FcMOzp4tG4dmWF3C8LJ91tckHPwoi+0D8mXql3Y=; b=Ecq3XEdl45P/DF5wYNHqAqhZZp
	NawfKuFNqy64Qwgy3nUQZPm7SI0/QpA8bt/OaI5zaFulRjq6LvPP/BvyfhRyMCExM6EF9TNWIO9P8
	TzxZoErLPeIcRjIo3QXDgOKUcHW2hXV+mAdWgjkN3cZXin6WHj/0OlaEU5BjZf5UlXXDUndkgwAyD
	zjeJKglSzMt2hD1/rYvrF25HV1pToed1wOXlkawXkR4kMr3tc3Qqjnnfwn2KLRG6EbAs1JNf3asIH
	922ApsvPE2I3GEpwNLwotZlG8A0oCBOMIkEyhXhBzxMR50KSAHc2fa7Qw+OVNoTcYYPeNxgk6wEtH
	iZJyKyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE6m-00000008v1V-3cW3;
	Tue, 21 Apr 2026 16:37:56 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE6j-00000008v12-2jgW
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Apr 2026 16:37:55 +0000
Date: Tue, 21 Apr 2026 16:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776789467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpJV3RY0EbaEZUr7cB+U3AXYZF0kplYNLFyuwZ/YRu4=;
	b=ORLnEF5qdgVpnRWwe+ZGDZRScEa9amzvTYBVvrDt3C6KffoF3IOiJuAsxNZJRe0OLubZR2
	0Q5IIYUgUNPmwOfL2EkA7FdYj8YqQHBdIAeNIWGV49DKTgkQv25LkVrwY31tlDT+mxSE0Y
	5eb0rf1riSjwB3GMibR5G7aQeMUonu+g77nOyI1PO2qk6W7IkD3pKs8ciosWGRDu5R6XRZ
	pnq+DUpMUcPCy6LwGy3LNvcDF8D7yDzghkqcYI7V3zpBMstJvaqvCmR/fIiPOv7KYDASx4
	nlHfefVgG8s+ryZbX7mC/CaQE0QRc357miibthjO4rgC3Oq+bEyJSRnO1Ona5g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for X98Q
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at> <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdurii.1o3p0jnn1bsji@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093754_146222_BE2D61A8 
X-CRM114-Status: UNSURE (   7.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMSBBcHIgMjAyNiAxNTo1MywgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50
LnVpYmsuYWMuYXQgd3JvdGU6Cj5Gcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwg
PGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0Pgo+Cj5BZGQgZHRzIGVu
YWJsaW5nIGNvcmUgaGFyZHdhcmUgZm9yIHRoZSBBbWVkaWF0ZWNoIFg5OFEuCj4KCllvdSBzaG91
bGQgZXhwbGFpbiB3aGF0IHRoZSBBbWVkaWF0ZWNoIFg5OFEgaXMuIFlvdSBkaWQgdGhpcyBpbiB0
aGUgdjIncwpjb3ZlciBsZXR0ZXIsIGJ1dCBpdCBzaG91bGQgYWRkaXRpb25hbGx5IGdvIGluIGhl
cmUgdG9vIHNvIGl0J3MgdmlzaWJsZQppbiBnaXQgY29tbWl0cyBpbiB0aGUga2VybmVsLiBXaGF0
IGhhcmR3YXJlIGRvZXMgaXQgaGF2ZT8gTWF5YmUgYWxzbyB3aGF0IGlzCmVuYWJsZWQgaW4gdGhl
IERUPwoKPlNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2hy
aXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMuYXQ+Cj4tLS0KPiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwo+IC4uLi9ib290L2R0
cy9hbWxvZ2ljL21lc29uLXM0LXM5MDV3Mi14OThxLmR0cyB8IDI0OSArKysrKysrKysrKysrKysr
KysKPiAyIGZpbGVzIGNoYW5nZWQsIDI1MCBpbnNlcnRpb25zKCspCj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMK
PjwuLi4+CgotLQpCZXN0IHJlZ2FyZHMsCkZlcmFzcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
