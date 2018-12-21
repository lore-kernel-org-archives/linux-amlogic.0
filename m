Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C99CC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 23:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C5B72190A
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 23:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DouqYWO8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tcHZIDOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C5B72190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzVPIPsgZ//0TlEfC3MtiKDrgOd7kdeETYIkHwOZ3AA=; b=DouqYWO89C7v2W
	inp/0p5W1Vy/gwcytQ5qsGm0GgWWaVIx98wq8aOg3KmScq+2zXvl94VbGML1wWKN/lGvdWJInDL+J
	4RkmLgMly24GsGNarRRnj+IpqzvQFWGQTD4a1euZEJykmeAjaffwBE0PyLCsdaNGv+2+suCBOJiqh
	z2yud7PFoAHZ6I2xI1x3+XOoEocg3Wgt/DxSyNBoM8+YbLZ5t+lIB36y1+21w5jO7FA6223caTauB
	93WlL/yZNZ5y+DFKDnOm8ibhCSpny+X1p8bVCLIdV9MXSDpfh2aNlfc/9Wf12/k+q19MawJliaXIG
	ACV1mD9fK1gQ/amJ5N5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaTzH-0003lM-Je; Fri, 21 Dec 2018 23:13:47 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaTzC-0003kd-TG
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 23:13:45 +0000
Received: by mail-pl1-x641.google.com with SMTP id b5so3123415plr.4
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 15:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=abNvcfy0ctwrO6xXPJ7uMEdhM3z3GEhCvmRhA5UceKM=;
 b=tcHZIDOAf8qwEnDqgyFQBCg2PO+jkbmB4Snxs25toGXyH/Sl/kyhbjY9Y0LYxo6L/A
 YNbAamxPkJXABrQ88ylxJf3kkLc7ft4A1k4TC+CAqGuILo3j4RQYTIu0DKwkZtcw70ye
 ZZidxKoy80WEg57BgkP9+kPTiVizhKokElImOSdq4s896SU3CSSXsYoymcZE51GObqin
 sjQjBQdk16XRBVjixHc6aMlWQa3hiRaV0J2nP6FP5be0Pg7NDK70DwCNEHgNi59QAfTt
 Dv0sGTGVQZ5EH+nXyOzP557rRER+BDabVJV84AGduDh8j7e/JQKemwE/4C1Xcv+O+Zul
 zHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=abNvcfy0ctwrO6xXPJ7uMEdhM3z3GEhCvmRhA5UceKM=;
 b=nk4oRyl+sqSDedAGXRiA2oB6u/C5qgecVy+U1FeUWb/t7YtTdYHmR01IszsCCxEBgK
 b2jQGBs1nKz9q8+EAHKhp6vHVml/mZlLumXDV0LBlQklijyUM0Iozz9Kh6Reb3f0UP/t
 NQgBsb2q8jyLV5XTA7mwXIzwSH5pzM2tKxaEk77KTkS5netJRx9gFVO57ld1zd2JO5Xn
 UsnPndc/TmsS/1Si+N88Fd73YVmDrkdCGQ9fKkn6gbehTtM4QW34UwVyfgrXld3H5eN2
 W4xmmpKalvGxD5LtNIqPbOIRsgE7gQvG/3hmJW4QHym0IiJyupIICv9rF+xc3PnMR3U3
 oqYA==
X-Gm-Message-State: AJcUukdroQYDK2TRseRHEgiZkz5JQqjD4/idvGHIITa+k+q1bkZUaRN/
 tWVZSK+SURMiWkF7+R5wWtmwug==
X-Google-Smtp-Source: ALg8bN496KpvbHJMgz+XL8XdPMKdcOPCPMKCswFD4JaPDzF+m6Hjcd+GX0wSq9e7l221G9l9sqB5YQ==
X-Received: by 2002:a17:902:7044:: with SMTP id
 h4mr4378935plt.35.1545434011051; 
 Fri, 21 Dec 2018 15:13:31 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:4dea:8076:74d1:94e1])
 by smtp.googlemail.com with ESMTPSA id 84sm51968092pfa.115.2018.12.21.15.13.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 15:13:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Chris Moore <moore@free.fr>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
In-Reply-To: <dc14926f-4433-fa7b-311f-cb275a7e7aee@free.fr>
References: <20181219233519.35287-1-khilman@baylibre.com>
 <dc14926f-4433-fa7b-311f-cb275a7e7aee@free.fr>
Date: Fri, 21 Dec 2018 15:13:29 -0800
Message-ID: <7hr2eaqxra.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_151343_268235_2CB5A96F 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Q2hyaXMgTW9vcmUgPG1vb3JlQGZyZWUuZnI+IHdyaXRlczoKCj4gSGksCj4KPiBTb3JyeSBmb3Ig
dGhlIHJlcGVhdCA6IEkgcmVwbGllZCBwcmV2aW91c2x5IHRvIHYxIGFzIEkgaGFkbid0IG5vdGlj
ZWQgCj4gdGhhdCB0aGVyZSB3YXMgYWxyZWFkeSBhIHYyLgo+Cj4gTGUgMjAvMTIvMjAxOCDDoCAw
MDozNSwgS2V2aW4gSGlsbWFuIGEgw6ljcml0wqA6Cj4+IEFkZCBuZXcgdmVuZG9yIGZvciBhbWVk
aWF0ZWNoLCBhbmQgaW5pdGlhbCBib2FyZDogeDk2LW1heAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBL
ZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0ICAgICB8IDEgKwo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0IHwgMSAr
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0Cj4+IGluZGV4IDhk
YmMyNTkwODFlNC4uYzUwYjA4NGI2YzU5IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50eHQKPj4gQEAgLTk5LDYgKzk5LDcgQEAg
Qm9hcmQgY29tcGF0aWJsZSB2YWx1ZXMgKGFscGhhYmV0aWNhbGx5LCBncm91cGVkIGJ5IFNvQyk6
Cj4+ICAgICAtICJhbWxvZ2ljLHAyODEiIChNZXNvbiBneGwgczkwNXcpCj4+ICAgICAtICJvcmFu
dGgsdHgzLW1pbmkiIChNZXNvbiBneGwgczkwNXcpCj4+ICAgCj4+ICsgIC0gImFtZWRpYXRlY2gs
eDk2LW1heCIgKE1lc29uIGd4bSBzOTEyKQo+Cj4gU2hvdWxkbid0IHRoYXQgYmUgTWVzb24gZzEy
YSBzOTA1eDIgPwoKVWdoLCB5ZXMuICBMYXp5IGNvcHkvcGFzdGUgYnVnLiAgV2lsbCBmaXggdGhh
dCBpbiBhIHYzIG5leHQgeWVhci4gOikKClRoYW5rcyBmb3IgdGhlIHJldmlldywKCktldmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
