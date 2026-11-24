Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6968606A32C
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 20:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wKQoeCC6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=G2eX0lM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7gdXqT+CQVcf363gZXqsstxBeNAMWXj7qTEVC7OsgXM=; b=wKQoeCC6hhCNQz7DgbUPyLkW7R
	8Qxt/VXJgG2sH+bLLtHnd/lPzBWNpDpHdHk0tdk7ia1gKzPl3p8HzLUJlxRrXkSpM+xjFSK/bR739
	5p+H8f1gr/FoAA5Zx0hAt9NWe5aeHEaFaiIAyMuMxeYHMyqfGEgG0E7C0WVNxLXdpvjJ3TwsSCdt4
	+7pwS2whKim3lgqwFZsHIlBt5Hc8yderXmQhw5hY+1bSKyLKVvZowJGC11HC5GeaUG8CsWlNwpiRL
	9pwy9qoiezsImX7pR6w5cAZdsENT9TVpqpMWzLizmrxLgDH9NRHEhxloedpG/ioHMDcv+R6aMlph0
	MZY/vsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPk-00000007lEW-2E39;
	Tue, 24 Nov 2026 20:46:56 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPf-00000007lBO-0qxz
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 20:46:55 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67db1f6f50eso5199152d50.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553210; cv=none;
        d=google.com; s=arc-20260327;
        b=KDE79xSCmNX9KCciXRCntPtxXTZ4cBcgfnmoNuEZDPFMoPNOwuTR+pHpCc5yDpx1jY
         UDWEoQbseJHRpxzwyUG7+CN6AbE5d2offLQalR5jY3PE8YOZ2HfYqLca4sBXb2Qt8r2q
         b8Z3nYuXtH+CkD15+nGMhSU40HZrqd4p+sOJNAXMPd/UOf8+FgR2TAZp1U+tHwBrqU4v
         d14CHlc+5hCtj9dNqDA4t5QIbs045iOWQHoxHiLYHfliIa48IZFtEfdf/Zj8E/pVBzal
         R4WYXHNtEJ4aG3iq+XnTZt/9k4GdSinsNuBUIDriUxm8OgNn9bo4nomST5hcC4UZbLac
         hFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        fh=v0KqZ5Hm7vRE6gpjeBI8tp07Xwncv+AYpROtICab6rE=;
        b=Dr4PXRJqnaPRQfwwFBvDLpYK6yyv6+Y79rdAiNBRhGID6phGBNJbdvxVB4Xe/Kwk0v
         3WBC0cZMH4KZ3siE/7/J5C3Hm+CrFquTJYMpjaPSQdpT6oj8rroXchvFdheJ/NOs0R8y
         q0tiFiyitAdlfj7Cn1cZElbY10IlJ6KqTxw8I+aFzkeoHuBewe5FQuk/83iaLfmW2cqO
         P4Z/Yc378p7WPtBk3yqynXBshLBHiFQM6wbIN2SfAhQZSomY8GxfdhtN6HnXGwnjgc4d
         Yw1c8xEYvRGKADAdS9VwRCXU/Q6Lf3Ir6YZlfQdVJxn9fK2NCA723+vcvxMHx+45serp
         5LzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553210; x=1796158010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=G2eX0lM5fqYyM8C00g4zWLM4TRmOwlp7hpjL7A07hzGewjLqeD9xgG7pmUtNjgY4U3
         ilbK2VKWK+XYfb9pPBqQBqprL2HVMx/yGvPorX/u4MSE68dnIIm2zj6CAHILihd9CMKd
         0EBVsfRU4hYfZtGvH3QNl5kzsfguMkMGlHdqCjZ608zMRwt0HRoWO323FUexYIOvJmrv
         0TpueNSkC36XjbhqHj7brnxC821ssJUHbc8yP75jpOt7z73HmrrIVt0iq4MyFBbcJiCm
         YpiZWVYfePrz23nHOyOBVi2h0zwJ6Tl0muZvGrAlVKVPuq6CBUe8rjV/Bted7+k3NJFK
         yFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553210; x=1796158010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=HN4EWcEUFkjdJc5SFmsXsuiq/gVadNQ5jmYrU22QH9TyNtsfeBjYx6FCOtH6d7kNHA
         pX1oiPxBzcAF6TSbl7XuQK8Ash6xuBydy1cIxM5uE34oUGZzgXpj/AhW8TFj4ylc7yNZ
         9fRu6HrRuqMym660wcWd1kMbKdhJowiKoRxXcizkR5w4YLf9qK8d7jDKx31jsWDnmaHd
         Om3bwqOk2IWsvH13OrLkYDs2H1yN3Rrx3Zm5U4WHDkG0q6PlpKZz+CXi9480RxVaWkNk
         n7oSEyfyF5pbFnuv2F3YYjJWZaAauaXRqeEcsBWxhQCoKpHxvr0dCUP8X+o3DOxY9fja
         5OdA==
X-Forwarded-Encrypted: i=1; AL+hErEZhapvE9lMHg0yhityhFxV6t9maEN/yERa8SZ17U8H2mntRheO4Kz6qb1143yl62jKjX9V2aQk05Ua2Qze@lists.infradead.org
X-Gm-Message-State: APuU4Z/99SPuaXK6s2XE58kjAK6LUKboVy4NGfaMFOw9CoGTprrg4RxX
	JPs5t28P03I1n4FXE2PbUdF4EVS/nNsivTTAMhONXV3uPyCyvD3sedVerUIscstSIOfkp88oO7Z
	cijdaAgvMWQK8dWrL/yfh+juveOWQRmA=
X-Gm-Gg: AZFdTZedl/J3UruGT8QE5Hz1bvQ81ECIUW7M+V+W2pyrzJ3vAczcjlF5vUUR+DbYdSE
	hDtDW9WgJ5SvknIwRdbMBH9jJoYO1OviBqDYd9hCydq8NGv0WYqGi36hEvUVQAbskM5srcbvHwq
	dH8GHGwU0XXG3MCkv4hactUOtXindhVszlnwPbHTaMRGIBzCqlPLAZ45KYWLwMTjFZ4G0EBpiWh
	npVksS0PvfMMy3FIRZK7DUGpvLxZYZnIGgX7YixQHOsJCc7GwkVx4BzLvA6fo/cLfAN918j4Ucd
	xBaUq+vWt8DDcZ9BrAi5SwJVp2ZKZbMmzXor3vvQk72tq9zC38ME/59hWESxix/ZH3PrEpgYK/r
	tysCKtzA1oSVrb3XgmwO49hX7TuaFKsBtUHlay5LpVyPMJaj77xYmKColKqSa39bIhZ2i1Q==
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id
 00721157ae682-8b5204e0b7cmr63699017b3.49.1795553209755; Tue, 24 Nov 2026
 12:46:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:46:39 +0100
X-Gm-Features: Aa3M54p-q6D_8aoLALfJ3nd02LBvNVydTGTGPe-SwdQ6NHwkSXTzPSzZ9Fj7tMI
Message-ID: <CAFBinCAB+CdP7ypZ3kZKKqFTqoAA5bdA9nUKkWX3fVit5LBNGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124651_252690_7603B73A 
X-CRM114-Status: GOOD (  13.26  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMjEsIDIwMjYgYXQgMTA6MzHigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBs
aW51eC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNvQyBoYXMgYSBTeW5vcHN5cyBnaWdhYml0IE1BQywg
Z2x1ZSByZWdpc3RlcnMgZm9yIHRoZSBpbnRlcmZhY2UKPiB0eXBlIGFuZCBjbG9jayB0aW1pbmcs
IGFuZCBhIG11bHRpcGxleGVyIHRoYXQgcG9pbnRzIHRoZSBtYW5hZ2VtZW50IGJ1cwo+IGF0IHRo
ZSBvbi1jaGlwIDEwME0gUEhZIG9yIHRoZSBleHRlcm5hbCBwaW5zLiBOb25lIG9mIGl0IHdhcyBk
ZXNjcmliZWQuCj4KPiBUaGUgY29udHJvbGxlciByZWFjaGVzIG1lbW9yeSB0aHJvdWdoIGEgcGlw
ZWxpbmUgc3RhZ2Ugd2l0aCBhIGdhdGUKPiBub3RoaW5nIGVsc2UgY2xhaW1zLCBzbyBpdCBpcyBz
d2l0Y2hlZCBvZmYgYXMgdW51c2VkLiBUaGUKPiBnbHVlIHJlZ2lzdGVycyBzaGFyZSBhIGNsb2Nr
IHdpdGggdGhlIG11bHRpcGxleGVyLCB3aGljaCBwcm9iZXMgYWZ0ZXIKPiB0aGUgY29udHJvbGxl
ciBoYXMgcHJvZ3JhbW1lZCB0aGVtOiB1bmxlc3MgdGhlIGNvbnRyb2xsZXIgaG9sZHMgdGhhdAo+
IGNsb2NrLCB0aGUgd3JpdGVzIGFyZSBsb3N0IGFuZCB0aGUgcG9ydCBrZWVwcyB0aGUKPiBib290
bG9hZGVyJ3MgZGVsYXlzLgo+Cj4gVGhlIG11bHRpcGxleGVyIGFuZCB0aGUgb24tY2hpcCBQSFkg
YnVzIHN0YXJ0IGRpc2FibGVkOiBhIGJvYXJkIGVuYWJsZXMKPiB0aGUgbXVsdGlwbGV4ZXIgd2l0
aCB0aGUgY29udHJvbGxlciwgYW5kIHRoZSBvbi1jaGlwIGJ1cyBvbmx5IHdoZW4gaXQKPiB1c2Vz
IHRoYXQgUEhZLgo+Cj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXgu
Y29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KCkFsc28gSSBjaGVja2VkIHNhc2hpa28ncyBjb21tZW50czogdGhv
c2Ugc2VlbSB0byBzaG93IHVwIGJlY2F1c2UgaXQKZGlkbid0IHNlZSB0aGUgcGF0Y2hlcyBpbiBu
ZXQtbmV4dCAobm90IHN1cmUgaWYvaG93IGl0IHNob3VsZCBrbm93KQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
