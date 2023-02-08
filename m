Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF2C636CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5LxigogUDNcrNXEEyEWfYfs9w9KCa2kLL5sq5Vf5Cw=; b=y3nQaw6SkunFTj
	At/svNPG058clOO/aRFix65az8wItbFeaeTbMHJfiygiEjPfu8AENGeP9ADv29zVquRSe4gLRwTDW
	12MHFIBy7vUjEOiJeayG4WkIFoooy6hGoZE41GZZ3bdVIS+e3XHAeVAy35kGS8Q+DzHrOF6nAK74L
	9j+0MoXme2lkHKcC5zbU4WIRbS9lUfl0rIjlwiCpsJzwnVoNpV2pSJJTYHbG+xXLNWAkV1Br4hJJu
	thif2mVKgmTQZuGAwbMEdzrn8hLV2to3coUVDSoi4Hyaa4jhxJGB+MJEtfD+06u8lcp6PLzfimi90
	1lJAtms2zDzvGvwFxXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjkz-00FcYA-W2; Wed, 08 Feb 2023 12:41:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjkx-00FcW1-0n
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 12:41:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id a2so16337434wrd.6
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Feb 2023 04:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SoZzOz36xn+BgE1e6kZnc3ii3Vw8oIG1xUizj+g3lJs=;
        b=PCWnnJ0O1JCCUgSraQE5Zv4V3gCiohSzwp1M51kueo0+pADF9LJnBKoPvU8rulV4ff
         asNUYcrfBk50sj68ZIagE0QKYvSvTArr1yj+nzsRrPElGXsFVXoHrPM1PVILajirPILw
         uQz0I7/FeQtL+XgttTblL/w8njJt3BJClsyCvIwBfIx+lfnpLCCqsnOI1Flj+UhP1+nK
         RLCP2vr1gvOzMzi2LGL6aX/jkIS6PB7Cdvfts8H16PeLX7GjQLsl4qX0F4Esg9wJKubP
         MN2ddFA2uLacaJIC4z6pDKdwtwAw/m7TGD2KFjAGgLA7sSlcBCmMYKMzRqcFPIrAVIr7
         KDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoZzOz36xn+BgE1e6kZnc3ii3Vw8oIG1xUizj+g3lJs=;
        b=29XNyCICdZm/ISEMVA66PrsZHoFVtSQQCo92U3bZpQa5wZOLcPwh+saTg7dCxnE6X5
         BZq3+u6j/+DAQAULctzndPeT0rnXjuLvcUB9DP+LpPkBX31Y0lhQxSU4yDVXzphsCRk1
         YQiGmWy/DKYxPyflJggxpQNx1+Hk4VA0U7d6m7r1G+Ww1dq/7HuNi5rB7aDsUPdLX91F
         8j1XpYe2k7me5aaCC0l6rDElLqiZaNoriSl20aid7b+dz2nogIDCLWQ/jdbuzldQrWxc
         fVlrjzHh5IoxBe3VZCvdKDdKDhQhH2rRw9xVTS415veHgwAKrX7A0pKDSkWxjmpUPMFS
         f7Tg==
X-Gm-Message-State: AO0yUKUTimqMPXFTDhg6jgSvPQgxyL72/1n/GAWgp/8xZGjEyNXL/wOZ
	2gZck27kttn4p8g68J2SNsRWLQ==
X-Google-Smtp-Source: AK7set98/DHovmfyhRgw7rfcf1Kqy4IHwDZOKbv09SNFqZ8LFy392y2+i2ttuEXDWAWA4pWoTvZo7Q==
X-Received: by 2002:a05:6000:1141:b0:2c3:db5b:727d with SMTP id d1-20020a056000114100b002c3db5b727dmr7667367wrx.53.1675860049313;
        Wed, 08 Feb 2023 04:40:49 -0800 (PST)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4986000000b002bfc24e1c55sm13360757wrq.78.2023.02.08.04.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 04:40:48 -0800 (PST)
Message-ID: <61db3f1c-b780-4385-f991-ebb4c3423791@linaro.org>
Date: Wed, 8 Feb 2023 13:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Content-Language: fr, en-GB
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
 <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_044059_081843_2E67B4B0 
X-CRM114-Status: GOOD (  17.48  )
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

TGUgMjcvMDEvMjAyMyDDoCAxNDowMiwgSGVpbmVyIEthbGx3ZWl0IGEgw6ljcml0wqA6Cj4gT24g
MjcuMDEuMjAyMyAwODo1OSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAy
Ni8wMS8yMDIzIDE1OjAzLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+PiBUaGUgdXNhZ2Ugb2Yg
ZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBsZWFkIHRvIGxvc3QgaW50ZXJydXB0cyB1bmRlciBs
b2FkLAo+Pj4gc2VlIFswXS4gVGhpcyB3YXMgY29uZmlybWVkIHRvIGJlIGZpeGVkIGJ5IHVzaW5n
IGxldmVsLXRyaWdnZXJlZAo+Pj4gaW50ZXJydXB0cy4KPj4+IFRoZSByZXBvcnQgd2FzIGFib3V0
IFNESU8uIEhvd2V2ZXIsIGFzIHRoZSBob3N0IGNvbnRyb2xsZXIgaXMgdGhlIHNhbWUKPj4+IGZv
ciBTRCBhbmQgTU1DLCBhcHBseSB0aGUgY2hhbmdlIHRvIGFsbCBtbWMgY29udHJvbGxlciBpbnN0
YW5jZXMuCj4+Cj4+IFRoYW5rcywgSSBhcHBsaWVkIGl0IGluIGZvci1uZXh0IHNvIGl0IHJ1bnMg
b24gdGhlIENJIHRlc3RzLgo+Pgo+Pj4KPj4+IFswXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9s
aXN0cy9saW51eC1tbWMvbXNnNzM5OTEuaHRtbAo+Pj4KPj4+IEZpeGVzOiAxNDk5MjE4YzgwYzkg
KCJhcm02NDogZHRzOiBtb3ZlIGNvbW1vbiBHMTJBICYgRzEyQiBtb2RlcyB0byBtZXNvbi1nMTIt
Y29tbW9uLmR0c2kiKQo+Pgo+PiBJIHRoaW5rIHdlIHNob3VsZCBmaW5kIGEgYmV0dGVyIEZpeGVz
IG9yIHBlcmhhcHMgc3BsaXQgaW4gMyBzbyBpdCB0YXJnZXRzIHRoZQo+PiByaWdodCBjb21taXQg
YWRkaW5nIHRoZSBub2RlcyBmb3IgZWFjaCBmYW1pbHkuCj4+Cj4gVGhpcyB3b3VsZCBiZSB0aGUg
Y2xlYW5lc3Qgb3B0aW9uLCByaWdodC4gUHJhY3RpY2FsbHkgaXQgc2hvdWxkbid0IG1ha2UKPiBt
dWNoIG9mIGEgZGlmZmVyZW5jZS4gVGhlIGNob3NlbiBjb21taXQgaXMgZnJvbSAyMDE5LCBTRElP
IGludGVycnVwdAo+IHN1cHBvcnQgaGFzIGJlZW4gYWRkZWQganVzdCByZWNlbnRseSwgYW5kIHJl
Z2FyZGluZyBNTUMvU0QgaXQgc2VlbXMgbm8KPiBwcm9ibGVtcyBjYXVzZWQgYnkgZWRnZS10cmln
Z2VyZWQgaW50ZXJydXB0cyBhcmUga25vd24uCgpJIHVuZGVyc3RhbmQsIGJ1dCB0aGUgRml4ZXMg
dGFnIG11c3QgcmVmbGVjdCB3aGF0IGNvbW1pdCBpbnRyb2R1Y2VkIHRoZSBicmVha2FnZSwKc28g
ZWl0aGVyIGtlZXAgYSBzaW5nbGUgcGF0Y2ggYnV0IGxpc3QgYWxsIGNvbW1pdHMgaW50cm9kdWNp
bmcgdGhlIE1NQywgU0QgJiBTRElPIG5vZGVzCm9uIHRoZSAzIGZhbWlsaWVzLCBvciBzcGxpdCBp
biAzIGFuZCBzcGVjaWZ5IHRoZSBjb21taXQgaW50cm9kdWNpbmcgdGhlIE1NQywgU0QgJiBTRElP
Cm5vZGUgb24gZWFjaCBmYW1pbHkuCgpJJ2xsIHByZWZlciB0aGUgbGF0ZXIuCgpJZiB0aGUgcGF0
Y2ggaXNuJ3QgYXBwbGljYWJsZSBmb3Igb2xkZXIga2VybmVscywgaXQgZG9lc24ndCBtYXR0ZXIg
YXMgdGhlIHN0YWJsZSB0ZWFtCndpbGwgb25seSBhcHBseSB0aGUgZml4IG9uIGEgdHJlZSBpZiBp
dCBhcHBsaWVzIGFuZCBidWlsZHMuCklmIHlvdSB0YXJnZXQgYW4gb2xkZXIgcmVsZWFzZSB5b3Ug
Y2FuIHN1Ym1pdCB0aGVtIGEgcGF0Y2ggcmV3b3JrZWQgdG8gYXBwbHkKY29ycmVjdGx5IGlmIHRo
ZSBvcmlnaW5hbCBwYXRjaCBpcyBhbHJlYWR5IG9ubHkgTGludXMgbWFzdGVyIHRyZWUuCgpBbmQg
ZG9uJ3QgZm9yZ2V0IGFkZGluZyB0aGUgVGVzdGVkLWJ5IHRhZ3MuCgpUaGFua3MsCk5laWwKCj4g
Cj4+IElmIHRoZSB0ZXN0IGRvZXNuJ3QgcmVwb3J0IGFueSBicmVha2FnZSwgSSdsbCBwcm9iYWJs
eSBhc2sgeW91IHRoYXQuCj4+Cj4gU3VyZS4KPiAKPj4gTmVpbAo+Pgo+IEhlaW5lcgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
