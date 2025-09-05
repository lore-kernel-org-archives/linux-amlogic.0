Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803ADCAC581
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d3oCsVXjQwUrJQkzZ7zFvk9IF0N9SfVvZhB24/hn40=; b=4v4hUKFVKx692J
	juEIV2zm7QN3BGK1aEDTJomtH1uUxEvbuFALi5jni9qC2oIVRTr9RD+jkLPzpBa0/RZfr/HCMBGQc
	N3paVTlzYhZBEbyA7KrcZGsj4NwR2aNsFgj95QhHVRigLjc5i19DjmGqXY7m2+cZ0nmn7xDUXmvwE
	nUi8Zrsiyfg7FX/wPrPuQgNWy/16fT7NLS69i3GynjvBOIb9Y3eaU9dkRObafdQpMyUcwcWgmFaP1
	bw4w3PIWXSWGkkr9F0ywJGllLHHQ0OPubfOI8aOBc9ph4LTGflG3aZmkeZfZpilDS4Etp7ZoQ20ch
	OO4GDcqQTGwDIB6+XBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbb-0000000Gai9-0lqS;
	Fri, 05 Sep 2025 03:59:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNUF-0000000GYNA-1Wxc;
	Fri, 05 Sep 2025 03:51:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afec5651966so340610166b.2;
        Thu, 04 Sep 2025 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757044301; x=1757649101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTMZ51CLrVMw82swKEmpSkZ08JOWyuDnIwmJ5JE3KQw=;
        b=FRhfdQkNwQJVoBE8MGoDrdoXfUL+ZeZoT4X1TthoCtmHgibTiPEsK0em9bBHTvXAUL
         8C1JLrF7v8sbS14Jqda0j/kHhiXAGuBhwh71vFOd75EJEe4Q6JwN4zG7tWoeZA7T/mQI
         eC1RGQn9jknxGnYKnxLlgMhjNd9Pd0RUuGsi106vX1xtWvn9Dn+9USFastbrMX1dKgSI
         XVW/0St0tIWhEZijyXLc5WWg1YtECEa0MpR3Shs3/cdBhPQXAy5WgKgn0dgFTPxqeajt
         x+3eUbZNOjGkY74gSErD9BGJoLX98se/zzXNmFfEGqkxT07fLk2x0oVzt6eG+hol4ZNk
         Atrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757044301; x=1757649101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTMZ51CLrVMw82swKEmpSkZ08JOWyuDnIwmJ5JE3KQw=;
        b=i0RIFzDvuzd46oCflPl1yHWjv07ElNefmrfXIZ1SacWvWD4d4reISCWBJY8j+b/b1X
         M4gIQAZcfRoTCprDyuZqSUI4AbZJiJrA5UjO4ajUD/zxbPAH4b/Vw1e271isPsHPZvGt
         HCDhe5p5OFVI/yTodDKoH6db6o3Cokwm54LBoPSFrRHVnJlOdXZsbJilJG7WKz9ZKS8C
         J5/N2I5okMK2ZW84pJke1i+4WNptN2+XE9mhqhKhenjC1EcW3OhnAui5gI9dJeQDqL1B
         AusFYcnTrNnbM7hOkN42WKB/qb8cXD4AykWYGBHCDg8ON0nbLiulZ3tw9GdpkPbGwMAt
         fEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8VbEFExzZpgAZHrLpANzRs8B3lw245GIZCqubgilhjKhER/CpQvc8TFtVHjQ8GJDu3ArvsvMS2YeEFlBqnSq6A==@lists.infradead.org, AJvYcCWUbzzVjwCUSRawsRqM5Mh6Izty9d/RqFLFQkuFKQ4QaclhW4ngmsPVHbzrYgxBvI7012/fto+E/5ndrlP7@lists.infradead.org
X-Gm-Message-State: AOJu0YxyuGEPCR5A2SJdd3rzmaAt72ThgBITxzF2ZsKxH2YUGkfGK13v
	SHpGAniyOBB8Zng5leuGxy5C2AuL40fb1ljfkbPJkwwSm4Q7hSU3z+PG6vpRrInq+vxiwanbhIA
	y6OL8Tebyd9Uh7dl2cybtN1WAu60zzJM=
X-Gm-Gg: ASbGncvhmljDW3Q8YqmcaWXfzN89FSa5TMFZeO4zX8GVHBPuZ++W/77ns6tXoEeeSAO
	hGH3RinMdsPJs+66iz4cQcL9LZ+wKYRkQJdbfaooN1qpE4DgN5Nab9/1HpCoFd8FU75TgjkpbgN
	YboqOti2D/LaOV2WUNpN0gVwR+Djh8HGB1TJcEYN0iDbTPrTwWeVk3Jk/Ex+BVDxPccEWbgzVqY
	pjnua0D1E6slVuS
X-Google-Smtp-Source: AGHT+IHcVn7No3ANoqx5woQ67BZrl62KReMCA2T36hJckpRBJtNeq23+uG18xwyotgKBGRTvHgmGlRKcK8i0ImMDvRc=
X-Received: by 2002:a17:907:3f12:b0:afe:ea46:e808 with SMTP id
 a640c23a62f3a-b01d9793846mr1869389666b.47.1757044301283; Thu, 04 Sep 2025
 20:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250825065240.22577-1-linux.amoon@gmail.com> <20250825065240.22577-3-linux.amoon@gmail.com>
 <e31d35c8-b2b2-4301-a13c-e18ad83a21d6@kernel.org>
In-Reply-To: <e31d35c8-b2b2-4301-a13c-e18ad83a21d6@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Sep 2025 09:21:25 +0530
X-Gm-Features: Ac12FXxyDiiV3g7LkqGtc1SDoPuFAN0OeFKgOY8PLCoMNfr5vTocBW2CQHpvMww
Message-ID: <CANAwSgQOcqYdMjxN+ZmTDMj31VrCgCvACvkNpErJExvR0kiw4Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] arm64: dts: amlogic: Add cache information to
 the Amlogic SM1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_205143_403486_5D5B1666 
X-CRM114-Status: GOOD (  13.22  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldyBjb21tZW50cy4KCk9uIFRodSwg
NCBTZXB0IDIwMjUgYXQgMTk6MDcsIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyNS8wOC8yMDI1IDA4OjUxLCBBbmFuZCBNb29uIHdyb3RlOgo+ID4g
QXMgcGVyIFM5MDVYMyBkYXRhc2hlZXQgYWRkIG1pc3NpbmcgY2FjaGUgaW5mb3JtYXRpb24gdG8g
dGhlIEFtbG9naWMKPiA+IFNNMSBTb0MuIEFSTSBDb3J0ZXgtQTU1IENQVSB1c2VzIHVuaWZpZWQg
TDMgY2FjaGUgaW5zdGVhZCBvZiBMMiBjYWNoZS4KPiA+Cj4gPiAtIEVhY2ggQ29ydGV4LUE1NSBj
b3JlIGhhcyAzMktCIG9mIEwxIGluc3RydWN0aW9uIGNhY2hlIGF2YWlsYWJsZSBhbmQKPiA+ICAg
ICAgIDMyS0Igb2YgTDEgZGF0YSBjYWNoZSBhdmFpbGFibGUuCj4gPiAtIEFsb25nIHdpdGggMjU2
S0IgVW5pZmllZCBMMiBjYWNoZS4KPiA+Cj4gPiBDYWNoZSBtZW1vcnkgc2lnbmlmaWNhbnRseSBy
ZWR1Y2VzIHRoZSB0aW1lIGl0IHRha2VzIGZvciB0aGUgQ1BVCj4gPiB0byBhY2Nlc3MgZGF0YSBh
bmQgaW5zdHJ1Y3Rpb25zLCBsZWFkaW5nIHRvIGZhc3RlciBwcm9ncmFtIGV4ZWN1dGlvbgo+ID4g
YW5kIG92ZXJhbGwgc3lzdGVtIHJlc3BvbnNpdmVuZXNzLgo+Cj4KPiBUaGlzIHN0YXRlbWVudCBp
cyBvYnZpb3VzIGFuZCBjb21wbGV0ZWx5IHJlZHVuZGFudC4gRHJvcCBpdCBmcm9tIGFsbCBvZgo+
IHRoZSBjb21taXRzLgo+ClBlbmRpbmcgYWRkaXRpb25hbCBmZWVkYmFjaywgSeKAmWxsIHJldmlz
ZSBhbmQgZHJvcCB0aGVtIGluIHRoZSBuZXh0IHJlbGVhc2UuCj4gQmVzdCByZWdhcmRzLAo+IEty
enlzenRvZgoKVGhhbmtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
