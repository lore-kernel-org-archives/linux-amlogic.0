Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B2FE77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2024 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7iKEF912ZczCq556Y+esYwLc5/uVjx8IpqKp0HNX0k=; b=xyhdKV8qa5TLL7
	X4HFGilreejzxM1EOWJpnY3q+lWo/Dj/PNQ1ZzLrWWB/vW50jH+VWu4x+iuqqpU4KPMWBP0ATb8qr
	85uyKRA5F/eQ+4QsbDifsWbx1NTnRwhZRLy4G1LcMzHty13E/tofuZrpDKNHj9kTk9cHaujBZNCat
	XSxZ6IiR5CpHaiIRWmHWlbQJ+y67DJrZdRYvMH8TsNAZR+z3T17SjDsJcD8BDCiDKzyoSzAInMuYg
	qEuW3tbRXas0x6QRgDu36OUImEqwofGovl7M1ClKapiR0+mSsQesfDBR+JgGbrS5qCCh1jtGUz4x6
	0yFuYRQszabY0l4l0WWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ63I-0000000C9jt-0MFG;
	Tue, 24 Dec 2024 14:38:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ624-0000000C9ev-3DSj;
	Tue, 24 Dec 2024 14:37:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21634338cfdso74704055ad.2;
        Tue, 24 Dec 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735051031; x=1735655831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d22KTIl3OplnLRpPFcAzrWIcYBNdTH4ggDHSk/lL2yk=;
        b=ibbTgw/LsPDFXeubqz9R6XIyoytjHxtxiz4Wh7creJQwWdTVWLITPG5fecsr81mlmm
         1BZc5HfFBtYVVeXI63F5EbNB77v5KOoWAwlqEDckfFlfO38o7fouzWVH1YkXnz0WnJyP
         mO659B4b89aKloWb5agcmLxtzB4nyQkcb5m/0F9lj1pLDXUf8qxB64lZqp58OZ2iL+Gk
         b4/BN32ROGuLvYxAVnUqAiBzWCm2jRo2p9IwrIgvYgziNC+I2DMqPkIzqQHEm/URHkoK
         XmLBNIQbkHi3OqZ5S0lsHU9C9XFiv8CWo6CDDYrtNgoJlSqoVPDJ8p9vtQmmlEWssMap
         sV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735051031; x=1735655831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d22KTIl3OplnLRpPFcAzrWIcYBNdTH4ggDHSk/lL2yk=;
        b=ZPTTCx1r8deYTsnyO/rv1QqV4VGguxoCpiVxfDBfq10lCTFsqAkF/NdaHSG6DvEZG+
         LT/j7D11ZXgElLov5tEpUoAUzSHLXHetkkEWtAPvMtk/yN9KVWYh4mGmMlTgVhkh2cyS
         qJcXkjrIQiwZnASly326ma/qyJlYS6ubJzMdP88VS+Kp1LxiQSo2rx7Ko8On6CyCgb5u
         9PLMUWAc33lDVTnUTc8MxCP/DtmpBwH+LOptFaUZxLA8TyvmK809c+Cqz09euP9+B1W0
         2HpiJD0PpBeiH9lU1A31/cRB3rIgcSAYFM2b0OjT2gmAjLVTWUMbRGx2OEE5jgXqpJxA
         lhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtbpRcHgXRCCqU/qWB7rqnu6R5PYQeNf//qvy9uLh2jvdZXnNOqcznPnqk4utyQ508rZKeS60+pAb1C0e6@lists.infradead.org
X-Gm-Message-State: AOJu0YxAYZr0xSLC5TAgEsje6avwGMdUNuvKdnCWJwm2xwdMjLmzNNLD
	5X49LaaZ8jUQ9FpBkh/MeV1DbyEtKCAbwogG48wY3wzPAi+FdIhxduDhcCyuzfZqHfxbrAHlOJ1
	hXwops6V1S8QXplp4FCeWMy5RNNU=
X-Gm-Gg: ASbGncvQlXCHMikbg/DMnJ8BcBt2Mnj1qtIjQlMcqbljhgu8BP5WVmQv1BaqBCpiYIx
	5jiErq8AMi4mo5u0o47uCJwQmQvCOFRq0TeKzFSZLkSv43rihZzVw
X-Google-Smtp-Source: AGHT+IE/mJTksJ5MUxt+Px4xwExymbX2lQdDPYewgw+owvA5v/YqFnqOXEhm6l3ZZ4oKIThu+ozZapG9TdbkkT3nwAg=
X-Received: by 2002:a17:902:fc44:b0:215:a964:e680 with SMTP id
 d9443c01a7336-219e6ebcf72mr256770385ad.25.1735051031637; Tue, 24 Dec 2024
 06:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-3-martin.blumenstingl@googlemail.com> <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
In-Reply-To: <37cb9bc9-88c0-4e2b-8f46-0f67b91bc5be@salutedevices.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2024 15:37:00 +0100
Message-ID: <CAFBinCBxsv92t_B_T3vBDJJ1K5BwUbV=as6sy-KyQYz+2jur2g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] iio: adc: meson: consistently use bool/enum in
 struct meson_sar_adc_param
To: George Stark <gnstark@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org, lars@metafoo.de, jic23@kernel.org, 
	linux-amlogic@lists.infradead.org, 
	"kernel@salutedevices.com" <kernel@salutedevices.com>, Xingyu Chen <xingyu.chen@amlogic.com>, 
	Zelong Dong <zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063712_815547_483E2433 
X-CRM114-Status: GOOD (  15.77  )
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

SGkgR2VvcmdlLAoKT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTo0MeKAr0FNIEdlb3JnZSBTdGFy
ayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6ClsuLi5dCj4gPiAgIGVudW0gbWVz
b25fc2FyX2FkY19hdmdfbW9kZSB7Cj4gPiAgICAgICBOT19BVkVSQUdJTkcgPSAweDAsCj4gPiAg
ICAgICBNRUFOX0FWRVJBR0lORyA9IDB4MSwKPiA+IEBAIC0zMjEsMTMgKzMyNiwxMyBAQCBzdHJ1
Y3QgbWVzb25fc2FyX2FkY19wYXJhbSB7Cj4gPiAgICAgICB1OCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdGVtcGVyYXR1cmVfdHJpbW1pbmdfYml0czsKPiA+ICAgICAgIHVu
c2lnbmVkIGludCAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZV9tdWx0aXBs
aWVyOwo+ID4gICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRl
bXBlcmF0dXJlX2RpdmlkZXI7Cj4gPiAtICAgICB1OCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGlzYWJsZV9yaW5nX2NvdW50ZXI7Cj4gPiArICAgICBib29sICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGlzYWJsZV9yaW5nX2NvdW50ZXI7Cj4gPiAgICAg
ICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGFzX3JlZzExOwo+ID4g
ICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhc192cmVmX3Nl
bGVjdDsKPiA+IC0gICAgIHU4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
cmVmX3NlbGVjdDsKPiA+IC0gICAgIHU4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjbXZfc2VsZWN0Owo+ID4gLSAgICAgdTggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFkY19lb2M7Cj4KPgo+IFRoZSByZWFzb24gdG8gY2hvb3NlIHU4IHR5cGUgb3Zl
ciBib29sIHdhcyB0aGF0IHRob3NlIGFyZSBub3QgYWN0dWFsbHkKPiBib29sIHZhbHVlcyBidXQg
ZGlyZWN0IHZhbHVlcyBvZiBodyByZWdpc3RlciBiaXRzLiBXZSBoYXZlIGxpdHRsZQo+IGluZm9y
bWF0aW9uIGFib3V0IHJlYWwgbWVhbmluZyBvZiB0aGVzZSBiaXRzIHNvIGl0IHdvbid0IGhlbHAg
bXVjaCB0bwo+IGFkZCBib29sIGxheWVyIGFuZCBrZWVwIHJlYWwgdmFsdWVzIGluIHRoZSBpbml0
IGNvZGUgaW5zdGVhZCBvZiBwYXJhbQo+IHNlY3Rpb24gKGFkY19lb2MsIGNtdl9zZWxlY3QpLgo+
IGJvb2wgZGlzYWJsZV9yaW5nX2NvdW50ZXIgd2lsbCBsb29rIGRlY2VwdGl2ZSB0b28gYmVjYXVz
ZSBpdCBkb2Vzbid0Cj4gc2F5IHdoZXRoZXIgZGlzYWJsZSByaW5nX2NvdW50ZXIgb3Igbm90ICh3
ZSBhbHdheXMgZGlzYWJsZSBpdCkgYnV0Cj4gaG93IHRvIGRpc2FibGUgaXQgKHdyaXRlIDAgb3Ig
MSkKRG8geW91IGhhdmUgYW55IGNvbnRhY3QgYXQgQW1sb2dpYyB0aGF0IGNhbiBoZWxwIGV4cGxh
aW4gdGhlIHB1cnBvc2UKb2YgdGhlc2UgYml0cz8KSSB0cmllZCByZWFjaGluZyBvdXQgdG8gbXkg
Y29udGFjdCBvZmYtbGlzdCBidXQgZGlkIG5vdCBnZXQgYW55IGFuc3dlcnMuCgpJIGFsc28gaGF2
ZSBtb3JlIHF1ZXN0aW9ucyBhYm91dCB0aGUgU0FSQURDIElQIGJsb2NrIG9uIHRoZSBHWExYIFNv
Qy4KV2UgKENocmlzdGlhbiBhbmQgSSkgaGF2ZSBhIHBhdGNoIHByZXBhcmVkIHRvIGZpeCBhdWRp
byAob3IgcmF0aGVyIHRoZQpNUExMIGNsb2Nrcykgb24gdGhlIEdYTFggU29DIChzZWUgWzBdKS4g
VW5mb3J0dW5hdGVseSB0aGVyZSBzZWVtcyB0bwpiZSBub2JvZHkgdGhhdCdzIGFuc3dlcmluZyBt
ZSB3aXRoIGVub3VnaCBpbmZvIHNvIHdlIGNhbiB1cHN0cmVhbSB0aGF0CnBhdGNoLgoKU28gaWYg
eW91IGhhdmUgYW55IGNvbnRhY3Qgb3IgaW5zaWdodHMgaW50byBkYXRhc2hlZXRzIC0gcGxlYXNl
IGNoZWNrCmFuZCBzZWUgaWYgeW91IGNhbiBwcm92aWRlIGluZm9ybWF0aW9uIHNvIHdlIGNhbiBp
bXByb3ZlIHRoZSBuYW1pbmcgb2YKdGhlc2UgYml0cyBhbmQgaG9wZWZ1bGx5IGdldCBHWExYIFNv
QyBzdXBwb3J0IGZpeGVkLgoKQWxzbyArQ2MgWGluZ3l1IENoZW4gYW5kIFplbG9uZyBEb25nIC0g
SSBmb3VuZCB5b3VyIG5hbWVzIGluCmRvd25zdHJlYW0gcGF0Y2hlcyB0byB0aGUgU0FSQURDIGRy
aXZlciBbMV0uCgoKVGhhbmsgeW91IGFuZCBiZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjQwNjA0MDU1NDMxLjMzMTM5NjEt
Mi1jaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbS8KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9raGFk
YXMvbGludXgvY29tbWl0LzEzMzIxZDIzMjMxYTdhNGQwOGY0ZmVmZWJjZWYxMWIzNzk0NzVhMzcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
