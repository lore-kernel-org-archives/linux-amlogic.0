Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88491C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 21:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uD7kAk3xwz2ELuaW7exCe3Hbz7JInZNLsgsyiaTa2Gw=; b=BGXgNZabmySZXX
	J2bVVCfQLfhYbviWdnoAKhc7N47xC7HBzvzckTGgr0nNAldGkXPCvY3S7KMiiMpzeDiB0bfK+Zp9i
	42beQg4Q8nDrKuzUI3IhCl513oDa8NSQbKzEqiFWUmUVQ6wu/Ec/9cJ8zcR8UBaRQfvareGLwG2Dh
	RKHNXDbyddDQE120i36Cqv2HCGvrdHrUxFeNyTy1tIOEOZ2OpU3tdmJLkACyiOKsbXWq9KKSF9EPf
	cjAAXG3VWXXkbcS2orgP9sBqEQpXSIFAJMGN61vLx2FaWX5kdp5xtdfU9Qt2/MzcIroMfrStfMkLK
	SswYiQa3EBfzb8qM0PJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plyqU-00Fx3e-0h;
	Mon, 10 Apr 2023 21:14:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plyqQ-00Fx2g-2t;
	Mon, 10 Apr 2023 21:14:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id sg7so26826995ejc.9;
        Mon, 10 Apr 2023 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681161270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np05l+USw9jQizmzx3dX3IUWv75lT/svJRr6EobyBN4=;
        b=CnS+HX1ztyCTAYIIBFVJEh3pzxH54r5KMaTE82OLyJqMdiz8CPkQN/Jdksiarozx6j
         E08rvBNJBiBnusoWHCShkGKVpPmtDR4MRgM3wF7CXjjeUE44QZRYzbej768Pa1vkueHy
         j1MmAWnxNrSKLT9Y1HtlDZ31Ypp3viVNJRaDredHDs0deakTftdMj53lbDNeZ8kzQcwg
         b5tuGME6JCx4tXsVrLFSX2+0YxC8mks4eA7/cF78QWJ9jcYMM9JxA7rxEREtNHFareRp
         A7IwayHBisdDn309kTEcYCguk0aEam1CLtdp937BC759j/6w2Z1ZE6NM0exbcH3zZluO
         jH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681161270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np05l+USw9jQizmzx3dX3IUWv75lT/svJRr6EobyBN4=;
        b=2b5hWiZKq0t18fTfcEjit16hnnrwv3z1oA/irZcH4qKBtLxEVGRVtYQdSwAmz4qVNO
         ZeaXQyCaVwkKCaQyCMFbT8+CKyLPt4J0eoHiyoe5xcuSUVXp4JceTznc2MBiq18k8my8
         Rb9qLKc0e1dNzSasXD876tMtjWGSi32FY+jLXzSE6C0hOY8hleMhfhp3Y2GJ3QeI8xZE
         o7jDY332mxO7VSx6xxYSp6SXLyzuE0TiO3fS9tmN9kHSt2QSoX+GKZfdzg1uLWMDEiKQ
         go191SUpFEdx4F3KoLtvknd4uspWzEFFBw4NyXQSdEBvvrQZesKjdIL18XFaaEg2XQT6
         kL0Q==
X-Gm-Message-State: AAQBX9fgWgMzA9gANu8x+MGOElIkVX+LL0ot/Ar3sz78BQ0FODcVJ/9/
	ljJsKMVr0D+aEIou8mGyzp1VqokhRESWzI6qF7M=
X-Google-Smtp-Source: AKy350a4fEr7xVPa9wFsgP6jGB5yZoJoMoyQxdGguA9nMTFfrIYVpvif3OI9rv1CQDmWpwMM8aTInQ0AB9gwUV44xbQ=
X-Received: by 2002:a17:907:970c:b0:8f5:2e0e:6def with SMTP id
 jg12-20020a170907970c00b008f52e0e6defmr4971819ejc.0.1681161270379; Mon, 10
 Apr 2023 14:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55>
In-Reply-To: <trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Apr 2023 23:14:19 +0200
Message-ID: <CAFBinCBdmqG+D5Y_CF=pB6paevTDVCQVi-NBq8Z8i8NykhLW_w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: meson8b: correct uart_B and uart_C clock references
To: hfdevel@gmx.net
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_141434_975800_1D6BF19A 
X-CRM114-Status: GOOD (  11.57  )
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

T24gRnJpLCBBcHIgNywgMjAyMyBhdCA0OjM24oCvUE0gPGhmZGV2ZWxAZ214Lm5ldD4gd3JvdGU6
Cj4KPiBXaXRoIHRoZSBjdXJyZW50IGRldmljZSB0cmVlIGZvciBtZXNvbjhiLCB1YXJ0cyBCIChl
LmcuIGF2YWlsYWJsZSBvbiBwaW5zCj4gOC8xMCBvbiBPZHJvaWQtQzEpIGFuZCBDIChwaW5zIDMv
NSBvbiBPZHJvaWQtQzEpIGRvIG5vdCB3b3JrLCBiZWNhdXNlIHRoZXkKPiBhcmUgcmVseWluZyBv
biBpbmNvcnJlY3QgY2xvY2tzLiBDaGFuZ2UgdGhlIHJlZmVyZW5jZXMgb2YgcGNsayB0byB0aGUK
PiBjb3JyZWN0IENMS0lELCB0byBhbGxvdyB1c2Ugb2YgdGhlIHR3byB1YXJ0cy4KPgo+IEZpeGVz
OiAzMzc1YWE3NzEzNWYgKCJBUk06IGR0czogbWVzb244YjogRml4IHRoZSBVQVJUIGRldmljZS10
cmVlIHNjaGVtYSB2YWxpZGF0aW9uIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gU2ln
bmVkLW9mZi1ieTogSGFucy1GcmllZGVyIFZvZ3QgPGhmZGV2ZWxAZ214Lm5ldD4KUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+CgpQUzogdGhlIGF1dGhvciBvZiB0aGlzIGNoYW5nZSBzZWVtcyB0byBiZSBqdXN0IHlvdXIg
ZW1haWwgYWRkcmVzcywgbm8KbmFtZSBhdHRhY2hlZC4KSSdtIG5vdCBzdXJlIGlmIE5laWwgY2Fu
IGZpeCB0aGlzIHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoLiBHZW5lcmFsbHkKdGhlIHJ1bGUgaXM6
IHBhdGNoIGF1dGhvciBhbmQgc2lnbmVkLW9mZi1ieSBsaW5lIHNob3VsZCBiZSBlcXVhbC4KCkFu
ZCBmaW5hbGx5OiB0aGFua3MgYWdhaW4gZm9yIHNwb3R0aW5nIGFuZCBmaXhpbmcgdGhpcyEKCgpC
ZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
