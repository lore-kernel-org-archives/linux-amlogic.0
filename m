Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC33E9B36B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqlDp4jlDU16I1CONXoLgBi4YKZNT9e7q1R5I1p2RPc=; b=R1dVwVreY2khYB
	O0KGQeQgPn3PwiwPBFEGQFulhFwbZDROrglpm2TMNAJp+6CSCkAn7pRNmp5zTtbentsiCqRLHAaP8
	X88rOW5lc7q4elo8b6zLq8bPKFP835F+xa0WWBk0Z2JJEDxceloSoXdbKUeZcv9XH0Nx1UiO41Gtq
	jyyZEqp5j6qM53pY/Pdx8qWjBDoU1IdVP79N1BC0cmM3cZJ9BXoju7kUjEGHPfyQwfpRItGeGUEmT
	kAw07+J3l0mfxDhZiAqVl/XxTRvyrQCRVJm6QDv31J2swvpzKnvF7TFXQGQpPPSR6jJ1zpeufTsVB
	J3fGIAlCCJGO6mrdsLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mT-0000000CrYX-2kfR;
	Mon, 02 Mar 2026 11:49:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mQ-0000000CrXd-06TV
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 11:49:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae3a2f6007so11974695ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 03:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452180; cv=none;
        d=google.com; s=arc-20240605;
        b=B91J2WSWNuCzYfdOdy1bQrNPHBoJlcAcf/r7JkpNQdUCV8B6SKYqqDZq4jmICWVQEB
         8NNOXEngYLgwloKsyX7MkvOUUSSuDVXDBYMGSYGb3VIYNuZvz8AM/7FFm4OyT1TIlbC6
         2t9StYa13YRpq/Ypd8Dv2fPw6+GSVKLzV07WOn4qvTMa6IFZxyuMPqW1z2s/cR+vx/wL
         mRqHZ47xzs5JJoO/teZDqBcxD2qA7QNUPeX7Ph5Taq5FKjIxE+GSXjV06ki0BPKOwu6W
         //0+wh86CjqlWYelYoFn9kCFjRQpXywo1S0OG55diiwF1La0wez97Qkpnzv964pGXvWE
         6f1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        fh=X65dsQD9K80G8mXHKZevPoGPjcA4DnFpeMZnMUQ1fs4=;
        b=AGbJ2xv1CSnIGzTiJ3yylSSlgHKA0L/Ew6LeRzv6zACTFUw1uQtO8fxFpWhh/FNSpf
         G1UDvOvQoJisD/yrgJCO0czYcQc5gYqHhriDyP48ZyaRiwipP2yO+//akegoQ0CBbmp1
         9de5QeR/Za5dhKZ6p3jXbgUKBFQAS2iJhu10ZtnY5aVRh6yXIdw2KfiTWT3mfN5IC9CK
         NbUo5PG+XEWA80e1urrK7W8mv8t+zCkOUXEdt+9pssn5W4IJTMvqoTs1nuirR7JeEY54
         Kx1g7RQKeHBnqqH0Lr3/2Vtu0TEeLyLe9jMkDGCYvwpbfqon6NEjty4i0A/H47G1R7Vd
         6HSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452180; x=1773056980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        b=ZaenMxDoEdnEfKwE5lbVEt7NGD1Bt0Xu21bAGi+DZIaUNuOWc4ijYAgfqc7CyAyrtc
         m76YBH69AK2I5Em4gINpxUt8GF0KG2g2OiqA3KOKRVpn2QKw9Hljh47f3G5lAjPL4Gkc
         gjL7Bj/dPxavqCO0BU7N+GX3W8su9yK4FSc+Gqc/BeDS8lPS8n+zzYYRdnQG8p9oBQLi
         zEmH1DnM51pqJkufRU+4lrCqHhJM8Dm7DwPGwX8wsH4V4SDXLGVr9YyOGtDsFOUhWLJt
         eFjHQYe1YBeJv2Nf1OEgteHACsL/wI7N1E77SjHmiQ+wldz2jq370coHEqEGamOI5//1
         FN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452180; x=1773056980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        b=p3UWtxK3BOixhTocM89BPKWgAjvzFDKsS1hPz+tqZSoJjqC/k31OQSxcYUFjht2xv4
         pF71udDC3HgmJuZKbvbPfqJnxf9Lm6JSJ92c3po0CYWMmTPhxRppDTyAhd9fpg4OoLYw
         Wv0CxS7rkOu/YrNekk6pwi23n2AdEhCZS22P6bonWHUNDsFvVS8Dx4bSidbKyOxBUIWt
         tfhzP/FUbJck/NVRl0aTjiUl5QSxPUZ+mFOv1oCKPYEJEBcTe1csOr9fDHXzT5/rMu7N
         mJXGkEp/yAbLd4soZk+YNj2Z3CRf908LNjK0ftAsHWl269QJz4etn7fIPkud+Rcr0bq2
         jiWg==
X-Forwarded-Encrypted: i=1; AJvYcCWmf9haHmbop0q+aa5eGTlZA3RR9i+dY/GfVC3b2AHAXwra+tEnMa6ESPk9tm1IWYYCQJ3Xv7ap1vEblpn1@lists.infradead.org
X-Gm-Message-State: AOJu0YzmsIKSPPRM57itUZE1rcUzJ8w/lEBy9mQO37IMWjMaawRDByVI
	qdK9yh1g2mW7OBC3lCqy+XY7BMPQxgH6OPCRFbQQauqxwxtrCNky8u8OR1EEl3+p+GHMe32uJou
	3EPBqmfFewx3Ykx27buwVFLHhxIEcnNU=
X-Gm-Gg: ATEYQzwZVUSz/kxTG9lBVA5dnNhZ9ySupRIXBNs1QMm5WSERkZajV/xnO19LJXC2Ht9
	qdAs7HFjZY9QqF99p25uhjJI21mTGohfJYa4V6JDBjgQidC4qeD7iqJbmTO13+gco3HtBKMBR+Q
	oQT6F73SZGzfmDg2uqcVGP8EYg5ENjk8cXnD6VdER2buSRq2YZB3VIKhdlF+/xFddt90uVx6lrx
	ge0dg4k2XG+JzOJNVr8rrnELMkDHuPpnJzDGkafyn0caLGfP9omF/RcJh4dW13e7rSJY4rt4bq5
	+93ItyDcOlHMXMfS//Zi/McVeAuPa9gVnPKjIfVS
X-Received: by 2002:a17:902:d48d:b0:2ae:3e43:4673 with SMTP id
 d9443c01a7336-2ae3e434cc0mr72292735ad.1.1772452180549; Mon, 02 Mar 2026
 03:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20260228063750.701887-1-nick@khadas.com> <20260228063750.701887-2-nick@khadas.com>
In-Reply-To: <20260228063750.701887-2-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:49:29 +0100
X-Gm-Features: AaiRm512qnGuhMk_kVkiofPglNgQBsBrV9Icn_fbpH3P2ZQt1NNOt_MmTM6m1d4
Message-ID: <CAFBinCAKwF2q7oE+MAvWGO6_Wx20_PVUKVQ=FnjMdZmDBYkJ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: amlogic: meson-s4: add UART_A node
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034942_100318_5C092C75 
X-CRM114-Status: UNSURE (   8.64  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgNzozOOKAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBVQVJUX0Egbm9kZSBhbmQgaXRzIHJlbGF0ZWQgcGluY3Ry
bCBkZWZpbml0aW9ucyB0byB0aGUKPiBNZXNvbiBTNCBTb0MgZHRzaS4KPgo+IFRoZSBwaW5jdHJs
IGdyb3VwcyBhcmUgc3BsaXQgaW50byBiYXNpYyB0eC9yeCBhbmQgZmxvdyBjb250cm9sIChjdHMv
cnRzKQo+IHRvIGFsbG93IGJvYXJkLWxldmVsIGZsZXhpYmlsaXR5Lgo+Cj4gVGhpcyBpbnRlcmZh
Y2UgaXMgdHlwaWNhbGx5IHVzZWQgZm9yIEJsdWV0b290aCBjb21tdW5pY2F0aW9uIG9uCj4gYm9h
cmRzIGxpa2UgdGhlIEtoYWRhcyBWSU0xUy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxu
aWNrQGtoYWRhcy5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
