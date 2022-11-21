Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8506DC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z1kM9yYjUF53j8cmnhXQ/G7baFy1ovSFeeg5kr8oUI=; b=DCT8CmK5rODNQT
	+cylK71nsE3zH7SoiYYmw9uG8COQoxbp0nYuFZtzYf3opnHf79b8GICQ5rE/hGQs+PNz6Ep9abCSp
	G4sfDynzhrU+Ibnkr1Rd22rprPlTO9JXA8d6/nC1Ddatha9L7mMXcXupMOOtcqGz66O38fJ9yE/Rs
	+RRw5QcJyYvBaH6Jtci4FNDen2Ax/7/Ekrv/aNPfoj3dSlx6ACbHrjtkwb39+FV7YkLu5rm/T66+P
	GCBEs+F+lVARS/q4aLhObQLb0+soT1DYUdil8AeblLNfHdcu5Jeq2bmuXQEiuADmGCnQf2j0haoUu
	YgtBUrb4zWdeOueiDbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Q5-00ChW2-3F; Mon, 21 Nov 2022 10:52:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Pt-00ChE0-Vp
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 10:52:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id r126-20020a1c4484000000b003cffd336e24so7736577wma.4
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 02:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DwFFWAbB39pdzGdbl/1ro70K08wbqiEN02fL5my0ng=;
        b=nSAKPp9iT1tfGIkSlXmfAmD6MPcXsYYSG4wspAw3llD1/Df8G+BuHDkMTvqHL+Ou7k
         BdMNJojv0ZkWbXFCsFg7d7OA4/6iPdyYm4WKe5lNtl4U7m6vEQm08L9Ms3ZmKPXqtpdx
         I64b3oIqfZid2IGanRVuzxL3U/FfDQTek317Vcp9WljqMqy5DUAl7gdwh3PLfjHEUhkN
         tJFIn9n/MGoRjCqHLTHIp/zAMjLbAOxMeYKQVxiOlibovRknkPM+XVoJMfdjpzzAXwlc
         ud5Srn6WG1kuGnTHesZ1sV07MFHQ2uF1hXZbLaVPxmIq1lsmnqkr33HLgfephdLSU0j0
         Iz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DwFFWAbB39pdzGdbl/1ro70K08wbqiEN02fL5my0ng=;
        b=NthmUmSFDlnrwaYdtIYDldAkDukTR1krsBlTQIIWDpG+ZHK2GFgm7vJWA9RWQ0Ncup
         ysY5G8ArjLxPfnxK7+NqDvuSx4oLTyivHx/VKLu9KbpkdogoQ3RX5bdZkma2A4CUEPSy
         vENvOxDO1p3C7IjhvodB5BtQm8LYmy8P1xe/l0ssnvhlRxoHGiko5BF2JmyTfz+VwIyt
         hMhaxE1rpIZ6flOnrwhjIUK0H8DzmZ4Y6/rc75HTOqp1l3+CQASkd0ekGCmJZ+duHHA6
         h7DNT4xL7gxrLgpTgvLUialcW/FL3E7zeiiIsm3BM2nzUsDc2rU1cCDuYhn/NEhIL4NA
         GbBQ==
X-Gm-Message-State: ANoB5pkHCRn0dGWTHORp62qE/3apSbfgrRaVsHYwq6MmLDMnXDXFr1T8
	ABY6oG49RdDecWhlwsLr2ZkApCAV66r2SQ==
X-Google-Smtp-Source: AA0mqf5QSJ7OtroHLmnJdUzSWQwzpQbp01lD9Fe8uHseFbRLgx9H+XiLEeh83Dx4wJW6i6KniCCkYw==
X-Received: by 2002:a1c:7409:0:b0:3cf:713a:c947 with SMTP id p9-20020a1c7409000000b003cf713ac947mr4678415wmc.40.1669027962284;
        Mon, 21 Nov 2022 02:52:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k33-20020a05600c1ca100b003b3365b38f9sm14550303wms.10.2022.11.21.02.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:52:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v2-0-a3df1e09b0af@linaro.org>
References: <20221031-b4-odroid-go-ultra-initial-v2-0-a3df1e09b0af@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: amlogic: add initial Odroid Go Ultra DTS
Message-Id: <166902796132.3866590.17335821749451892538.b4-ty@linaro.org>
Date: Mon, 21 Nov 2022 11:52:41 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_025246_029239_D9E4E05A 
X-CRM114-Status: GOOD (  11.36  )
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

SGksCgpPbiBGcmksIDE4IE5vdiAyMDIyIDE2OjUwOjA0ICswMTAwLCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiBUaGlzIGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgSGFyZGtlcm5lbCBPZHJv
aWQgR28gVWx0cmEuCj4gCj4gVGhlIE9kcm9pZCBHbyBVbHRyYSBpcyBhIHBvcnRhYmxlIGdhbWlu
ZyBkZXZpY2Ugd2l0aCB0aGUgZm9sbG93aW5nCj4gY2hhcmFjdGVyaXN0aWNzOgo+IC0gQW1sb2dp
YyBTOTIyWCBTb0MKPiAtIFJLODE3ICYgUks4MTggUE1JQ3MKPiAtIDJHaUIgTFBERFI0Cj4gLSBP
biBib2FyZCAxNkdpQiBlTU1DCj4gLSBNaWNybyBTRCBDYXJkIHNsb3QKPiAtIDVpbmNoIDg1NMOX
NDgwIE1JUEktRFNJIFRGVCBMQ0QKPiAtIEVhcnBob25lIHN0ZXJlbyBqYWNrLCAwLjVXYXR0IDjO
qSBNb25vIHNwZWFrZXIKPiAtIExpLVBvbHltZXIgMy43Vi80MDAwbUFoIEJhdHRlcnkKPiAtIFVT
Qi1BIDIuMCBIb3N0IENvbm5lY3Rvcgo+IC0geDE2IEdQSU8gSW5wdXQgQnV0dG9ucwo+IC0gMngg
QURDIEFuYWxvZyBKb3lzdGlja3MKPiAtIFVTQi1DIFBvcnQgZm9yIFVTQjIgRGV2aWNlIGFuZCBD
aGFyZ2luZwo+IAo+IFsuLi5dCgpUaGFua3MsIEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQgKHY2LjIvYXJt
NjQtZHQpCgpbMS8yXSBkdC1iaW5kaW5nczogYW1sb2dpYzogZG9jdW1lbnQgT2Ryb2lkIEdvIFVs
dHJhIGNvbXBhdGlibGUKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2MvNjZh
ZjIxOGY4NjY5YTI2MmIxYmY4OWJhODBmMmFjZjFhM2JlNDI5YwpbMi8yXSBhcm02NDogZHRzOiBh
bWxvZ2ljOiBhZGQgaW5pdGlhbCBPZHJvaWQgR28gVWx0cmEgRFRTCiAgICAgIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvYW1sb2dpYy9jLzYyZTczZjAwMDY5NmNjNDFjZmQyMzdhMWFkOTBiMDAxYWQw
Zjc2YzYKClRoZXNlIGNoYW5nZXMgaGFzIGJlZW4gYXBwbGllZCBvbiB0aGUgaW50ZXJtZWRpYXRl
IGdpdCB0cmVlIFsxXS4KClRoZSB2Ni4yL2FybTY0LWR0IGJyYW5jaCB3aWxsIHRoZW4gYmUgc2Vu
dCB2aWEgYSBmb3JtYWwgUHVsbCBSZXF1ZXN0IHRvIHRoZSBMaW51eCBTb0MgbWFpbnRhaW5lcnMK
Zm9yIGluY2x1c2lvbiBpbiB0aGVpciBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGluIG9yZGVy
IHRvIGJlIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdywgb3Igc29v
bmVyIGlmIGl0J3MgYSBzZXQgb2YgZml4ZXMuCgpJbiB0aGUgY2FzZXMgb2YgZml4ZXMsIHRob3Nl
IHdpbGwgYmUgbWVyZ2VkIGluIHRoZSBjdXJyZW50IHJlbGVhc2UgY2FuZGlkYXRlCmtlcm5lbCBh
bmQgYXMgc29vbiB0aGV5IGFwcGVhciBvbiB0aGUgTGludXggbWFzdGVyIGJyYW5jaCB0aGV5IHdp
bGwgYmUKYmFja3BvcnRlZCB0byB0aGUgcHJldmlvdXMgU3RhYmxlIGFuZCBMb25nLVN0YWJsZSBr
ZXJuZWxzIFsyXS4KClRoZSBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGFyZSBtZXJnZWQgZGFp
bHkgaW4gdGhlIGxpbnV4LW5leHQgdHJlZSBbM10sCnBlb3BsZSBhcmUgZW5jb3VyYWdlZCB0ZXN0
aW5nIHRoZXNlIHByZS1yZWxlYXNlIGtlcm5lbHMgYW5kIHJlcG9ydCBpc3N1ZXMgb24gdGhlCnJl
bGV2YW50IG1haWxpbmctbGlzdHMuCgpJZiBwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCBvbiB0aG9z
ZSBjaGFuZ2VzLCBwbGVhc2Ugc3VibWl0IGEgc2lnbmVkLW9mZi1ieSByZXZlcnQKcGF0Y2ggZm9s
bG93ZWQgYnkgYSBjb3JyZWN0aXZlIGNoYW5nZXNldC4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdApbMl0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4Lmdp
dApbM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4
dC9saW51eC1uZXh0LmdpdAoKLS0gCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
