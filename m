Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D037FCA6002
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRnSn4IONiseBiLYlxIWgkd8VgeNHbydGq6f7oJvgyM=; b=lZ7GxBnuRtuwfK
	vwe4tf4V1UZQqpXAKSOW1UdRlKwFtbrdv8ScPyq6vWI3HzcF0ou2mT8GmPmNZIrjRjNuP1+3hga9T
	NTlHqkM6oYoSyEcVH2XzVmkDi/cl6XMoRka3sJTqpckTq46ebD3/5eo+LZNa5Ehwh83EHXzUOAOQC
	3HV9sqF7HfHCedrB8YN7/JrwoOW4YTGj/m6+U9CKCFSyNny+4P3G15opNwvjAjZccGflFil4HLT+7
	bB188nAtNmRBsozBDeW+cDO16oy0CDi91lzmAzxl2hpH0H1E9c66Qh84i8OgBo2KjJdo96dFzIK+j
	2f/u2cPmh+CbHyg/OrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbfk-00000003JJT-0f2K;
	Thu, 08 Oct 2026 00:07:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbfh-00000003JIU-1CE3
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 00:07:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso3717208f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791418059; x=1792022859; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=HdkiTn240CkDnLB/3DQrr0XTXY3GzXB6Ard4umLEOwv2OJkSA6q8t1SRzQCzu8OfWe
         43D/PMpHJ1mdXxTrcu2y1WiISWdCX99YVIuLTwoQ8fM3jfQPpALizCm6Q2rRnKW0Hkio
         Zbu9aFk+RQYSFOSYyZRomOIiWNk+xexmobHmNs2bRtUYFtCuFOtfWCzeTdH9FfETCZWr
         G/oByvjg4OGWcNnNVHHUfDGpKwkDY4wU5v7beeaTh7xu2oJFW7WkJW50ScCGpargur/Z
         G8horgdUqostwA0u/FHOEyt4XVAh2QT4wdKa+ArKDZcog2deL4TAmcFVU2Q9gP8HQLMM
         dQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418059; x=1792022859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=bINL1qdkCKsPL7GtTLY9ygjLuWfY71jilAz+LwCdtpyGiWbHH+ODHElSjuxnMnzZmr
         O0x9NnJK4/znKEK90eiQxfvZ5j6/Je26TdysZz2OyEe6/LogYMzyDs64sZDLD0dM8x79
         R5YfcAsqFQGlSXuvQhxejnfvXFKTQkVwpGGSLHx5x/fFgQFOX2kkHUJi7NxLLJ6Hw6AN
         aAbR5xFPafF34OfTHbhEgK6MFmBuINtf9weV+DSqlgw0oHWZZBFVEOCqpMjsF04ylHkv
         T8pN6MFPQAiNFvyoXU0G5ThxKGcU0nw9dA6tkmvqoj944dHK/Hxp8JfW1wWCcDvXmpGn
         lR5w==
X-Forwarded-Encrypted: i=1; AKwUvBzcX8lmczkHSFE63bUZdIeAhubVzZE7/X3CKZENKVng0wnrplL56Cl+k5v8MfYv0VmOOQzlNQqzSLG8u6UQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJVWMTbatxclAWm3lBn/Cf3CtkNgKZesGYejgRex1ZiMYTLyoAH
	+EEcyZE86CAdMR1x06xazZ/wOQgPR/pKes5dqTJIAeO1tEXtWjyBUZND
X-Gm-Gg: AYBFou0Rd8/2VV8vdmoTx67E3QePP9NTKiGxDdS48gnDr53HLlzKPLyJq9J7jWSV4OT
	EFRPek6kd04ACiTsbg4JVTSBic33InQqeespOBXKX6tTZftsAZNfjsAGMnnTC4pmNLGU0UNJSgN
	q9oQrBMt5OdGA1AgIfhUb+kCwm1nVBLELyRQwX2BscHvDEYVk9qO+gWM7abcDRCgDLnFx1AB30I
	noWTArZVW2eRMd5bk4/L7s31BC3N1HWkNL3gPhP5d2vR2XYeHI9zXvn19gIzA+3qmPUNef+AhTl
	QV9h6HRkXHVgmOQTeHWtTtSuNZx3FXUibfDxmaR3N5lrlQQr+nDOJuoK+/WG1tuR7wC4201ARu3
	VByTfv90oo9yn+1+iH1mcfW125JP8lyxF2dE728iSUEjdniBQZw6BqdTKxF36PHbYxyIg+GHJJH
	XpSL2IY2cr/NEXRPME8ISjUE/wcUCm31svwAK/LErIQMouPJxnHMyrxywHzWoLzHPLTGtkoj3EY
	O4pMLN+3TSr/Ql5G44u3ajOD7dA
X-Received: by 2002:a05:6000:4818:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48c72788373mr6736354f8f.16.1791418058790;
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7fb9eda1sm1040996f8f.7.2026.10.07.17.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <179140715034.293470.4459182430175564610@iav.lv>
Date: Thu, 8 Oct 2026 04:07:23 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
 <179100548183.3372253.2014593916926884551@iav.lv>
 <179140715034.293470.4459182430175564610@iav.lv>
To: Igor Velkov <iav@iav.lv>
X-Mailer: Apple Mail (2.3864.700.51.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_170741_343386_032D1875 
X-CRM114-Status: GOOD (  16.71  )
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

PiBPbiA4IE9jdCAyMDI2LCBhdCAxOjA14oCvYW0sIElnb3IgVmVsa292IDxpYXZAaWF2Lmx2PiB3
cm90ZToKPiAKPiBGb2xsb3ctdXAgdG8gdGhlIGRyb3BwZWQgcGF0Y2guCj4gCj4gQW4gb3V0LW9m
LXRyZWUgcmVzdGFydCBoYW5kbGVyIFsxXSBwb3dlci1jeWNsZXMgdGhlIGNhcmQ6IGl0IGRyaXZl
cwo+IFRGTEFTSF9WREQgYW5kIGJvdGggdGZfaW8gbGluZXMgbG93IGZvciAxMDAgbXMsIHRoZW4g
cmVsZWFzZXMgdGhlbSBhbmQKPiB0aGUgY2FyZCBpcyBwb3dlcmVkIGFnYWluLiBXaXRoIHRoZSBT
UEkgZmxhc2ggZXJhc2VkLCBPRFJPSUQtSEM0IGJvb3RzCj4gZnJvbSBTRCBhZnRlciBhIHdhcm0g
cmVib290IDUvNSBvbiA2LjE4LCA3LjIgYW5kIDcuMy1yYzUuIFdpdGhvdXQgdGhlCj4gaGFuZGxl
ciB0aGUgYm9vdCBzdGFsbHMgaW4gdGhlIFJPTSBvciBpbiBVLUJvb3QuCj4gCj4gV2hlcmUgc2hv
dWxkIHRoaXMgbGl2ZSB1cHN0cmVhbTogdGhlIG1tYyBjb3JlIG9uIHJlc3RhcnQsIG1lc29uLWd4
LW1tYywKPiBvciBhIGJvYXJkIGRyaXZlciBsaWtlIHRoaXMgb25lPwo+IAo+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vYXJtYmlhbi9idWlsZC9ibG9iL21haW4vcGF0Y2gva2VybmVsL2FyY2hpdmUv
bWVzb242NC03LjMvbWVzb242NC1yZWJvb3QtMDItcG9ydC10by1ncGlvZC5wYXRjaAoKSeKAmXZl
IGJlZW4gZG9pbmcgc29tZSBicmluZy11cCB3b3JrIG9uIFM0IHN1cHBvcnQgd2l0aCBhIFZJTTFT
IGJvYXJkCmFuZCBDbGF1ZGUgaW5pdGlhbGx5IHN1Z2dlc3RlZCBhIHUtYm9vdCB2YXJpYW50IG9m
IHRoZSBzYW1lIHBhdGNoIFsxXQp3aGljaCBpbXByb3ZlZCBidXQgZGlkIG5vdCBmdWxseSByZXNv
bHZlIHRoZSBzaXR1YXRpb24uIEkgd2FzIGFsc28gbm90CmFibGUgdG8gZXhwbGFpbiB3aHkgYXBw
bHlpbmcgdGhlIHNhbWUgY2hhbmdlIHZpYSB0aGUgTGludXggZGV2aWNlLXRyZWUKdGhhdCB1LWJv
b3QgY29uc3VtZXMgZGlkbuKAmXQgaGF2ZSB0aGUgc2FtZSBlZmZlY3QgYXMgZXNzZW50aWFsbHkg
dGhlCnNhbWUgY2hhbmdlIGluIHRoZSB1LWJvb3QgZHRzaSBmaWxlLgoKQ2xhdWRlIHN1YnNlcXVl
bnRseSBhZGRlZCBhIHNlY29uZCBwYXRjaCBbMl0gd2hpY2ggcmVzdWx0ZWQgaW4gMTAwJQpyZWxp
YWJsZSBib290LiBIb3dldmVyIHRoYXQgYWxsb3dlZCBtZSB0byBtb3ZlIGZvcndhcmRzIHdpdGgg
a2VybmVsCndvcmsgYW5kIEkgaGF2ZW7igJl0IHlldCBjaXJjbGVkIGJhY2sgdG8gdS1ib290IHRv
IHJ1biBhbiBleHBlcmltZW50CndpdGhvdXQgdGhlIGZpcnN0IHBhdGNoLgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9jaGV3aXR0L3UtYm9vdC9jb21taXQvMGEzZjU2OTNhNGZmMTkyZWIwNDRmYzRj
NWE0MzQ3NzBkZTA1MzgzNQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvdS1ib290L2Nv
bW1pdC84ZTY2MzYzMmJjNTAwZWU2YTgzYTg0NmJjZDMyNDIyMzFjMzNhYTQzCgpBcyB1c3VhbCBi
b3RoIG9mIENsYXVkZeKAmXMgYXV0aG9yaXRhdGl2ZWx5IHdvcmRlZCBkZXNjcmlwdGlvbnMgc291
bmQKY29udmluY2luZ2x5IG9yIGNvbnZlbmllbnRseSBnb29kIDopCgpDaHJpc3RpYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
