Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8067A606A32C
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrFpJVzy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dVdTPmTjJJ+/YOT1DT35W1AE8TEr4NevRA0zlywrXik=; b=VrFpJVzykIfe8Rw+jV07cXQtCc
	gezMrSw05OgkqtbtMA3EbN+TLQYjuBVkGWcQCNbsR7TrZA1di9y5rSNMQarAENqmlQ7NEIRy5oX9s
	QPZ6Ltoq9yceFyi2NRIXNwoGPzaZ2qLxbYt59rDgQI2M/qWxEDGGMMq3+631B5X7I8nCPirQz+b1T
	nsYlWeWam8EoUkAu2mlAj06BVsqc9cwmoYfY8ULcT7ZHoaQBRqsOEdDvnQIhg61biTQpepbFYPWgw
	kNsLj5sXp+H67OOrfRvoiGwThtaD+wf4zlFZpL33PwbOiTmFGHnjX6kMNBwmscXu0PeWaWk3Oe+Vv
	/ujp5HNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsj9-00000000MSy-10X1;
	Sat, 21 Nov 2026 21:34:31 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsj7-00000000MSI-0cGS
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:34:30 +0000
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so1253390a91.0
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296868; x=1795901668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
        b=w5txJBNYrj7aEQ49FC1LDHhE10OJFc6jdYSeMS3IBh2Ima7SKf5OOU5VVLCthCDteb
         lODlKlRfmWo18Dah7ZkBZP2C//JLpNPa+tmkkGfVktCzT8Vcd7fXEB6Mwb/sJIZZ/T8V
         4l5MlxkxqCXYG2tG6M4RIRX70/dYFi3t1o79ZW2ylQnntLM+dch2LTk/YWD4xZB1wUpR
         ppyjnpU4WchLtwNdto1tfEVhLYfHSXvuXH3wgjLls3ycHBFzKtPonKJGmaUX1/+cY3a9
         HNQBFBStnjNRZSTnOXNwOGO2HudxnyV3N43mjWlOZ/j0VBVb0YciheyhmLnPFzPoQGOb
         47Uw==
X-Forwarded-Encrypted: i=1; AL+hErE83jXZBSVxZFLMs3DW/3i2EO0JmXMbmYbLFMqwCMDsbAsDkxfDd2DGYOEbdAHVaVOdXRzxqyVJbWW18mhC@lists.infradead.org
X-Gm-Message-State: APuU4Z+H8ngtKTfAIoSGpf5x1XdsTmH1PlvN9SQlX4b4rWBtE5OkSqKC
	/etM+WZwywCUw9G8fiCMBDx10TEnTYmiCYPEA/wYtWRCDT8B/peGjeLLJ3DRHsg8
X-Gm-Gg: AZFdTZfXRs6UVjZ4WwU54ewx5xOek4ey6HOgpTNRNePnhCOibZ9r6Xx/jue33MQV+oK
	+A2vxI/3lB/qTi+ci6b3EkYBYEBL98qjhdeqY8/IUFUO75hsvW99OVezb0MfYFOF5iTIV5f9ynT
	fANutPK4VJC9e4o6Mvt3pv8Cfr3u5SXkUHUoLW/BY4hfPhs406Wc6tdZuco0saH/7H1T0b2lJ4W
	2Z3Eilaik4aoSI+/pyhDwocmVyvMgiPS3uWJukre30b+ylKoq4N/BDpwjBKrOJ6WjtdlNshk8aL
	E8zCAa2sRL+14ya6zj/Urn00D2hsbcT1BnYFbtGng+QCvwpv/mJgvmhx/fLY3ayO/IkjCDiPa54
	nAMmL2sxbT4qHuHQ50mOQzRNHQgraz0XW92VMKfR1GAjh4TBt4UzTGpon1DJKHn67UfsCfdt5Ll
	xAdNIWhph8mjFg1OMj3BqhlPxynToPRBAFxEIuMnT2Lh3ZQmHWRK8W/HfgzYnidQH5g8nt0g8y+
	e4ow4wED699r7oD6sW6dhvAnUIgQ2WYwRMYWIQSIcQlx2txlRQ0eXfz+Xlvdt3vw9pRsyRYwSh2
	lVATflu9aJmYGnoNVyZ6H2YC/gh5kWVTeT0AH5yvil4bh8OsBs7099oeIFZ3J4es4NwW5ZufRi/
	qpe86pnc1/SsSFHgmy1NryHEYEbBe0t463QPhTPC8jqs3RT7rKqe84WNukw==
X-Received: by 2002:a17:90b:1801:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3b41c9e4b0dmr6866384a91.31.1795296868250;
        Sat, 21 Nov 2026 13:34:28 -0800 (PST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm2638760a91.3.2026.11.21.13.34.27
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:34:27 -0800 (PST)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f07a960666so1877135ad.1
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENLFG7zooKiHUNInap/CwxY5TL/LN/Axc/JDUQSUMXeemUJKCwMCsMXjHV+mxDJ66ePm5C85NGO8Jl/Kek@lists.infradead.org
X-Received: by 2002:a05:690c:7206:b0:8b4:e51a:c4f9 with SMTP id
 00721157ae682-8b52032b68dmr26349417b3.1.1795296389589; Sat, 21 Nov 2026
 13:26:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
 <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
In-Reply-To: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
X-Gm-Features: Aa3M54ryC1wrMtzkfpXZSCYbt8X4yrGmEQflHHmQnHyfNLikt3muwFhwFJm0PEo
Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
X-CRM114-CacheID: sfid-20261121_133429_207637_C8BE56CB 
X-CRM114-Status: GOOD (  15.67  )
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

T24gU3VuLCBOb3YgMTUsIDIwMjYgYXQgNjowOOKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgTHVjYXMsCj4K
PiBPbiBGcmksIE5vdiAxMywgMjAyNiBhdCAxOjE54oCvUE0gTHVjYXMgVGFudXJlIDx0YW51cmVA
bGludXguY29tPiB3cm90ZToKPiBbLi4uXQo+ID4gKyZleHRfbWRpbyB7Cj4gPiArICAgICAgIGV4
dGVybmFsX3BoeTogZXRoZXJuZXQtcGh5QDAgewo+ID4gKyAgICAgICAgICAgICAgIC8qIFJlYWx0
ZWsgUlRMODIxMUZELUNHICovCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+IFdlJ3Zl
IGJlZW4gZm9sbG93aW5nIHRoaXMgZm9yIGEgbG9uZyB0aW1lIHVudGlsIHNvbWVvbmUgZm91bmQg
b3V0IHRoYXQKPiBSVEw4MjExRiBoYXMgYSBicm9hZGNhc3QgZmVhdHVyZS4KPiBDYW4geW91IGNo
ZWNrIHRoZSBzdHJhcHBpbmcgcmVnaXN0ZXJzIChvciBzaW1wbHkgc2VlIGlmIHRoZSBQSFkKPiBh
bnN3ZXJzIG9uIGFkZHJlc3MgMSBhcyB3ZWxsKT8KCkNoZWNrZWQgYm90aC4gVGhlIHNjaGVtYXRp
YyAodjEzYSwgcGFnZSA5KSBzdHJhcHMgUEhZQURbMjowXSB0byAwMDE6ClJYQ1RML1BIWUFEMiBh
bmQgUlhDTEsvUEhZQUQxIGhhdmUgNC43SyB0byBHTkQsIFJYRDMvUEhZQUQwIGhhcyA0LjdLCnRv
IEVWRERJTy4gU28gdGhlIFBIWSBzaXRzIGF0IGFkZHJlc3MgMS4KCkEgc2NhbiBmcm9tIHRoZSBy
dW5uaW5nIGtlcm5lbCBhZ3JlZXMuIEl0IHJlYWRzIFBIWSBJRCByZWdpc3RlcnMgMgphbmQgMyBh
dCBhbGwgMzIgYWRkcmVzc2VzIHRocm91Z2ggU0lPQ0dNSUlSRUcsIHdoaWNoIGdvZXMgdGhyb3Vn
aCB0aGUKbXV4IHRvIHRoZSBleHRlcm5hbCBidXM6CgogIGFkZHIgIDA6IDB4MDAxYyAweGM5MTYK
ICBhZGRyICAxOiAweDAwMWMgMHhjOTE2CiAgYWRkciAgMi4uMzE6IDB4ZmZmZiAweGZmZmYKCkFk
ZHJlc3MgMSBpcyB0aGUgc3RyYXAuIEFkZHJlc3MgMCBpcyB0aGUgUlRMODIxMUYgYnJvYWRjYXN0
IGFkZHJlc3MKKFBIWUFEMF9FTiBpbiBQSFlDUjEsIG9uIGFmdGVyIHJlc2V0KS4gVGhlIHZlbmRv
ciB0cmVlIHVzZXMgMCBhbmQKb25seSB3b3JrcyBiZWNhdXNlIG9mIHRoYXQuCgo+IEknZCBhcHBy
ZWNpYXRlIGl0IGlmIHlvdSBjb3VsZCB1cGRhdGUgdGhpcyBwYXRjaCBzbyB3ZSBjYW4gdXNlIHRo
aXMKPiBhcHByb2FjaCBhcyByZWZlcmVuY2UgZnJvbSBub3cgb24uCgp2OCB1c2VzIHJlZyA9IDwx
Pi4gVGhlIFBIWSBhdHRhY2hlcyBhcyBtZGlvX211eC0wLjA6MDEsIGxpbmsgYXQKMUdicHMvRnVs
bCwgOTQxLzk0NE1iaXQvcyB3aXRoIGlwZXJmMywgbm8gZXJyb3IuIFRoZSBjb21taXQgbWVzc2Fn
ZQpzYXlzIHdoZXJlIHRoZSBhZGRyZXNzIGNvbWVzIGZyb20gYW5kIHdoeSAwIGFsc28gd29ya2Vk
LgoKVGhhbmtzLApMdWNhcwoKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+Cj4KPiBbMF0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2JjOGM3YzZhLTVkNWYtNGY3Yy1hMWUyLWUxMGE2
YTgyZDUwZUBsdW5uLmNoLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
