Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323D606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oZqR+NHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3FI8eytDQRR0jrejDeylJFu81Ax8qXOtnJyw4Co4OFg=; b=oZqR+NHWp5jTYC2P/TYSZnsLQN
	ek++A0Atfj4tr9qA6bJMIW6NlgTcA3eN10O8V2ry7YLbkxlQlhkT58xu7j7kqK3pmg8OMLndAUB+p
	IvJzE1I88BXk/XojAqo2Oh30mT1qUkIFbhMTNd9oGL0NYVx7YCuYp9rMBFLbDxIpoR2zn70ZE67yh
	n67ZbgwVhidbW0Dcc2E0E1b68a12nDLbunluhFbrnORG4qtyANQsJ9ojOnEAjsJr6/8+cT1nGqlHX
	BNtvIMhTHF3rxhC/kBNx4fCk4DtxW9t49L9gOcX88zZslAGz+U3rMlVXS9/+qXhROztep7cCOD/fY
	MGc+2TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY24-0000000D5AW-2dYI;
	Thu, 26 Nov 2026 11:52:56 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY21-0000000D58e-2auQ
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 11:52:55 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c477so58699225ad.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 03:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693972; x=1796298772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
        b=d7z0VEoO74khA08acejPdeo4IYwWFDDoQ0xTOQdqQPP/ZQ12qiM30+hQURBzn9DRfm
         MYiabBejsATEYVQ7Hn2my4GJpMG9gHIC7z3xCTx5/8dM4LT1joCjRfqLceX2uEIUxhpo
         axUqUoreT0N0jByHihD2itCS958dzWfDV6X213B5Msz6s0i48zNvXZUiTncJQ7/lAgf/
         TVT0KrqFUxOo9iNbWycmXpl+u/D7SsAsiXgR+LlV4UGfGBFnX9Cd5oOUiuxBBsIS2aG3
         rq8AkJDVxaKPxqEiM+Sv/b9rkJ/xoC0SbVYLOaCE+ET7kmwk1T6wu8sCwTnF7rzuAGOA
         4HhA==
X-Forwarded-Encrypted: i=1; AL+hErHlyF4rHhi0db4/M5cSuKtYGyEXWA3Nnvcabn9lyX4rnWPWD6EVmGvjPu4z+EurR19QutfE4OcKWRcT33EZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+ILIFrK/Owdt7z1e4Cp2s/LVRDkvTEB17+FQEcpUqgHvHqr1HD
	WYgk4bfsBpxl2XZ82mJhTHEEAFdB8Es5PSRavLnK1JNgisgXPlgc/FiiQxEoguYm
X-Gm-Gg: AZFdTZcQdvo7xcarvVDBhZkv+HuCSMAtQuWSQz2QIe4zRMfYTMljNzWHQvhnix5PEkk
	WXxzoAN39uQOnEfohqY56jYFlUuMwb6N8OzY4l6CzSszOgkU20mIB1rORpBBPNp8Tt5JuYMQh7Z
	OcfWLA6u3V6pcTF4Xi8BLs+0hEYE+01/jKCIWCqKlJg8s+ujRIBTLmoax6d06jqdUYiEqu0YgdL
	/IFN4YzwQBQJikONEQx68oz7lBEJvzlPlt+aWeqS/VaQ670XkGlKc7AHy3qWHlz2PVnrWM/3EUf
	ks42824pFdbZbQDX2kVMC9bkGmvbgVe2LOHaLGnfjzWhVqnrrbH8+1beT4xU7nqZX9W+ZUBlF7U
	ltDb00RiirG0yCPHbmQmQywGXc2zy/OGRy9uF3vMBWOZvYj+ZWRlwlfXZkvOLGDj46rIy35hGGA
	QOrwzDrq66atPXPkqyqCzNBzcxLMbdfWbfzXptS5X6FrhhNSy5ghZeAXevR3YsaPUmP6HtDRg71
	5NxFnaf4uk754O+iHssVrBqbpFdjVWIR45zxVSu/1rgLDLim2C8Mvd/c9xq0Nec9uG/tKT+LUAx
	4V/AL01jcz4zj4WRh0OnAmkRnVH/o6D1NlTK4GcQytKhJIBftlydTZIHrJHw1Udw0JyaqE3J9z0
	BrsYfCXRB1GV+9sI0NNMQdiNKgQKhjQT82G7TLzxX9xr2pppkgTv1+CZ4+Q==
X-Received: by 2002:a17:903:41c6:b0:2ed:f9c:3e5b with SMTP id d9443c01a7336-2f03f17d5e7mr223027485ad.52.1795693972430;
        Thu, 26 Nov 2026 03:52:52 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm49486345ad.45.2026.11.26.03.52.52
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:52:52 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so5105447b3a.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 03:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFts8JonUyo4jwjH4M9BYBVQ5+ssjHq645/bAiGdBrDM3NvBPFIukMY4+RPJRga8oOYrzcV17poNiSvBr7J@lists.infradead.org
X-Received: by 2002:a05:690c:4985:b0:8b3:3854:c28b with SMTP id
 00721157ae682-8b520435d1bmr62048027b3.22.1795693500919; Thu, 26 Nov 2026
 03:45:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 11:44:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
X-Gm-Features: Aa3M54p7abSX0OPwjSGJJWzx2W6fGgqfMqyz9aVR061y3YOch6bS5dv9yFIyoYk
Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
X-CRM114-CacheID: sfid-20261126_035253_736942_48A5FCCB 
X-CRM114-Status: GOOD (  16.36  )
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

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgOTozN+KAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3Yg
MjEsIDIwMjYgYXQgMTA6MzHigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdy
b3RlOgo+IFsuLi5dCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludF9tZGlv
OiBtZGlvQDEgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IEx1Y2FzLCBJZ29yICgrQ2MpIGhhcyB0
YWtlbiBhIGNsb3NlciBsb29rIGF0IHRoZSBNRElPIG11eCwgc2VlIFswXQo+IFdoYXQgaGUncyBz
YXlpbmcgaXMgdGhhdCAoaW4gbXkgb3duIHdvcmRzKToKPiAtIHN0YXR1cyA9ICJkaXNhYmxlZCIg
aXMgdW5uZWNlc3NhcnkKPiAtIGlmIHlvdSBoYWQgcHJvYmxlbXMgd2l0aG91dCBzdGF0dXMgPSAi
ZGlzYWJsZWQiOiBJZ29yJ3MgcGF0Y2ggc2hvdWxkCj4gZml4IGl0LCBjYW4geW91IHBsZWFzZSB0
ZXN0IGl0Pwo+Cj4KPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8y
MDI2MTEyNC1yZS1tYXJ0aW4tZzEyYS1tdXgtdDdAaWF2Lmx2L1QvI20yNDBmODg1OTc5YzdjM2E4
NGFmMjZlZThiNjBkMzhmMzA5MmYwYzBhCgpJIG5ldmVyIHNhdyBhIHByb2JsZW0gd2l0aG91dCBp
dC4gdjEgdG8gdjQgaGFkIHRoZSBvbi1jaGlwIGJ1cwplbmFibGVkIGFuZCB0aGUgVklNNCByYW4g
YXQgZnVsbCBzcGVlZC4gdjUgZGlzYWJsZWQgaXQgYWZ0ZXIgYSByZXZpZXcKY29tbWVudCwgc28g
dGhhdCBhIGJvYXJkIGVuYWJsZXMgb25seSB0aGUgYnVzIGl0IHVzZXMsIGFuZCBJZ29yIGNhbGxz
CnRoYXQgb3JkaW5hcnkgcHJhY3RpY2UgZm9yIGEgbmV3IFNvQy4gSSBhbSBmaW5lIGVpdGhlciB3
YXk6IGtlZXAgdGhlCmxpbmUsIG9yIGRyb3AgaXQgaW4gdjkgaWYgeW91IHByZWZlci4KClRlc3Rl
ZCBJZ29yJ3MgcGF0Y2ggb24gdGhlIFZJTTQgb24gbGludXgtbmV4dCAobmV4dC0yMDI2MTEyMCwg
d2hpY2gKaGFzIGl0IGFuZCB0aGUgVDcgZHJpdmVyKSB3aXRoIHRoZSBvbi1jaGlwIGJ1cyBlbmFi
bGVkLCB0aGUgTUFDIG9uCnRoZSBleHRlcm5hbCBSVEw4MjExRjoKCi0gYm90aCBidXNlcyBjb21l
IHVwLCBtZGlvX211eC0wLjA6MDEgKFJUTDgyMTFGLCB0aGUgTUFDJ3MgUEhZKSBhbmQKICBtZGlv
X211eC0wLjE6MDggKE1lc29uIEcxMkEgSW50ZXJuYWwgUEhZKTsgbGluayAxR2Jwcy9GdWxsOwog
IEVUSF9QSFlfQ05UTDIgcmVhZHMgMHgwIGFmdGVyIHRoZSBhdHRhY2gKLSB3aGlsZSByZWNlaXZp
bmcgOTQyIE1iaXQvcyB3aXRoIGlwZXJmMywgSSB1bmJvdW5kIGFuZCByZS1ib3VuZCB0aGUKICBp
bnRlcm5hbCBQSFkgZHJpdmVyIHR3aWNlIChwaHlfcHJvYmUgcmVhZHMgdGhlIFBIWSB0aHJvdWdo
IHRoZSBtdXgpOgogIGFmdGVyIGVhY2ggYmluZCBFVEhfUEhZX0NOVEwyIHJlYWRzIDB4NDAsIFNN
SV9TUkNfTUFDIG9ubHksCiAgVVNFX0lOVEVSTkFMIGFuZCBSWF9DTEtfRVBIWSBjbGVhcgotIHRo
ZSBzdHJlYW0ga2VwdCA5NDEgdG8gOTQyIE1iaXQvcyBpbiBldmVyeSAyIHMgaW50ZXJ2YWwsIDAK
ICByZXRyYW5zbWl0cywgMCBlcnJvcnMgaW4gMi40TSByZWNlaXZlZCBwYWNrZXRzLCBhbmQgcmVj
ZWl2ZSBrZWVwcwogIHJ1bm5pbmcgd2l0aCB0aGUgcmVnaXN0ZXIgbGVmdCBhdCAweDQwCgpTbyB0
aGUgZGF0YSBwYXRoIHN0YXlzIG9uIHRoZSBleHRlcm5hbCBQSFkgYWNyb3NzIGFuIGludGVybmFs
IGFjY2VzcywKb24gdGhlIFQ3IGFzIHdlbGwuCgpMdWNhcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
