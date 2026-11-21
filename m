Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D9606A681
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eAyKTOOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nPcYlg3mLtiwYkrf3i1CO/gQVCHpyqmwJKZy1VTDhGw=; b=eAyKTOOW+mBhLv+6Q8faZIlycs
	Tkvwg57SWdsur7RsjvBeOzHARTcqW0LUygTREY34xKOTYjzQX7PvSV58ktc65bRAih9Wt19Fs8FC0
	L1tVGzG97AmaIAPfIZQxCPxuc8Ql9NdSCDKzT7r/1y/ph4C262cyhmMlUiFSNaCK3i6dM4q8y1TrK
	gf5e8rGpANtkPZ92gmxTiM6GjkOWQUbdRip4s4GByQerkMnMZUbXgGRlOyYI3Qa/upUS60IhuoR7j
	iBz3m/CMqsA/IrNzw6oOxulaHo8d9sLSdXFuCcC3fWNjeQD8t8n1xWDwo4dUuB+eNAQzZyUXYJasc
	2wGftFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsiR-00000000MLo-3CIY;
	Sat, 21 Nov 2026 21:33:48 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsiO-00000000ML6-2iOz
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:33:46 +0000
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94999a08973so218400885a.0
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296823; x=1795901623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
        b=CYEkVvmHL5BgYaea2/Pi38IZ/ZMMETNlksxDLOVI4aaUdry3qRy5bgC0iJmujaGvk1
         xGJuyWezlNbXTXGTZyoy6A9/alCNLJgdj79VyCTNJpK9NYq5XHwcGcqFwcPAjckyyR0J
         8ulIt2yO+/tdVxgRcPRqKjIYa7uEUjjABz5vP9nvpXtnQ+booNh234Hb2hab91VD3tLm
         jytQPHu3uuTbJiHVLbgQI4nUeDJGxTBNwpR0oBJrKg+yUcTZBuRtPwtkMXYWRJJ1aH1i
         jfbBHK+jyfVKxnFGfV4RrabhCsE3yOm6tNiS4AoEkA/jBBEtfD1qMFqDYZe4sB3gAdZf
         xJ5A==
X-Forwarded-Encrypted: i=1; AL+hErGLUsSINot9vzilXFk2r2CK4OFp00sJsXQ3ixACC9IaLPQ4BHBXECKXKQfMY1khHlPJjEsyxHCZR+KYP3fe@lists.infradead.org
X-Gm-Message-State: APuU4Z9wb4cNEi+nN89H5hFwa9G55AY5KTT5Z7W1kL+vCfTYknsW0IT5
	MJttodKLqQaOM+gV/qUm1qPCTYD2F9dt3H+k3yRdo8NTS08K/uwRGY0A02dR3PrC
X-Gm-Gg: AZFdTZdY+QbQ2Nmvs/OHDPPoWEoNFoDTx/uzmM8/ZAryo05A7+QEOHYX49nEDCL1NQw
	B2pR8SMdS/4iqpAn5wn88vgZBoll9txE2nQFDEmW3niP1Pop+Ynqu7U2+pdZlbAK69EOEk7r0m9
	75lmGMbmCZzjyvhViR/XHRqXCXTOtCtUym+Ej3cP3dCDlmzJuJmWMGI+civMsFlInALb6T24j33
	wMUksxgPjBGEDQhnmTlQ0JWw+Dxqv/gaRlWaNyYiVNf++p5dDnjE16kppyiGv3Qv2J/r+tUsVSO
	TwQL1Cr8P//LDYjifsJIAPUL8ObhBRdgjGhJX97DLfCE+up2Xqjo0WnPk2jP4xGKiFa7qNoVbSi
	aHZEgn16B1wGCg6yOc9MKrY0/Pg8TG7YGWJZc8UUobHDyhy3rB8MWDglZ/fmwAVbappIPwQNEnx
	XgLGTF/Jsmi8gxT4UU9BT5ttiiI+w79UE09tdQRZZiWLz9FEC5Scl7CXtWvETrraCNKBljCcPIi
	Tx17tCQBJWVmZL4EtDnzeegGPJ72vjnUzW2wbqaimiP+lkhueIH3QiP2p0PYZzwj+HfY5xyAae4
	wxhzaqm9iPbhHDBmH9848MSQU57xw+8dfuH1rZ8bhmxLQ+eAHtm/k6HCORBk4EvOFmnFCDG/wdg
	XJUs7sxntd5aSLAnvjWT9yNzL15WgQQvv7iapwbNP+OXewPN2VNcx4lsLlA==
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1114641885a.23.1795296822345;
        Sat, 21 Nov 2026 13:33:42 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm488860385a.15.2026.11.21.13.33.42
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:33:42 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so1619454e0c.3
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFLuRCW3x9TbKAl9H+w4rN9lCz1mNGTw/5eMtWHeDw/aJ2VLUyoPzLoTfYF3T4FouiEEIy7jJELSqNFDZvt@lists.infradead.org
X-Received: by 2002:a05:690c:6c92:b0:8b3:7782:675f with SMTP id
 00721157ae682-8b5204bb6b2mr23239647b3.66.1795296429324; Sat, 21 Nov 2026
 13:27:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
 <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
In-Reply-To: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:57 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
X-Gm-Features: Aa3M54q0-4I4quSKRWB1j7w8Nv6x5L8DyHdNe8I0CVnAIjNuxS8ecYBkoD_MhLQ
Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
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
X-CRM114-CacheID: sfid-20261121_133344_761520_01374376 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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

T24gU3VuLCBOb3YgMTUsIDIwMjYgYXQgNjowMuKAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3Yg
MTMsIDIwMjYgYXQgMToxOOKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4gd3Jv
dGU6Cj4gWy4uLl0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGV0aF9waHk6IG1kaW8tbXVs
dGlwbGV4ZXJAMjgwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImFtbG9naWMsZzEyYS1tZGlvLW11eCI7Cj4gSSB0aGluayB0aGlzIGhhcyB0byBn
ZXQgYSBUNyBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyAoZHQtYmluZGluZ3MKPiBvbmx5LCBu
byBkcml2ZXIgY2hhbmdlIG5lZWRlZCk6Cj4gICBjb21wYXRpYmxlID0gImFtbG9naWMsdDctbWRp
by1tdXgiLCAiYW1sb2dpYyxnMTJhLW1kaW8tbXV4IjsKPgo+IElmIHdlIGZpbmQgZGlmZmVyZW5j
ZXMgaW4gVDcncyBtZGlvLW11eCBjb21wYXJlZCB0byBHMTJBIHRoZW4gd2UnbGwgYmUKPiBhYmxl
IHRvIG1hbmFnZSB0aGVtLgoKRG9uZSBpbiB2ODogYSBuZXcgZmlyc3QgcGF0Y2ggYWRkcyAiYW1s
b2dpYyx0Ny1tZGlvLW11eCIgdG8KYW1sb2dpYyxnMTJhLW1kaW8tbXV4LnlhbWwgd2l0aCB0aGUg
RzEyQSBzdHJpbmcgYXMgZmFsbGJhY2ssIGFuZCB0aGUKbm9kZSB1c2VzIGJvdGguIE5vIGRyaXZl
ciBjaGFuZ2UuCgpUaGFua3MsCkx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
