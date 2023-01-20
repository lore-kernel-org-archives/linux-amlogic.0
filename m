Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF69C25B4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nP0zLOHul2bCBG3irY0O6WBKoppLHVIBlP/uEDsAuL8=; b=xWspac6e+YFFh1
	N/ZPZrnBEg/kZYGyc8b/++S0viCjxSYGPUEDUzPNrRBsuhgcGknx/gcLWmhFPDozmSwbBvQ/ETWoN
	kq0xBbo29zYqA16Yaz21s4R6o5Gh7qpsCZvsqWNj+4DABB9GjqvpOcog8SPgfKfduXjopvtrxxYs6
	M15srq3x3x4pSkWCxLnMG2dB3Sn1DnLU8EE1LBPBlPfZqEFLuBiLEv7Oi6XajEx3qko6sg1IKjTOs
	hm3wzxR1I4ty5mhs9jZQgVzh0s5E0oYse9q69yboQRkArtyClpnvRxHp01OvJ2xIxLVP/b6jqRchE
	oJ4Y/5SoX9KuV6Tk7PUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoYi-009mrp-6r; Fri, 20 Jan 2023 10:23:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoXI-009mEp-NQ; Fri, 20 Jan 2023 10:22:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id b5so4458133wrn.0;
        Fri, 20 Jan 2023 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBagG8EDIuu/uJXoc6X7ZZCA35pdkVUcKYnIkIKOggQ=;
        b=pLnd75gP08DHfUkSbA51dfoqrnIo/hGqzDYVkvy+zGYyngqyyUYSz0UvctcHM6VhkR
         Jh585Q7i7ol9+4wW1/P5UBerr7g+6jGWdDoOeLmNeqpNQ5cs43o4N5E0TXaCAdr57tMH
         pqSg8qiQQg35WvrIuiOm5B75R6HfOQ1n8+VXYcF+9vzLBzaaPyIS8VBA7HYor47Ml+3M
         HU6BH5+0BKa9MG+zs9Vx9giNS/L0qCjNNt2RrVF+T20F/ZctaIJess1vzR1F6riSNpyJ
         hEgtgfC5qWcRj3yT8uNpyESn2FtIjvuh3ofyYe5TVI/QP0nFYx465ysOU6G9ljq6E7XI
         NwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBagG8EDIuu/uJXoc6X7ZZCA35pdkVUcKYnIkIKOggQ=;
        b=3L7e49VHnDukigmiXrvayg1bDPb86RwlmIrSAYhW9BprpoddHNYvMVvdjeR8dJZjxB
         UFu2/+3Rp+z64a3WNFgbPwH10Jeiq9wwcA4TCwDpwb6j5dzvxWQDuWxGZeIHOVf7fph4
         g0O3lGCHN+MuWWxJhUqPEllJgoIvzGXq2kiEM6f++SCePmGE8DAMefUTmPMllzplOKDf
         zEu8z5ZEvyGYuWCcV29d+2q8jvLwACQUxAf5Uw+9QHyiyQaH6s9dPIvNYdegjb8gyUNg
         PogNJ/zp4q345276ho+HiEFEU/MSIQdNIC3iVG/B7HzUWW9YraCLOpKCAvFbneBFq1Cg
         Nmbg==
X-Gm-Message-State: AFqh2krEIfqqh4cyPFIOuSK4Wyg5Z7fSA5jILO3A7JGt/omEZ4xKYurF
	hjQZffVc8O8kHbtcJetiRfM=
X-Google-Smtp-Source: AMrXdXvISUk8cNPjNkmZunP8YzkcogqSIh6BS8mjoKUYD/dVIALPmjJr0tO/9uEer01FFqoWBWKksA==
X-Received: by 2002:adf:f10b:0:b0:2bd:e215:4372 with SMTP id r11-20020adff10b000000b002bde2154372mr11044719wro.20.1674210134267;
        Fri, 20 Jan 2023 02:22:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc41:e300:8963:d1f4:1cd7:2821? (dynamic-2a01-0c23-bc41-e300-8963-d1f4-1cd7-2821.c23.pool.telefonica.de. [2a01:c23:bc41:e300:8963:d1f4:1cd7:2821])
        by smtp.googlemail.com with ESMTPSA id e11-20020a5d6d0b000000b002bdda9856b5sm2190835wrq.50.2023.01.20.02.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:22:13 -0800 (PST)
Message-ID: <eef8668d-a1f1-7b5d-1a15-ebf3a00d1e4b@gmail.com>
Date: Fri, 20 Jan 2023 11:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jo7qtwm1z.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_022216_874380_C8C09F3C 
X-CRM114-Status: GOOD (  33.20  )
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

T24gMjAuMDEuMjAyMyAxMTowMSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiAKPiBPbiBUaHUgMTkg
SmFuIDIwMjMgYXQgMjM6NDIsIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
IHdyb3RlOgo+IAo+PiBPbiAxNS4wMS4yMDIzIDIxOjM4LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6
Cj4+PiBPbiAxNS4wMS4yMDIzIDE5OjQzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBIaSBI
ZWluZXIsCj4+Pj4KPj4+PiBMZSAxNS8wMS8yMDIzIMOgIDE4OjA5LCBIZWluZXIgS2FsbHdlaXQg
YSDDqWNyaXTCoDoKPj4+Pj4gT24gMTUuMDEuMjAyMyAxNzo1NywgQW5kcmV3IEx1bm4gd3JvdGU6
Cj4+Pj4+PiBPbiBTdW4sIEphbiAxNSwgMjAyMyBhdCAwNDoxOTozN1BNICswMTAwLCBIZWluZXIg
S2FsbHdlaXQgd3JvdGU6Cj4+Pj4+Pj4gT24gbXkgU0MyLWJhc2VkIHN5c3RlbSB0aGUgZ2VucGh5
IGRyaXZlciB3YXMgdXNlZCBiZWNhdXNlIHRoZSBQSFkKPj4+Pj4+PiBpZGVudGlmaWVzIGFzIDB4
MDE4MDMzMDAuIEl0IHdvcmtzIG5vcm1hbCB3aXRoIHRoZSBtZXNvbiBnMTJhCj4+Pj4+Pj4gZHJp
dmVyIGFmdGVyIHRoaXMgY2hhbmdlLgo+Pj4+Pj4+IFN3aXRjaCB0byBQSFlfSURfTUFUQ0hfTU9E
RUwgdG8gY292ZXIgdGhlIGRpZmZlcmVudCBzdWItdmVyc2lvbnMuCj4+Pj4+Pgo+Pj4+Pj4gSGkg
SGVpbmVyCj4+Pj4+Pgo+Pj4+Pj4gQXJlIHRoZXJlIGFueSBkYXRhc2hlZXRzIGZvciB0aGVzZSBk
ZXZpY2VzPyBBbnl0aGluZyB3aGljaCBkb2N1bWVudHMKPj4+Pj4+IHRoZSBsb3dlciBuaWJibGUg
cmVhbGx5IGlzIGEgcmV2aXNpb24/Cj4+Pj4+Pgo+Pj4+Pj4gSSdtIGp1c3QgdHJ5aW5nIHRvIGF2
b2lkIGZ1dHVyZSBwcm9ibGVtcyB3aGVyZSB3ZSBmaW5kIGl0IGlzIGFjdHVhbGx5Cj4+Pj4+PiBh
IGRpZmZlcmVudCBQSFksIG5lZWRzIGl0cyBvd24gTUFUQ0hfRVhBQ1QgZW50cnksIGFuZCB0aGVu
IHdlIGZpbmQgd2UKPj4+Pj4+IGJyZWFrIGRldmljZXMgdXNpbmcgMHgwMTgwMzMwMiB3aGljaCB3
ZSBoYWQgbm8gaWRlYSBleGlzdHMsIGJ1dCBnb3QKPj4+Pj4+IGNvdmVyZWQgYnkgdGhpcyBjaGFu
Z2UuCj4+Pj4+Pgo+Pj4+PiBUaGUgU0MyIHBsYXRmb3JtIGluaGVyaXRlZCBhIGxvdCBmcm9tIEcx
MkEsIHRoZXJlZm9yZSBpdCdzIHBsYXVzaWJsZQo+Pj4+PiB0aGF0IGl0J3MgdGhlIHNhbWUgUEhZ
LiBBbHNvIHRoZSB2ZW5kb3IgZHJpdmVyIGZvciBTQzIgZ2l2ZXMgYSBoaW50Cj4+Pj4+IGFzIGl0
IGhhcyB0aGUgZm9sbG93aW5nIGNvbXBhdGlibGUgZm9yIHRoZSBQSFk6Cj4+Pj4+Cj4+Pj4+IGNv
bXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5LWlkMDE4MC4zMzAxIiwgImV0aGVybmV0LXBoeS1pZWVl
ODAyLjMtYzIyIjsKPj4+Pj4KPj4+Pj4gQnV0IHlvdSdyZSByaWdodCwgSSBjYW4ndCBzYXkgZm9y
IHN1cmUgYXMgSSBkb24ndCBoYXZlIHRoZSBkYXRhc2hlZXRzLgo+Pj4+Cj4+Pj4gT24gRzEyQSAo
JiBHWEwpLCB0aGUgUEhZIElEIGlzIHNldCBpbiB0aGUgTURJTyBNVVggcmVnaXN0ZXJzLAo+Pj4+
IHBsZWFzZSBzZWU6Cj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0
L3NvdXJjZS9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1lc29uLWcxMmEuYyNMMzYKPj4+Pgo+
Pj4+IFNvIHlvdSBzaG91bGQgZWl0aGVyIGFkZCBzdXBwb3J0IGZvciB0aGUgUEhZIG11eCBpbiBT
QzIgb3IgY2hlY2sKPj4+PiB3aGF0IGlzIGluIHRoZSBFVEhfUEhZX0NOVEwwIHJlZ2lzdGVyLgo+
Pj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBoaW50LiBJIGp1c3QgY2hlY2tlZCBhbmQgcmVhZGluZyBi
YWNrIEVUSF9QSFlfQ05UTDAgYXQgdGhlCj4+PiBlbmQgb2YgZzEyYV9lbmFibGVfaW50ZXJuYWxf
bWRpbygpIGdpdmVzIG1lIHRoZSBleHBlY3RlZCByZXN1bHQgb2YgMHgzMzAxMDE4MC4KPj4+IEJ1
dCBzdGlsbCB0aGUgUEhZIHJlcG9ydHMgMzMwMC4KPj4+IEV2ZW4gaWYgSSB3cml0ZSBzb21lIG90
aGVyIHJhbmRvbSB2YWx1ZSB0byBFVEhfUEhZX0NOVEwwLCBJIGdldCAwMTgwLzMzMDAKPj4+IGFz
IFBIWSBJRC4KPj4+Cj4+PiBGb3IgdS1ib290IEkgZm91bmQgdGhlIGZvbGxvd2luZzoKPj4+Cj4+
PiBodHRwczovL2dpdGh1Yi5jb20va2hhZGFzL3UtYm9vdC9ibG9iL2toYWRhcy12aW00LXItNjRi
aXQvZHJpdmVycy9uZXQvcGh5L2FtbG9naWMuYwo+Pj4KPj4+IHN0YXRpYyBzdHJ1Y3QgcGh5X2Ry
aXZlciBhbWxvZ2ljX2ludGVybmFsX2RyaXZlciA9IHsKPj4+IAkubmFtZSA9ICJNZXNvbiBHWEwg
SW50ZXJuYWwgUEhZIiwKPj4+IAkudWlkID0gMHgwMTgwMzMwMCwKPj4+IAkubWFzayA9IDB4ZmZm
ZmZmZjAsCj4+PiAJLmZlYXR1cmVzID0gUEhZX0JBU0lDX0ZFQVRVUkVTLAo+Pj4gCS5jb25maWcg
PSAmbWVzb25fcGh5X2NvbmZpZywKPj4+IAkuc3RhcnR1cCA9ICZtZXNvbl9hbWxfc3RhcnR1cCwK
Pj4+IAkuc2h1dGRvd24gPSAmZ2VucGh5X3NodXRkb3duLAo+Pj4gfTsKPj4+Cj4+PiBTbyBpdCdz
IHRoZSBzYW1lIFBIWSBJRCBJJ20gc2VlaW5nIGluIExpbnV4Lgo+Pj4KPj4+IE15IGJlc3QgZ3Vl
c3MgaXMgdGhhdCB0aGUgZm9sbG93aW5nIGlzIHRoZSBjYXNlOgo+Pj4KPj4+IFRoZSBQSFkgY29t
cGF0aWJsZSBzdHJpbmcgaW4gRFQgaXMgdGhlIGZvbGxvd2luZyBpbiBhbGwgY2FzZXM6Cj4+PiBj
b21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMwMSIsICJldGhlcm5ldC1waHktaWVl
ZTgwMi4zLWMyMiI7Cj4+Pgo+Pj4gVGhlcmVmb3JlIGlkIDAxODAvMzMwMSBpcyB1c2VkIGV2ZW4g
aWYgdGhlIFBIWSByZXBvcnRzIHNvbWV0aGluZyBlbHNlLgo+Pj4gTWVhbnMgaXQgZG9lc24ndCBt
YXR0ZXIgd2hpY2ggdmFsdWUgeW91IHdyaXRlIHRvIEVUSF9QSFlfQ05UTDAuCj4+Pgo+Pj4gSSBy
ZWR1Y2VkIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byBjb21wYXRpYmxlID0gImV0aGVybmV0LXBo
eS1pZWVlODAyLjMtYzIyIgo+Pj4gYW5kIHRoaXMgcmVzdWx0ZWQgaW4gdGhlIGFjdHVhbCBQSFkg
SUQgYmVpbmcgdXNlZC4KPj4+IFlvdSBjb3VsZCBjaGFuZ2UgdGhlIGNvbXBhdGlibGUgaW4gZHRz
IHRoZSBzYW1lIHdheSBmb3IgYW55IGcxMmEgc3lzdGVtCj4+PiBhbmQgSSBhc3N1bWUgeW91IHdv
dWxkIGdldCAwMTgwLzMzMDAgdG9vLgo+Pj4KPj4+IFJlbWFpbmluZyBxdWVzdGlvbiBpcyB3aHkg
dGhlIHZhbHVlIGluIEVUSF9QSFlfQ05UTDAgaXMgaWdub3JlZC4KPj4+Cj4+Cj4+IEkgdGhpbmsg
SSBmb3VuZCB3aGF0J3MgZ29pbmcgb24uIFRoZSBQSFkgSUQgd3JpdHRlbiB0byBTb0MgcmVnaXN0
ZXIKPj4gRVRIX1BIWV9DTlRMMCBpc24ndCBlZmZlY3RpdmUgaW1tZWRpYXRlbHkuIEl0IHRha2Vz
IGEgUEhZIHNvZnQgcmVzZXQgYmVmb3JlCj4+IGl0IHJlcG9ydHMgdGhlIG5ldyBQSFkgSUQuIFdv
dWxkIGJlIGdvb2QgdG8gaGF2ZSBhIGNvbW1lbnQgaW4gdGhlCj4+IGcxMmEgbWRpbyBtdXggY29k
ZSBtZW50aW9uaW5nIHRoaXMgY29uc3RyYWludC4KPj4KPj4gSSBzZWUgbm8gZWFzeSB3YXkgdG8g
dHJpZ2dlciBhIHNvZnQgcmVzZXQgZWFybHkgZW5vdWdoLiBUaGVyZWZvcmUgaXQncyBpbmRlZWQK
Pj4gdGhlIHNpbXBsZXN0IG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBuZXcgUEhZIElEIGluIHRoZSBj
b21wYXRpYmxlLgo+IAo+IFRoaXMgaXMgYmVjYXVzZSAoSSBndWVzcykgdGhlIFBIWSBvbmx5IHBp
Y2tzIHVwcyB0aGUgSUQgZnJvbSB0aGUgZ2x1ZQo+IHdoZW4gaXQgcG93ZXJzIHVwLiBBZnRlciB0
aGF0IHRoZSB2YWx1ZXMgYXJlIGlnbm9yZWQuCj4gCkkgdGVzdGVkIGFuZCBhIFBIWSBzb2Z0IHJl
c2V0IGlzIGFsc28gc3VmZmljaWVudCB0byBwaWNrIHVwIHRoZSBuZXcgUEhZIElELgpTdXBwb3Nl
ZGx5IGV2ZXJ5dGhpbmcgZXhlY3V0aW5nIHRoZSBzb2Z0IHJlc2V0IGxvZ2ljIGlzIHN1ZmZpY2ll
bnQ6CnBvd2VyLXVwLCBzb2Z0IHJlc2V0LCBjb21pbmcgb3V0IG9mIHN1c3BlbmQvcG93ZXItZG93
bgoKCj4gUmVtZW1iZXIgdGhlIFBIWSBpcyBhICJib3VnaHQiIElQLCB0aGUgZ2x1ZS9tdXggcHJv
dmlkZXMgdGhlIGlucHV0Cj4gc2V0dGluZ3MgcmVxdWlyZWQgYnkgdGhlIFBIWSBwcm92aWRlci4K
PiAKPiBCZXN0IHdvdWxkIGJlIHRvIHRyaWdnZXIgYW4gSFcgcmVzZXQgb2YgUEhZIGZyb20gZ2x1
ZSBhZnRlciBzZXR0aW5nIHRoZQo+IHJlZ2lzdGVyIEVUSF9QSFlfQ05UTDAuCj4gCj4gTWF5YmUg
dGhpcyBwYXRjaCBjb3VsZCBoZWxwIDogPwo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qYnJ1bmV0L2xp
bnV4Ly0vY29tbWl0L2NjYmIwN2IwYzllYjJkZTI2ODE4ZWI0ZjhhYTFmZDBlNWIzMWU2ZGIucGF0
Y2gKPiAKVGhhbmtzIGZvciB0aGUgaGludCwgSSdsbCBsb29rIGF0IGl0IGFuZCB0ZXN0LgoKPiBJ
IHRyaWVkIHRoaXMgd2hlbiB3ZSBkZWJ1Z2dlZCB0aGUgY29ubmVjdGl2aXR5IGlzc3VlIG9uIHRo
ZSBnMTIgZWFybGllcgo+IHRoaXMgc3ByaW5nLiBJIGRpZCBub3Qgc2VuZCBpdCBiZWNhdXNlIHRo
ZSBwcm9ibGVtIHdhcyBmb3VuZCB0byBiZSBpbgo+IHN0bW1hYy4KPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
