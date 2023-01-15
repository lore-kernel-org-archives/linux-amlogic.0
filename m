Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D41C63797
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 20:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfvEB19ewblMELmawkuWGX9MZliuGcAwmnHsxGRdKV0=; b=VWSHPykqEpMM1a
	Tls4wyg06jRfAVuFEwDb07ZrnTgVin+TKAQsaekV8vc28OhMKGUpVcaYI94X9BaEtTVM7O2kiRaMX
	KNwMmbBh69cuSgX6rXTpn5A/1J2zZllM163KsFcIjYKAP/3S+0m8yTucukGVqots9Bv7z/siFZHEb
	A9NUf/dFM8mM/rIH7jqSZHJLkq3O1BaGGw0CirZAPxCjSlAreho0PJtMy8PLiOc90a7a3YrtJC40E
	IVwZjTsMHS7hEdThjOu2z7tajU2pMTgGKdpM3+NYBHWgcxhIOMY49RI3i846s7j5CqT6fyTwdhMNx
	AUBm+YFMmJLUWUs5fN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH9lm-007wwI-MG; Sun, 15 Jan 2023 20:38:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH9la-007wup-NV; Sun, 15 Jan 2023 20:38:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so6619606wms.5;
        Sun, 15 Jan 2023 12:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEFlSf16WFxddMhHmvpZYMaVEQuEHnQ55NRL/ZWegJ4=;
        b=qxU5FHdv1qSMxl7GIcCDig/+qAFuafJVkVFx/qD0B3CZLK58kfEN5uTIsmuZqmm5CR
         bTVSlwIF94O4jgqLzTJgTVpDwdlIuf5GHf3KDZxKw0IMAmndibgnNrQi11Iiz+pG1zeo
         ee8Ak6LM7tk2M5YrT5Ig4tf7ma2JXg6DTqCIpRnzzkN5Z9oLDxV65chQ/u0jLwPHGCVE
         HCD6Hl9PbFn+4sWZUqwHYuCLtRIdFIDj9rgjDoWz7twueyExbTTFyj5U3nfdhzo9PzCs
         V+I0gG6ms//r/dGN2bQ60Xx0+7htrOdiHRkS++q8BLol3OwI4T3xJm/jGO8w6z1NhbW6
         ZGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEFlSf16WFxddMhHmvpZYMaVEQuEHnQ55NRL/ZWegJ4=;
        b=5whpveUSLcLG3WKZAORP74hMq6DLM3FmEkNf0NF1prULwAVy+1vgpH0eADpBV9mlhM
         3gjg9RmjZQUtaTT33o22KWRUmKm3wHRIreZ66YWU/GnH6c1N1X0AmPM4qheW2v2sk6Ap
         t7N8HCm/krXoznNsXS7XEVKJkS8IU16gygyKPbSjLDAWUjkLq22nQdyTK+WY+LvdAaiK
         G2Uw+/FfP4bGyU1ecp24kRgsocpYsTx8bvkFjnS4aVIIjVty3BQv0PdQOIlrEoTuhvoF
         Oxk9Au4hJtrUK07ToJej6fuJ6IYxsg16XAM7xisp560xXmNHJHhkBlS29oK3COeVmQXr
         tZPQ==
X-Gm-Message-State: AFqh2kryyOcz/3PCreEFrzKIr+3gh44CLeIR7lETGvIvBaheudAwQQ7K
	gy6Jbi7n9l6twvVH6vbDvxM=
X-Google-Smtp-Source: AMrXdXsaBVxKQKx0Z40WV6Xqs0q2xvaWR7myGk5yZXzRG5gPyCypgGCphHNJWWhYFt2DnvpW93dpOw==
X-Received: by 2002:a05:600c:4e08:b0:3cf:a41d:844b with SMTP id b8-20020a05600c4e0800b003cfa41d844bmr65637432wmq.5.1673815087980;
        Sun, 15 Jan 2023 12:38:07 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm35971141wmh.46.2023.01.15.12.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 12:38:07 -0800 (PST)
Message-ID: <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
Date: Sun, 15 Jan 2023 21:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>
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
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
In-Reply-To: <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_123810_811869_5A3C7F1A 
X-CRM114-Status: GOOD (  24.82  )
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

T24gMTUuMDEuMjAyMyAxOTo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgSGVpbmVyLAo+
IAo+IExlIDE1LzAxLzIwMjMgw6AgMTg6MDksIEhlaW5lciBLYWxsd2VpdCBhIMOpY3JpdMKgOgo+
PiBPbiAxNS4wMS4yMDIzIDE3OjU3LCBBbmRyZXcgTHVubiB3cm90ZToKPj4+IE9uIFN1biwgSmFu
IDE1LCAyMDIzIGF0IDA0OjE5OjM3UE0gKzAxMDAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4+
PiBPbiBteSBTQzItYmFzZWQgc3lzdGVtIHRoZSBnZW5waHkgZHJpdmVyIHdhcyB1c2VkIGJlY2F1
c2UgdGhlIFBIWQo+Pj4+IGlkZW50aWZpZXMgYXMgMHgwMTgwMzMwMC4gSXQgd29ya3Mgbm9ybWFs
IHdpdGggdGhlIG1lc29uIGcxMmEKPj4+PiBkcml2ZXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4+Pj4g
U3dpdGNoIHRvIFBIWV9JRF9NQVRDSF9NT0RFTCB0byBjb3ZlciB0aGUgZGlmZmVyZW50IHN1Yi12
ZXJzaW9ucy4KPj4+Cj4+PiBIaSBIZWluZXIKPj4+Cj4+PiBBcmUgdGhlcmUgYW55IGRhdGFzaGVl
dHMgZm9yIHRoZXNlIGRldmljZXM/IEFueXRoaW5nIHdoaWNoIGRvY3VtZW50cwo+Pj4gdGhlIGxv
d2VyIG5pYmJsZSByZWFsbHkgaXMgYSByZXZpc2lvbj8KPj4+Cj4+PiBJJ20ganVzdCB0cnlpbmcg
dG8gYXZvaWQgZnV0dXJlIHByb2JsZW1zIHdoZXJlIHdlIGZpbmQgaXQgaXMgYWN0dWFsbHkKPj4+
IGEgZGlmZmVyZW50IFBIWSwgbmVlZHMgaXRzIG93biBNQVRDSF9FWEFDVCBlbnRyeSwgYW5kIHRo
ZW4gd2UgZmluZCB3ZQo+Pj4gYnJlYWsgZGV2aWNlcyB1c2luZyAweDAxODAzMzAyIHdoaWNoIHdl
IGhhZCBubyBpZGVhIGV4aXN0cywgYnV0IGdvdAo+Pj4gY292ZXJlZCBieSB0aGlzIGNoYW5nZS4K
Pj4+Cj4+IFRoZSBTQzIgcGxhdGZvcm0gaW5oZXJpdGVkIGEgbG90IGZyb20gRzEyQSwgdGhlcmVm
b3JlIGl0J3MgcGxhdXNpYmxlCj4+IHRoYXQgaXQncyB0aGUgc2FtZSBQSFkuIEFsc28gdGhlIHZl
bmRvciBkcml2ZXIgZm9yIFNDMiBnaXZlcyBhIGhpbnQKPj4gYXMgaXQgaGFzIHRoZSBmb2xsb3dp
bmcgY29tcGF0aWJsZSBmb3IgdGhlIFBIWToKPj4KPj4gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1w
aHktaWQwMTgwLjMzMDEiLCAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+Pgo+PiBCdXQg
eW91J3JlIHJpZ2h0LCBJIGNhbid0IHNheSBmb3Igc3VyZSBhcyBJIGRvbid0IGhhdmUgdGhlIGRh
dGFzaGVldHMuCj4gCj4gT24gRzEyQSAoJiBHWEwpLCB0aGUgUEhZIElEIGlzIHNldCBpbiB0aGUg
TURJTyBNVVggcmVnaXN0ZXJzLAo+IHBsZWFzZSBzZWU6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1lc29u
LWcxMmEuYyNMMzYKPiAKPiBTbyB5b3Ugc2hvdWxkIGVpdGhlciBhZGQgc3VwcG9ydCBmb3IgdGhl
IFBIWSBtdXggaW4gU0MyIG9yIGNoZWNrCj4gd2hhdCBpcyBpbiB0aGUgRVRIX1BIWV9DTlRMMCBy
ZWdpc3Rlci4KPiAKVGhhbmtzIGZvciB0aGUgaGludC4gSSBqdXN0IGNoZWNrZWQgYW5kIHJlYWRp
bmcgYmFjayBFVEhfUEhZX0NOVEwwIGF0IHRoZQplbmQgb2YgZzEyYV9lbmFibGVfaW50ZXJuYWxf
bWRpbygpIGdpdmVzIG1lIHRoZSBleHBlY3RlZCByZXN1bHQgb2YgMHgzMzAxMDE4MC4KQnV0IHN0
aWxsIHRoZSBQSFkgcmVwb3J0cyAzMzAwLgpFdmVuIGlmIEkgd3JpdGUgc29tZSBvdGhlciByYW5k
b20gdmFsdWUgdG8gRVRIX1BIWV9DTlRMMCwgSSBnZXQgMDE4MC8zMzAwCmFzIFBIWSBJRC4KCkZv
ciB1LWJvb3QgSSBmb3VuZCB0aGUgZm9sbG93aW5nOgoKaHR0cHM6Ly9naXRodWIuY29tL2toYWRh
cy91LWJvb3QvYmxvYi9raGFkYXMtdmltNC1yLTY0Yml0L2RyaXZlcnMvbmV0L3BoeS9hbWxvZ2lj
LmMKCnN0YXRpYyBzdHJ1Y3QgcGh5X2RyaXZlciBhbWxvZ2ljX2ludGVybmFsX2RyaXZlciA9IHsK
CS5uYW1lID0gIk1lc29uIEdYTCBJbnRlcm5hbCBQSFkiLAoJLnVpZCA9IDB4MDE4MDMzMDAsCgku
bWFzayA9IDB4ZmZmZmZmZjAsCgkuZmVhdHVyZXMgPSBQSFlfQkFTSUNfRkVBVFVSRVMsCgkuY29u
ZmlnID0gJm1lc29uX3BoeV9jb25maWcsCgkuc3RhcnR1cCA9ICZtZXNvbl9hbWxfc3RhcnR1cCwK
CS5zaHV0ZG93biA9ICZnZW5waHlfc2h1dGRvd24sCn07CgpTbyBpdCdzIHRoZSBzYW1lIFBIWSBJ
RCBJJ20gc2VlaW5nIGluIExpbnV4LgoKTXkgYmVzdCBndWVzcyBpcyB0aGF0IHRoZSBmb2xsb3dp
bmcgaXMgdGhlIGNhc2U6CgpUaGUgUEhZIGNvbXBhdGlibGUgc3RyaW5nIGluIERUIGlzIHRoZSBm
b2xsb3dpbmcgaW4gYWxsIGNhc2VzOgpjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAu
MzMwMSIsICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7CgpUaGVyZWZvcmUgaWQgMDE4MC8z
MzAxIGlzIHVzZWQgZXZlbiBpZiB0aGUgUEhZIHJlcG9ydHMgc29tZXRoaW5nIGVsc2UuCk1lYW5z
IGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIHZhbHVlIHlvdSB3cml0ZSB0byBFVEhfUEhZX0NOVEww
LgoKSSByZWR1Y2VkIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byBjb21wYXRpYmxlID0gImV0aGVy
bmV0LXBoeS1pZWVlODAyLjMtYzIyIgphbmQgdGhpcyByZXN1bHRlZCBpbiB0aGUgYWN0dWFsIFBI
WSBJRCBiZWluZyB1c2VkLgpZb3UgY291bGQgY2hhbmdlIHRoZSBjb21wYXRpYmxlIGluIGR0cyB0
aGUgc2FtZSB3YXkgZm9yIGFueSBnMTJhIHN5c3RlbQphbmQgSSBhc3N1bWUgeW91IHdvdWxkIGdl
dCAwMTgwLzMzMDAgdG9vLgoKUmVtYWluaW5nIHF1ZXN0aW9uIGlzIHdoeSB0aGUgdmFsdWUgaW4g
RVRIX1BIWV9DTlRMMCBpcyBpZ25vcmVkLgoKPiBOZWlsCj4gCj4+Cj4+PiDCoMKgwqDCoEFuZHJl
dwo+Pgo+PiBIZWluZXIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
