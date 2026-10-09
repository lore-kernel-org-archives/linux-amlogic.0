Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68927CA9EBE
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHoWTas8uWtpb/u4oUkk864fRDUO48YWV+gi7n6cvjs=; b=IoZtlcRXLrcaza
	VMfVTGPej44WcGn1LE2YryBeBCUBNXFe8yIJHzHyDgfnT6+fYyherf/3Fl8qQyN8b58Kuz845DK59
	jcSqNL7/7eA/CTxXOMeUBfYBvHXB/nGlN/+aKFJuFNeb+PbXmelKjOx+LXU6f1Nny1mR0pRgPuYP4
	Cs7gkonuwXqyWzw7dN2mLYHtSP/MAuyRHzF8SwCI2qfpAAbRYPUchimt6bz6e6nz7ugPgZB8toSdj
	TMTp7KELLWb/tFk4T0qKVfkmMN1ZvSp+B4wH/cyEhNXHhdMeH+ybcb+8Sb3xrvkv6sbFRr0Feqort
	hnPHTlCOxa5SwWvrLvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHgX-00000007DV7-2leI;
	Fri, 09 Oct 2026 20:59:21 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHgU-00000007DUm-1JNy
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 20:59:19 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823e4047037so198168a34.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Oct 2026 13:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579557; x=1792184357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRIIxOajP0yzIY23BtbyoAhj2PBRdU9IpmRdYvRMNJ4=;
        b=fMwtps3JjCfcAA3w+LtBYrpqstyzIC6aEmz/xK0sTf5fU6sFiuxmsv0xjMU0qUYY9M
         y2XL3rF05pLyXlMuIftLuW1EgdmPf9XA9Whe806t3PuQwUfc9lcH2uBKu07PtOEYtTLe
         4NFj0FCovSVS5GfZn/mw60owdHdL9aqZVuHyMwB1r4B+9ei2OUmiN4oLmeI84FGTSB/u
         IejagknSlBCxjBWjpGd3bqYDi3oox5uiQ8prEDNqMnn1QyEB6zoNkyQ5E/6x9NXYF5t0
         HnqBWYaPx8cwR8OVaJ90SgBkNC8Y7kTHTYGNyZT5vyOM72jPJlbBOJBPbf/Uqe1e2Bxw
         rdfg==
X-Forwarded-Encrypted: i=1; AKwUvBwX6K1hrK29/q1oVFAdV68Ar76vZMYUQi7cYw0KAlsq7IMV0HKrqv+eyn1DGqHf/dHecNab/DIbkhW03M+7@lists.infradead.org
X-Gm-Message-State: AFuF++m2Rj20TC2EZnXcEqpIAer00RH0aj/K+j5+7TQbVZhZEY76wRJ5
	+LE2glCNN0dSv3GaSXz9DWVXFZbuFbFfrOjOr5j1IeM33TbzbQO6sbtM3ZojdbA7Yl0=
X-Gm-Gg: AYBFou2x2gYrRk/mzTgKR3FKNSBb43p97suZaE5qL0EG4MEdSxvS9oJf8Hc4Tg3dowm
	K3U97YqH4VhYc9EWbMHzR3/JgfeXwmOOdA7yL30ur+BySRVnfCo2KF3yYeLnZTx1ulkjpGfy3/2
	uWzMBr5yoXUr6Go7pmhg0AqMPJR3rsTzMUzvPUIK2x6Xdv7AgVySdhXNYaAEvaEZWduaRXyN1vl
	RCvDjHZWcFZnWV+DbfVIuzV0eOZrlpT1WF1T3SBdTGOtfqjcp0q4hI+d6TDWThSh17abOhIx2Hk
	EHPlJNZmjkiP1ocYN66GYaGJTNIIWjk/ueedyjiBtDFkOYc05zvLMC81xyNGnqH8d2zH+kcAjME
	aA/PO/f4Ti6TqI7jKxqjzIH8nyAc/DPYeL1lkCIokogdUCQgFMPDhKoMdpbR5v/gjtJXtNGMeuB
	NYaeyl80+28usMzDEX/x6drjeo3MoqK60HwaYbrMZ6ws6AMH49E1RBQrpW8nIEJasLTgki7txou
	4Bwu9+h8aQZE9aNfWLsnR6cukbGod6eIQlnIG1n5raXTgTEiElg6pz7rpdXJI4=
X-Received: by 2002:a05:6830:490c:b0:80c:d34f:5f62 with SMTP id 46e09a7af769-83097e5963cmr2725740a34.27.1791579557258;
        Fri, 09 Oct 2026 13:59:17 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303494f64csm2827490a34.3.2026.10.09.13.59.16
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:59:16 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8266c388b67so204139a34.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Oct 2026 13:59:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySQYi46xZU9TCmJ0dIWUWxs41VZMY4FxKOmgEQIagzHTa2CFFa9opDpM+M9O0EdtbhOJ20i7ljSQfTMvZS@lists.infradead.org
X-Received: by 2002:a05:690e:440f:b0:677:d3d8:990 with SMTP id
 956f58d0204a3-67936768725mr589216d50.6.1791579173056; Fri, 09 Oct 2026
 13:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com> <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
In-Reply-To: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 21:52:41 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
X-Gm-Features: AclHuK_m9bgs2ZxoWfD-m6qDBIuQp5RI_xHW6gmLTuflU7vtLwdOlVbkLA0qUf0
Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_135918_356882_B2459E0F 
X-CRM114-Status: GOOD (  22.24  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgOSwgMjAyNiBhdCAxOjEz4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDA5LCAyMDI2IGF0IDA2OjU5OjQ5QU0gKzAxMDAs
IEx1Y2FzIFRhbnVyZSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDcsIDIwMjYgYXQgMjowMeKAr1BN
IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwg
T2N0IDA3LCAyMDI2IGF0IDA5OjI2OjIwQU0gKzAxMDAsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPiA+
ID4gPiBUaGUgVDcgcGFpcnMgYSBTeW5vcHN5cyBnaWdhYml0IE1BQyB3aXRoIHRoZSBzYW1lIGds
dWUgcmVnaXN0ZXJzIHRoZQo+ID4gPiA+IEcxMkEgaGFzLCBidXQgbm90aGluZyBkZXNjcmliZWQg
aXQuIFRoaXMgYWRkcyB0aGUgYmluZGluZywgdGhlIGRyaXZlcgo+ID4gPiA+IHN1cHBvcnQgYW5k
IHRoZSBkZXZpY2UgdHJlZSBub2RlcywgYW5kIGVuYWJsZXMgdGhlIHBvcnQgb24gdGhlIEtoYWRh
cwo+ID4gPiA+IFZJTTQuCj4gPiA+ID4KPiA+ID4gPiBVbmxpa2UgdGhlIEcxMkEsIHRoZSBjb250
cm9sbGVyIHJlYWNoZXMgRFJBTSB0aHJvdWdoIGEgcGlwZWxpbmUgc3RhZ2UKPiA+ID4gPiB3aXRo
IGEgZ2F0ZSBvZiBpdHMgb3duLCBzeXNfYW1waXBlX2V0aC4gTm90aGluZyBlbHNlIGNsYWltcyBp
dCwgc28KPiA+ID4gPiBjbGtfZGlzYWJsZV91bnVzZWQgc3dpdGNoZXMgaXQgb2ZmIGFuZCB0cmFu
c2ZlcnMgc3RvcC4KPiA+ID4gPgo+ID4gPiA+IHYyIGNoYW5nZXMgdGhlIFJHTUlJIGRlbGF5cywg
YWZ0ZXIgcmV2aWV3LiBwaHktbW9kZSBkZXNjcmliZXMgdGhlCj4gPiA+ID4gYm9hcmQsIG5vdCB3
aGljaCBjaGlwIGFkZHMgdGhlIGRlbGF5LCBzbyB0aGlzIGJvYXJkIGlzIHJnbWlpLWlkLgo+ID4g
PiA+IGR3bWFjLW1lc29uOGIgZGlkIHRoZSBvcHBvc2l0ZSwgYW5kIGlnbm9yZWQgdGhlICotaW50
ZXJuYWwtZGVsYXktcHMKPiA+ID4gPiBwcm9wZXJ0aWVzLiBQYXRjaCAxIGZpeGVzIHRoYXQuIFRo
ZSBWSU00IG5lZWRzIGl0IGJlY2F1c2UgdGhlIFJUTDgyMTFGCj4gPiA+ID4gdHJhbnNtaXQgZGVs
YXkgZG9lcyBub3Qgd29yayBoZXJlLgo+ID4gPgo+ID4gPiBXaGF0IGlzIHNwZWNpYWwgYWJvdXQg
dGhlIFJUTDgyMTFGPwo+ID4gTWF5YmUgbm90aGluZywgaXQgbWF5IGJlIHRoaXMgYm9hcmQuIEkg
Y2Fubm90IHRlbGwgZnJvbSBoZXJlLgo+Cj4gWWVzLCBsb29rIGF0IG15IG90aGVyIHJlcGx5LiBU
aGUgUlRMODIxMUYgaXMgdmVyeSBsaWtlbHkgY29ycmVjdC4gSXQKPiBpcyB0aGUgTUFDIGRyaXZl
cnMgaGFuZGxpbmcgb2YgZGVsYXlzIHdoaWNoIGlzIGJyb2tlbi4gWW91IGdldCB0byBmaXgKPiBp
dCBmb3IgdGhpcyBuZXcgZGV2aWNlLgo+Cj4gICAgQW5kcmV3CgpEb2luZyBleGFjdGx5IHRoYXQu
IHYzIGxlYXZlcyB0aGUgZXhpc3RpbmcgZGVsYXkgY29kZSBhbG9uZSBhbmQgYWRkcyBhCnBhdGgg
dXNlZCBvbmx5IGJ5IHRoZSBUNyBjb21wYXRpYmxlLCBidWlsdCBvbiBNYXhpbWUncwpwaHlfZml4
X3BoeV9tb2RlX2Zvcl9tYWNfZGVsYXlzKCkuIFRlc3RpbmcgaXQgbm93LCB0aGVuIEkgd2lsbCBz
ZW5kCml0LgoKVGhhbmtzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
