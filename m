Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4AE606A323
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sK4kN6wn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Tnk8S8Ma
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=foEzOXVYTGWUCiPwBnhWbDksgezsXGqchp/d64yb/FA=; b=sK4kN6wnftOQ1Wfj5AqA6zb0ss
	QLvAS4Ol7k4t4f1dIX1epMg4A7fimUa0yNTF2zJ5I5xLXQ47Dgb4TtBTcs57DmJwE4Y6rlfT0CBVA
	AkvhNClL69MmakpghOvWqe64gQFDWvtLez/rQHyjCG/+YuUPlngQ8UA0JOmabhwiv36mpTVWWVeqc
	B7cqDCSoOFxlnHiwXB/NWS5va/3qfzOHPWKeP1RWwn3td1fBNwbkzurJzsmErtp8HxiyQw/+yQjUg
	390Hpuknfh1zUD/il7slJ4fdBH37iXE3HQmwY1RpsHXCoAxmFV3b0AvaylYltpEcz+2DcWgici5WU
	cvtmFrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeSh-00000000Hr8-2XMe;
	Sun, 15 Nov 2026 17:56:19 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeSf-00000000HqI-1C4x
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 17:56:18 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67921b515a7so2649926d50.2
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 09:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765376; cv=none;
        d=google.com; s=arc-20260327;
        b=aebs7soOPiqUEdmY13lsQP1guSK7VqQ7El/hd88at4nM/m7wR30ew6RDFfIuUjlnmy
         Vkyh4HE8F7ebbmvqj7BNHgBByGywoJYVO30LVBCRAtmG0W/Bm4yuSXwbPf+3iHjdic+s
         0wUjLmURkwDqdpYvtKH3jLQbfWK/Aobz1lkZF0zWp2Y5lVFqLJpoBSvw8EZW6yNI54Ri
         sjRPHpJsodV/0DkuJwd++3nLOKpxbQyOk9ionrXFixNNN9uIFQMapc+gILvXuWYqJ9Ut
         jnaemwfMMZzljXq3fHewtHGUxXhZa+h/KU0d5qvbM4bhSoTld29TKomKmYYSxRxnyHk1
         NQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        fh=3a9YNNd1/lqPwE7ElN8uP8ZQkOzCHxN8t3aa/Pf6V94=;
        b=RKoA6AWRhOS2JMxfZMIk+3iiqkJYw39+IKOLlRtp3aW47LwGRz9fwHCObNMDJjsch9
         Q+3yXfe3hXqyfqsXAYPSpTVgTbpD+Wg6XHKn5OmzUewIpobneS9zKe/d1E+MxpB2lzZL
         mAUu8MKUP4CPkNJkqMneaJbq7v7doHSe+3dzEcmDhGMj0oTtnUDD+IvHPqiHtNt27qRQ
         ckBfwXMusJiYGXEQGzctfl/gr3E4Dpcv7HjKsD5Y7xBFZVDXRrdn4Bgjx7gr8MjTIG6H
         9YH/4UKvMkxu+1BrGlBb1xJUO5Dq98BSD9FlBxBt9kASPI6yDc6oFaWKhpOXa0P4rix3
         BInA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765376; x=1795370176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=Tnk8S8Ma4y+2LYOpQz5pELW3vVKcrd4XWZHYyct76whRhZYRIp/EUYQFFGWtParv9W
         Leskk8PWS/HGpaqz/8qPcDB8ezEyBmv1++TuOcUN6xbnVxf18ez2bIxe1w5MMS7V1KXv
         L/U09JehI0vniLzZqQixMIqeQOhcOrT4g2kWT9/PbIc4WSU/nArTzFv41bt1FlOiCYGP
         LwsiRkIBrmVJeRAUeNVso/o4l7UTKG58eAoy9864bC1UWBcndODf8KWpCBTxwAKwYZB9
         7SPn+YRup0ye5QTH1yAQBx1YYoE0Y2qbJAXBosEah7HSyWiW5H0cTU4zOanpXA/KTbl1
         EKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765376; x=1795370176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=eWNNiDDsrYov/3Ki5322x5Ywa6U0d7BRhETMBt2vB0K0+/WatFIz6jT2yMuuyGYyPq
         ji+Uf0cJG6aQ6VvPwxvtiAnpGQc2zq/TA5/CVdCmAExCAPetmIY8wc1al/ZuDo6BzFOV
         36PPhQvWeCQ9BZwuiccbi7bIbalQJZCt7YOz6LYIt07+eJYCgN3G9yaosFKII/4zaqD3
         zxSHLZc5IzeLvmKtbY+bpZ8rDH426cjuQtfq8r1QdT4aV7uD8loBrU4sCLmMHN6lDUbm
         bt1uRiN00AUJL5v5teVMeuo6/AseXvFRO4BhiSyutjg4zyWXqoquvQEkIGgrpjH5T5K/
         wdsw==
X-Forwarded-Encrypted: i=1; AL+hErE7qmVXQyo1ACTBCJk/Y8ITK8WXydO2qsomwB0v7A0Yy/P5OMpJ2ldrNN6Q7on2HTg4+Udvj24zgzXwqKtV@lists.infradead.org
X-Gm-Message-State: APuU4Z9il+x0oCKNSeKpid57xWntN60418/NLRMtAWjn3+byDEEbHHCH
	+hHsdGnGBZjlPJBn3Q712zs7mTIc4mxGBX9bs9NEIpr7tk3Np60tI0RmHgNrvuIzw5ULwQ2AmRA
	iFIli0qvs382MKPs2GnS0MxQyChS7Tpc=
X-Gm-Gg: AYBFou1YopGWjteEzqBN3QEDi4rtfE544BmwdZfQdETypdEU3ha0y2PetByjvFyy4zT
	zpvazODOalL8hkr78X/RRp46YSMoamjOYHScGyIuksu8LoKbWY/pJUCvCWbRJ3FzgYhXwkTRkMO
	+lVH/QDIah+mTus5Ygp6gNUfzXwUDhdqteSYrDOjXj4f+px+CZNUWNOcPwBXoOXyKjMad6PdiEr
	u8T57dl/v192TDZli+ITwVWEazViLyJ5XIYYE1XeEMSE+UqKXX7fw1tYIFZFCacFTU6Igxwawl3
	CwMRTrMuivier69dGg6NkgWCtjQsUTno3hnmu4IsJPijGBjShLMBnR6p4ReH/c6olkO93qLITbt
	bamZ6J6v2WxUPfuEgQyxKadgLkqTd4hW/Pj3WJeSTtDp4oyUdQvojUMB7V2hC0SIALNwd3g==
X-Received: by 2002:a05:690e:4852:10b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67d895d195dmr3505161d50.24.1794765375839; Sun, 15 Nov 2026
 09:56:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-3-tanure@linux.com>
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:56:05 +0100
X-Gm-Features: AclHuK_UkljuS9ciZHxa_G9-g5ueKP83ug6GjLSD0viVWSMIsEbzxQPrFL8LXzo
Message-ID: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
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
X-CRM114-CacheID: sfid-20261115_095617_359176_49E09F74 
X-CRM114-Status: GOOD (  13.02  )
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

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMToxOOKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgVDcgaGFzIHRoZSBzYW1lIGV0aGVybmV0IGdsdWUgYXMg
dGhlIEcxMkEgYnV0IG5lZWRzIHR3byBjbG9ja3Mgb2YKPiBpdHMgb3duLiBUaGUgY29udHJvbGxl
ciByZWFjaGVzIG1lbW9yeSB0aHJvdWdoIGEgcGlwZWxpbmUgc3RhZ2Ugd2l0aAo+IGl0cyBvd24g
Z2F0ZTsgbm90aGluZyBlbHNlIGNsYWltcyBpdCwgc28gaXQgaXMgc3dpdGNoZWQgb2ZmIGFzIHVu
dXNlZAo+IGFuZCB0cmFuc2ZlcnMgbmV2ZXIgZmluaXNoLiBUaGUgZ2x1ZSByZWdpc3RlcnMgc2hh
cmUgYSBnYXRlIHdpdGggdGhlCj4gTURJTyBtdWx0aXBsZXhlciwgd2hpY2ggcHJvYmVzIGFmdGVy
IHRoZSBjb250cm9sbGVyIGhhcyBwcm9ncmFtbWVkCj4gdGhlbTogdGhlIHdyaXRlcyBhcmUgbG9z
dCBhbmQgdGhlIHBvcnQga2VlcHMgdGhlIGJvb3Rsb2FkZXIncyBkZWxheXMuCj4KPiBXaXRoIGEg
bmV3ZXIgY29yZSwgYSBjbG9jayBsaXN0IG9mIGl0cyBvd24gYW5kIGRlbGF5cyB0aGF0IGZvbGxv
dwo+IGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbCwgdGhlIFQ3IGdldHMgYSBiaW5kaW5nIG9mIGl0
cyBvd246IHRoZSBQSFkKPiBhZGRzIHRoZSAybnMsIGFuZCBvbmx5IHRoZSByZWNlaXZlIGRlbGF5
IGxpbmUgb2ZmZXJzIGZpbmUgdHVuaW5nLCBzbwo+IG9ubHkgcngtaW50ZXJuYWwtZGVsYXktcHMg
aXMgdmFsaWQgaGVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4KTG9va3MgZ29vZCB0byBtZSBpbiBnZW5lcmFsCgpbLi4uXQo+ICsgICAgICAtIGRl
c2NyaXB0aW9uOgo+ICsgICAgICAgICAgQVBCIGNsb2NrIG9mIHRoZSBnbHVlIHJlZ2lzdGVycyBQ
UkdfRVRIMCBhbmQgUFJHX0VUSDEuCj4gKyAgICAgICAgICBXaXRob3V0IGl0LCB0aGV5IHJlYWQg
YXMgemVybyBhbmQgaWdub3JlIHdyaXRlcy4KUGxlYXNlIGdpdmUgQ2h1YW4gTGl1IGEgZmV3IGRh
eXMgdG8gY2xhcmlmeSB0aGlzIGNsb2NrIGlucHV0OiBbMF0KSXQgd291bGQgYmUgZ3JlYXQgaWYg
aGUgY291bGQgcHJvdmlkZSBtb3JlIGRldGFpbHMgb24gaXQuIElmIHRoZXJlJ3MKbm8gcmVwbHkg
dGhlbiBJIHN1Z2dlc3QgZ29pbmcgd2l0aCBMdWNhcycgdGVzdGluZyBmaW5kaW5nIHRob3VnaAoo
d2hpY2ggbWVhbnMgdGhhdCBjbG9jayBpbnB1dCBpcyBjb3JyZWN0KQoKClswXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljL0NBSlhfUSswc2VGd0R2ZDZ6a3NMbkpqV1lKSlkx
UWNMYzFnQWpyPUZOMXArYVRkdW1wd0BtYWlsLmdtYWlsLmNvbS8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
