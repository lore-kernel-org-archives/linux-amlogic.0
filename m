Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A96C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyB4FsOItnP3CzmZQQobfiNEXrBDQ+gClo98eSWBOzk=; b=Ei2C3Yk4zr37pN
	U+G1xa2u6d1S144TCTZc7rbFAgLRZrCUvx1GvcSLYUERiHanctlxlMzWzN7P1BS7YAx4ffyHcei3I
	tUxbQBtCp7edgIfognwh0lVIuigY5jPH+hkwlHrJEzJexXaC1zBR0QnQLUEyNZbLmlfrAK5aymKeo
	3CWKnFOpT+iDM0JoOznWh5mTvwkKGlzJzHEWFg0FeM1iln5qgTC6xuDbpS4/Aph7Ttb0EEorad2ma
	DSA4GAPuSE8Hxs+nvURdzCg8QraYi2z3ykpH0D/lUPcjED94EmJxvGmCbDfA7cWyEwWp1qOb1+m0x
	tIdyXhACPTHGtsHo3n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLhf-005x5c-Ca; Mon, 06 Dec 2021 21:39:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLdZ-005vec-38; Mon, 06 Dec 2021 21:35:06 +0000
Received: by mail-ed1-x532.google.com with SMTP id w1so48574849edc.6;
 Mon, 06 Dec 2021 13:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g/3xej/+7yR5jJ0HvJ4Y8QLnsfRIB2TAouZkdT19Z2g=;
 b=J7JsGjsf/XGWSvpCCG8croHDg8zDuVWD+tHl/bI49pnwZcleqZoMVWfxLLBWqPfzrF
 kumFZb1dl7F+01MzkDELA5qt3iMyS2ail/jGZusyCcLUgwja5bJgiX5zaJhNM25xSS/8
 DdsS1tl59APyj3ACPqfhgcgbI1demlIgtU6Qti85MJ7KX46le2eIMiVv0BHzqhFwsV8n
 X0vqahcDxs4YcAWwLumlhUQZ1IdfHxNjmXUn47z2gAbqxeHhlr0TLF3PeASown5WVn1Q
 Yy3hKGXOOMdDuta1Qi42aYvChfg81FTRkOzp7v+wnEDHvoJ41ell4r5N3n4R02boNKf9
 ccLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g/3xej/+7yR5jJ0HvJ4Y8QLnsfRIB2TAouZkdT19Z2g=;
 b=QPS1zVLGl5j2uMiPcbaEV0K45lLpVapWKo9paM35weLSdlfthHZ+LzgGCzJ7cX3Bqk
 x3ufc+N2Bl0lWwyuzdy7Kzwwi/MuhE3FIcgT/kqAlBxFJif0ZixtWs2cnsolMSEpXirh
 Z/syp24pEOr3k3/5ukMCxBkHSadjZbO0QEsgRzHGmu6fxs60eXwaYs4/XTY9anIi6iVN
 IGMzYBdYbgOWVAZEkfPou/tmu4amh1HSZGyhUKfi1EWddQPilu12nswURl3uqe2U7DSJ
 I+5N4RBSkj+SeOpsX+0bobCrRCuuELcdped4y5ZhnocQT0v8spoMz+23zh1K4vI2U367
 Rk9Q==
X-Gm-Message-State: AOAM531IW5+Zr5BnX2G5wo1JDDQWRBircjl8wqARWdRSjAdP7jyEwhh7
 QSPimb/IW1GlKLhSBBqNphdo3eMyPrZH5OwU4MQ=
X-Google-Smtp-Source: ABdhPJz7vzNiruzGi8mIW3IUnHtTxAzltO2rAWQ0vCs78/iB1Z8kPEXplKx6gdM538xcewsFgbTKHxy/BZxn3gyyy78=
X-Received: by 2002:a05:6402:7d8:: with SMTP id
 u24mr2500706edy.215.1638826503830; 
 Mon, 06 Dec 2021 13:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-4-christianshewitt@gmail.com>
In-Reply-To: <20211130060523.19161-4-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:34:53 +0100
Message-ID: <CAFBinCAK76UY3LPyBRX99oR74JFk8geru-th6FqA9bPgugbCag@mail.gmail.com>
Subject: Re: [RFC PATCH 3/9] arm64: dts: meson: add initial device-trees for
 X96-AIR
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Benoit Masson <yahoo@perenite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_133505_189090_D29CCD44 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgNzowNyBBTSBDaHJpc3RpYW4gSGV3aXR0CjxjaHJpc3Rp
YW5zaGV3aXR0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgQW1lZGlhdGVrIFg5Ni1BSVIgaXMg
YmFzZWQgb24gQW1sb2dpYyBTOTA1WDMgcmVmZXJlbmNlIGJvYXJkCj4gZGVzaWducyBhbmQgc2hp
cHMgaW4gbXVsdGlwbGUgY29uZmlndXJhdGlvbnM6Cj4KPiDigJMgNEdCIEREUjMgKyA2NEdCIGVN
TUMgKyBXaUZpIGEvYi9nL24vYWMgKyBCVCArIEdiIEV0aGVybmV0Cj4g4oCTIDRHQiBERFIzICsg
MzJHQiBlTU1DICsgV2lGaSBhL2IvZy9uL2FjICsgQlQgKyBHYiBFdGhlcm5ldAo+IOKAkyA0R0Ig
RERSMyArIDMyR0IgZU1NQyArIFdpRmkgYi9nL24gKG5vIEJUKSArIDEwLzEwMCBFdGhlcm5ldAo+
IOKAkyAyR0IgRERSMyArIDE2R0IgZU1NQyArIFdpRmkgYi9nL24gKG5vIEJUKSArIDEwLzEwMCBF
dGhlcm5ldAo+IC4uLgo+IC0gSERNSSAyLjEgdmlkZW8KPiAtIFMvUERJRiBvcHRpY2FsIG91dHB1
dAo+IC0gQVYgb3V0cHV0Cj4gLSAyeCBVU0IgMi4wIGluYy4gT1RHIHBvcnQKPiAtIDF4IFVTQiAz
LjAgcG9ydAo+IC0gSVIgcmVjZWl2ZXIKPiAtIDF4IG1pY3JvIFNEIGNhcmQgc2xvdCAoaW50ZXJu
YWwpCj4gLSAxeCBSZXNldC9VcGRhdGUgYnV0dG9uIChpbiBBViBqYWNrKQo+IC0gNy1zZWdtZW50
IFZGRAo+Cj4gVGhlIGRldmljZS10cmVlIHdpdGggLTEwMCBzdWZmaXggc3VwcG9ydHMgbW9kZWxz
IHdpdGggMTAvMTAwIEV0aGVybmV0Cj4gYW5kIHdpdGggLTEwMDAgc3VmZml4IHN1cHBvcnRzIG1v
ZGVscyB3aXRoIEdpZ2FiaXQgRXRoZXJuZXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
SGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiAjClg5Ni1BaXIg
d2l0aCBHYml0L3MgUEhZCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
