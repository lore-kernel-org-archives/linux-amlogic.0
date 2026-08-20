Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A5FC5DF81
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2026 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/y7GMOxXSnnSUzLjkBfjEy9wqIONK3PR53GvuMa1k4=; b=1KmZ0mqGV3aWhG
	MFrCdABxYWlxiR8Kfd5gJmoYbU8VKKBXnJAXI/nug2c2Xkcnqg/EeAyvm4D6cuPd6zcaxPEJNobzU
	lTl18v3LPisiOIMugPJjnJwgaXtXkC5JVRG+L0u1bbMyFcYK3IuctWSg251G8XSNpzCg8XVC+k1ot
	gJY8XOrBtSSRrekoESfur2yLCBI0FAs+OdM5ew+hH9OusFpMaiamEbdHEhHX1WCKUVM/wrjYAentV
	vChUYo2MFPdOyF1pobaj6mOv4TrMyT0CTvbQ0KyA+EB3F+8uQl3pSGwvMSrqstbnJKsA7o4JywQCt
	ljaJnT7N1tqFP0c1FXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxOP-0000000B5GJ-18of;
	Thu, 20 Aug 2026 07:40:53 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxOK-0000000B5Fr-1MPK
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Aug 2026 07:40:51 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso759710e0c.0
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Aug 2026 00:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211647; x=1787816447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdPpwGypGBUsvrsSvDXIguPPL189yxwSySBc8xM9coA=;
        b=dUbZuLG2vOyjAeiTRfBD1tKko+slPXhnVdW7QdV+JCtjgV+XDoV4t991VFMlRRxzHg
         TC2RuEC6YxqIlb6xMR+4l04gnQUgYVZymN81X92y6WErBVD+0gc9D4tPkHxKh6WmbjUg
         6/5OmVZ+ULvTZYr8Awi5H/QPPP7E+m89Br0mNZ3dqYNAvO0433lUJ9EEurx8go6s30uP
         nUZrnEq234OvfQ/wDFhEs5DQlHYR0c/ddfGOA0YpCL8Cnz81h/HHyQQzeIedUiyNfzyb
         05A/P+TDdod4NNI/Np4FylGrGjn/jfkv9Mq+ouhVIZI0XWwoPFwW47J7DFTzDqy0TPxj
         Ujkw==
X-Gm-Message-State: AOJu0YwwGNR6519CkvAkYNqiwaYgr8IDwbjSqkb79Y/oIm0OwdVq84oZ
	bqufD29qUZqderlvnQmotUW3T8i1MQGU0sAbjBn+3uBO2ORUP2D2SPP+qn774Ks/
X-Gm-Gg: AR+sD10OFOqhfqAfkrr6QH6C0E3sh3jCc5VxUrTmM9rNmdSreRu2UY00IN2PnkE7o/l
	HjavQ89nk/6lcw/uCYPKejKMVZgnO1nLSOQFOM9rGIDR+xeNsz1yO00DbK7cPGNYh9eyk82Tu+1
	12Tdixc9JDS1bjAtOYdFYBRNWl5qYPGs7keZHlqnPqkLa2VPZTu35KoOHp53y9CVjzCnVS4Fzad
	ECqDwmdblSbshJvp7f9Jb6Ycb5I9HE6Ya/FdrpT+mH31jYARABHzLdTjDxgCWDaKGrrHXlOcu2j
	xuRuB9J9e2BeKiIE8Gxk9c7m6/OHas2ikyKTNT7LeeOh1x6UPH13L0DPVZgWh20bX+QQcZ+Tt1z
	d5WsowVEbiHSXMZ5IB/ZZ39MD3oeAcqPCsX7JWrUwdTxLMym/NWfy/DJyE5lDLKMIxxtbwysNuE
	MumyybvejJJF/hp1MNkld437p00if7wKej8uxt7bkTUPMTowFpBYcVBlZQdHze9lFXERh5/CKUp
	9pLLrjFomA/shQ2zZqqoVrnQfUOvw==
X-Received: by 2002:a05:6122:46aa:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c5e3e09666mr4214520e0c.7.1787211646790;
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e27e29e1sm4881514e0c.14.2026.08.20.00.40.46
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so818664e0c.3
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
X-Received: by 2002:a05:6122:882:b0:5bd:86ac:a847 with SMTP id
 71dfb90a1353d-5c5e3df88c4mr4331225e0c.6.1787211646157; Thu, 20 Aug 2026
 00:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be> <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
 <20260819191316.8F2F21F000E9@smtp.kernel.org>
In-Reply-To: <20260819191316.8F2F21F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 09:40:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
X-Gm-Features: AcwNN1Xf-k2z34g_6wcrswrRilyDIcooOAsIPdAyo4-A___PZ7FNnn6TGkqYEkE
Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_004049_899362_AEDAE718 
X-CRM114-Status: GOOD (  22.21  )
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

SGkgU2FzaGlrbywKCk9uIFdlZCwgMTkgQXVnIDIwMjYgYXQgMjE6MTMsIDxzYXNoaWtvLWJvdEBr
ZXJuZWwub3JnPiB3cm90ZToKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPgo+
IFByZS1leGlzdGluZyBpc3N1ZXM6Cj4gLSBbSGlnaF0gSW5jb21wbGV0ZSBmaXggZm9yIHVuaW5p
dGlhbGl6ZWQgc3RhY2sgdmFyaWFibGVzOiBgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBwYXJlbnRf
ZGF0YWAgcmVtYWlucyB1bmluaXRpYWxpemVkIG9uIHRoZSBzdGFjaywgbGVhZGluZyB0byBhIGtl
cm5lbCBjcmFzaCBkdXJpbmcgY2xvY2sgcmVnaXN0cmF0aW9uLgo+IC0tCj4KPiAtLS0gUGF0Y2gg
WzRdOiBbUEFUQ0ggdHJlZXdpZGUgNC81XSBpaW86IGZyZXF1ZW5jeTogYWRmNDM3NzogTWFrZSBz
dXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQgLS0tCj4gY29tbWl0IDk5ZTAy
NGE3N2Y1YmNlNTkyMWQzYzZiNDYwNTQyNjNhYTQ1MDYxMGQKPiBBdXRob3I6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4KPiBpaW86IGZyZXF1ZW5jeTogYWRm
NDM3NzogTWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQKPgo+IFRo
aXMgY29tbWl0IGluaXRpYWxpemVzIHRoZSBjbGtfaW5pdF9kYXRhIHN0cnVjdHVyZSBpbgo+IGFk
ZjQzNzdfY2xrX3JlZ2lzdGVyKCkgdG8gemVyby4gVGhpcyBwcmV2ZW50cyBjcmFzaGVzIGNhdXNl
ZCBieQo+IHVuaW5pdGlhbGl6ZWQgZmllbGRzIGxpa2UgcGFyZW50X25hbWVzIHdoZW4gQ09ORklH
X0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk4KPiBvciBDT05GSUdfSU5JVF9TVEFDS19OT05FIGlzIGVu
YWJsZWQuCj4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9mcmVxdWVuY3kvYWRmNDM3Ny5j
IGIvZHJpdmVycy9paW8vZnJlcXVlbmN5L2FkZjQzNzcuYwo+ID4gLS0tIGEvZHJpdmVycy9paW8v
ZnJlcXVlbmN5L2FkZjQzNzcuYwo+ID4gKysrIGIvZHJpdmVycy9paW8vZnJlcXVlbmN5L2FkZjQz
NzcuYwo+ID4gQEAgLTk5OSw3ICs5OTksNyBAQCBzdGF0aWMgaW50IGFkZjQzNzdfY2xrX3JlZ2lz
dGVyKHN0cnVjdCBhZGY0Mzc3X3N0YXRlICpzdCkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3Qgc3Bp
X2RldmljZSAqc3BpID0gc3QtPnNwaTsKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZz
cGktPmRldjsKPiA+IC0gICAgIHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7Cj4gPiArICAgICBz
dHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0ID0ge307Cj4gPiAgICAgICBzdHJ1Y3QgY2xrX3BhcmVu
dF9kYXRhIHBhcmVudF9kYXRhOwo+Cj4gW1NldmVyaXR5OiBIaWdoXQo+IFRoaXMgaXMgYSBwcmUt
ZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHRoaXMgc3RydWN0IGNsa19wYXJlbnRfZGF0YSBhbHNv
Cj4gbmVlZCB0byBiZSB6ZXJvLWluaXRpYWxpemVkPwo+Cj4gT25seSBmd19uYW1lIGlzIGV4cGxp
Y2l0bHkgYXNzaWduZWQgYmVsb3csIGxlYXZpbmcgbmFtZSwgaHcsIGFuZCBpbmRleAo+IHBvcHVs
YXRlZCB3aXRoIHN0YWNrIGdhcmJhZ2UuIFdoZW4gYWRmNDM3N19jbGtfcmVnaXN0ZXIoKSBwYXNz
ZXMgdGhpcyB0bwo+IHRoZSBjbG9jayBmcmFtZXdvcmssIGNsa19jb3JlX3BvcHVsYXRlX3BhcmVu
dF9tYXAoKSB3aWxsIHJlYWQKPiBwYXJlbnRfZGF0YS5uYW1lIGFuZCBwYXNzIGl0IHRvIGNsa19j
cHlfbmFtZSgpLCB3aGljaCB1bHRpbWF0ZWx5IGNhbGxzCj4gc3RybGVuKCkgYW5kIGNhbiBjYXVz
ZSBhIHBhZ2UgZmF1bHQgZHVyaW5nIHByb2JlLgoKWWVzLCBwYXJlbnRfZGF0YSBoYXMgdGhlIHNh
bWUgaXNzdWUuCkFzIEpvbmF0aGFuIHdpbGwgcmViYXNlIGFnYWluc3QgcmMxIGFueXdheSwgSSB3
aWxsIHNlbmQgYSB2Mi4KVGhhbmtzIQoKPgo+IFsgLi4uIF0KPgo+ID4gICAgICAgcGFyZW50X2Rh
dGEuZndfbmFtZSA9ICJyZWZfaW4iOwo+ID4KPiA+ICAgICAgIGluaXQub3BzID0gJmFkZjQzNzdf
Y2xrX29wczsKPiA+ICAgICAgIGluaXQucGFyZW50X2RhdGEgPSAmcGFyZW50X2RhdGE7Cj4KPiAt
LQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9j
b3Zlci4xNzg3MTY1MzI5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZT9wYXJ0PTQKCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
