Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C44C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqrg5GKoiWy9hKryg4olJuuS9iVSEEg1bVZANUR4J3w=; b=w3RPUfioy7ygLX
	pf3ClyLryl0wy5lREm5xPSHT+BV0NZvaGFecyiF4bseE70F39MJ8oV6WmmcXsFG88EM+DiBDcjpHx
	xZ3sdl8zVyTEdfSlzjmf40UQquV5SQvGq7oaAHj+tUiv89pZOfo9vy5+/y1dYbY85DtU/MnDPoGyt
	jVEefWJk7ZsRWl4yhhkARNDgoHH7oHGTdxw3jG4DDH4YV5RWHYMdWxHqqafUN3fIYk6U6se/AxN2l
	guC6rUKWHoseiY3N6epnR+o2Kr6uR2JrYJxDNsIbPOSMb0YdI9r8oAu+acn3Hnj/LnT2VZAPdYY1U
	9FzwiOl8iRA474Zi7paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDZJ-002cQg-HS; Tue, 24 Jan 2023 07:18:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDZ8-002cO2-KZ
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 07:17:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id b7so12936536wrt.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 23:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK1e6exqqlScuIzxu3kNmwlgTnCtE6Xr3k93M7x3/qM=;
        b=u5z15n4Cyt2W8vpNpjDEUeibtG9KHLxTHPITggkl6YipYA5BXWZ7/ft4hggv0FDPB9
         PK+Nzz9u4k22ogUnKlyaMoStBoHq36k9tnELpawylWBgOzKjH24AqP5EoUJg8nP/j5JC
         7qfbyrBwPAJBOQeDyW1+9gtnBsodssyGQLbXIwnAAcRwe+9Htsl7d2PdGMMQ+KQ33jR1
         6IGA5AGS/Bs1jAmEjr+ugu/XSrwDHcF7cJtzaxEbP77pq7CVPbnTDa17+Pd26pIB3iJD
         LxNctTqt2rhXFwlCLbPNRC2Uspa54BJ5j0kq3toy/k9GBvlsjGUtn09KGQwCbrBdu9tI
         N49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VK1e6exqqlScuIzxu3kNmwlgTnCtE6Xr3k93M7x3/qM=;
        b=OxZb7Xxu6sqXA6czhy2MWp3bTqThayauKxrshdHKEsvxbcid2yhEKavnxJmMqw6q6r
         iYxOPvGykNUTzQ3Q4htD69TnSZW9FLWPbQh3yi8GQ9hegX3D7ZpZCMRD9tHgNFu1wWKR
         LcClbsdwES95bW5qz8ZmoUVJ5zJbW38jf06G093+hNVEhj9/Dl0D+zS0r0vbx6aQN+0K
         mPCFFqQN2DVwnnw7adfeDoyk84HDEE+fNPEjh4PosgSvoyhbZUfBv2Me2L2VyOpW53K3
         OUAW8vkMwA+OocD9TjeMxJOmBJZT6J1jA8LLvYSorvFiFInRcjIj5QGro1wSjck/qms5
         C0cw==
X-Gm-Message-State: AFqh2kq7GDhWfTurzxL4N+srsCXR6Rz0iFlqBKYS/vWtOSx1Nx0TDMuF
	XD/HqoVUDP35aMIq3+q7je8qTA==
X-Google-Smtp-Source: AMrXdXvwcy3PSUb4q848sDoaIWHWtvBUmNR0so2nrtzYx6JjuVz/rsCcjLc37lx8FLvr6XECSoyb9g==
X-Received: by 2002:adf:dc0a:0:b0:2be:57a6:8161 with SMTP id t10-20020adfdc0a000000b002be57a68161mr12340309wri.46.1674544674861;
        Mon, 23 Jan 2023 23:17:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7542:4469:3507:5738? ([2a01:e0a:982:cbb0:7542:4469:3507:5738])
        by smtp.gmail.com with ESMTPSA id p7-20020adff207000000b002bdff778d87sm1147623wro.34.2023.01.23.23.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:17:54 -0800 (PST)
Message-ID: <02e97893-ccae-50d1-db38-fb6fa31faaa5@linaro.org>
Date: Tue, 24 Jan 2023 08:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/8] arm64: dts: amlogic: Fix non-compliant SD/SDIO node
 names
Content-Language: fr
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <55c53e8d-6b30-51bf-edf6-b5b67887bd0a@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <55c53e8d-6b30-51bf-edf6-b5b67887bd0a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_231758_716172_664B1D5B 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgMjMvMDEvMjAyMyDDoCAyMjoyNCwgSGVpbmVyIEthbGx3ZWl0IGEgw6ljcml0wqA6Cj4gbW1j
LWNvbnRyb2xsZXIueWFtbCBkZWZpbmVzICJebW1jKEAuKik/JCIgYXMgbm9kZSBuYW1lIHBhdHRl
cm4uCj4gSW4gcHJlcGFyYXRpb24gb2YgYWRkaW5nIHNjaGVtYS1iYXNlZCB2YWxpZGF0aW9uIGZp
eCB0aGUgbm9kZSBuYW1lCj4gaW4gdHdvIGFmZmVjdGVkIGZpbGVzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4gLS0tCj4gICBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2kgICAgICAgIHwgMiArLQo+ICAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSB8IDQgKyst
LQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaQo+IGluZGV4IDE2
NDhlNjdhZi4uZWQ4OTVmYjMyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1heGcuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1heGcuZHRzaQo+IEBAIC0xODgzLDcgKzE4ODMsNyBAQCBhcGI6IGJ1c0BmZmUwMDAwMCB7
Cj4gICAJCQkjc2l6ZS1jZWxscyA9IDwyPjsKPiAgIAkJCXJhbmdlcyA9IDwweDAgMHgwIDB4MCAw
eGZmZTAwMDAwIDB4MCAweDIwMDAwMD47Cj4gICAKPiAtCQkJc2RfZW1tY19iOiBzZEA1MDAwIHsK
PiArCQkJc2RfZW1tY19iOiBtbWNANTAwMCB7Cj4gICAJCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uLWF4Zy1tbWMiOwo+ICAgCQkJCXJlZyA9IDwweDAgMHg1MDAwIDB4MCAweDgwMD47Cj4g
ICAJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxNyBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9u
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNp
Cj4gaW5kZXggMWE5MzFkNWMyLi44MGQ4MmY3MzkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPiBAQCAtMjMyMSw3ICsyMzIx
LDcgQEAgdWFydF9BOiBzZXJpYWxAMjQwMDAgewo+ICAgCQkJfTsKPiAgIAkJfTsKPiAgIAo+IC0J
CXNkX2VtbWNfYTogc2RAZmZlMDMwMDAgewo+ICsJCXNkX2VtbWNfYTogbW1jQGZmZTAzMDAwIHsK
PiAgIAkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGctbW1jIjsKPiAgIAkJCXJlZyA9
IDwweDAgMHhmZmUwMzAwMCAweDAgMHg4MDA+Owo+ICAgCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDE4OSBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4gQEAgLTIzMzMsNyArMjMzMyw3IEBAIHNkX2Vt
bWNfYTogc2RAZmZlMDMwMDAgewo+ICAgCQkJcmVzZXRzID0gPCZyZXNldCBSRVNFVF9TRF9FTU1D
X0E+Owo+ICAgCQl9Owo+ICAgCj4gLQkJc2RfZW1tY19iOiBzZEBmZmUwNTAwMCB7Cj4gKwkJc2Rf
ZW1tY19iOiBtbWNAZmZlMDUwMDAgewo+ICAgCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29u
LWF4Zy1tbWMiOwo+ICAgCQkJcmVnID0gPDB4MCAweGZmZTA1MDAwIDB4MCAweDgwMD47Cj4gICAJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTkwIElSUV9UWVBFX0VER0VfUklTSU5HPjsKClJldmll
d2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
