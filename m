Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065C606A685
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDAIqZSW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YEWzoWfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eWt5MFq1U7cioYcLcbkdPCAHNM6tfOymJuZ4fyP01L4=; b=jDAIqZSWI1TAxu6GjWXZC6zVzT
	LPf5FMZVvil1Gm9WnOoGappC2nrckRTG7h63mXQhcmxrmv5t704AsJIkyC3oL9nfVQVwvOd618WPt
	qwQMm45hOdpyJmWyGoVo9vmlqjVC71xMhpSj8PKpnO+9w9jsFdDCBfXMc+sZ9ZEvXVUcjnCOGg8G+
	p0YyRdssn1PiBp/DOCWofbLm9hv5NN5mPO0Z7lh/0ex/UXd2Vr3O4pRdtefE7CMTiaQNG0AZIxNIg
	s0xUkkBqaw8JDhGteqqGQakrVb+RaanpGPBN5QVKrampkR9ul2fv6S++4aBIdAGHtnHK6fzB4hQP3
	iVGqQr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQ4-00000007lNy-0H0u;
	Tue, 24 Nov 2026 20:47:16 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQ0-00000007lMC-2Wig
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:15 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b3402105b9so35588107b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553231; cv=none;
        d=google.com; s=arc-20260327;
        b=Hx0++x79pRm86zxdtR74nk35QSdR7nRgf7LCfQlsqQvyjo3ZUqxY4Xxp/Mpohaweuz
         jt49/hgEpBy+UxDabldyzAlt5heIScJlJiuB1X+sbGxOOUbYc/CauZ19lBaLcGyQmWdR
         obFzSTm0LgNmKcCH9lr1E0Cg5sDw5OIioG7s5DGKKglSaPlij/Oeg/L1/xi1lRSc7+yG
         wAqOe2xVPE9u4sZp8zy2ihJNhy4wENH7L23uq9ZXAGsluVbd9yXpubbLcfuL/nUrz1A8
         ZXTBF4HYjAq1wzW45NXGj8bgNH1lTZuDAYQ1poFmXpWOGtHAywnS9cWWHBJjkaX0GPgr
         MCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        fh=xW7xIXX4olCkOgAEfFSPdHWJU2UXw/u70xVFb/m7YkY=;
        b=ZBWhHMcCoNwynr8EYlDELmLz0RXDQnN4gNHdhVQ53K8oUEFcQODzTiu51h1czpryHf
         j85O3geAb6FUw5NXPqtWcoMKxq0LSjeMcUVmHyq72cO1+yeZufhiU9sjh48WTqc+vSNt
         J6FRngeu05upkYRzebaTzq742oIxRBR0M3ZDhO2fpi3gjy3yIRrqOB7i98gZ5Td+zIEy
         UuAtBWVPmpHn8SfOBrB+THmMFm2ltKG3lCHzdBq7ESG8HZ3Rl42gMRBcgLrLibN33qoW
         ee1Hq+DOXGn6iRo3R2L1gEHh0altWzQh0qyGATqw1HSJIO7kYCcG/Nnb809Zx60HZ8Po
         YWYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553231; x=1796158031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=YEWzoWfa5m8lkp4l71xUanG9dbC5YpDv42AqDfqC1vJu03ZTI4P76HYMaLznxF3dWc
         7AGggwdwMjgVP06LnT6UqgXykt8MzlqFDw1REqueHOmeV4UeFPDLCeZSbIquDe8P1of+
         f7n0ZFdTZz7r2iS9jeM4Ln+gMbvVvOcD/XX4zh0vKOQlghFtv6c2nJ+GmXuhqkssc1O5
         NyeMkeE0Cpox/1sqtEpYe7OoE6jQrk+oMC2BeP8bdYrqr97OxlHb2DTrXXl2BrNPQzQZ
         gKeJhiPZS8JVT/L1jAbfpVIDBCy2wHl3wpwuVg2mcYi6phXJO86MSj3r78RN1j/3L92D
         lMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553231; x=1796158031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=o10WDkth3QsorcjvfZuvERgHrkH5pmN0EalNQdEdbzldzpQ7BeCW0mGNyZ9SLIskj7
         vx156Y02WNpRfVd7CKvKZbrCR4aM+9zsh0T7GpdV7LVRgogDcwuowyOypHGwz2Gh5sBh
         DLxgnnB2lYz7Hi6u/YmGnbdCw8Z4I2kQILvMedzPPryrbAKH77zpGlgRsGkPhOWT4t4W
         LCi6SZz0MH9ps7T6wzcaJbZ1ya/1ODZuE8PlaL/j04WlbW0R32l1BrVlWfgteOeGWfW+
         RXCPBfWwVQRXl1FABE+Yr4HEouNh7OqnelDgw/1ahuh0+iHNlU7QnRxeuk8E0dV70NwM
         Vr4w==
X-Forwarded-Encrypted: i=1; AL+hErEm62kUae2NobgjAlJxIUjnrtazYlGKI1SBjWRUJcalriyl0Ko+orQAcRmPHATPLfq5705RVxGH93YxUvr2@lists.infradead.org
X-Gm-Message-State: APuU4Z9JBUZ6f4zsTP8yYIiyYD1X6bjhcNUj2A9HZBXK8/FcxU8/0NxS
	x/9r1yGIfQXeK4E47aDuEHWpsTcZdC8ZGkvQZuWMQaoP6oMqSCwqK8rIBKBze5D65Rp09aEA00w
	3xlPOtVSCriO+ZTbDlZuUqeiXbGerBDI=
X-Gm-Gg: AZFdTZcsVsy5txLsTjBCi/uxV4g9To25PRZMK9Br40krWRatCfiTeOn4TbNOjRDQXbf
	30GIFsOs890rvTEfvclBb2HbIhQ2EKxDA7ZNLhjN7YA6ZrCo7x8gOR17qNZ3psZCihaJKr7HbD1
	GNjLjxKxPFyzCdcMg8zcdD1fjN4G3Orx8xEHYRlGGAyuvKMezgNjyHVwFlDmyFFX5Mp6sa9Gu7a
	jfw77yAqUlcnD8CPwZoGrgBLhX+VjK8k77v4mvdxeh8N3F00kimaJDyB2oRhysUXPHIH1LD5lWO
	pWGw2qsP68HiqGFfHqHVRlDdQHZoqXqxCXGyXVkz7LhJvLVyA5MqqpN587kjsQJm6MQen8RLUcm
	T6g4z3oy1I7w8OdKHUnIM3QzobMQnZ9WIN8IKzwAsIVvkMCWGjISKF0Yll1J3OR9a9fSIMA==
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr61098007b3.42.1795553231171; Tue, 24 Nov 2026
 12:47:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-5-tanure@linux.com>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:47:00 +0100
X-Gm-Features: Aa3M54piMjiC5eZa2JiYOkn7APdjKphVw0p4pBUTRqSLCMVNRfh1PWCBswFg3JY
Message-ID: <CAFBinCDVe5njTaO9xN-snXRQGKHDpsber4hi9P+Fq5SD2jMUEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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
X-CRM114-CacheID: sfid-20261124_124712_868131_02994344 
X-CRM114-Status: GOOD (  12.53  )
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
aW51eC5jb20+IHdyb3RlOgo+Cj4gVGhlIGJvYXJkIGNhcnJpZXMgYSBSZWFsdGVrIFJUTDgyMTFG
IGdpZ2FiaXQgUEhZIG9uIHRoZSBleHRlcm5hbAo+IG1hbmFnZW1lbnQgYnVzLCBjb25uZWN0ZWQg
dG8gdGhlIE1BQyBvdmVyIFJHTUlJLiBJdHMgYWRkcmVzcyBwaW5zCj4gc3RyYXAgaXQgdG8gMTsg
aXQgYWxzbyBhbnN3ZXJzIG9uIDAsIHRoZSBSVEw4MjExRiBicm9hZGNhc3QgYWRkcmVzcywKPiBz
byB0aGUgdmVuZG9yIHRyZWUgbGlzdHMgMC4KPgo+IEVuYWJsZSB0aGUgY29udHJvbGxlciBhbmQg
dGhlIG1hbmFnZW1lbnQgYnVzIG11bHRpcGxleGVyLCBoYW5kIHRoZQo+IGNvbnRyb2xsZXIgdGhl
IGV0aGVybmV0IHBpbnMgYW5kIHBvaW50IGl0IGF0IHRoZSBQSFkuIFJHTUlJIG5lZWRzIGEKPiBk
ZWxheSBvbiBlYWNoIG9mIGl0cyB0d28gY2xvY2tzLiBUaGUgYm9hcmQgdHJhY2VzIGFkZCBub25l
LCBzbyB0aGUgUEhZCj4gYWRkcyBib3RoLCB3aGljaCBpcyB3aGF0IHJnbWlpLWlkIGFza3Mgb2Yg
aXQuCj4KPiBUaGUgUEhZIGludGVycnVwdCBpcyBvbiBHUElPSF82LCBzbyBsaW5rIGNoYW5nZXMg
YXJlIHJlcG9ydGVkLCBub3QKPiBwb2xsZWQuIFRoZSByZXNldCBpcyBhbiBSQyBuZXR3b3JrIG9u
IHRoZSBib2FyZCwgbm90IGEgU29DIHBpbjogbm8KPiByZXNldCBsaW5lLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
