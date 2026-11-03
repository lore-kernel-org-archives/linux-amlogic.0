Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE9606A326
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPdunyLK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7OqSBcXsltYo0RFRn91q9rNDVWMeqzjFagLkxEz1pCU=; b=mPdunyLKWC6lzPzVDQR/WaTYG7
	wVXnqN9WQKprmd4OtsHorVgPd77ol2cEmq8ismqbdafdwZXXHmQhOC+3tdRw2taY16E+d/GejUFRq
	NFkNIB+NiB8lqqhCjKBWqw5HV+E6w3D/k3bbnl66mhFDuet0K1jcxSAJ5FGR2dLsZveM87GmkUPgT
	RpXtlNBRHmqIM45z3nA42v04a5XXPoEhgSbPe8B2StwhN3PTYjDD2/FGe/GOznQSJi1cw8qibz3FP
	6O7iEyUIgr7e5j6gji+5HIIQ+4mqcyHuV0sX7lmIas/Aur2iYJF9/tU/i1iOpDzbaS3DfWMqgt2tK
	jpLk9YaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHV6-000000039Jo-0BTA;
	Tue, 03 Nov 2026 16:36:44 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHV2-000000039Ir-1Cyx
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:36:41 +0000
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5364042eecfso70493541cf.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723799; x=1794328599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAabvEd6vL4y9BLf5sVKsYhFFT7p2yobeyEnKOJ5A4=;
        b=RJGV2IBNBw1eEFQMa+75sE2S9Ey7VfmD2RRe4GpojEEdahcp53rgb0BMXJro5Hh8X6
         a623HPfpuKYwwr8wAHa71sUzhye6efUcJK/TuwOrp98Gg/QHeO3Ro8SwgQ0ZehwUMz/L
         UlHY44vw1BFzI+hOiF5loStLI1I9YKHI6yh42KRF7SWd/Ioj5xj2m4Ujz23BGnabX+3S
         FXiYs5jVcThwwAKpU64peG4we/KTGkg60BRglk1dwQ2Cy+gPbkLwjzI1dMHhi0k4dp2a
         0mZJQLzdfMj/TZ3t14HZ0LYFiqjxA3vVxZRqnPdccbp1m4fBEqH55CWzzcdGp86UaUWx
         pK4w==
X-Forwarded-Encrypted: i=1; AKwUvBy7m+hvf9fcituGuz8oU+nT/+lxQHr3YDFbB5CTpU93NSJP7J+kWmkpzzAdQSyirqngD31oVpeaYo+qZjR4@lists.infradead.org
X-Gm-Message-State: APuU4Z/1iCQ8y0iTUzfc7zJYVeUm5jQ/EFKmswwOZWE1qceGuF0pjQsU
	7/Xpso7RhLLSuot43RbbYCYb5gZsXA6uleNr3/lziHfStnPKQTW6WO6zcshW1eUFKgU=
X-Gm-Gg: AYBFou2fVUdf2FMtqaLPmouwYOiDoU+IiOErhM5J7ANmQkF/E/6NS9ogoU+z8VJbbwH
	M/e8ABlrlVAUW6Z6H2TnsZ3wGYGaRPJ6eG8vjlVNZu+2dr4flT8WD84eFhU6P2V/idrzjJnvZ/M
	7z+kAjhQ0Niqa6Uwi73llZdM9jsL0dGe1rrXLJsjVf2RoihZxI7ibbevE10YZm/XSiXrINWTxC0
	Tcxb4Dru2p7dwPWKcyWXRjp75TZVuGtVAPC8Xb8UwGOvfTziGFuyyz4Pd9t+uPJQuT755ItWSqb
	xHSsb5sV2GjuedVq9Xa93+cKMZCJzHbOz+Hl2l/eYLq/VlrWuFHR0IpwJ9PT4rNpeH1LUxUoNdS
	iLG+a3zI/1+vH9K2gQFXXQZdxsGWjAPjnyZH80/gmx50AQbLcODzUZnS34Ja7KHJPvz4J5vVg6t
	H5rKHDQP8YBl1eXyMj3hoH6d76ivjQyrAp8xRVQJPTggGM4OGhySCJDeul8ZMqrj05iutn8TJwf
	6YpI5UCRkdSA2KJgrrbWpIgSHQZxvaEUIffos0+nHMWh3gWdsJyWTBjKUF/LEZQnk/FMjLhmXwV
	g9Md4L1dAS7Kd/dS0VZ/MCsz2vm2tyEuOsMNeGqcdeCAutsgB3d05ZkCDGPisNfkbl6Z7WwqIQU
	XnujKXBkVMTYC8c6v4wUFI2vFV7Tqu8TR1EeQp/SagAP30Oz+hESN3Sey9hmZBhpgjnqsjJKag/
	ZZuw==
X-Received: by 2002:ac8:5a04:0:b0:535:25db:17b1 with SMTP id d75a77b69052e-542b62a459emr229704821cf.17.1793723798852;
        Tue, 03 Nov 2026 08:36:38 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm128731cf.15.2026.11.03.08.36.38
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:36:38 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-945ae2daa3eso327538985a.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:36:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwPp1sw2pvGEPzno+POzSwzxX4EOHY9JKsWSJAFUcBE+gwbUcoiQjJ5OPQF09H2OIZ7NW7s7rea69d12QVY@lists.infradead.org
X-Received: by 2002:a05:690e:4810:b0:67b:9051:e32a with SMTP id
 956f58d0204a3-67ba50e0ademr6918680d50.93.1793723407281; Tue, 03 Nov 2026
 08:30:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
In-Reply-To: <95418d50-a83f-47da-819b-de04eab449e2@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
X-Gm-Features: AclHuK9mStYKxlMFWLlexMhXND4q5zYuU5C_HQS0PBE7THFUZlCXo6CxCqTl6Rk
Message-ID: <CAJX_Q+1jAYu-0XjUqmNsR4hbSPTWT+JzsBK+PNqPg_yxCKy8YA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083640_330247_2C603544 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCAxOjE44oCvQU0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gKyAgICAgICAgcngtaW50ZXJuYWwtZGVsYXktcHM6Cj4gPiArICAg
ICAgICAgIGVudW06IFsyMDAsIDQwMCwgNjAwLCA4MDAsIDEwMDAsIDEyMDAsIDE0MDAsIDE2MDAs
IDE4MDAsIDIwMDAsCj4gPiArICAgICAgICAgICAgICAgICAyMjAwLCAyNDAwLCAyNjAwLCAyODAw
LCAzMDAwXQo+Cj4gSXMgMCBwb3NzaWJsZSB3aXRoIHRoZSBoYXJkd2FyZT8gSWYgc28sIGkgd291
bGQgYWNjZXB0IGl0LgpZZXMsIDAgaXMgdGhlIGRlbGF5IGxpbmUgc3dpdGNoZWQgb2ZmLiB2NSBh
Y2NlcHRzIGl0LCBhbmQgdGhlIFQ3IGpvaW5zCnRoZSBleGlzdGluZyBHMTJBIGxpc3QgaW4gdGhl
IGJpbmRpbmcgaW5zdGVhZCBvZiBjYXJyeWluZyBpdHMgb3duLgoKPgo+ICAgIEFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
