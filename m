Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595C7C3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 18:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkF6RCWFQoa5OvX3yqSd0Bib/9KKJQWGkJ6qF1QHU0w=; b=Yr8Igpf89LqNzH
	+VBg5oYthsejmSgWl+EpxO2xY+zpDxgK6NRkpgTyoDuVFZ4RWF/D6asMfKTfbMNr8oZHMYpeiHnt2
	WvM8Qo/OtSAtgX4kPbjalTHAKswX2wB+Qa1Y9mcdJoFdURyFMq1gXkU/welwmuMe/v9MF76uC1uSz
	IdxtCWzeeIf7/jGACURuWgB0aCT2O3Xi5xOJpiFgetX9Noj1dpe6QRgqENeGoP0f6DJ1YR8DcH4jj
	w7+NaBwh1Qe8OxgSqTHHR47xH6JWSEFoB7pFaI9M0f6oMU+6iB7xTEEfz9pHv9lV6yO4Dct2EVv2y
	ON3gV1n2d19DFWEPklDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH7z1-007oMD-Lo; Sun, 15 Jan 2023 18:43:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH7yy-007oL1-2Y
	for linux-amlogic@lists.infradead.org; Sun, 15 Jan 2023 18:43:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id d2so5431712wrp.8
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Jan 2023 10:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqNu4z7pVUpJTWUrkJ4U/d2KgKBc21hr1i/mBhqreCk=;
        b=ssNzrq3Nd7XNJkmahlyQ/9J04sU0fcIOPhxzHYzuYvM2pCHS6fgOsJ2LOimWTSdtxr
         D7anbkV4JFp5UmWsUcIxXttg86WIosZXTExsjaf+5rWgA360zZm8ZJnbci2XVzzXqp6+
         y78SUhkTdrvmrjThgpC0S/qsonCFsQI6uLz/OshG2euGHBsg7CbAnyICXkUMC/78VxFO
         rhQE3sobOrjK+vmdeBtPM7/GlayvqMlwOOkhevykQ9u3aJyVkys3GYUV3+JQAX/06qPj
         45mDsUzGvV+e38YMSlAqzybxfK3WNrFNYV6EirX2ekrT3WeidS3oRIsSrhJId9EF48Kt
         NIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqNu4z7pVUpJTWUrkJ4U/d2KgKBc21hr1i/mBhqreCk=;
        b=1yj8ELMVL+WiT39tCUanu1fTYzP3jf2hbDCASSoGggzuxH4QtY/PtRwBqdqsvRyfpI
         FDqOEOgf5/DSpM4sTT0+J2/8ZqAsvTRCQDbZAz0mYlNJT7jaVVo5Sc9cGscUjUE18KCK
         aax4YAenyJXuwMwm9fVZB26614eTNfNJQo2eYUhML5XQCmSuDaL0qNJ60IDSMuUg/QRH
         mdP87PJTT0PqdNMPOcNsE4SCxuhmMt8LDnv2UqlfGntQCa6RojEYHFhBlASnIpycXCp3
         KKbVhk9eBzxib1kTEfCo7yRZPX9CS5uSyM36fMQxHdaFLAc7UyQ7er6CNDYa3Yof9JiT
         uvNA==
X-Gm-Message-State: AFqh2krfhfR/EmnMfu0jJdhFaP0MTdhuVSy3y4XvBPIyMXP7dPJqgxPV
	RSup2rVwNbNLVROtuo9RyUlzSA==
X-Google-Smtp-Source: AMrXdXuFIbJ8sgk1dRCGGcgp21liwHrqT6eDQwJqp2Z4Sm3pYqyagyRd8SylbdZooVuIL08uhVraYQ==
X-Received: by 2002:adf:e587:0:b0:2bd:c2ce:dd58 with SMTP id l7-20020adfe587000000b002bdc2cedd58mr13399941wrm.18.1673808228849;
        Sun, 15 Jan 2023 10:43:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3095:3ab6:8d3f:21f? ([2a01:e0a:982:cbb0:3095:3ab6:8d3f:21f])
        by smtp.gmail.com with ESMTPSA id t14-20020adfeb8e000000b002baa780f0fasm24089794wrn.111.2023.01.15.10.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 10:43:48 -0800 (PST)
Message-ID: <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
Date: Sun, 15 Jan 2023 19:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
Content-Language: fr
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_104352_203723_FF2FA4FC 
X-CRM114-Status: GOOD (  19.11  )
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

SGkgSGVpbmVyLAoKTGUgMTUvMDEvMjAyMyDDoCAxODowOSwgSGVpbmVyIEthbGx3ZWl0IGEgw6lj
cml0wqA6Cj4gT24gMTUuMDEuMjAyMyAxNzo1NywgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+IE9uIFN1
biwgSmFuIDE1LCAyMDIzIGF0IDA0OjE5OjM3UE0gKzAxMDAsIEhlaW5lciBLYWxsd2VpdCB3cm90
ZToKPj4+IE9uIG15IFNDMi1iYXNlZCBzeXN0ZW0gdGhlIGdlbnBoeSBkcml2ZXIgd2FzIHVzZWQg
YmVjYXVzZSB0aGUgUEhZCj4+PiBpZGVudGlmaWVzIGFzIDB4MDE4MDMzMDAuIEl0IHdvcmtzIG5v
cm1hbCB3aXRoIHRoZSBtZXNvbiBnMTJhCj4+PiBkcml2ZXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4+
PiBTd2l0Y2ggdG8gUEhZX0lEX01BVENIX01PREVMIHRvIGNvdmVyIHRoZSBkaWZmZXJlbnQgc3Vi
LXZlcnNpb25zLgo+Pgo+PiBIaSBIZWluZXIKPj4KPj4gQXJlIHRoZXJlIGFueSBkYXRhc2hlZXRz
IGZvciB0aGVzZSBkZXZpY2VzPyBBbnl0aGluZyB3aGljaCBkb2N1bWVudHMKPj4gdGhlIGxvd2Vy
IG5pYmJsZSByZWFsbHkgaXMgYSByZXZpc2lvbj8KPj4KPj4gSSdtIGp1c3QgdHJ5aW5nIHRvIGF2
b2lkIGZ1dHVyZSBwcm9ibGVtcyB3aGVyZSB3ZSBmaW5kIGl0IGlzIGFjdHVhbGx5Cj4+IGEgZGlm
ZmVyZW50IFBIWSwgbmVlZHMgaXRzIG93biBNQVRDSF9FWEFDVCBlbnRyeSwgYW5kIHRoZW4gd2Ug
ZmluZCB3ZQo+PiBicmVhayBkZXZpY2VzIHVzaW5nIDB4MDE4MDMzMDIgd2hpY2ggd2UgaGFkIG5v
IGlkZWEgZXhpc3RzLCBidXQgZ290Cj4+IGNvdmVyZWQgYnkgdGhpcyBjaGFuZ2UuCj4+Cj4gVGhl
IFNDMiBwbGF0Zm9ybSBpbmhlcml0ZWQgYSBsb3QgZnJvbSBHMTJBLCB0aGVyZWZvcmUgaXQncyBw
bGF1c2libGUKPiB0aGF0IGl0J3MgdGhlIHNhbWUgUEhZLiBBbHNvIHRoZSB2ZW5kb3IgZHJpdmVy
IGZvciBTQzIgZ2l2ZXMgYSBoaW50Cj4gYXMgaXQgaGFzIHRoZSBmb2xsb3dpbmcgY29tcGF0aWJs
ZSBmb3IgdGhlIFBIWToKPiAKPiBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMw
MSIsICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7Cj4gCj4gQnV0IHlvdSdyZSByaWdodCwg
SSBjYW4ndCBzYXkgZm9yIHN1cmUgYXMgSSBkb24ndCBoYXZlIHRoZSBkYXRhc2hlZXRzLgoKT24g
RzEyQSAoJiBHWEwpLCB0aGUgUEhZIElEIGlzIHNldCBpbiB0aGUgTURJTyBNVVggcmVnaXN0ZXJz
LApwbGVhc2Ugc2VlOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5jI0wzNgoKU28geW91IHNo
b3VsZCBlaXRoZXIgYWRkIHN1cHBvcnQgZm9yIHRoZSBQSFkgbXV4IGluIFNDMiBvciBjaGVjawp3
aGF0IGlzIGluIHRoZSBFVEhfUEhZX0NOVEwwIHJlZ2lzdGVyLgoKTmVpbAoKPiAKPj4gCUFuZHJl
dwo+IAo+IEhlaW5lcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
