Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46221C83F25
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRYRlWZBaWY5VNSN/4LyJzWrc0v5FmLav6PCWb1A9oU=; b=O61xAV3frItTUM
	tckPygMxiFnro2VaIeESeFo1NAKqfjGBOHzqOin701JJ3UJSA1Tktk3rMGKyGuuG3YKHTVsE//EUL
	90pH2qinmY7S6ZoNReKJXIJVEzkYQAK/z5SIp/DxOONL5i2Apf3cA53KNC2z3vGgPNoij5G8XBXtq
	YD6nq3hbDb1MdTjeW75j8Xu0eNfjSlXWWHKl9aHvQv7k4Cwxl1YSFbkMTgzHBSofZwv53bOI8oiNC
	nbJWJ8G4yt17cG6ry7qoqPbPZ32OUmxBFmPPV5jbOWhuUW/NCDKYP9o5QeYpAmMEaqqEA84MaiY/S
	+Bqnkuz5lgOa9Y+8gfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb3-00000000BsD-1wxC;
	Mon, 21 Jul 2025 16:42:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrCr-0000000HT2w-2Xcc
	for linux-amlogic@bombadil.infradead.org;
	Mon, 21 Jul 2025 14:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=; b=m1DVvsPC0THI1WeaOuAPkRVDT3
	j788EnQgd2cJJudayNR54k8L9bRiQHZxWOT+23klwOp/7jfauA/EPiTBJE7eiGx2yCgW3y4y3qCYV
	tSVRgHnJdQK9lEfIf3sObe1dnql9hF/ZgHASf7/mQI69e3MCAz6ruF106Tah0aOF1ldLWyPuoFDCX
	on4mpz28G3biuuurlaRDyE/tjYD5Yqne+0Wx3DtfIJaSWwqGS7LJBn78BtwsjOKPw+WRDeykGQlUX
	xtDNBPqPnrxtf6aebcwRgWpJlSFPOuDGocugvnBdMIx5PsAkYKVnCqVPbzxX0wUKq55yrv2lCa9CG
	Dr7olkzQ==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrCo-0000000B3mI-0geZ
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Jul 2025 14:09:28 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-73e7804cf31so805552a34.2
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Jul 2025 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753106964; x=1753711764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=;
        b=fUtac6v6OPZKO7xu1UTTftCGuYZs/cbFJY5xh3n1We7wQVQgefjP3LyOmHaWXZRX4V
         J9UYsLSuHCPRDwMBP8YvRmf/IhEeaIC2PHBHhUewIh9T0hsAHMluPAbrhzVSOV1jyzWM
         1OzNtJ5PixHeNVN73lT8EXbQd8yNFRbqmiRam3tXxJa8pf91ZmQN3Ca1eFVQ/4TJJVwP
         Zeilv3Gam05+8+h2oCc9KhdxibCaM77LscUMszS0XMONtD6obV6RDRSyjSgWsdTQJlE+
         9WOg09c4nFJ/H4RyAvCwZOB5/x/yUCsmc03vEyG7aJAKOxKUhR7UCkC6hQr6zK40RnIg
         KqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106964; x=1753711764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=;
        b=Cj4KUlvlU46Obk22gxJ8Su7tsnIeQPLd8DRbKbVv9VUcX05ZoDoqaiuuMRzdIwaqU3
         3EGWHK2uO62C+HFTlyMOOchg8GzBEP5sQDi2Y1kb1WNz1TQU8DZHvhF8QJ4fTkJGbYn9
         gQXphkzLW0e7p+02Ih1oH8HLrBFHyTVwrgblOizRWQoCueX0pxjB8Veb0ASQa4HJcrgE
         H00j5LPmMyzR1nOJYaTn6RFEUZJkYIptrtREWKjEEnKJptp8sLW6KPDJp1vWgiCZZ6au
         yTOsfLbxKqx+It0keNoJaFR+X0faO6AOhu9atZWLSsDwdmQQvkysWjjAbmJnn3uhMm9y
         f/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvt/kcXFtx0ohsBpSRtMesUx8ATjRav6gPRIEG6gx/ZJVlS4E+eK+1yBblSK0VrMvec6L+zA+z+biJgTHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5izhXIyG8x4yhrpk/46tcznZABtUmMerdHDNC+eyha/5qjTJf
	tXQ4tOZP++0DBR4GarfSWuJvXQ1YPKT3KPBDeaB1drRhnMRQ2/TXF3lkKPDLB/NK5EA=
X-Gm-Gg: ASbGncuR9zJhTJSlRY2oeAeks5VurZMmX2hR9usur7VvXZno6713Jyf4r6QigcUvSCg
	w0R4qbQAbmLvZ6BlYpDu09rR4CpPUE4qcyEb/MFkiZPv5hgNvFGev2sW9u6elI4mKPxmwn01ozw
	Mw/kLfoTSgImCICSPYiec2bJ2qAe70282NwSvlzrLIbXypXOR8vawZJraJnX34+EmMdr0c3o7IG
	LHHmTNGkxKnl1Hh+cRikzjfZw1MUbwIMVzzzCJlDyw6fKJm0IwlVs6hdepusk753aEg3CiNnDJS
	DmPCQzAc+HUhmnrjDyOLi5wcW3SJMjxBW+g2wFodgIBj4rPnCkVexLGOdCTADNOBFFDQxIOIagg
	MLqzVEy7GS+L3sFZmfP6S4HLLq0gNHk/CQQg8NRxkWlL4Nhbe4x5ytFD/39hj2i74/HIUaEOGLc
	g=
X-Google-Smtp-Source: AGHT+IEYJ69qw8hWrbyhfCDdoYCGwahdtxo+pfFxwMph5mSmiJShT9DMVnokAtIY6hWFVoiT1iMVrw==
X-Received: by 2002:a05:6830:3e8b:b0:735:af51:5ea5 with SMTP id 46e09a7af769-73e665b9181mr11113510a34.22.1753106963677;
        Mon, 21 Jul 2025 07:09:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3bea:f296:60f2:c6cb? ([2600:8803:e7e4:1d00:3bea:f296:60f2:c6cb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83bf667fsm2820418a34.65.2025.07.21.07.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:09:23 -0700 (PDT)
Message-ID: <35eba285-2c49-49ac-9da2-29636e257196@baylibre.com>
Date: Mon, 21 Jul 2025 09:09:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
 <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
 <84ad0f66-311e-4560-870d-851852c6f902@baylibre.com>
 <9574826f-3023-4fe1-9346-eacd70990d73@kernel.org>
 <CADU64hDZeyaCpHXBmSG1rtHjpxmjejT7asK9oGBUMF55eYeh4w@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CADU64hDZeyaCpHXBmSG1rtHjpxmjejT7asK9oGBUMF55eYeh4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_150926_579024_0B22C679 
X-CRM114-Status: GOOD (  16.25  )
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

T24gNy8yMS8yNSA1OjE1IEFNLCBTYW5qYXkgU3V0aGFyIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDIx
LCAyMDI1IGF0IDEyOjIy4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
IDxtYWlsdG86a3J6a0BrZXJuZWwub3JnPj4gd3JvdGU6Cj4+Cj4+IE9uIDIwLzA3LzIwMjUgMjE6
MzAsIERhdmlkIExlY2huZXIgd3JvdGU6Cj4+ID4+IMKgIMKgLSBSaWNhcmRvIFJpYmFsZGEgRGVs
Z2FkbyA8cmljYXJkb0ByaWJhbGRhLmNvbSA8bWFpbHRvOnJpY2FyZG9AcmliYWxkYS5jb20+Pgo+
PiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9h
bWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+PiA+PiBpbmRleCAwY2Q3OGQ3MTc2OGMu
LjVjOTE3MTZkMWYyMSAxMDA2NDQKPj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwKPj4gPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwK
Pj4gPj4gQEAgLTE0OSw3ICsxNDksNyBAQCBwcm9wZXJ0aWVzOgo+PiA+PiDCoCDCoCDCoCDCoC0g
ZGVzY3JpcHRpb246Cj4+ID4+IMKgIMKgIMKgIMKgIMKgIMKgVGhlIGZpcnN0IHJlZ2lzdGVyIHJh
bmdlIHNob3VsZCBiZSB0aGUgb25lIG9mIHRoZSBEV01BQyBjb250cm9sbGVyCj4+ID4+IMKgIMKg
IMKgIMKgLSBkZXNjcmlwdGlvbjoKPj4gPj4gLSDCoCDCoCDCoCDCoCDCoFRoZSBzZWNvbmQgcmFu
Z2UgaXMgaXMgZm9yIHRoZSBBbWxvZ2ljIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24KPj4gPj4gKyDC
oCDCoCDCoCDCoCDCoFRoZSBzZWNvbmQgcmFuZ2UgaXMgZm9yIHRoZSBBbWxvZ2ljIHNwZWNpZmlj
IGNvbmZpZ3VyYXRpb24KPj4gPj4gwqAgwqAgwqAgwqAgwqAgwqAoZm9yIGV4YW1wbGUgdGhlIFBS
R19FVEhFUk5FVCByZWdpc3RlciByYW5nZSBvbiBNZXNvbjhiIGFuZCBuZXdlcikKPj4gPj4KPj4g
Pj4gwqAgwqBpbnRlcnJ1cHRzOgo+PiA+Cj4+ID4gSSB3b3VsZCBiZSB0ZW1wdGVkIHRvIHNwbGl0
IHRoaXMgaW50byB0d28gcGF0Y2hlcy4gSXQncyBhIGJpdCBvZGQgdG8gaGF2ZQo+Pgo+Pgo+PiBO
bywgaXQncyBhIGNodXJuIHRvIHNwbGl0IHRoaXMgaW50byBtb3JlIHRoYW4gb25lIHBhdGNoLgo+
Pgo+IAo+IFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBTaW5jZSB0aGVyZSBhcmUgc3VnZ2VzdGlvbnMg
b24gcGF0Y2ggc3BsaXQgYXMgaXQgaXMgdG91Y2hpbmcgZGlmZmVyZW50IHN1YnN5c3RlbXMsIHN0
aWxsIG5vdCBjbGVhciBpZiBJIHNob3VsZCBzcGxpdCB0aGUgcGF0Y2ggb3Igc2luZ2xlIHBhdGNo
IGlzIGZpbmUuIEkgd291bGQgYXBwcmVjaWF0ZSBpZiB5b3UgY2FuIGd1aWRlIG9uIHRoZSBuZXh0
IHN0ZXBzIHRvIGJlIHRha2VuCj4gCj4gQmVzdCBSZWdhcmRzLAo+IFNhbmpheSBTdXRoYXIKCkty
enlzenRvZiBpcyBvbmUgb2YgdGhlIGRldmljZXRyZWUgbWFpbnRhaW5lcnMgYW5kIEkgYW0gbm90
LCBzbyB5b3UKc2hvdWxkIGRvIHdoYXQgS3J6eXN6dG9mIHNheXMgLSBsZWF2ZSBpdCBhcyBvbmUg
cGF0Y2guIDotKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
