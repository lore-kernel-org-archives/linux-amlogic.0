Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62AC05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghlaY/cQTm9i3ZlQBGDa3EfiNoIAEJO142NlZNszbwc=; b=dMKz/12Qii4oSdszTi+PswFlNx
	sleobKAsJzbm1sNaBl2bc5Q0malr42SwqD1WSOAaThchydaMqXszb3ArAE/pq5P3qiv+KSvipUydw
	wQgewdyWWjvvktzr5IJm/sy6WBOQ/X/ullbKgQRtdiiMSOm4G/gTfHB9LikRd9ZwtGOk9oVOIl9P9
	m3mhCXP15fmGl8H0eXIxL7699zohx0oSq3MoZ0TaqNeE6lbL/pnYGdAQv1fftColO2nZ4rOXhPgsX
	tRafh9ZIiEO/Bt7EHocWQsj5tIB7/uNfxdUa1Jp7ICAsKo7HUaCePHt47lBqbdQMQHXh18XD6Lhlx
	JcbA+6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxqD-007tUj-Sv; Mon, 06 Feb 2023 09:31:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxpt-007tMs-Ge
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 09:31:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so2086086wmp.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lB4DhwaSuvhN4P7Fhpq7/qUQ5TChk2PSO58hA8Th51M=;
        b=pNfKCIOjPfs++lNBj7MN3NLWBE1KGv1TjqYwvaHuxFnxTkWBJu8cCNPwsKTgfYFS5S
         7CipaKO32z792vMXEYavV51W4au8Joyub0stOCLvLwXy19iwSyXhDiL6fONUX2Q+WyKN
         eagL3P6LtuFtn3yF3bm1k3vmb3beOUIx6vJmfjYkox7Xtm+ad6/UV6ZVqbHkidSMTHDJ
         4hHLEJbQb0hMQId+inGJlUkBALKUuHJoqK6BlqhQ44/H776cG/exHFUK2ii6gfWiRo+b
         cuDGhdynizFqO9vAP00TN2UoEeaygE1IyA59IHKgDzaZ7WpvWLdAaP4WnT0/cCr03AeM
         krCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB4DhwaSuvhN4P7Fhpq7/qUQ5TChk2PSO58hA8Th51M=;
        b=CwegSK+usL1hHBEF4CY9SmBV9a3EigBwSAgvX3suLGPu0EgMZFrWPTmbbR2ZOnf++s
         x5fhGgrlXS97OeBCWkRR8wqoKTKJ63dJxQ2IDwnHH2h4RRMzjviqofhIDM+oX46CK+in
         R9QSbqSdxb7QfeM2ue3Kr8U2xrRjx56G7Mz/9rsF8Hs8QGckA+gSBtVpwg30k7D/KFm3
         Tq7AOnrY2dpPSiFOniUKKQE2t6FIxD3mwjWLbLYr/WneShZCEgAKksj5yL2EUF84ZLfV
         XPQOqib+OJGd3pPr4vOOxY+978+sAyRHt6F+INxcPQaDmI8MY9BltJzBCQAmbaQ7fKsl
         LuVA==
X-Gm-Message-State: AO0yUKX+LUxG/UYM0g3Kpyhmr+nfh8I6pwZoFoSVApgEuA7VryESFglS
	UptjaNhNjvHM3BAz1RxKg8hiFw==
X-Google-Smtp-Source: AK7set/EM6G4iF6XU2ICAX6o4we+sLMP4fWM9bshVgckPfbUtnBscAA1Oeg+itR7t/Aev12+0ww9DQ==
X-Received: by 2002:a05:600c:1e13:b0:3d9:f836:3728 with SMTP id ay19-20020a05600c1e1300b003d9f8363728mr18491159wmb.11.1675675849887;
        Mon, 06 Feb 2023 01:30:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f03f:3ced:a369:d884? ([2a01:e0a:982:cbb0:f03f:3ced:a369:d884])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c468a00b003e0015c8618sm2489133wmo.6.2023.02.06.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 01:30:49 -0800 (PST)
Message-ID: <2590e80b-2a42-ceff-b3b0-afb616aad43c@linaro.org>
Date: Mon, 6 Feb 2023 10:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <narmstrong.kernel@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <6dcf6333-f75a-f7ec-8ce9-fbbfb81d1a60@gmail.com>
 <9DA78049-10C9-47D6-B36B-9B7E1067385A@gmail.com>
 <0db3cd05-9a3a-a79b-308a-18ab49d29c17@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <0db3cd05-9a3a-a79b-308a-18ab49d29c17@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_013053_579501_C09182B2 
X-CRM114-Status: GOOD (  16.78  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDUvMDIvMjAyMyAxNzo1NCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDA1LjAyLjIw
MjMgMDg6NTcsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pgo+Pj4gTGUgNSBmw6l2ci4gMjAyMyDD
oCAwMTowNSwgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gYSDDqWNyaXQg
Ogo+Pj4KPj4+IO+7v09uIDA0LjAyLjIwMjMgMjM6NTYsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3Jv
dGU6Cj4+Pj4gSGkgSGVpbmVyLAo+Pj4+Cj4+Pj4gT24gV2VkLCBGZWIgMSwgMjAyMyBhdCAxMTox
MyBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToKPj4+PiBb
Li4uXQo+Pj4+Pj4+ICsgICAgICAtIGl0ZW1zOgo+Pj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDog
YW1sb2dpYyxtZXNvbjhtMi1hb2J1cy1waW5jdHJsCj4+Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0
OiBhbWxvZ2ljLG1lc29uOC1hb2J1cy1waW5jdHJsCj4+Pj4+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+
Pj4+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uOG0yLWNidXMtcGluY3RybAo+
Pj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjgtY2J1cy1waW5jdHJsCj4+
Pj4+Pgo+Pj4+Pj4gQWdhaW4sIGNhbid0IGhhdmUgYm90aCB3aXRoIGFuZCB3aXRob3V0IHRoZSBm
YWxsYmFjayBhbGxvd2VkLgo+Pj4+Pj4KPj4+Pj4gSGkgTWFydGluLAo+Pj4+Pgo+Pj4+PiBtZXNv
bjhtMiBpcyB0aGUgb25seSBjaGlwIHZlcnNpb24gaGF2aW5nIGEgZmFsbGJhY2sgZm9yIHRoZQo+
Pj4+PiBwaW5jdHJsIGNvbXBhdGlibGUuIElzIHRoaXMgZmFsbGJhY2sgcmVhbGx5IG5lZWRlZD8K
Pj4+Pj4gTG9va2luZyBhdCB0aGUgZHJpdmVyIGl0IHNlZW1zIHRoYXQgYm90aCBjb21wYXRpYmxl
cwo+Pj4+PiBhcmUgaGFuZGxlZCBpZGVudGljYWxseS4KPj4+PiBCYWNrIGluIHRoZSBkYXkgd2Ug
ZGVjaWRlZCB0byBkdXBsaWNhdGUgdGhlIE1lc29uOCBkcml2ZXIgY29kZSBqdXN0IHRvCj4+Pj4g
YWRkIGZvdXIgbmV3IHBpbiBmdW5jdGlvbnMgdGhhdCBhcmUgYWRkZWQgYnkgdGhlIE1lc29uOG0y
IFNvQwo+Pj4+IGdlbmVyYXRpb246Cj4+Pj4gImV0aF9yeGQyIiwgImV0aF9yeGQzIiwgImV0aF90
eGQyIiwgImV0aF90eGQzIgo+Pj4+Cj4+Pj4gVGhlIGNvbXBhdGlibGUgc3RyaW5nIHdhcyBkZWZp
bmVkIHdpdGggYSBzaW1pbGFyIGFwcHJvYWNoOiBzaW5jZQo+Pj4+IE1lc29uOG0yIGp1c3QgYWRk
cyBhIGZldyBiaXRzIHRvIHRoZSBNZXNvbjggcGluIGNvbnRyb2xsZXIgaXQncwo+Pj4+IGJhY2t3
YXJkcyBjb21wYXRpYmxlLgo+Pj4+Cj4+Pj4gSWYgdGhlIGZhbGxiYWNrIGhhcyB0byBiZSByZW1v
dmVkIHRoZW4gSSdtIG9rYXkgd2l0aCB0aGF0IGJ1dCBJIHdvdWxkCj4+Pj4gbGlrZSB0byB1bmRl
cnN0YW5kIGl0IGZpcnN0Lgo+Pj4+IFNvIGZhciBJIHRob3VnaHQgdGhhdCBSb2IgYmFzaWNhbGx5
IGFza2VkIHRvIHJlbW92ZSB0aGUgZm9sbG93aW5nIHR3bwo+Pj4+IGNvbXBhdGlibGUgc3RyaW5n
cyBmcm9tIHRoZSBlbnVtIChhcyB0aGV5J3JlIGxpc3RlZCBzZXBhcmF0ZWx5IHdpdGgKPj4+PiB0
aGVpciBmYWxsYmFja3MpOgo+Pj4+IC0gYW1sb2dpYyxtZXNvbjhtMi1jYnVzLXBpbmN0cmwKPj4+
PiAtIGFtbG9naWMsbWVzb244bTItYW9idXMtcGluY3RybAo+Pj4+Cj4+PiBSaWdodCwgdGhpcyBz
aG91bGQgYmUgc3VmZmljaWVudC4gVGhlcmUncyBubyBwbGFjZSB3aGVyZSB0aGUgOG0yIHBpbmN0
cmwKPj4+IGNvbXBhdGlibGVzIGFyZSB1c2VkIHcvbyBmYWxsYmFjay4KPj4+Cj4+PiBUaGVuIHRo
ZSBob3BlZnVsbHkgZmluYWwgdmVyc2lvbiBvZiB0aGUgYmluZGluZyBpcyBhbG1vc3QgcmVhZHku
Cj4+PiBJJ20ganVzdCBzdGlsbCBjaGVja2luZyB3aGV0aGVyIHRoZXJlJ3MgYW55IHdheSBpbiB5
YW1sIHRvIHNwZWNpZnkKPj4+IGEgcmVnLW5hbWVzIGxpc3Qgd2l0aCBtYW5kYXRvcnkgYW5kIG9w
dGlvbmFsIG5hbWVzLiBEb2Vzbid0IHNlZW0gc28uCj4+Cj4+IEl04oCZcyBwb3NzaWJsZSB3aXRo
IG1pbkl0ZW1zL21heEl0ZW1zIGFuZCBhbGxPZjppZi9lbHNlIHRvIHNwZWNpZnkgZGlmZmVyZW50
IG1pbi9tYXggZm9yIGVhY2ggY29tcGF0aWJsZQo+Pgo+IEkgaGF2ZSBhIHByb2JsZW0gaGVyZSBi
ZWNhdXNlIHJlZy1uYW1lcyBpcyBpbiB0aGUgZ3Bpby1jb250cm9sbGVyIGNoaWxkIG5vZGUgYW5k
IGNvbXBhdGlibGUgaXMgaW4gdGhlCj4gcGluY3RybCBwYXJlbnQgbm9kZS4gQW4gZXhwcmVzc2lv
biB1bmRlciBwYXR0ZXJuUHJvcGVydGllcyBkb2Vzbid0IHNlZSB0aGUgY29tcGF0aWJsZSBwcm9w
ZXJ0eSBvZiB0aGUKPiBwYXJlbnQgbm9kZS4gSXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBw
bGFjZSByZWdzL3JlZy1uYW1lcyBpbiB0aGUgcGluY3RybCBub2RlLgo+IE5vdCBzdXJlIGhvdyB0
byBkZWFsIHdpdGggdGhpcy4gVGhlIGVhc2llc3Qgd291bGQgYmUgdG8ganVzdCBoYXZlIG1pbkl0
ZW1zOjIgYW5kIG1heEl0ZW1zOjUgYXMgY3JpdGVyaWEKPiBmb3IgcmVncyBhbmQgcmVnLW5hbWVz
Lgo+IAoKSW4gdGhpcyBjYXNlLCBlaXRoZXIgeW91IGFkZCAyIHlhbWwgYmluZGluZ3Mgd2l0aCBw
ZXJoYXBzIGEgY29tbW9uIHlhbWwgdXNpbmcgYWxsT2Y6cmVmIG9yCnlvdSBhZGQgc29tZSBjb21w
bGV4IG1hdGNoaW5nIGJ1dCBJIHRoaW5rIHlvdSBzaG91bGQgc3BsaXQgaXQgaW4gMyBmaWxlcyBs
aWtlOgoKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KYW1sb2dpYyxtZXNvbi1waW5jdHJsLWNvbW1vbi55YW1sOgouLi4KCnBy
b3BlcnRpZXM6CiAgIHJhbmdlczogdHJ1ZQoKICAgIiNhZGRyZXNzLWNlbGxzIjoKICAgICBlbnVt
OiBbMSwgMl0KCiAgICIjc2l6ZS1jZWxscyI6CiAgICAgZW51bTogWzEsIDJdCgpwYXR0ZXJuUHJv
cGVydGllczoKICAgIi1zdGF0ZSQiOgogICAgIGFsbE9mOgogICAgICAgLSAkcmVmOiBwaW5jZmct
bm9kZS55YW1sIwogICAgICAgLSAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIwoKYWxsT2Y6CiAgIC0g
JHJlZjogcGluY3RybC55YW1sIwoKcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJhbmdl
cwogICAtICIjYWRkcmVzcy1jZWxscyIKICAgLSAiI3NpemUtY2VsbHMiCgphZGRpdGlvbmFsUHJv
cGVydGllczogdHJ1ZQoKJGRlZnM6CiAgIG1lc29uLWdwaW86CiAgICAgdHlwZTogb2JqZWN0CiAg
ICAgcHJvcGVydGllczoKICAgICAgIGdwaW8tY29udHJvbGxlcjogdHJ1ZQoKICAgICAgICIjZ3Bp
by1jZWxscyI6CiAgICAgICAgIGNvbnN0OiAyCgogICAgICAgZ3Bpby1yYW5nZXM6CiAgICAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKCiAgICAgICBy
ZXF1aXJlZDoKICAgICAgICAgLSBncGlvLWNvbnRyb2xsZXIKICAgICAgICAgLSAiI2dwaW8tY2Vs
bHMiCiAgICAgICAgIC0gZ3Bpby1yYW5nZXMKLi4uCgo9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CmFtbG9naWMsbWVzb244LWNi
dXMtcGluY3RybC55YW1sOgoKLi4uCiRyZWY6IGFtbG9naWMsbWVzb24tcGluY3RybC1jb21tb24u
eWFtbCMKCnByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6CiAgICAgb25lT2Y6CiAgICAgICAtIGl0
ZW1zOgogICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOC1j
YnVzLXBpbmN0cmwKICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItY2J1cy1waW5jdHJs
CiAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjgtYW9idXMtcGluY3RybAogICAgICAgICAg
ICAgICAtIGFtbG9naWMsbWVzb244Yi1hb2J1cy1waW5jdHJsCiAgICAgICAtIGl0ZW1zOgogICAg
ICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244bTItYW9idXMtcGluY3RybAogICAgICAgICAg
IC0gY29uc3Q6IGFtbG9naWMsbWVzb244LWFvYnVzLXBpbmN0cmwKICAgICAgIC0gaXRlbXM6CiAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbjhtMi1jYnVzLXBpbmN0cmwKICAgICAgICAg
ICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uOC1jYnVzLXBpbmN0cmwKCnJlcXVpcmVkOgogICAtIGNv
bXBhdGlibGUKCnBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiXmJhbmtAWzAtOV0kIjoKICAgICAkcmVm
OiAiIy8kZGVmcy9tZXNvbi1ncGlvIgoKICAgICBwcm9wZXJ0aWVzOgogICAgICAgcmVnOgogICAg
ICAgICBtYXhJdGVtczogMgoKICAgICAgIHJlZy1uYW1lczoKICAgICAgICAgaXRlbXM6CiAgICAg
ICAgICAgLSBjb25zdDogZ3BpbwogICAgICAgICAgIC0gY29uc3Q6IHB1bGwKCiAgICAgcmVxdWly
ZWQ6CiAgICAgICAtIHJlZwogICAgICAgLSByZWctbmFtZXMKLi4uCgo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CmFtbG9naWMs
bWVzb24tZ3hiYi1wZXJpcGhzLXBpbmN0cmwueWFtbDoKCi4uLgokcmVmOiBhbWxvZ2ljLG1lc29u
LXBpbmN0cmwtY29tbW9uLnlhbWwjCgpwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIGl0
ZW1zOgogICAgICAgLSBlbnVtOgogICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItcGVyaXBo
cy1waW5jdHJsCiAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1hb2J1cy1waW5jdHJsCiAg
ICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3hsLXBlcmlwaHMtcGluY3RybAogICAgICAgICAgLSBh
bWxvZ2ljLG1lc29uLWd4bC1hb2J1cy1waW5jdHJsCiAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
YXhnLXBlcmlwaHMtcGluY3RybAogICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1hb2J1cy1w
aW5jdHJsCiAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1wZXJpcGhzLXBpbmN0cmwKICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWFvYnVzLXBpbmN0cmwKICAgICAgICAgIC0gYW1s
b2dpYyxtZXNvbi1hMS1wZXJpcGhzLXBpbmN0cmwKICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1z
NC1wZXJpcGhzLXBpbmN0cmwKCnJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUKCnBhdHRlcm5Qcm9w
ZXJ0aWVzOgogICAiXmJhbmtAWzAtOV0kIjoKICAgICAkcmVmOiAiIy8kZGVmcy9tZXNvbi1ncGlv
IgoKICAgICBwcm9wZXJ0aWVzOgogICAgICAgcmVnOgogICAgICAgICBtaW5JdGVtczogNQoKICAg
ICAgIHJlZy1uYW1lczoKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAgLSBjb25zdDogZ3Bpbwog
ICAgICAgICAgIC0gY29uc3Q6IHB1bGwKICAgICAgICAgICAtIGNvbnN0OiBwdWxsLWVuYWJsZQog
ICAgICAgICAgIC0gY29uc3Q6IG11eAogICAgICAgICAgIC0gY29uc3Q6IGRzCgogICAgIHJlcXVp
cmVkOgogICAgICAgLSByZWcKICAgICAgIC0gcmVnLW5hbWVzCi4uLgo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpZb3UgbWF5
IGV2ZW4gYWRkIGEgNHRoIGZpbGUgZm9yIEcxMi9BMSBpcyByZWctbmFtZXMgbmVlZCBhIGRpZmZl
cmVudCBjb3VudC4KCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
