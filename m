Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E425AC76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBBy3ajLM7C8+U75UisDvboGJwaG8nX69aIH5od1wvs=; b=VpwGDraJUWRujD
	pGSNoO+d3x7bPvGRNei3hiNADsqE8Ez76muG0ZRSNTDar2GJoiNuv1eysKRdj6xM9hsKADVY2l9UX
	9Xxt3iLFgI8GMe9ZtBrzzQ0cBxaYddO43qu6TYmVfMdds1p99yJYWpPFh7CiICpfi6OmKSVYEWwHz
	vJMzMzcYtN5ZHnAQnRXYmvuVp54/kR7LjaEa9QsGnKlPx9DfbiNOOT/H1R1Y251SLL8CZ++xnGjW+
	4vO2+uzYczXYNkLvbcxH4EClFY5192hxTVR6m1q/357pWpte7b7xu7YJ2ddhrw4tNmUjPDsMkDNxK
	At9KfoyyHndgSfB2XVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pguAc-00CO0K-2K;
	Mon, 27 Mar 2023 21:14:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pguAY-00CNzj-2Q;
	Mon, 27 Mar 2023 21:14:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y4so41774211edo.2;
        Mon, 27 Mar 2023 14:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679951660;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfAWnu/HdNhG59VBhfDGl+NVjd1Z3ukfdoF0dEk/N1I=;
        b=HWbF9w1mZ2QP9tY6RqiY9yqRFJ6NaxVzXcS/UFEKXSlDiZpErLlMb7BRK6BkbQM/yK
         BOTDO0cs4rrE9kXE5j6GCN29lHVAWepUTRrikmBmgXQ2iMhny2pD4rhzxrDjro6mGHCd
         7x3wml4rZYR00ijP634qc8A6eRj/TzhhPAqCYtRYfJ2GxEyrH5+TyDXhQB0rX6P4RZkB
         BgftATo5IAwYCjNxdKCZd5MqCyq6GdbnS9WQR/O7XfIwF+Amg+txiAAzHVDFV0R2JYyG
         dlekFWV6bS6zTgGvL6pQC5Ml3HPQNIs9hdSmifJx1l0IYp5+Nq51A3tnsIfM04QKPFxp
         opSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679951660;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfAWnu/HdNhG59VBhfDGl+NVjd1Z3ukfdoF0dEk/N1I=;
        b=Duy+3gmWXFMaa17IAw3vTt5V3j5YwMP8sxQ5GmcO83Y3EFwRCbPsuiLbXzqwi77e6T
         083zbrktkC5CMbArdTikts0bEqcLaXE/wbWGVWKj+z8/WgAQPHL/vvXCjjZW748QxE3c
         iiUpcDxt/V7Qdq5Hz6MvYnYZlwDeeP2RAT+GOv+51tMK93TPjuN+Mu1CRSt+P4eI5kVT
         kuzSHwafdwqtdiyiP2qBv9BKnXRc7BaVFcKMZogfnD4xacoHc7RkcK5R+/XgTR917etD
         0EmTi7wdwO0G78qkmYXrlBrtvoNxwDCHjwk0DqMTx4BG/WlNdJ8gP8y1DGzbVxfDvECu
         hUwQ==
X-Gm-Message-State: AAQBX9fMQk6PbBxNelUxEzIKVwT6zhjlJFPQAJRROi7wtJPuf6sNAY+5
	d8fsRIQT1c724ZOFsIyytvw=
X-Google-Smtp-Source: AKy350bS6pzWTlVbxsSwTwiREma9tvBEdcF4ls6GPCSegZ3MZVId9oBZGpZfEhKAhtO5arHhdCH2hQ==
X-Received: by 2002:a50:fe94:0:b0:4f9:9e56:84bf with SMTP id d20-20020a50fe94000000b004f99e5684bfmr12458082edt.10.1679951660257;
        Mon, 27 Mar 2023 14:14:20 -0700 (PDT)
Received: from ?IPV6:2a02:3100:91f1:2a00:c022:d3da:60a9:9c00? (dynamic-2a02-3100-91f1-2a00-c022-d3da-60a9-9c00.310.pool.telefonica.de. [2a02:3100:91f1:2a00:c022:d3da:60a9:9c00])
        by smtp.googlemail.com with ESMTPSA id u6-20020a50d506000000b004fd2aab4953sm15126055edi.45.2023.03.27.14.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 14:14:19 -0700 (PDT)
Message-ID: <fc607b9a-baed-daf5-5b2a-3b69d36b8d17@gmail.com>
Date: Mon, 27 Mar 2023 23:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: neil.armstrong@linaro.org,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <fad131e9-265f-6c4d-3223-932f69c9a927@gmail.com>
 <3492657f-6cc2-5828-b153-30c609a92783@linaro.org>
 <45dbd1d4-a2b8-af33-beec-64906c0e98da@gmail.com>
 <20230327175027.z7as4fybzgx7zhuq@pengutronix.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] pwm: meson: add support for S4 chip family
In-Reply-To: <20230327175027.z7as4fybzgx7zhuq@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_141422_829651_DF812AEB 
X-CRM114-Status: GOOD (  26.97  )
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

T24gMjcuMDMuMjAyMyAxOTo1MCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gTW9uLCBN
YXIgMjcsIDIwMjMgYXQgMDc6MDA6MzVQTSArMDIwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+
PiBUaGUgYmVzdCAoZm9yIGFjaGlldmluZyBiZXN0IHByZWNpc2lvbikgaW5wdXQgZnJlcXVlbmN5
IGlzIDB4ZmZmZiAvIHBlcmlvZC4KPj4gU28gd2Ugc2hvdWxkIGRvIG91ciBiZXN0IHRvIGNvbWUg
YXMgY2xvc2UgYXMgcG9zc2libGUgdG8gdGhpcyBmcmVxdWVuY3kuCj4+IEJ5IHVzaW5nIHNldF9y
YXRlKCkgQ0NGIHdpbGwgY2hvb3NlIHRoZSBvcHRpbWFsIG11eCBpbnB1dCBhbmQgZGl2aWRlciB2
YWx1ZS4KPiAKPiBKdXN0IGZvciB0aGUgcmVjb3JkOiBIZXJlIG1pZ2h0IGJlIGEgbWlzY29uY2Vw
dGlvbi4gVGhlcmUgaXMgKEFGQUlLKSBubwo+IHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgc2V0X3Jh
dGUgd291bGQgcGljayBhbiBvcHRpbWFsIGNvbmZpZ3VyYXRpb24uIEFuZAo+IGlmIGl0J3Mgb25s
eSBiZWNhdXNlIHRoZXJlIGlzIG5vIG9iamVjdGl2ZSBkZWZpbml0aW9uIG9mICJvcHRpbWFsIi4g
Rm9yCj4gZXhhbXBsZSBpZiBhIGRyaXZlciBmb3IgYW4gU0QgY2FyZCByZXF1ZXN0cyA0MDBNSHos
IGl0IG1pZ2h0IG5vdCB3YW50Cj4gYW55dGhpbmcgZmFzdGVyIGFuZCBzbyBwcm9iYWJseSBwcmVm
ZXJzIDIwMiBNSHogb3ZlciA0MDQgTUh6LiBIb3dldmVyIGEKPiBkcml2ZXIgZm9yIGEgVUFSVCB3
b3VsZCBwcmVmZXIgdGhlIDQwNCBNSHogaW4gdGhpcyBjYXNlLiBJTUhPIHdlJ2QgbmVlZAo+IHNv
bWV0aGluZyBsaWtlCj4gClJpZ2h0LCBJIHdhc24ndCBwcmVjaXNlIGVub3VnaC4gSW4gbXkgY2Fz
ZSBvcHRpbWFsIGlzICJmYXN0ZXN0IHJhdGUgPD0gcmVxdWVzdGVkIHJhdGUiLgpUaGlzIHNlZW1z
IHRvIGJlIHRoZSBiZWhhdmlvciBvZiBjbGsgY29yZSBkZWZhdWx0IGltcGxlbWVudGF0aW9ucyBs
aWtlCmNsa19tdXhfZGV0ZXJtaW5lX3JhdGVfZmxhZ3MoKSBhbiBkaXZpZGVyX2RldGVybWluZV9y
YXRlKCksIHVzZWQgYnkgdGhlIG1lc29uCmNsb2NrIGRyaXZlcnMuCkhvd2V2ZXIgaW4gZ2VuZXJh
bCBjbG9jayBwcm92aWRlcnMgY2FuIHByb3ZpZGUgdGhlaXIgb3duIGRldGVybWluZV9yYXRlKCkK
aW1wbGVtZW50YXRpb25zLiBBbmQsIGFzIGEgZGlzY2xhaW1lciwgSSBoYXZlIHRvIGFkbWl0IHRo
YXQgSSdtIG5vIGV4cGVydCBpbiBDQ0YuCgo+IAljbGtfcm91bmRkb3duX3JhdGUoKTsKPiAJY2xr
X3JvdW5kbmVhcl9yYXRlKCk7IGFuZCBtYXliZQo+IAljbGtfcm91bmR1cF9yYXRlKCkKPiAKPiB0
byBwbGVhc2UgYWxsIGRyaXZlcnMuIEJ1dCB0aGF0IHNvdW5kcyBsaWtlIGEgYmlnZ2VyIHF1ZXN0
Lgo+IAo+IElmIHlvdXIgY2xrIGNhbiBwcm92aWRlIChzYXkpIDEwMDAwMDAgSHogYW5kIDIwMDAw
MDAgSHogKGFuZCBub3RoaW5nIGluCj4gYmV0d2VlbikgdGhlcmUgaXMgbm8gcnVsZSBpbiB0aGUg
Q0NGIHRoYXQgdGVsbHMgeW91IHdoaWNoIG9mIHRoZSB0d28gdG8KPiBwaWNrIGlmIHlvdSByZXF1
ZXN0IDEwMDAwMDEgSHogb3IgMTk5OTk5OSBIei4gKFRoZSBvbmx5IHRoaW5nIEkgd291bGQKPiBu
b3QgZXhwZWN0IGlzIHRoYXQgeW91IGdldCAxMDAwMDAwIEh6IHdoZW4gcmVxdWVzdGluZyAxOTk5
OTk5IEh6ICphbmQqCj4gMjAwMDAwMCBIeiB3aGVuIHJlcXVlc3RpbmcgMTAwMDAwMSBIei4pCj4g
Cj4+IE5vdCBzdXJlIHdoeSB3ZSBzaG91bGQgcmVzdHJpY3Qgb3Vyc2VsdmVzIHRvIG9uZSBtdXgg
cGFyZW50IG9ubHkuCj4+IEUuZy4gZm9yIGEgdmVyeSBsb3cgZHV0eSBjeWNsZSBhIGhpZ2hlciBp
bnB1dCBmcmVxdWVuY3kgdGhhbiB0aGUgeHRhbCAyNE1IeiBtYXkgYmUgcHJlZmVyYWJsZS4KPj4K
Pj4gTm90IG9ubHkgdGhlIG11eCBpcyBvdXRzaWRlIHRoZSBQV00gYmxvY2sgbm93LCBhbHNvIHRo
ZSBkaXZpZGVyICg4IGJpdCB3aWRlIGluc3RlYWQgb2YgNyBiaXQKPj4gYXMgb2YgdG9kYXkpLiBT
byB3ZSBuZWVkIGEgc2V0X3JhdGUoKSBhbnl3YXkgdG8gc2V0IHRoZSBkaXZpZGVyIHZhbHVlLgo+
PiBXaGF0IEkgY2FuJ3Qgc2F5IGlzIHdoZXRoZXIgdGhlIGludGVybmFsIGRpdmlkZXIgc3RpbGwg
ZXhpc3RzICh0aGVuIGV4dGVybmFsIGFuZCBpbnRlcm5hbAo+PiBkaXZpZGVyIHdvdWxkIGJlIGNh
c2NhZGVkKSBvciBpcyByZW1vdmVkIG9yIGJ5cGFzc2VkLgo+PiBJdCBzZWVtcyBsaWtlIHdoZW4g
YWRkaW5nIHRoZSBleHRlcm5hbCBQV00gY2xvY2sgZmVhdHVyZSBBbWxvZ2ljIGZvcmdvdCB0byB1
cGRhdGUKPj4gdGhlIFBXTSBibG9jayBkb2N1bWVudGF0aW9uLCBhcyB0aGVyZSdzIG5vIHJlZmVy
ZW5jZSBhdCBhbGwgdG8gdGhlIG5vdyBleHRlcm5hbCBpbnB1dCBjbG9jawo+PiAoZXhjZXB0IGlu
IHRoZSBjbG9ja3Mgc2VjdGlvbikuCj4gCj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gdGVzdCAob3Ig
YXNrPykgaWYgdGhlIGludGVybmFsIGRpdmlkZXIgc3RpbGwgZXhpc3RzCj4gYW5kIGRvIHRoZSBy
aWdodCB0aGluZyB0aGVuLgo+IAo+IEhhdmluZyBzYWlkIHRoYXQsIEkgd29uZGVyIGlmIGl0IHdv
dWxkIG1ha2Ugc2Vuc2UgdG8gcmV3b3JrIHRoZSBkcml2ZXIKPiBmb3IgdGhlIHZhcmlhbnRzIHdp
dGggdGhlIGludGVybmFsIG11eCB0byBhbHNvIGFic3RyYWN0IHRoZSBkaXZpZGVyIGFzIGEKPiBw
cm9wZXIgY2xrLgo+IApJIHRoaW5rIHRoaXMgd291bGQgbWFrZSBzZW5zZS4gVGhlbiB3ZSBjb3Vs
ZCBpZ25vcmUgdGhlIG11eCBwYXJlbnQgc2V0IGluIERUCmFuZCBsZXQgQ0NGIHNlbGVjdCB0aGUg
bXV4IHBhcmVudCBhbmQgZGl2aWRlciB2YWx1ZS4gQW5kIHdlIGNvdWxkIHVzZSBvbmUKcHdtIGNh
bGMgbG9naWMgYW5kIGdldCByaWQgb2YgbW9zdCBpZihleHRfY2xrKS4KCgo+IEJlc3QgcmVnYXJk
cwo+IFV3ZQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
