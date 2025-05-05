Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E0C3ABAA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeFFhwH/C26zaAkR2+ztz6iOcdXlFxIMy3AKLbAd3yc=; b=bkBKqcrkV8R2eE
	al+B/uYXog5M15QYblOAl3zA11kybB9G7kjuhZigt596P180Cwu5OLjOb13T+2551dcLL784YPl/9
	ZSYwnak6mvX4qTSELygk9+5YeyYfJCGAFuYtAAaTt+4rPnAVrT9JAFxgthKifcQLosA5aVJ7vkgQT
	odfBvIGvuA4j09DCL/dpcYA8dGiVptjuWS/MOeKLaugOwdPhNuZbeQkFhSp+GBHdiCt1ob3quu9/o
	M/5sPSgmxWukUQCmmSqvPoElRHHxMvGVPZov/yV/Nsq68gUGBk3BnOAJmcC/OWYUJYEM9qiSSNXfz
	18bFNi1GQ7gU8YPlEHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvke-00000007RvV-3sXm;
	Mon, 05 May 2025 13:20:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvAA-00000007NRM-0Vli;
	Mon, 05 May 2025 12:43:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227c7e57da2so38285145ad.0;
        Mon, 05 May 2025 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746448993; x=1747053793; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
        b=lw+vf9yCgcFIEf33ia8RNdRtqSCpjgeZ9erAIz2Ow9/k5LMZIL2DxYU4BCzsgY5Pm/
         AnWF+i1eRj6CGzPPYzTOr9tm0d8S0xIEQzQcY+0VCso3I+ijaLHDayQRm1CWpEMI5KFW
         JmLwQC7xNNwWhuuHboqdpETxXhb+EVrfAV8GxXHEsFYyOGyHoRPeyCyY/oMtOa2s7etm
         pAnEkyKVFfaAZCT40katRGQpE0gvr9SgpRpKjr2vCeZWmvhB67YdD1am5Adhv2FoPjXq
         4GS8SFdjAUJl3i/pzDoL5izmLltsR7kU3ekD7En/ZH7iLJc8X8tcJbXNQXH3oSwJ/4u8
         5T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448993; x=1747053793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itsdfpxgqr9T28YDfLuBCV4kCGXrZvdi4BFAEN1n0j4=;
        b=S1ixCrRT169yiO2ghAV3sDnCUWn5M3HxdOGnx61l5LwFq8BE0TGwD008x6311t6lPO
         GSvnwHIBOoB6RsS3aNmssAummV7RptaSxNDrF3LPPTs3yoBKEqHgjLI58GtT12oc67qf
         /b6jSzoOHHc9lWLrxcgvOlAyE2LLe7pbTlMBBKdTs7kF8b8ZlJM290cQHLZGPeK5j2CT
         41Fsl/l4QfzAgGErxH7Ju4UAogD/bg2PAtBI5WwMqAP81hWSt5Y12ZYmUow0j21Da7Q9
         T6wC9btBCXsEXcyv/hxFlAno78Uj2SFWhyWy9i+Dc641HJTOV5o+q6N88+BqL1FPYi/q
         FWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXkD4I7FoHaDipu1k/sXc4xyJ/f/6iMn9mjs+sIjYfFsX24MZdvDUXYp+IFXMCcSZren5mkOBiTmq69ghK@lists.infradead.org, AJvYcCXBrf2wdo50Ceoa2xCkd7d7amKoPSng2YRybOk5++J6tNnS2411qjORe6uHoOrT1Dj0y4ENseFJtwTtR4uUl6r3oA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY59SI/wA8wRa8wK6sils6Y8AyO30VWnPykMYcQ1oizEmyXuih
	/Ie+b4elzuVx8XxSWrqKAyJ7PiawW//foeHjYbW3Ml5bs0iE5Z+o
X-Gm-Gg: ASbGnctV+UCPctBdSm3t0cVbss808diSI9g7TSObKR/h35bpqpYazfwSY3O+g/ovphh
	U/HYrrwTbmr3SyQP48syCCnnKuP6EyQKPeYEkH3XrVs941I4MHhuUCaJ6LSvCEtNl7Jh9MKkwA2
	9WhYPgEU05E67wB4BOgFbPL1opfMAwBSdtnjzulA5z5iiljSj+ZDI7XuUx5P66DTQSuCO8R7UzO
	4vZlg4KQE+KnNJTT9UxDlwjOPFCubITxbAxYsGlzy4elCIJ3R+UGK4hrANF1zKzJwzZ8JgqgLSC
	I6oEnSuQJUAsKEyHryc/N1HCdm1mKI0neihKWMIpd8Rw9ZFBqQfNAy018JVDL8ypzk8=
X-Google-Smtp-Source: AGHT+IG2KkrrZuW4JZYAu2SgF1mIQ5x6uKuF20k8DiGK8/U7q4/P+FzZt88l6w+tkDWWksMwAnmVlg==
X-Received: by 2002:a17:903:2f07:b0:21f:45d:21fb with SMTP id d9443c01a7336-22e1e8c1dcemr101041235ad.3.1746448992997;
        Mon, 05 May 2025 05:43:12 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bd19:74c5:b39c:cda])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e194aa391sm41645485ad.154.2025.05.05.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:43:12 -0700 (PDT)
Date: Mon, 5 May 2025 20:43:06 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Message-ID: <aBiyWnKKGMpMYnJ1@vaxr-BM6660-BM6360>
References: <20250429190724.330883-1-richard120310@gmail.com>
 <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
 <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_054314_171154_B7282D52 
X-CRM114-Status: GOOD (  18.97  )
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

T24gU3VuLCBNYXkgMDQsIDIwMjUgYXQgMTE6MDY6MDZQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBUdWUsIEFwciAyOSwgMjAyNSBhdCAxMTowMOKAr1BNIENocmlzdG9w
aGUgSkFJTExFVAo+IDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4gPgo+
ID4gTGUgMjkvMDQvMjAyNSDDoCAyMTowNywgSSBIc2luIENoZW5nIGEgw6ljcml0IDoKPiA+ID4g
Q292ZXJpdHkgc2NhbiByZXBvcnRlZCB0aGUgdXNhZ2Ugb2YgIm1vZGUtPmNsb2NrICogMTAwMCIg
bWF5IGxlYWQgdG8KPiA+ID4gaW50ZWdlciBvdmVyZmxvdy4gQ2FzdCB0aGUgdHlwZSBvZiAibW9k
ZS0+Y2xvY2siIHRvICJ1bnNpZ25lZCBsb25nIGxvbmciCj4gPiA+IHdoZW4gdXRpbGl6aW5nIGl0
IHRvIGF2b2lkIHBvdGVudGlhbCBpbnRlZ2VyIG92ZXJmbG93IGlzc3VlLgo+ID4gPgo+ID4gPiBM
aW5rOiBodHRwczovL3NjYW41LnNjYW4uY292ZXJpdHkuY29tLyMvcHJvamVjdC12aWV3LzEwMDc0
LzEwMDYzP3NlbGVjdGVkSXNzdWU9MTY0Njc1OQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJIEhzaW4g
Q2hlbmcgPHJpY2hhcmQxMjAzMTBAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gICBkcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMgfCA0ICsrLS0KPiA+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4gPiA+IGluZGV4IDc3
NTJkOGFjODVmMC4uZmUzZDNmZjdjNDMyIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4gPiA+IEBAIC03NSw3ICs3NSw3IEBAIHN0YXRp
YyB2b2lkIG1lc29uX2VuY29kZXJfaGRtaV9zZXRfdmNsayhzdHJ1Y3QgbWVzb25fZW5jb2Rlcl9o
ZG1pICplbmNvZGVyX2hkbWksCj4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyB2ZW5jX2Zy
ZXE7Cj4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBoZG1pX2ZyZXE7Cj4gPiA+Cj4gPiA+
IC0gICAgIHZjbGtfZnJlcSA9IG1vZGUtPmNsb2NrICogMTAwMDsKPiA+ID4gKyAgICAgdmNsa19m
cmVxID0gKHVuc2lnbmVkIGxvbmcgbG9uZykgbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4KPiA+IEhp
LAo+ID4KPiA+IG1heWJlLCB1c2luZyAxMDAwVUxMIGluc3RlYWQgd291bGQgZG8gdGhlIHNhbWUs
IGJ1dCB3b3VsZCBiZSBsZXNzIHZlcmJvc2U/Cj4gQWdyZWVkLCB0aGF0IHdvdWxkIG1ha2UgdGhl
IGNvZGUgbW9yZSBzaW1pbGFyIHRvIGRybV9oZG1pX2NvbXB1dGVfbW9kZV9jbG9jaygpLgo+IFRo
ZSBnb2FsIGlzIHRvIHN3aXRjaCB0byBkcm1faGRtaV9jb21wdXRlX21vZGVfY2xvY2soKSBtaWQt
dGVybSBhbnl3YXlzLgoKSGksCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBzdWdnZXN0aW9u
cyAhCkknbGwgbWFrZSB0aGUgY29ycmVzcG9uZGluZyBjaGFuZ2VzIGFuZCBzZW5kIHYyLgoKQmVz
dCByZWdhcmRzLApJIEhzaW4gQ2hlbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
