Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66634C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FUcXs0HklujhRY7BVtbdxCKahY4vUIplkrZKa0suvU=; b=ullw5T7wLiEWZa
	C8m0TXpUx2NLRhF5LeSXhNx56iFQHGThR1lastmjvdS98kjikg2AQS5tPqGsVBDYkngkM4iOUp6PU
	dD62g4gEcDi50K+Ts3gc1xBAOxK5vq5FvtSPOqGd4a2FNa+pFMosvXMob/GEZctRGeIUhvnAwosHf
	ESQQmo2JjqTsQaCzfYB6meGffTS5zhE8kRF7yA+oA/tfWc4rFcROkMxc7gZ6fgK3YYXntm0XxmooN
	uKiBhSuLDjWq27DTYAvFlGEoucluQpjn7H8R2XAdxsnnWvjqocIK0gCqwwBs91TORTJvndANMxuoI
	l+E5yEOwJSMp2sIDwxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGz3b-005s1V-5C; Thu, 28 Jul 2022 08:39:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGz3L-005rtV-Qf
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 08:39:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id h188-20020a1c21c5000000b003a34ac64bdfso475989wmh.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version:content-transfer-encoding;
        bh=jIAL/NtinFiIoUs1seDVkZQ5Lk2NmjX9+zgQPi+IvjA=;
        b=igCNHyQ+4L6hHGHtmQg+2CD+K5Lvfdlh+ACqtzyHI+0w3RvK2lZlpDBROkddBN9MaY
         RsVkQtpd2iBAqUrYrvuxJsJcMkolsL+ZY1MFOdQuU4vQd+zBp/vI2sL5UUn/o0khNJnm
         Tr4/ynuvnx3cxODsOm30vkD8XGxrYBipeO2GpFZiq8aE5kjO5hAdh5p8ScJQDEjSiyJY
         lUOgKCpLWfVBzsvUEReXVJ6OwDyOWtoNh71AlIKCOKh2DIdJpw1NRrhEuOnerCgCSBM5
         MZZRz+sXHYM3frimQR/+CoQ7D8PHkDVAkXilylaD+9GXtYkLZaFlaDAqXBsyKcXicvsf
         fVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=jIAL/NtinFiIoUs1seDVkZQ5Lk2NmjX9+zgQPi+IvjA=;
        b=C41IBQs9sg84bJgmdOtDiPssjOqpsU4IK8cU9TBTN3xkQZGaTjXgKVZAf0XDYfI6c8
         a4AhdefZv8iq1DNmfuJmeNwXF1PWMnJTMbNHVgqKe/yQJcbJ6j5U3PAtl7PXvybUBpMZ
         B3Xk9JVC9JL5nurteg5C3pO//pMpK1AXkkobEIasfY5CCGgFX0L55bxnyaerpTodMdvi
         R/d/HOvTSpZqGoganz0sQ5bXEPDZ/76s3Ukqhe9MgJMLkYKAq9wpSqEQVr4dj5ewpnwi
         ax9szAixfceoVs/9jH4pXOtoqLleSemIhHsTvrQjUjU6AwZW8W4HZk/epVPBzZdehNQs
         dx/A==
X-Gm-Message-State: AJIora9TeWqgr+rr+evTEZK6RRTsFw/JORkYy4iSMDiyABEDk6XEgn0t
	OzOO+AKhEI7bWuiTjK6wKEQRPg==
X-Google-Smtp-Source: AGRyM1uM91GvDx6P1GRpKHAV4YFnCfa9JW4xCzK7+51rXTwVChFIWKbdxZIbjGm98XgIPJ4Z2/8p4A==
X-Received: by 2002:a1c:7503:0:b0:3a3:2db1:d37e with SMTP id o3-20020a1c7503000000b003a32db1d37emr5730471wmc.47.1658997570007;
        Thu, 28 Jul 2022 01:39:30 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z16-20020adfe550000000b002185631adf0sm363872wrm.23.2022.07.28.01.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:39:29 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
 <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Date: Thu, 28 Jul 2022 10:27:00 +0200
In-reply-to: <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
Message-ID: <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_013932_075366_12D76ECE 
X-CRM114-Status: GOOD (  19.32  )
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

Ck9uIFRodSAyOCBKdWwgMjAyMiBhdCAxNjowNiwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgSkLvvIwKPgo+IE9uIDIwMjIvNy8yOCAxNTowOCwgSmVyb21lIEJydW5ldCB3
cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+IAo+PiBPbiBUaHUgMjggSnVsIDIwMjIgYXQg
MTM6NDEsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gMS4gQWRkIGNs
b2NrIGNvbnRyb2xsZXIgZHJpdmVyIGZvciBTNCBTT0MuCj4+Pgo+Pj4gWXUgVHUgKDMpOgo+Pj4g
ICAgZHQtYmluZGluZ3M6IGNsazogbWVzb246IGFkZCBTNCBTb0MgY2xvY2sgY29udHJvbGxlciBi
aW5kaW5ncwo+Pj4gICAgYXJtNjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgY2xvY2sgY29udHJv
bGxlciBpbiBEVAo+Pj4gICAgY2xrOiBtZXNvbjogczQ6IGFkZCBzNCBTb0MgY2xvY2sgY29udHJv
bGxlciBkcml2ZXIKPj4+Cj4+PiBWMSAtPiBWMjogQ2hhbmdlIGZvcm1hdCBhcyBkaXNjdXNzZWQg
aW4gdGhlIGVtYWlsLgo+Pj4KPj4+IExpbms6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YW1sb2dpYy8yMDIyMDcwODA2Mjc1Ny4zNjYyLTEteXUudHVAYW1sb2dpYy5jb20vCj4+Pgo+Pj4g
ICAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxneGJiLWNsa2MudHh0ICAgICAgfCAgICAxICsK
Pj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
MSArCj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpICAgICB8
ICAgMTEgKwo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgfCAgIDE1ICsKPj4+ICAgZHJpdmVycy9jbGsvbWVzb24vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgIHwgICAgMSArCj4+PiAgIGRyaXZlcnMvY2xrL21lc29uL3M0LmMgICAgICAgICAgICAg
ICAgICAgICAgICB8IDQ3MzIgKysrKysrKysrKysrKysrKysKPj4+ICAgZHJpdmVycy9jbGsvbWVz
b24vczQuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI5NiArKwo+Pj4gICBpbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL3M0LWNsa2MuaCAgICAgICAgICAgfCAgMTQ2ICsKPj4+ICAgOCBmaWxl
cyBjaGFuZ2VkLCA1MjAzIGluc2VydGlvbnMoKykKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvY2xrL21lc29uL3M0LmMKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xr
L21lc29uL3M0LmgKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svczQtY2xrYy5oCj4+Pgo+Pj4KPj4+IGJhc2UtY29tbWl0OiBiMjkzYmM5Mjg2ZWUyMTgy
NGU5M2YwZmNmZWQzYjc4ZmRmZWUwMWU2Cj4+IFBsZWFzZSBkb24ndCBwb3N0IHVudGlsIHlvdSBo
YXZlIGFkZHJlc3NlZCAqQUxMKiB0aGUgY29tbWVudHMgZnJvbSB0aGUKPj4gcHJldmlvdXMgdmVy
c2lvbi4KPiBUaGUgbGFzdCBlbWFpbCBhc2tlZCB5b3UgdG8gYWRvcHQgQTEgbWV0aG9kLCBidXQg
eW91IGRpZCBub3QgcmVwbHk/Cj4KPj4gQXQgZmlyc3QgZ2xhbmNlLCBJIGNhbiBzZWUgdGhhdCB0
aGlzIGlzIHN0aWxsIGEgc2luZ2xlIGRyaXZlciBmb3IKPj4gd2hhdCBpcyBvYnZpb3VzbHkgMiBj
b250cm9sbGVycyB3aXRoIDIgcmVnaXN0ZXIgc3BhY2VzLiBTaW1wbGUgY29tbWVudHMKPj4gbGlr
ZSB0aGUgIjw8IDIiIGluIHRoZSByZWdpc3RlciBkZWNsYXJhdGlvbiBoYXZlIG5vdCBiZWVuIGFk
ZHJlc3NlZCBlaXRoZXIuCj4gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBzaG91bGQgYmUgYSBjb250
cm9sbGVyLCBqdXN0IHR3byBhZGRyZXNzCj4gZGVzY3JpcHRpb25zLiBPbmUgaXMgdGhlIHZhcmlv
dXMgUExMIHJlZ2lzdGVycyBhbmQgb25lIGlzIHRoZSBjbG9jayBmb3IgCj4gdGhlIHBlcmlwaGVy
YWxzLiBBbmQgUExMIGlzIHRvIHByb3ZpZGUgYSBjbG9jayBzb3VyY2UgZm9yIHZhcmlvdXMKPiBw
ZXJpcGhlcmFsIGNsb2Nrcy4gU28gYSBjbG9jayBjb250cm9sbGVyIGlzIHJlYXNvbmFibGUuIEkg
dGhpbmsgeW91IGdvdCAKPiBpdCB3cm9uZy4KCkkgZG9uJ3QgdGhpbmsgSSBkby4gVGhpcyBsb29r
cyBleGFjdGx5IGxpa2UgdGhlIEExLgpUaGUgcG9zdCBvZiB0aGF0IGNvbnRyb2xsZXIgYXJlIHN0
aWxsIGluIHRoZSAgYXJjaGl2ZSBhbmQgSSBhbSBzdXJlIHlvdXIKY29sbGVhZ3VlcyBjYW4gZ2l2
ZSB5b3UgdGhlIGhpc3RvcnkuCgpZb3UgY2xlYXJseSBoYXZlIHJlZ2lzdGVyIHJlZ2lvbnMgcHJv
dmlkaW5nIGNsb2NrLCBzZXBhcmF0ZWQgYnkKMHg4MDAwLiBDbGFpbWluZyB0aGF0IGFzIG9uZSBi
aWcgcmVnaW9uIGlzIGJhZCBkZXNpZ24uCgpUaGVyZSBoYXMgYmVlbiBzZXZlcmFsIHJlbWFya3Mg
YWJvdXQgdXNpbmcgYSBiaWcgc3lzY29uIG9uIFYxLAp1bmFkZHJlc3NlZCB0b28uCgpDQ0YgaGFz
IGV2ZXJ5dGhpbmcgbmVjZXNzYXJ5IGluIHBsYWNlIHRvIGhhbmRsZSBlYWNoIHJlZ2lzdGVyIHJl
Z2lvbgpzZXBhcmF0ZWx5LCBwcm9wZXJseSBhbmQgcGFzcyBjbG9jayBhcm91bmQuCgpZb3UgY2Fu
IGhhbmRsZSBpdCBhcyBhIHNpbmdsZSBjb250cm9sbGVyLCBjbGFpbWluZyB0aGUgdHdvIHJlZ2lv
bnMKaW5kaXZpZHVhbGx5IGJ1dDoKIyAxIC0gaGFuZGxpbmcgMiBkaWZmZXJlbnQgcmVnbWFwcyBp
biB0aGUgY29udHJvbGxlciBpcyBnb2luZyB0byBiZQogICAgICBiaWdnZXIgbWVzcyB0aGFuIHlv
dSB0aGluawojIDIgLSBJIGFtIGZhciBmcm9tIGNvbnZpbmNlZCB0aGVyZSBpcyBhbnkgcmVhc29u
IHRvIGRvIHNvCgoKPgo+IE9rLCBpZiB5b3UgaW5zaXN0IG9uIHVzaW5nIHR3byBjbG9jayBjb250
cm9sbGVycywsIHBsZWFzZSBwcm92aWRlIHlvdXIgdGhlCj4gcmVhc29uIGFuZCBleGFtcGxlIGNv
ZGU/Cj4KPj4gU2VlaW5nIHRoYXQsIEkgaGF2ZSBub3QgcmV2aWV3ZWQgdGhpcyB2ZXJzaW9uIGZ1
cnRoZXIuCj4+IEkgd29uJ3QgdW50aWwgYWxsIHRoZSBjb21tZW50cyBmcm9tIHYxIGFyZSBlaXRo
ZXIgYWRkcmVzc2VkIG9yIGFuc3dlcgo+PiBSZWdhcmRzCj4+IEplcm9tZQo+PiAuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
