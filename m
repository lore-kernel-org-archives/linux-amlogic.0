Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9458AC3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT/EbdqWjD+UaTykb/I149vm/ZjEj+u1SUy2Jpw477A=; b=palKU/OGLpsvmp
	3T3ri3fiGewvw2TY9If79CoJ6NuJoD8UDJiqBgSjYHC6xS0HDDm2iYiTxGrpztLuJ2X69IEZ8L0c5
	cxcxNbhYQbmjW8W3Kl/qDkTr9iB8bzhFSRxq7TJ0tRWErO6pQUa8nHs+dKh0tdgfsyYVtJVfOKxCR
	o5m6dkB7f2IXs0Ucpv7D/NOzkkVszr8eM7xqwFQFseJ9TVGEYpk68gmlP5umH9TxaXVsKBs/beJbi
	WupHpMj0WdkwLr7M9ZO6qiNkWFQU8nBzihNqXCMmOlCElxocALdqjWCQs+Nq4fVZQqLNI1jGbZMIt
	ZpU2o7WAggSTKXYP0Vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spusd-00000002ZZ4-1X1Q;
	Sun, 15 Sep 2024 19:25:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spusZ-00000002ZYV-3E91;
	Sun, 15 Sep 2024 19:25:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2053616fa36so44776945ad.0;
        Sun, 15 Sep 2024 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726428351; x=1727033151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsFMrp52owgT+QXsdARrXyzoDdIWrvC9j2u21aCjt/E=;
        b=JdRX7npJuM2CJMHpU9WecnFSwB0+rxrSrHVNURlonvZ4Kynef7jIQKxQ6RxF8iJ8sq
         9zfPU2xNWb+NErxsoZr7mNSnDtnGJ2IlDWq9cG4s7h4XYPF4IuIjdoldcZjancyQs/mv
         +OJxVLAHF/SXkOQOiK8WxCyY3dpVmAFInhqWvU8Ykk+m2gGfUW0pU1j9M5ReJOTgCxG9
         DnAql3m0xIE7lry+LYvgOf2o+8WTn1PqQaEMYMlAKiDQR07vp1s72WyYFOuaci797IP6
         VWnz/tpF4FiYXwV/V0+ikhU7vHciprSu1yQlR/OUTD+In0Gfw7wL4vq1ow4XURowYjoo
         34uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726428351; x=1727033151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsFMrp52owgT+QXsdARrXyzoDdIWrvC9j2u21aCjt/E=;
        b=Ue9iUo9tmZhu4smancHjMZv0+XxYV4gNVbRNPnL2geDNVsnBS9FFCgzmu9vhRLQlZu
         K0iEIjVg542zkwyXCJtdKxn6wpr4jvRfl69sOaQS616NIe9XVebVxAGywscwzI7QOx+s
         HRRwB9gLkrEOXQ4RJKCw+SvfqJ7iWpX9vA8qnuxrStrHIPx+NXdgYgccZ3MSjyWJAt6h
         FCq7zdi1ZLhPTinxo7EExxn++OpeWFJzOAeAravlUT6WRKkY2eKzq1QDVMDg+bi3+/AJ
         Ics5rYLA2L0NgVr5qCf4inf51NyDhZSo/yw89MRmajyGBLz5BTPFqjNatOiaRikV6nVU
         eKqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvoeVUUOReOVN43EVX8bm/5aiEWbd3QMgyVcL4zNHO4vk/ILMq2mOiE58el08CmTtoUA54gETR3VfdH37tWGA/Kg==@lists.infradead.org, AJvYcCXQJMHnH+46q7st7IrfZ+rzaI2Xtt73zAUkAsALGYzILwVl+6rbHmCze5VkuF9hW0C48ecdRAHTmYr/FotI@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+lOlM5bTn/j2cH9aed8zfPXHjmNnPPh9ILZlgZYGb6VgSO41
	GFdU4x8z4TwnHukB+yF9z/2mHGccN/b3fXfbUPiReQZPcd8fZMfrn7GAEv9QsnUqUX7laTKOEKC
	g1T1HxGXFZjmeORsTqv+K0TdZhF+AtVEN
X-Google-Smtp-Source: AGHT+IH+Uh1qYC1xAfKonOLcFVaIB/RFxfFjSDlBJUEqbp07iFMSDQJBm36Rof9f/CiWuchgMutW+DT9FNYBnFttrAk=
X-Received: by 2002:a17:902:d546:b0:205:9112:efea with SMTP id
 d9443c01a7336-2076e39c879mr190881715ad.35.1726428350658; Sun, 15 Sep 2024
 12:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:25:39 +0200
Message-ID: <CAFBinCBZ8kowT_R6MnVkQO_BpxPA88xz-=KPStFDYQgH=P5upA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_122551_835057_1993ED22 
X-CRM114-Status: GOOD (  10.60  )
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

SGkgTmVpbCwKCk9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDU6MDnigK9QTSBOZWlsIEFybXN0cm9u
Zwo8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBDb252ZXJ0IHRoZSBBbWxv
Z2ljIE1lc29uOCwgTWVzb244YiBhbmQgTWVzb244bTIgQ2xvY2sgYW5kCj4gUmVzZXQgQ29udHJv
bGxlciB0byBkdC1zY2hlbWEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVp
bC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KVGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhIEZp
cnN0IG9mIGFsbCB0aGlzIHBhdGNoIGlzOgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCkRvIHlvdSB3YW50IG1lIHRv
IHNlbmQgYSBwYXRjaCB0byBkb2N1bWVudCB0aGUKImFtbG9naWMsbWVzb24taGhpLXN5c2N0cmwi
IGNvbXBhdGlibGUgc3RyaW5nIG5leHQ/CldlIGVpdGhlciBoYXZlIHRvIHVwZGF0ZQpEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2FtbG9naWMvYW1sb2dpYyxtZXNvbi1neC1o
aGktc3lzY3RybC55YW1sCm9yIGNyZWF0ZSBhIHNpbWlsYXIgYmluZGluZyBmaWxlIGZvciB0aGUg
b2xkZXIgU29Dcy4KQWxzbyBJIHRoaW5rIHdoZW4gZG9jdW1lbnRpbmcgdGhhdCBjb21wYXRpYmxl
IHN0cmluZyB3ZSdsbCBoYXZlIHRvIGFkZApwZXItU29DIGNvbXBhdGlibGVzIGFzIEkgdGhpbmsg
dGhpcyBnZW5lcmljIG9uZSBpcyBub3QgZW5vdWdoLgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
