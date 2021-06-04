Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,URI_NOVOWEL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D24C47083
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 15:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0EB6140B
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 15:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0EB6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrvWBWc0KmZRqccQrNCvNbVADfjpqFhmTBrErKG+hxk=; b=CPNVkanuHOvWm2
	2Z+g5SfRsAXnvG7DP1EFjnZFoOKT05fGEDKW6p60RkqR1cc0LU7pnwfKdqSrsbVM1Pi6ibqwcdGX/
	4kMKUXlNg83MHzc8rjKs5X8FClQ0os05d7ywLweRtSe0W3vgpZCghwDLiKfet2ojrrj3/u3vDwhD4
	IVbAEVswcn9OpJsVf6Zv18HS+hDAsQujtwcuLtfF1U1dqTg1bkomhcmM1Yw82JtV/YUUYbPOH/ap3
	Zrid5yyPSu0sVjnebA6zQF9SdnEsrXuAVxWX3l0emQR2BWAvtFgE6fVo97MtiHrhJbmIViOU3NBHU
	/YFK9Oica+X6hGZ+LBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBQO-00E4rW-Qn; Fri, 04 Jun 2021 15:07:52 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBQJ-00E4qZ-Q2
 for linux-amlogic@lists.infradead.org; Fri, 04 Jun 2021 15:07:52 +0000
Received: by mail-qt1-x836.google.com with SMTP id m13so7175691qtk.13
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jun 2021 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=M0MIug4uhteRxdWOVPqNkw3ATKplY4lCx/S7+si7RU8=;
 b=BUuszxg2VmWIb45n6Sy0XgAeOFUXiR0DYTIMBbaScwIRDkBvAWr4DKous4ZMXHVXPx
 TptzCxF1bLWSoXYfYniTJIL02O3mXFnXHjdpReyAEyciHoPP1/A6qXSM/T+a5famQ3fO
 3sc91jlHbreVV+YSD9Wf2ezEGR+nuTrHTj/xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M0MIug4uhteRxdWOVPqNkw3ATKplY4lCx/S7+si7RU8=;
 b=U7qSuMWiuVORwZMUfweZdW77Q+Oyvo9+qzn056/30bJck/XjWe5L3RSnYjT5eGoL5M
 F9jdpk9wUSYpuU4P9esi1SwLGYhsCit/0Em60BBjgISumcmADktwbVlEX2KJYkpkZwQf
 1qWWZYthja3hzEchxnVdjDgtk+SY0+Jb4dmH7Y9rlVZQvTwh+bqPrcs21s3i66zEKtbP
 UhsHpJkmPDTKmRmFvKmILiFKn+2GWoO3fTu6iZ+BR/ucgz2eY+1WbAXa00Azo9T00e7j
 fEHE7NTZuEr7XA09L98msvbtWHtbP3HNs9srJDUjBMZWpFRMa+9MrX+OO+I5ndEAHuar
 0Xsw==
X-Gm-Message-State: AOAM530WhoHkzI76XL4b3M5M9eB4tvu2eH2jOXIYpwdAmkU+yw7ukEuP
 E37OwveoJQJUWNjhxCXACQOX/w==
X-Google-Smtp-Source: ABdhPJxodCC4r10tdeEEZ++ru5B61RlYUeDhkHbCXsCZl5Ytxumdywew7iZczhxzr0149uigp2MlpQ==
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr3793418qto.135.1622819263846; 
 Fri, 04 Jun 2021 08:07:43 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
 by smtp.gmail.com with ESMTPSA id a191sm4165998qkg.61.2021.06.04.08.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:07:43 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:07:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0
 is disabled
Message-ID: <20210604150742.bssvnhm4gv72uw4h@nitro.local>
References: <20210601084830.260196-1-narmstrong@baylibre.com>
 <YLoHSJIOSRTyF0r1@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLoHSJIOSRTyF0r1@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_080747_880753_EEE39446 
X-CRM114-Status: GOOD (  11.60  )
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

T24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMTI6NTg6MTZQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBNZXRhIGNvbW1lbnQsIHlvdSBzaWduZWQgdGhpcywgYW5kIGl0IHdvcmtlZCEKCk5PSUNFLiBc
by8KCj4gTG9va2luZyB1cCBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwNjAxMDg0ODMw
LjI2MDE5Ni0xLW5hcm1zdHJvbmclNDBiYXlsaWJyZS5jb20KPiBHcmFiYmluZyB0aHJlYWQgZnJv
bSBsb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIxMDYwMTA4NDgzMC4yNjAxOTYtMS1u
YXJtc3Ryb25nJTQwYmF5bGlicmUuY29tL3QubWJveC5nego+IEFuYWx5emluZyAyIG1lc3NhZ2Vz
IGluIHRoZSB0aHJlYWQKPiBDaGVja2luZyBhdHRlc3RhdGlvbiBvbiBhbGwgbWVzc2FnZXMsIG1h
eSB0YWtlIGEgbW9tZW50Li4uCj4gLS0tCj4gICDinJMgW1BBVENIXSB1c2I6IGR3YzMtbWVzb24t
ZzEyYTogZml4IHVzYjIgUEhZIGdsdWUgaW5pdCB3aGVuIHBoeTAgaXMgZGlzYWJsZWQKPiAgICAg
KyBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4gKOKckyBES0lNL2xpc3RzLmluZnJhZGVhZC5vcmcpCj4gICAtLS0KPiAg
IOKckyBTaWduZWQ6IG9wZW5wZ3AvbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20KPiAgIOKclyBCQURT
SUc6IERLSU0vYmF5bGlicmUtY29tLjIwMTUwNjIzLmdhcHBzc210cC5jb20KPiAgIOKckyBTaWdu
ZWQ6IERLSU0vbGlzdHMuaW5mcmFkZWFkLm9yZyAoRnJvbTogbmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20pCj4gLS0tCj4gVG90YWwgcGF0Y2hlczogMQo+IC0tLQo+ICBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjEwNjAxMDg0ODMwLjI2MDE5Ni0xLW5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tCj4gIEJhc2U6IG5vdCBmb3VuZAo+IEFwcGx5aW5nOiB1c2I6IGR3YzMtbWVzb24tZzEyYTog
Zml4IHVzYjIgUEhZIGdsdWUgaW5pdCB3aGVuIHBoeTAgaXMgZGlzYWJsZWQKPiAKPiAKPiBPZGQg
dGhhdCBES0lNIGRpZG4ndCB3b3JrIGZvciBiYXlsaWJyZS1jb20sIGJ1dCBoZXksIEknbGwgdGFr
ZSBhIHJlYWwKPiBzaWduYXR1cmUgb3ZlciBES0lNIGFueWRheSEKClRoYXQgbG9va3VwIGhhcHBl
bmVkIHRvIGdyYWIgdGhlIHRocmVhZCBmcm9tIGxpbnV4LWFtbG9naWMsIHdoaWNoIGlzCm1haWxt
YW4yLW1hbmFnZWQgYW5kIGlzIGtub3duIHRvIGJyZWFrIERLSU0uIEknbGwgdHJ5IHRvIGZpeCBv
dXIgY29uZmlndXJhdGlvbgpzbyB0aGF0IGtub3duLURLSU0tZnJpZW5kbHkgc291cmNlcyBhcmUg
Z2l2ZW4gcHJpb3JpdHkuIFRoaXMgd2F5LCB3aGVuIGEgdGhyZWFkCmV4aXN0cyBvbiBtdWx0aXBs
ZSBsaXN0cywgeW91J2xsIGdldCB0aGUgb25lIG1vcmUgbGlrZWx5IHRvIHBhc3MgREtJTSBjaGVj
a3MuCgo+IHRoYW5rcyBmb3IgZG9pbmcgdGhpcy4KClllcywgdGhhbmtzISBIb3BlZnVsbHksIG1v
cmUgcGVvcGxlIHdpbGwgc3RhcnQgZG9pbmcgdGhpcy4KCi1LCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
