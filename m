Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FCAE77197
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jan 2025 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnN6zJst8ld2JTrs4lVKsmp9yseZYtSmKA/TEJ92c0k=; b=4YnHjpN6YOAx4e
	/E5os8KnmibeTF76QPZvA5FxXl/cu5sKCfz26XUzhUu4AxS8vhXmuMkGFdSjuDVSNmXjISpUteadJ
	2XpK6stIFkKT4IaCHafpGBfCK8GxzO1+ddQAC/ywYT11/qfZjwcQzSSz//H4IfFM/AOCQE9YR8s5S
	QIadbdi3GOm4LQIBTnyDdIeUVHgdvWX2C2lvh8mmh7xiaa++gP2E9Is4duDIK+D/WktKlcb+mUWG5
	bTHDBhcyiSx8VnjXutDEEYx4o5QpHxcIuRIfm49Tx9VfH0WatkjTDHBcXhnKTbIwSDquVCZGfm26U
	WrfZAjTt+AMglKmkGTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSt9-0000000H12Z-0w5l;
	Sun, 05 Jan 2025 15:50:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSt7-0000000H11o-25yE;
	Sun, 05 Jan 2025 15:50:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216401de828so180596075ad.3;
        Sun, 05 Jan 2025 07:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736092200; x=1736697000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YywA5lTEdJWoFMmlp4DfxD/jE6edYt47y3+JzLz1vMk=;
        b=Ab/rLD7lrEowNJEt/xSwSR3wZZRKNxUXbDI1YWIP6gHhjzFP9Yj9FnSZg387U5HgqM
         JYyts/ehe8CVCfPhftxn88+mNIQbpQrWSAZi6fNn/S9VBfEz6cuZk1usGJR0AvMryrGu
         YmqGcMTMS1RQG1fc0dvbGyphvVkLsQTUnkGYRcqHR8fJf4hUPF2Pvr3FJqZCJgoPg3cq
         tY8MSBaeNvcT0UlojAFRkWBBsbu0rRaCe+uZWbrlANL9qV2kBpnlUepl7ZsbmaS2MRWd
         pGM68Hh70S/H71EYeSHA8ZkJXIavNE5VHbKhVNIqMXcDym2dmIysk24gPBR6+HDYky4R
         +Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736092200; x=1736697000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YywA5lTEdJWoFMmlp4DfxD/jE6edYt47y3+JzLz1vMk=;
        b=tCWNsMdzY50hLESGnltSiIUjHYMx0fnWgzO1Q8mSOM9dZmveA2HCyqwULduEMdw6lr
         4aZhAWdLbcniO6Eh+JsbR2WaBChIKrEmDQVyhE8gMIUH66YYoWrYkJHmRT4j8cwFynGG
         rYJZf8DLLZf5S8xR+qz+CzCAXTfslLCxk5Rt1zUtjmVV+YIBguEoBvBiDNCxWZfbaD2U
         4axkx6Zn6xtKAR6R4MRwdWZYb7QOqppMN8dTT61ym3z2JF+Xo8f/klj2InaJ2W9I2Zn9
         b1ApNdMTa8Bqrk6v1qptPxPZzR2uISPp3UD/S4lv4h8LhqxqifNXrhI2QzUNLtyyg8/r
         BuuA==
X-Forwarded-Encrypted: i=1; AJvYcCV8sgeMStY5SQdJr+EXKdIY4fTswevwAspE/2HywddGnkn4QYZrMNyx12KLkTjFzgQJzPv23xnLJLvhp67tt35s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz26RwA9jEf7OxpFXiH7K7S4I6KtFkq4+Va4ANmrZ+OmHo2q6HG
	lKXA6i8GB2FFtYBUONWO4uAmZUei01MT9dnkVetpNfN93HmlzL6B3HzL/2F99IUVWdfMSurEe+w
	gBBR/RN9lNty7xb1TRpuPrczLQt0UBw==
X-Gm-Gg: ASbGncsg+MobNWgAN1uzmJphlnhcTuB2ovTlJf12QNkOY0IoTGDbnbkzyB6iWLaU5ST
	597hDJ6jte5N2713XpbbUg+2rYCYX7V2nAzbcpiuLUBTHhcOeDLRs
X-Google-Smtp-Source: AGHT+IHBq4Bpn7IMCuiOvWpCDfq6WSEWbk+kF8P/My012EE2LHfMCwEfjsvbXgI3Q5S8UqpawhTxxnoNTWpu5as8yyE=
X-Received: by 2002:a17:902:d4c4:b0:216:7cbf:951f with SMTP id
 d9443c01a7336-219e6ea195cmr764170955ad.21.1736092200275; Sun, 05 Jan 2025
 07:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-3-martin.blumenstingl@googlemail.com> <20250104135912.390ec87c@jic23-huawei>
In-Reply-To: <20250104135912.390ec87c@jic23-huawei>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jan 2025 16:49:49 +0100
Message-ID: <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
To: Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_075001_576237_90143877 
X-CRM114-Status: GOOD (  22.94  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de, robh@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, gnstark@salutedevices.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSm9uYXRoYW4sCgpPbiBTYXQsIEphbiA0LCAyMDI1IGF0IDI6NTnigK9QTSBKb25hdGhhbiBD
YW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMzEgRGVjIDIwMjQg
MjA6NDI6MDcgKzAxMDAKPiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+ID4gVGhlIFNBUkFEQyBJUCBvbiB0aGUgR1hMWCBT
b0MgaXRzZWxmIGlzIGlkZW50aWNhbCB0byB0aGUgb25lIGZvdW5kIG9uCj4gPiBHWEwgU29Dcy4g
SG93ZXZlciwgR1hMWCBTb0NzIHJlcXVpcmUgcG9raW5nIHRoZSBmaXJzdCB0aHJlZSBiaXRzIGlu
IHRoZQo+ID4gTUVTT05fU0FSX0FEQ19SRUcxMiByZWdpc3RlciB0byBnZXQgdGhlIHRocmVlIE1Q
TEwgY2xvY2tzICh1c2VkIGFzIGNsb2NrCj4gPiBnZW5lcmF0b3JzIGZvciB0aGUgYXVkaW8gZnJl
cXVlbmNpZXMpIHRvIHdvcmsuCj4gPgo+ID4gVGhlIHJlYXNvbiB3aHkgdGhlcmUgYXJlIE1QTEwg
Y2xvY2sgYml0cyBpbiB0aGUgQURDIHJlZ2lzdGVyIHNwYWNlIGlzCj4gPiBlbnRpcmVseSB1bmtu
b3duIGFuZCBpdCBzZWVtcyB0aGF0IG5vYm9keSBpcyBhYmxlIHRvIGNvbW1lbnQgb24gdGhpcy4K
PiA+IFNvIGNsZWFybHkgbWFyayB0aGlzIGFzIGEgd29ya2Fyb3VuZCBhbmQgYWRkIGEgd2Fybmlu
ZyBzbyB1c2VycyBhcmUKPiA+IG5vdGlmaWVkIHRoYXQgdGhpcyB3b3JrYXJvdW5kIGNhbiBjaGFu
Z2UgKG9uY2Ugd2Uga25vdyB3aGF0IHRoZXNlIGJpdHMKPiA+IGFjdHVhbGx5IGRvKS4KPgo+IFNv
IElJVUMgdGhpcyBpcyB0byBtYWtlIHNvbWUgbm9uIEFEQyBjb21wb25lbnQgd29yay4KVGhhdCdz
IGNvcnJlY3QKCj4gSG93IGFyZSB5b3UgaGFuZGxpbmcgZGVwZW5kZW5jaWVzPyAgVGhlIEFEQyBk
cml2ZXIgbWlnaHQgbm90IGJlIGxvYWRlZCBvcgo+IGlzIHRoZXJlIHNvbWUgcmVhc29uIGl0IGRl
ZmluaXRlbHkgaXMgYXQgdGhlIHBvaW50IHdoZXJlIHRoZSBhdWRpbyBkcml2ZXIKPiBsb2Fkcz8K
VW5mb3J0dW5hdGVseSB0aGVyZSBhcmUgbm8gZGVwZW5kZW5jaWVzIGF0IHRoZSBtb21lbnQuClRv
IG1lIGl0J3Mgbm90IGV2ZW4gMTAwJSBjbGVhciBpZiB0aG9zZSBiaXRzIGFyZSBhIGRlcGVuZGVu
Y3kgZm9yIHRoZQphdWRpbyBJUCBvciBpZiB0aGV5IGFyZSBpbnN0ZWFkIGxpbmtlZCB3aXRoIHRo
ZSBjbG9jayBjb250cm9sbGVyIChtb3JlCmJhY2tncm91bmQgaW5mbzogc29tZSBvZiB0aGUgTVBM
TCBjbG9ja3MgYXJlIC0gYXQgbGVhc3QgaW4gdGhlb3J5LCBpbgpwcmFjdGljZSB3ZSBkb24ndCB1
c2UgdGhhdCAtIGFyZSBhbHNvIHVzZWQgYXMgaW5wdXQgZm9yIHRoZSBNYWxpIEdQVQphbmQgdmlk
ZW8gc3Vic3lzdGVtLiBUaGUgb25seSBwcmFjdGljYWwgdXNhZ2UgdGhhdCBJJ20gYXdhcmUgb2Yg
aXMgdGhlCmF1ZGlvIGNvbnRyb2xsZXIpLgoKQ2hyaXN0aWFuIGFuZCBJIGhhdmUgYm90aCB0cmll
ZCB3aXRoIGFsbCBvZiBvdXIgY29udGFjdHMgYXQgQW1sb2dpYwpidXQgZGlkIG5vdCBnZXQgYW55
IGFuc3dlcnMuCklmIEkga25ldyB0aGUgcHVycG9zZSBvZiB0aGVzZSBiaXRzIEknZCBtb2RlbCB0
aGVtIGFzIHdoYXRldmVyIHRoZXkKYXJlIChyZXNldHMsIGNsb2NrIGdhdGVzLCAuLi4pIGFuZCBw
cm92aWRlIHByb3BlciBkdC1iaW5kaW5ncy4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
