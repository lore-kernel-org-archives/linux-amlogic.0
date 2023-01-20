Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEFDC25B4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9+3nY9d3vQYd/VENFhrKwJiu9uSncY/9hUnmzlVqF8=; b=gAj2z2vaIsaRrx
	AYqWigktzOs5W3S3DECle1ATDwePqgG6ETcwwZS3xTnNAPD+riyCdmz31q0e4IYU0DqwoeL5OQijC
	uzWq2MrCrmGflwY8JZikblBkY+57Pvh2ulvOEirKh9Rh77Gw/1tLLHZX5UaLxX8yKQEJbMZWy5v8Z
	Q2zoFAmUtBy90l9PAzgNOUlF6pY4jKejSsAEF+mCZw4RPdXSkmVaFSnkuFx6bnmbKschrOCVEKM1s
	UO+rnriE/RZaUGoaq/mB6ECsBE/OcrStX+1RKnR2X3gWsjMcLu9eSyGR2qn93MAhr/4YF3YLvd0KO
	rw3dkmOVCor/CSplMQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIp0X-009tGX-4i; Fri, 20 Jan 2023 10:52:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIp0L-009tDx-Iz; Fri, 20 Jan 2023 10:52:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so12950371ejc.4;
        Fri, 20 Jan 2023 02:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN03NvQhT/BdhwfWBiypYa/s2Rg4sHw2i2q465Uwpwk=;
        b=g8V3jI2gTRF/dCqarJmm80abJW68h+PUsb4fJRMt3QsKZ1xKgBQQ2LSmizlzpGm9bb
         xU0a4fnSQbiG+b9Xxj77ldFNCHYJgGmLYYnkSBlvH1pyMQlksY/w4MyiYtOVKPMeBisr
         qMS6jQuf+sVWNzN++wOW97NY16mSFrrZPaSkEJckNrFS849wy+7VQKI3cjcz9UXKAxMU
         mFClo2+mz8cZvH7K9WiV0lmXz8GmU2mpnYU5CcAllWVQ3V9mCmEV0B1RK4yiNAOb4Cy+
         GHPAzG4oltNxHk6WLdycbPRz3fRUUwv1XnOcAJ19pr4JOpXHUIUgXYn5cOfivOvVEA05
         dEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iN03NvQhT/BdhwfWBiypYa/s2Rg4sHw2i2q465Uwpwk=;
        b=qbQiOWC2bFYJDlDeY6FPORnVFKnaMxLZWnYXqJjfb/BPTg5FQdhShkcdD08lD7t+f9
         gTtb9nGx8sMafuZ014zCxPQ7Lg7M9YubeU4MKPguaasM8ydm5h5VCTuYuTnNQ4y/OSLp
         MpI3PTkX0BqxdneoezWb9Ux/ceda7G6l8kazpYQQWuG9T8nFbIfOlfKluCTvdjrSWLIS
         jYlBWPhUMkjM3Xsa7z3Pyziz1FdQI2bK/gUVacH4JbrI0n6kQAu2U89vDjZlLYARWwFp
         whMw2smwRS+R+0kulTN4lEdoR0CYsjuplDCzR+GrvemeZxt+lOV8CSyDoJrzk7t8LOvZ
         XAcA==
X-Gm-Message-State: AFqh2kr0X23mxD8yFL7sEBFhHmE/NM7UnXY5eDxTeKs8ehautNfVZejy
	PNF5QQksgetKRidviunwGXo=
X-Google-Smtp-Source: AMrXdXssf4A0K3c+R5tSKAMUkP1XIc17VwKVdzDy8P+j0b+8/MfqruVLsVGW9lQkK2YqveBUF3IiEg==
X-Received: by 2002:a17:907:91d3:b0:86e:3e0c:ae50 with SMTP id h19-20020a17090791d300b0086e3e0cae50mr9421742ejz.14.1674211934885;
        Fri, 20 Jan 2023 02:52:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc41:e300:8963:d1f4:1cd7:2821? (dynamic-2a01-0c23-bc41-e300-8963-d1f4-1cd7-2821.c23.pool.telefonica.de. [2a01:c23:bc41:e300:8963:d1f4:1cd7:2821])
        by smtp.googlemail.com with ESMTPSA id a8-20020aa7d908000000b0049dfd6bdc25sm7996301edr.84.2023.01.20.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:52:14 -0800 (PST)
Message-ID: <dc1ab1b9-347e-5d6f-670b-03057a98d2dd@gmail.com>
Date: Fri, 20 Jan 2023 11:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <e75ed56f-ba25-f337-e879-33cc2a784740@gmail.com>
 <1jo7qtwm1z.fsf@starbuckisacylon.baylibre.com>
 <eef8668d-a1f1-7b5d-1a15-ebf3a00d1e4b@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
In-Reply-To: <eef8668d-a1f1-7b5d-1a15-ebf3a00d1e4b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_025217_706148_B13071F2 
X-CRM114-Status: GOOD (  38.33  )
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

T24gMjAuMDEuMjAyMyAxMToyMiwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDIwLjAxLjIw
MjMgMTE6MDEsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+Cj4+IE9uIFRodSAxOSBKYW4gMjAyMyBh
dCAyMzo0MiwgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Cj4+PiBPbiAxNS4wMS4yMDIzIDIxOjM4LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+Pj4gT24g
MTUuMDEuMjAyMyAxOTo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IEhpIEhlaW5lciwK
Pj4+Pj4KPj4+Pj4gTGUgMTUvMDEvMjAyMyDDoCAxODowOSwgSGVpbmVyIEthbGx3ZWl0IGEgw6lj
cml0wqA6Cj4+Pj4+PiBPbiAxNS4wMS4yMDIzIDE3OjU3LCBBbmRyZXcgTHVubiB3cm90ZToKPj4+
Pj4+PiBPbiBTdW4sIEphbiAxNSwgMjAyMyBhdCAwNDoxOTozN1BNICswMTAwLCBIZWluZXIgS2Fs
bHdlaXQgd3JvdGU6Cj4+Pj4+Pj4+IE9uIG15IFNDMi1iYXNlZCBzeXN0ZW0gdGhlIGdlbnBoeSBk
cml2ZXIgd2FzIHVzZWQgYmVjYXVzZSB0aGUgUEhZCj4+Pj4+Pj4+IGlkZW50aWZpZXMgYXMgMHgw
MTgwMzMwMC4gSXQgd29ya3Mgbm9ybWFsIHdpdGggdGhlIG1lc29uIGcxMmEKPj4+Pj4+Pj4gZHJp
dmVyIGFmdGVyIHRoaXMgY2hhbmdlLgo+Pj4+Pj4+PiBTd2l0Y2ggdG8gUEhZX0lEX01BVENIX01P
REVMIHRvIGNvdmVyIHRoZSBkaWZmZXJlbnQgc3ViLXZlcnNpb25zLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
SGkgSGVpbmVyCj4+Pj4+Pj4KPj4+Pj4+PiBBcmUgdGhlcmUgYW55IGRhdGFzaGVldHMgZm9yIHRo
ZXNlIGRldmljZXM/IEFueXRoaW5nIHdoaWNoIGRvY3VtZW50cwo+Pj4+Pj4+IHRoZSBsb3dlciBu
aWJibGUgcmVhbGx5IGlzIGEgcmV2aXNpb24/Cj4+Pj4+Pj4KPj4+Pj4+PiBJJ20ganVzdCB0cnlp
bmcgdG8gYXZvaWQgZnV0dXJlIHByb2JsZW1zIHdoZXJlIHdlIGZpbmQgaXQgaXMgYWN0dWFsbHkK
Pj4+Pj4+PiBhIGRpZmZlcmVudCBQSFksIG5lZWRzIGl0cyBvd24gTUFUQ0hfRVhBQ1QgZW50cnks
IGFuZCB0aGVuIHdlIGZpbmQgd2UKPj4+Pj4+PiBicmVhayBkZXZpY2VzIHVzaW5nIDB4MDE4MDMz
MDIgd2hpY2ggd2UgaGFkIG5vIGlkZWEgZXhpc3RzLCBidXQgZ290Cj4+Pj4+Pj4gY292ZXJlZCBi
eSB0aGlzIGNoYW5nZS4KPj4+Pj4+Pgo+Pj4+Pj4gVGhlIFNDMiBwbGF0Zm9ybSBpbmhlcml0ZWQg
YSBsb3QgZnJvbSBHMTJBLCB0aGVyZWZvcmUgaXQncyBwbGF1c2libGUKPj4+Pj4+IHRoYXQgaXQn
cyB0aGUgc2FtZSBQSFkuIEFsc28gdGhlIHZlbmRvciBkcml2ZXIgZm9yIFNDMiBnaXZlcyBhIGhp
bnQKPj4+Pj4+IGFzIGl0IGhhcyB0aGUgZm9sbG93aW5nIGNvbXBhdGlibGUgZm9yIHRoZSBQSFk6
Cj4+Pj4+Pgo+Pj4+Pj4gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQwMTgwLjMzMDEiLCAi
ZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+Pj4+Pj4KPj4+Pj4+IEJ1dCB5b3UncmUgcmln
aHQsIEkgY2FuJ3Qgc2F5IGZvciBzdXJlIGFzIEkgZG9uJ3QgaGF2ZSB0aGUgZGF0YXNoZWV0cy4K
Pj4+Pj4KPj4+Pj4gT24gRzEyQSAoJiBHWEwpLCB0aGUgUEhZIElEIGlzIHNldCBpbiB0aGUgTURJ
TyBNVVggcmVnaXN0ZXJzLAo+Pj4+PiBwbGVhc2Ugc2VlOgo+Pj4+PiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgt
bWVzb24tZzEyYS5jI0wzNgo+Pj4+Pgo+Pj4+PiBTbyB5b3Ugc2hvdWxkIGVpdGhlciBhZGQgc3Vw
cG9ydCBmb3IgdGhlIFBIWSBtdXggaW4gU0MyIG9yIGNoZWNrCj4+Pj4+IHdoYXQgaXMgaW4gdGhl
IEVUSF9QSFlfQ05UTDAgcmVnaXN0ZXIuCj4+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB0aGUgaGludC4g
SSBqdXN0IGNoZWNrZWQgYW5kIHJlYWRpbmcgYmFjayBFVEhfUEhZX0NOVEwwIGF0IHRoZQo+Pj4+
IGVuZCBvZiBnMTJhX2VuYWJsZV9pbnRlcm5hbF9tZGlvKCkgZ2l2ZXMgbWUgdGhlIGV4cGVjdGVk
IHJlc3VsdCBvZiAweDMzMDEwMTgwLgo+Pj4+IEJ1dCBzdGlsbCB0aGUgUEhZIHJlcG9ydHMgMzMw
MC4KPj4+PiBFdmVuIGlmIEkgd3JpdGUgc29tZSBvdGhlciByYW5kb20gdmFsdWUgdG8gRVRIX1BI
WV9DTlRMMCwgSSBnZXQgMDE4MC8zMzAwCj4+Pj4gYXMgUEhZIElELgo+Pj4+Cj4+Pj4gRm9yIHUt
Ym9vdCBJIGZvdW5kIHRoZSBmb2xsb3dpbmc6Cj4+Pj4KPj4+PiBodHRwczovL2dpdGh1Yi5jb20v
a2hhZGFzL3UtYm9vdC9ibG9iL2toYWRhcy12aW00LXItNjRiaXQvZHJpdmVycy9uZXQvcGh5L2Ft
bG9naWMuYwo+Pj4+Cj4+Pj4gc3RhdGljIHN0cnVjdCBwaHlfZHJpdmVyIGFtbG9naWNfaW50ZXJu
YWxfZHJpdmVyID0gewo+Pj4+IAkubmFtZSA9ICJNZXNvbiBHWEwgSW50ZXJuYWwgUEhZIiwKPj4+
PiAJLnVpZCA9IDB4MDE4MDMzMDAsCj4+Pj4gCS5tYXNrID0gMHhmZmZmZmZmMCwKPj4+PiAJLmZl
YXR1cmVzID0gUEhZX0JBU0lDX0ZFQVRVUkVTLAo+Pj4+IAkuY29uZmlnID0gJm1lc29uX3BoeV9j
b25maWcsCj4+Pj4gCS5zdGFydHVwID0gJm1lc29uX2FtbF9zdGFydHVwLAo+Pj4+IAkuc2h1dGRv
d24gPSAmZ2VucGh5X3NodXRkb3duLAo+Pj4+IH07Cj4+Pj4KPj4+PiBTbyBpdCdzIHRoZSBzYW1l
IFBIWSBJRCBJJ20gc2VlaW5nIGluIExpbnV4Lgo+Pj4+Cj4+Pj4gTXkgYmVzdCBndWVzcyBpcyB0
aGF0IHRoZSBmb2xsb3dpbmcgaXMgdGhlIGNhc2U6Cj4+Pj4KPj4+PiBUaGUgUEhZIGNvbXBhdGli
bGUgc3RyaW5nIGluIERUIGlzIHRoZSBmb2xsb3dpbmcgaW4gYWxsIGNhc2VzOgo+Pj4+IGNvbXBh
dGlibGUgPSAiZXRoZXJuZXQtcGh5LWlkMDE4MC4zMzAxIiwgImV0aGVybmV0LXBoeS1pZWVlODAy
LjMtYzIyIjsKPj4+Pgo+Pj4+IFRoZXJlZm9yZSBpZCAwMTgwLzMzMDEgaXMgdXNlZCBldmVuIGlm
IHRoZSBQSFkgcmVwb3J0cyBzb21ldGhpbmcgZWxzZS4KPj4+PiBNZWFucyBpdCBkb2Vzbid0IG1h
dHRlciB3aGljaCB2YWx1ZSB5b3Ugd3JpdGUgdG8gRVRIX1BIWV9DTlRMMC4KPj4+Pgo+Pj4+IEkg
cmVkdWNlZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1w
aHktaWVlZTgwMi4zLWMyMiIKPj4+PiBhbmQgdGhpcyByZXN1bHRlZCBpbiB0aGUgYWN0dWFsIFBI
WSBJRCBiZWluZyB1c2VkLgo+Pj4+IFlvdSBjb3VsZCBjaGFuZ2UgdGhlIGNvbXBhdGlibGUgaW4g
ZHRzIHRoZSBzYW1lIHdheSBmb3IgYW55IGcxMmEgc3lzdGVtCj4+Pj4gYW5kIEkgYXNzdW1lIHlv
dSB3b3VsZCBnZXQgMDE4MC8zMzAwIHRvby4KPj4+Pgo+Pj4+IFJlbWFpbmluZyBxdWVzdGlvbiBp
cyB3aHkgdGhlIHZhbHVlIGluIEVUSF9QSFlfQ05UTDAgaXMgaWdub3JlZC4KPj4+Pgo+Pj4KPj4+
IEkgdGhpbmsgSSBmb3VuZCB3aGF0J3MgZ29pbmcgb24uIFRoZSBQSFkgSUQgd3JpdHRlbiB0byBT
b0MgcmVnaXN0ZXIKPj4+IEVUSF9QSFlfQ05UTDAgaXNuJ3QgZWZmZWN0aXZlIGltbWVkaWF0ZWx5
LiBJdCB0YWtlcyBhIFBIWSBzb2Z0IHJlc2V0IGJlZm9yZQo+Pj4gaXQgcmVwb3J0cyB0aGUgbmV3
IFBIWSBJRC4gV291bGQgYmUgZ29vZCB0byBoYXZlIGEgY29tbWVudCBpbiB0aGUKPj4+IGcxMmEg
bWRpbyBtdXggY29kZSBtZW50aW9uaW5nIHRoaXMgY29uc3RyYWludC4KPj4+Cj4+PiBJIHNlZSBu
byBlYXN5IHdheSB0byB0cmlnZ2VyIGEgc29mdCByZXNldCBlYXJseSBlbm91Z2guIFRoZXJlZm9y
ZSBpdCdzIGluZGVlZAo+Pj4gdGhlIHNpbXBsZXN0IG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBuZXcg
UEhZIElEIGluIHRoZSBjb21wYXRpYmxlLgo+Pgo+PiBUaGlzIGlzIGJlY2F1c2UgKEkgZ3Vlc3Mp
IHRoZSBQSFkgb25seSBwaWNrcyB1cHMgdGhlIElEIGZyb20gdGhlIGdsdWUKPj4gd2hlbiBpdCBw
b3dlcnMgdXAuIEFmdGVyIHRoYXQgdGhlIHZhbHVlcyBhcmUgaWdub3JlZC4KPj4KPiBJIHRlc3Rl
ZCBhbmQgYSBQSFkgc29mdCByZXNldCBpcyBhbHNvIHN1ZmZpY2llbnQgdG8gcGljayB1cCB0aGUg
bmV3IFBIWSBJRC4KPiBTdXBwb3NlZGx5IGV2ZXJ5dGhpbmcgZXhlY3V0aW5nIHRoZSBzb2Z0IHJl
c2V0IGxvZ2ljIGlzIHN1ZmZpY2llbnQ6Cj4gcG93ZXItdXAsIHNvZnQgcmVzZXQsIGNvbWluZyBv
dXQgb2Ygc3VzcGVuZC9wb3dlci1kb3duCj4gCj4gCj4+IFJlbWVtYmVyIHRoZSBQSFkgaXMgYSAi
Ym91Z2h0IiBJUCwgdGhlIGdsdWUvbXV4IHByb3ZpZGVzIHRoZSBpbnB1dAo+PiBzZXR0aW5ncyBy
ZXF1aXJlZCBieSB0aGUgUEhZIHByb3ZpZGVyLgo+Pgo+PiBCZXN0IHdvdWxkIGJlIHRvIHRyaWdn
ZXIgYW4gSFcgcmVzZXQgb2YgUEhZIGZyb20gZ2x1ZSBhZnRlciBzZXR0aW5nIHRoZQo+PiByZWdp
c3RlciBFVEhfUEhZX0NOVEwwLgo+Pgo+PiBNYXliZSB0aGlzIHBhdGNoIGNvdWxkIGhlbHAgOiA/
Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qYnJ1bmV0L2xpbnV4Ly0vY29tbWl0L2NjYmIwN2IwYzll
YjJkZTI2ODE4ZWI0ZjhhYTFmZDBlNWIzMWU2ZGIucGF0Y2gKPj4KPiBUaGFua3MgZm9yIHRoZSBo
aW50LCBJJ2xsIGxvb2sgYXQgaXQgYW5kIHRlc3QuCj4gCj4+IEkgdHJpZWQgdGhpcyB3aGVuIHdl
IGRlYnVnZ2VkIHRoZSBjb25uZWN0aXZpdHkgaXNzdWUgb24gdGhlIGcxMiBlYXJsaWVyCj4+IHRo
aXMgc3ByaW5nLiBJIGRpZCBub3Qgc2VuZCBpdCBiZWNhdXNlIHRoZSBwcm9ibGVtIHdhcyBmb3Vu
ZCB0byBiZSBpbgo+PiBzdG1tYWMuCj4+Cj4gCgpJIHRlc3RlZCB0aGUgcGF0Y2ggd2l0aCBhIHNs
aWdodCBtb2RpZmljYXRpb24uIE1heWJlIHRoZSBQSFkgcGlja3MgdXAgb3RoZXIKc2V0dGluZ3Mg
YWxzbyBvbiBwb3dlci11cC9zb2Z0LXJlc2V0IG9ubHkuIFRoZXJlZm9yZSBJIG1vdmVkIHNldHRp
bmcKRVRIX1BIWV9DTlRMMiB0byBiZWZvcmUgcG93ZXJpbmcgdXAgdGhlIFBIWS4gRG8geW91IHRo
aW5rIHRoYXQncyBuZWVkZWQvYmV0dGVyPwoKV2l0aCB0aGlzIHBhdGNoIHRoZSBuZXcgUEhZIElE
IGlzIGVmZmVjdGl2ZSBlYXJseSBlbm91Z2ggYW5kIHRoZSByaWdodApQSFkgZHJpdmVyIGlzIGxv
YWRlZCBhbHNvIHcvbyBvdmVycmlkaW5nIHRoZSBQSFkgSUQgd2l0aCBhIGNvbXBhdGlibGUuCgpC
YXNlZCBvbiB3aGljaCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB5b3UgcHJlZmVyLCBhcmUgeW91IGdv
aW5nIHRvIHN1Ym1pdCBpdD8KRWxzZSBJIGNhbiBkbyBpdCB0b28sIGp1c3QgbGV0IG1lIGtub3cu
CgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5jIGIv
ZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1nMTJhLmMKaW5kZXggOWQyMWZkZjg1Li43
ODgyZGNjZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEy
YS5jCisrKyBiL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5jCkBAIC02LDYg
KzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+CiAjaW5jbHVkZSA8bGludXgvY2xr
Lmg+CiAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+CisjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9pby5oPgog
I2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgpAQCAtMTQ4LDYgKzE0OSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2xrX29wcyBnMTJhX2VwaHlfcGxsX29wcyA9IHsKIAogc3RhdGljIGludCBnMTJh
X2VuYWJsZV9pbnRlcm5hbF9tZGlvKHN0cnVjdCBnMTJhX21kaW9fbXV4ICpwcml2KQogeworCXUz
MiB2YWw7CiAJaW50IHJldDsKIAogCS8qIEVuYWJsZSB0aGUgcGh5IGNsb2NrICovCkBAIC0xNTks
MTcgKzE2MSwxOSBAQCBzdGF0aWMgaW50IGcxMmFfZW5hYmxlX2ludGVybmFsX21kaW8oc3RydWN0
IGcxMmFfbWRpb19tdXggKnByaXYpCiAKIAkvKiBJbml0aWFsaXplIGVwaHkgY29udHJvbCAqLwog
CXdyaXRlbChFUEhZX0cxMkFfSUQsIHByaXYtPnJlZ3MgKyBFVEhfUEhZX0NOVEwwKTsKLQl3cml0
ZWwoRklFTERfUFJFUChQSFlfQ05UTDFfU1RfTU9ERSwgMykgfAotCSAgICAgICBGSUVMRF9QUkVQ
KFBIWV9DTlRMMV9TVF9QSFlBREQsIEVQSFlfREZMVF9BREQpIHwKLQkgICAgICAgRklFTERfUFJF
UChQSFlfQ05UTDFfTUlJX01PREUsIEVQSFlfTU9ERV9STUlJKSB8Ci0JICAgICAgIFBIWV9DTlRM
MV9DTEtfRU4gfAotCSAgICAgICBQSFlfQ05UTDFfQ0xLRlJFUSB8Ci0JICAgICAgIFBIWV9DTlRM
MV9QSFlfRU5CLAotCSAgICAgICBwcml2LT5yZWdzICsgRVRIX1BIWV9DTlRMMSk7CiAJd3JpdGVs
KFBIWV9DTlRMMl9VU0VfSU5URVJOQUwgfAogCSAgICAgICBQSFlfQ05UTDJfU01JX1NSQ19NQUMg
fAogCSAgICAgICBQSFlfQ05UTDJfUlhfQ0xLX0VQSFksCiAJICAgICAgIHByaXYtPnJlZ3MgKyBF
VEhfUEhZX0NOVEwyKTsKKwl2YWwgPSBGSUVMRF9QUkVQKFBIWV9DTlRMMV9TVF9NT0RFLCAzKSB8
CisJICAgICAgRklFTERfUFJFUChQSFlfQ05UTDFfU1RfUEhZQURELCBFUEhZX0RGTFRfQUREKSB8
CisJICAgICAgRklFTERfUFJFUChQSFlfQ05UTDFfTUlJX01PREUsIEVQSFlfTU9ERV9STUlJKSB8
CisJICAgICAgUEhZX0NOVEwxX0NMS19FTiB8CisJICAgICAgUEhZX0NOVEwxX0NMS0ZSRVE7CisJ
d3JpdGVsKHZhbCwgcHJpdi0+cmVncyArIEVUSF9QSFlfQ05UTDEpOworCXZhbCB8PSBQSFlfQ05U
TDFfUEhZX0VOQjsKKwl3cml0ZWwodmFsLCBwcml2LT5yZWdzICsgRVRIX1BIWV9DTlRMMSk7CisJ
bWRlbGF5KDEwKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4zOS4wCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
