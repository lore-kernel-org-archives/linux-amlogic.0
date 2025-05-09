Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA73AC3ABCA
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMVOSzbegYBDKOsy8Ws27EkZaaZe+er4ieyYyiUS8E4=; b=oVdnzHDU08fbpz
	bBAROm9thV06q6BNq5fpXTxW52EYAp3r0QcJqoPJARcZZztiLAwV5BccH+MN8gPmU3X9h8pzJM/9Z
	snkrM34E1vHwY2XH0qaLOT5kEHnTpHSs94VxIlncE/b9gnaERBX9vdwd6aHB/KyUox9NV0v1eOS9t
	ZCnxWU372NsN2nyyoOFVuGNHPc63BB9Jn1vUQhbHZqx6snf6Ffk2U+mLu6KKGMRkYZQUu6QMInt6l
	KV/9M1VuXaV3UICmPdbow3KhTGOr02Qqk5+G74cC6IUL2A5yt9S2HJCDzKiC4H7mge7IGig4IuRY0
	7wzLZIf/u/DsvelZ+UoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHuC-00000002i8V-0Czu;
	Fri, 09 May 2025 07:12:24 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHqr-00000002hWK-376X
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 07:08:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so177527866b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746774535; x=1747379335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDOVTvBY2hQzl4x0xlAS9VP7sT+X5C+A8PuttaCFmyA=;
        b=ld1VSWC4vnHo2oza9T7MEb05PT9lK+evs7PVYLRMMQOkD7l3ZHE21Qdf3a3vqj2XOX
         UBa8WQcbFZ41az/H+zPeM+Nr5EQf9uwJ6XNzHw5suZjT0InqNsqH54QP+9qllNHPEXaF
         HN2xTRjOQEl2lIyVaXoUlKTMRj1Mf4YYybnaE9j5kGi5kR/T0z23inMkL1R+2fNnA2sm
         YEAwxzSdPte0VKnE8i5BnRZW9ggwZgorFT6VW3ZKMKn43xRQQCqHvgkrcKNQhzIW0XwG
         ReIs8Ve1Bhwm28T++l5vRM8w9oh4U+JEHbnRN4s3jW5xgyDXtGzl7vdnSdmfnEOBbjFv
         rSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774535; x=1747379335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDOVTvBY2hQzl4x0xlAS9VP7sT+X5C+A8PuttaCFmyA=;
        b=Y26HMoLNertyBCTh6bY+29qSNnS2+CXvM37951izRUIThg+8yVUhv7mEcyjjMnCFFF
         DSUwWT/a7gYQKqrWhEON0UYj8mii11HyOx/VzQUEGZ/do0jkZ06TpOD/6Qtz0voUqU+7
         Epe14qfgw7Vjvj7f3X6aQEqpZI1PI9PVtLRDfox/jgFdIs7+JDfYyywbqahtSRCI22hy
         XitRdXIhSPTCc1moIrziV3HOkO2U6G0andOViEGiVLszx/kGOwZyHXFih2fbv1Zml7xj
         sqxjSokVZhDFt3Jl1StKHiiC/Mh6RmVLC8qcU3BaZeAUEKXJKhWFp4ZWm3CBlLr8+KY5
         ld4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1exb6N4X62K0G2FoRUFKHqWW/iAZEYtlwGkdK9SW7+hjkMacgGU+s5n8GhNVVAPXS3TRqBHDesbQ2If5@lists.infradead.org
X-Gm-Message-State: AOJu0YxOENNfYGTFBOwQZjfgwewGrXEoVe2jJ2m2lOtQh/bvuCTaxOdZ
	dBvKNUNGDU0eMeKgv01ychDWFtjj9kkFa798xQsmfkhaGYyFrTZpoZjoT1C4QDgsC13ubnczGHH
	+/D0p9JU3JYJ7gHKb+RHLr3WtOE1kUuVj
X-Gm-Gg: ASbGncsLd6EC7QRb8wvLiuD7F471aqksJ2tJkrLCSpFLHSc5+aAgZoFAXFcPR/9qkSR
	6A1oRPltxq/FJBxyWSWxlMYXMx+mnduNaYDFcq5LoW21jf52JiCgM3p06DLkw3GUEdO8cN3/n3f
	kpHx+2eY0xWoUZ6PUIaqY=
X-Google-Smtp-Source: AGHT+IFy6xSeENnr6GpZhNdMlhkEbAuN+UZ4rG9yxOM+Fw1GvytEt7cTK20FJVRt02pTE3RFKoZFSKkTIULzJWvTRRc=
X-Received: by 2002:a17:907:688a:b0:ad2:2417:12d9 with SMTP id
 a640c23a62f3a-ad2241716a5mr51158766b.39.1746774535293; Fri, 09 May 2025
 00:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org> <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
In-Reply-To: <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 9 May 2025 12:38:38 +0530
X-Gm-Features: AX0GCFvlAIyHMSqomrT8B9EkBmrGtOImqqnXVMTyKPDTZq4Vn-h2XNtU_Hhsenk
Message-ID: <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Wayne Schroeder <raz@chewies.net>
Cc: Ferass El Hafidi <funderscore@postmarketos.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_000857_804728_13BA70FD 
X-CRM114-Status: GOOD (  19.03  )
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

SGkgV2F5bmUsCgpPbiBGcmksIDkgTWF5IDIwMjUgYXQgMDE6MjUsIFdheW5lIFNjaHJvZWRlciA8
cmF6QGNoZXdpZXMubmV0PiB3cm90ZToKPgo+IEkgYWN0dWFsbHkgYWxyZWFkeSBoYXZlIGEgd29y
a2luZyBzb2x1dGlvbiB0aGF0IEkgZG9jdW1lbnRlZCBpbiBteQo+IGdpdGh1YiByZXBvIChkdWJz
Y2hyby9vZHJvaWQtbjIpLiAgQWxsIEkgZG8gaXMgc2V0IEJPT1RDT01NQU5EIHRvCj4gY2hlY2sv
ZGVsZXRlIGEgZmxhZyBmaWxlIG9uIG15IGJvb3QgcGFydGl0aW9uIGFuZCBpZiBpdCBpcyBmb3Vu
ZCwgdGhlbgo+IHJlc2V0IHVzYiBhbmQgc2xlZXAgZm9yIDEwIHNlY29uZHMuICBJIHRoZW4gaGF2
ZSBhIHN5c3RlbWQgc2h1dGRvd24KPiBzY3JpcHQgb25seSBvbiByZWJvb3QgdG8gdG91Y2ggdGhh
dCBmaWxlLgo+Cj4gQ09ORklHX0JPT1RDT01NQU5EPSJmYXRybSBtbWMgMDoxIHJlYm9vdCAmJiBl
Y2hvIFJlc2V0dGluZyBVU0Igb24KPiByZWJvb3QuLi4gJiYgdXNiIHJlc2V0ICYmIHNsZWVwIDEw
OyBydW4gZGlzdHJvX2Jvb3RjbWQiCj4KPiBJdCBpcyBhIGhhY2ssIGJ1dC4uLiB0aGUgc3lzdGVt
IHJlbGlhYmx5IHJlYm9vdHMgcmVtb3RlbHkgbm93LCBhbmQKPiB0aGF0J3MgdGhlIGltcG9ydGFu
dCBwYXJ0IGZvciBub3cuCj4KPiBXYXluZQo+Cj4gT24gVGh1LCBNYXkgOCwgMjAyNSBhdCAxMToy
MuKAr0FNIEZlcmFzcyBFbCBIYWZpZGkKPiA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gT24gV2VkIE1heSA3LCAyMDI1IGF0IDE6MDMgUE0gVVRDLCBXYXluZSBT
Y2hyb2VkZXIgd3JvdGU6Cj4gPiA+IEl0J3MgaGFyZCBmb3IgbWUgdG8gcXVhbnRpZnkgaWYgdXNi
IHdvcmtzIGluIHUtYm9vdCBhcyBJJ20gbm90IGxvYWRpbmcKPiA+ID4gb2ZmIG9mIGFueSB1c2Ig
c3RvcmFnZSBkZXZpY2VzLiAgSXQgY2VydGFpbmx5IG5ldmVyIGxldHMgbWUgdXNlIHRoZQo+ID4g
PiBrZXlib2FyZCB0byBhYm9ydCBhdXRvIGJvb3QsIGFuZCBuZXZlciBoYXMuICBPbiByZWJvb3Qs
IHRvIHJlbGlhYmx5Cj4gPgo+ID4gWW91IGNhbiBzZW5kIGJ5dGVzIHZpYSBVQVJUIHRvIGFib3J0
IGJvb3QsIGlmIHlvdSBoYXBwZW4gdG8gaGF2ZSBhIFVBUlQKPiA+IGFkYXB0ZXIgYXJvdW5kLgo+
CkNhbiB5b3UgdGVzdCB0aGlzIHNlcmllcyB0byBzZWUgaWYgdGhpcyByZXNvbHZlcyB0aGUgaXNz
dWU/CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvbGlzdC8/c2Vy
aWVzPTQ1NjA4OAoKVGhhbmtzCi1BbmFuZAoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
