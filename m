Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0C6606A31E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIOqvyz6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=R90t7onI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uimnGVleO/eSSHzB/lmqEwYar7Cy1ZiBpn5BUi3Ke8A=; b=jIOqvyz6NVqHp4qLLxnw98kUdD
	xOBNBoF7kIkmKyMqmSSpv/bXvVb8HcqgW0cGIgGqL/eqNci4d3SWDGvonAUwq1ryepcpi2OPMOgMe
	EriwemFH+tsHIV1gWREkJv1S7YO6fABphm0k0PqafNj/pcSBjDLLZmGGgdRiuiG0fay4se+4XI8Qr
	XmOHOWA++O37yU7kkTacsdkvNDrXWFUxPpklgq2hm54+gY7igR85vvaGiBvidroIZz8jjB3KWb+10
	TnO5QvmzIjU8EoZYQmti92x2fcKj30IMx/pvTLVIfkPM8T9kEdRhfxnwI8VQAbvC3G/Qq2VfyvdZI
	R1BglpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOR-00000007kks-2o6X;
	Tue, 24 Nov 2026 20:45:35 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOP-00000007kj3-2GuW
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 20:45:34 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8b4cd576f2aso37671317b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 12:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553132; cv=none;
        d=google.com; s=arc-20260327;
        b=pIHwFOBIwohZYFHh25vTXiRJaKq1DgNFdahCfUf6U0HKDzBTU8PME41NF7tSBTQXB9
         zji8du1I8Gr0+68oVszogOIB7JHT6qISUnCdOtG9HVXlh/O/6ql08oc4/iSXfU/EvDp+
         CmL8zP/UGkdNndlNyea8dd5GluVxzl5AFEPVZLkNflN7iZC1KB9hl2Vy8BcnjCsTNt5R
         0i8tZrUncYIbleTbXkCbwkBV5isgGRh6AJoftqL0t7bB5Lexzlig0uLWFsmLhNRjYg6Z
         mtHiRBWT6TMalYhlmipO1+p9YCv0uEJ4A0KfA2oBvKjxwvL68w1gipcsHAhjyo6mE8EK
         DkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        fh=TV009M/X3vVrTucJvPWlsq3lpX4ETb5meeToJHvxiko=;
        b=DKDtvi0gSseGmK07rGcTlRYsqXycs/GPw0sRYqGBaXbpKQGOwM+M1VGAHoCzq5lu5l
         Exl1lHa0Sk9/7DuJe10SuDv/uRpiCqnsNArm67Rs6ZaLFbqRM5mMT8duTGOu1XpS6aDf
         0ieHcVEF1/RG+NUuTw9K868pZ/zUUThr3BvU8gmEGETH9QiCsOcD1zZrBorQ3bBTQCRC
         p67+0igQlHjzdXzt+z70pyFwhseKSZxpaUJpRXpI9AdOW2l9qB7kjHvFVh7Wg/w5cf8l
         tccU3ykMVmzzZMtCkcaEI3xAKNXiYoL8IB4ZgfZVLZsA6vhvC49qM/Yze9p/7yuJ/HJU
         t29g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553132; x=1796157932; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=R90t7onIqWceTO7ycfHwDRpJODze4oLHqHC+nwDR5adEV7+dsLUebxRWRkUVu1Iksx
         zk/xva1PZLoc3nYIymmFYC2L5cSOUnVFeotjeiycz/j/0gjXPUWXgkMQdpb/4o63lhDL
         AdSuquUPKU8HR90/ofdDULHjgPcuYVfcfzQb+NEh2wjh9KhPPGMXaLOY0fShBAkPcSM7
         WjBCTJ/ZxpCsTO4JyF22c3KmRlj/mlnuKK/o7tx6u/qmshkV2hkuy4LqBV8GpCyKUQSJ
         MEE2W19m6EqqY3EFx3tqf2wxaGHZvam+vGLAYz7ZEWxsExh3Es5FO40vs7BphzsN6IcE
         Z4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553132; x=1796157932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=BVVmsYN90iu+DHkD2GjPEmow3HeOGmAuhIQeJ/b1q7jgOLdgHhollZrDsWJqOVK/+s
         kJzAb5vQidh06PzCdDdux+KUCfyam/dYBblMFVCE8Y/sqghhsgNHrCjrHYtpHcswZMpz
         +567jKyT6dElEGDN7DmTZAkARfNuzBumpRmJ+cweY5dcGJoV0sg2P7CGnk1s+Z/BDmJc
         sLoRjjWircGAeX9LlWEcJrHKDrwxpOX5/M8nll43dW1OPQ9xdnpAVCXehn78J/NXGgAv
         JcnmstY1s1qAUE+qq5USwrhfuZpyMHGq/ZoQs1Hd9evlbmD1KpYuYiuRd9zxrsQUQ0xt
         t//Q==
X-Forwarded-Encrypted: i=1; AL+hErGmezEXWryjh1X13lx8Bt/IAcGWnkShrv7SIfRFOadD6ZXl5gKxW8P+Eo//FXeM/+m7QSPtGXGbm3g1dfVz@lists.infradead.org
X-Gm-Message-State: APuU4Z9V1myeOvuTQGaBeScMlxli+ANIBimBge8bZJydoR95OwK/eqB3
	V4J6e+ySyAhfi7YwuN+crEq6dwOo6Pk5SH8GBAKsAbW+LlkuxZSm2MKgLICA3OtmqP9UdpJcw7/
	bXSOJEFfaM7WbG6nqpgZynGhzL+67a0c=
X-Gm-Gg: AZFdTZfS0YjJmfHgz7U3mR+wIKlWNgDxXS9/SGvhXRVT/Y/A0QQGSDuIkN6jamJPZZ+
	wUIE+GaOdtukoekRB6wlKeDAB5a0mV5CWCe/Kg30xYwpseXLshEWOsa8a98vR0LAkBQzqLs/HYO
	dRBpowIOj6OlaKKthaizn6CAM1gCIXaSvu0l/tHGwsAlkqU2Eeud1njAglrJ7HqJ5FJxJK1QcHM
	xzT/B4hSflXl52yap1wVACsab/04Wxl7M1HuoRMD/8jt55zpsC77LijldXubRWi4QbRwvtIwG3j
	QQgP4AlRIhdXrPgbuv2UHxMCo7NVP/HXMWERWNmVFgQqWBuWOuv+xiDBOTRpHIL+A5U7gHegZb/
	RwN/SA+JuFuY8KM1AneGAIRpChF+QBpPMHbEOuhc0/YabztYlfSyzc9oG5htwxloqszbpsPYphy
	n30z6fTsVvGSBNnlJY
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id
 00721157ae682-8b52043ff55mr69264227b3.21.1795553131511; Tue, 24 Nov 2026
 12:45:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-2-tanure@linux.com>
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:45:20 +0100
X-Gm-Features: Aa3M54pybnp1CQPsafQYDf0P2DptibC917JzUwMw-x18aat2wfvVMhiMsv1rR3s
Message-ID: <CAFBinCDPGYpR6rmtJvN5pT1OdSN-ne=YJVeT0kk4Ff2SB2vraA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
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
X-CRM114-CacheID: sfid-20261124_124533_602891_8BA85248 
X-CRM114-Status: GOOD (  11.60  )
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
aW51eC5jb20+IHdyb3RlOgo+Cj4gVGhlIFQ3IGhhcyB0aGUgc2FtZSBtYW5hZ2VtZW50IGJ1cyBt
dWx0aXBsZXhlciBhcyB0aGUgRzEyQSwgaW4gZnJvbnQKPiBvZiB0aGUgc2FtZSBvbi1jaGlwIDEw
ME0gUEhZLCBhbmQgdGhlIEcxMkEgZHJpdmVyIHJ1bnMgaXQgdW5jaGFuZ2VkLgo+IEJ1dCBhIGRl
dmljZSB0cmVlIHRoYXQgbmFtZXMgb25seSB0aGUgRzEyQSBzdHJpbmcgbGVhdmVzIG5vIHdheSB0
bwo+IHRlbGwgdGhlIHR3byBhcGFydCBsYXRlcjogaWYgYSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IHR3byBibG9ja3MKPiB0dXJucyB1cCwgZXZlcnkgVDcgYm9hcmQgd291bGQgaGF2ZSB0byBjaGFu
Z2UgaXRzIGNvbXBhdGlibGUgdG8gZ2V0Cj4gdGhlIGZpeC4KPgo+IEdpdmUgdGhlIFQ3IGEgY29t
cGF0aWJsZSBvZiBpdHMgb3duIHdpdGggdGhlIEcxMkEgb25lIGFzIGZhbGxiYWNrLCBzbwo+IHRo
ZSBleGlzdGluZyBkcml2ZXIga2VlcHMgYmluZGluZyBhbmQgYSBUNy1zcGVjaWZpYyBtYXRjaCBj
YW4gYmUgYWRkZWQKPiB3aXRob3V0IHRvdWNoaW5nIHRoZSBib2FyZHMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
