Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82091ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+7/Yb6OThCyAMjqI5/r9yRjd6vBTJ7dkfcdmSJRFk0=; b=yNOYMZ7nUMcsvu
	9t90jerY0CPPSEN1vf4yibWVQl70DEgRQDTU83J2Ob+PgS/1MRmHEKJH7egWrCMw4ar6Wn3ppwZyo
	UDJU1uaSSHRDWV4HZkzN4Lwr1rScNDWUSBWROX3brJyHhPaZ1ZmLSAk3AKbiDZ5tUD0JoLT64i7sQ
	prNbcUOss7NWVzdXDQJwvVwonHXxwf/rMUAbIi2D0Sv6BvE5qJnhV5h5zal1PcTX+0Q68IL3a/mMw
	HYK3oQDJwcphtFhAtM4P0Lu4rcPNFwdW9+10Iy+xz2T0oWloOHph7Hlq3KgQXFrm5HQIGC4GoAFgg
	jKuE7VLVDqlp8oQ2SkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv1i-00EWpJ-G7; Tue, 30 Aug 2022 06:47:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv1M-00EWdu-Ju
	for linux-amlogic@lists.infradead.org; Tue, 30 Aug 2022 06:46:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id v16so10110814wrm.8
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:from:to:cc;
        bh=uNEuHOAteazyIC1AyuG6gAPmQRuBflQgsrGFq90AkL8=;
        b=xrxjzN84NNOAPVsknUJjhguvFY7Jm9nDNOw5SxQQrrR0IpFZtQ/cWzc1kLMxeTC9HB
         WwbtoDMMgcs5u5vMMgt0F1OisV1DD7zW8KZR04rZdcF0PBypUgCyR+Cvjb6y4xZfeLur
         v2HeMOnSAIpcdzquU4WAvSS6WCJUlR5j+DCeMrA80WllQzw//G/b97zPaNhct0+excqD
         OZy+YpWX6WKUxsBEW8QCbZGdx5RmBtQ05ASdsiC6Qb9jIIQvRYhBi4re3uec/788bWTu
         YE28suGbqmERGc/PP/nN1GwYKWta9h6uztrIIxJtsGg9SsYXhcqpFwXakLdwbZ+yi+2i
         Y99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
        bh=uNEuHOAteazyIC1AyuG6gAPmQRuBflQgsrGFq90AkL8=;
        b=oJ/IWxl7oqe8LIA/bbsHYCxVqzBr8SFp6dWAibnoeqowx66uE8v5EidJPHpj8ZBHpO
         hxXTvIJoUEB4UkplBiXo/PDZrf20xGcAvJ3lv52iFaauwTzElgkGsJZTZV8mQ+L2lyKf
         0xIf7qzY9hXri0SfZ6LNdXFy8m1SHRAtxNa71MmZpAIpuRs+JS4alsUu1rttnfUTe6mo
         jaU6DKBbolW89I0Dd4K+CdPuj3nqPJrzUXYO1LHg1ciuu8Bz0O1blFhf9zTObouoO+Vp
         gpsakTY4W7eJ3FOkrOB4RAv8qbuo1A3dFPqrxNdOHU3CocaIgF3U8f+dR/Te1v+mLJib
         pwTA==
X-Gm-Message-State: ACgBeo1QEVwfZz1XF14NQ9/3rIVSDje1xdzzSkSWuYmYIxAPuafVTXa9
	IFmkyIU5t6AfrOkkSBv3s/qy7A==
X-Google-Smtp-Source: AA6agR4DWkxaJe99oAOEPXlrrxRopc/vUu//vwPgzIo0tcLsvHWV2Vq+65oUCUGF7bxEZ15aEUQTwA==
X-Received: by 2002:a05:6000:18a2:b0:221:7db8:de02 with SMTP id b2-20020a05600018a200b002217db8de02mr8049189wri.132.1661842003316;
        Mon, 29 Aug 2022 23:46:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d4346000000b0020fff0ea0a3sm8757749wrr.116.2022.08.29.23.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 23:46:42 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
 <4e3cdd6b-5861-8a4f-1df7-af763f77bad5@amlogic.com>
 <1jsflftm1y.fsf@starbuckisacylon.baylibre.com>
 <0c7e6d90-2ce3-25ab-84b6-026ce8a238a8@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Tue, 30 Aug 2022 08:44:01 +0200
In-reply-to: <0c7e6d90-2ce3-25ab-84b6-026ce8a238a8@amlogic.com>
Message-ID: <1jtu5uz0ry.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_234648_708611_DAAD8061 
X-CRM114-Status: GOOD (  16.99  )
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

DQpPbiBUdWUgMzAgQXVnIDIwMjIgYXQgMTQ6MTMsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4g
d3JvdGU6DQoNCj4gT24gMjAyMi84LzI5IDE3OjQ4LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOg0KPj4g
WyBFWFRFUk5BTCBFTUFJTCBdDQo+PiBPbiBNb24gMTUgQXVnIDIwMjIgYXQgMjE6MjAsIFl1IFR1
IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6DQo+PiANCj4+Pj4+PiArDQo+Pj4+Pj4gK3N0YXRp
YyBzdHJ1Y3QgY2xrX3JlZ21hcCBzNF9oZG1pX3BsbF9kY28gPSB7DQo+Pj4+Pj4gK8KgwqDCoCAu
ZGF0YSA9ICYoc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSl7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5lbiA9IHsNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFO
QUNUUkxfSERNSVBMTF9DVFJMMCwNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hp
ZnTCoMKgID0gMjgsDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndpZHRowqDCoCA9
IDEsDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5t
ID0gew0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9I
RE1JUExMX0NUUkwwLA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAg
PSAwLA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSA4LA0KPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAubiA9IHsNCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBMTF9D
VFJMMCwNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMTAsDQo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndpZHRowqDCoCA9IDUsDQo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH0sDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mcmFjID0gew0KPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwx
LA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAwLA0KPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSAxNywNCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgfSwNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmwgPSB7DQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDAsDQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDMxLA0KPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC53aWR0aMKgwqAgPSAxLA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9LA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAucnN0ID0gew0KPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLA0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAyOSwNCj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAud2lkdGjCoMKgID0gMSwNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwN
Cj4+Pj4+PiArwqDCoMKgIH0sDQo+Pj4+Pj4gK8KgwqDCoCAuaHcuaW5pdCA9ICYoc3RydWN0IGNs
a19pbml0X2RhdGEpew0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJoZG1pX3BsbF9k
Y28iLA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAub3BzID0gJm1lc29uX2Nsa19wbGxfcm9fb3Bz
LA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAucGFyZW50X2RhdGEgPSAoY29uc3Qgc3RydWN0IGNs
a19wYXJlbnRfZGF0YSBbXSkgew0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsgLmZ3
X25hbWUgPSAieHRhbCIsIH0NCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwNCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgLm51bV9wYXJlbnRzID0gMSwNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyoN
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIERpc3BsYXkgZGlyZWN0bHkgaGFuZGxlIGhkbWkg
cGxsIHJlZ2lzdGVycyBBVE0sIHdlIG5lZWQNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIE5P
Q0FDSEUgdG8ga2VlcCBvdXIgdmlldyBvZiB0aGUgY2xvY2sgYXMgYWNjdXJhdGUgYXMNCj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoCAqIHBvc3NpYmxlDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAg
Ki8NCj4+Pj4+DQo+Pj4+PiBJcyBpdCByZWFsbHkgPw0KPj4+Pj4NCj4+Pj4+IEdpdmVuIHRoYXQg
SERNSSBzdXBwb3J0IGZvciB0aGUgczQgaXMgdGhlcmUgeWV0LCB0aGUNCj4+Pj4+IGFkZHJlc3Nl
cyBoYXZlIGNoYW5nZXMgYW5kIHRoZSByZWdpb24gaXMgbm8gbG9uZ2VyIGEgc3lzY29uLCBpdCBp
cyB0aW1lDQo+Pj4+PiBmb3IgdGhlIEhETUkgZHJpdmVyIHRvIGdldCBmaXhlZC4NCj4+PiBUaGUg
SERNSSBQTEwgaXMgY29uZmlndXJlZCBpbiB0aGUgVWJvb3QgcGhhc2UgYW5kIGRvZXMgbm90IGNo
YW5nZSB0aGUNCj4+PiBmcmVxdWVuY3kgaW4gdGhlIGtlcm5lbCBwaGFzZS4gU28gd2UgdXNlIHRo
ZSBOT0NBQ0hFIGZsYWcgYW5kDQo+Pj4gInJvX29wcyIuDQo+PiBUaGF0J3Mgbm8gcmVhc29uIHRv
IHB1dCBOT0NBQ0hFIG9yIHJvLW9wcw0KPj4gSWYgeW91IHdhbnQgdGhlIGZyZXF1ZW5jaWVzIHRv
IGJlIHN0YXRpY2FsbHkgYXNzaW5nZWQsIHRoZSBjb3JyZWN0IHdheQ0KPj4gd291bGQgYmUgdGhy
b3VnaCBhc3NpZ25lZC1yYXRlIGluIERUIEkgZ3Vlc3MuDQo+DQo+IE9rYXkuIFlvdSdyZSByaWdo
dC4gSG93ZXZlciwgd2hlbiByZWdpc3RlcmluZyB3aXRoIE9QUywgSERNSSBQTEwgd2lsbCBiZQ0K
PiByZXNldC4gSXQgdGFrZXMgdGltZSBmb3IgUExMIHRvIHN0YWJpbGl6ZSB0aGUgb3V0cHV0IGZy
ZXF1ZW5jeSwgd2hpY2ggd2lsbA0KPiBsZWFkIHRvIHRoZSBzdGFydHVwIHNjcmVlbiBmbGFzaGlu
Zy4NCj4NCj4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaG93IHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBp
ZiBub3QgdXNpbmcgcm9fb3BzLg0KPg0KPj4gDQoNCllvdSBjYW4gYWRkIG5ldyBvcHMgb3IgdHdl
YWsgdGhlIGN1cnJlbnQgaW5pdCBmdW5jdGlvbi4NCg0KU2FmZXN0IHdvdWxkIGJlIHRvIGRvIHRo
ZSBmb2xsb3dpbmcgOg0KICogQ2hlY2sgaWYgdGhlIFBMTHMgaXMgYWxyZWFkeSBvbi4NCiAqIENo
ZWNrIGlmIHRoZSAncGxsLT5pbml0X3JlZ3MnIG1hdGNoZXMgd2hhdCBpcyBhbHJlYWR5IHNldA0K
ICAgLSBpZiBzbywgeW91IGNhbiBza2lwIHRoZSByZXNldA0KICAgLSBpZiBub3QsIHlvdSBuZWVk
IHRvIHJlc2V0IGFzIHVzdWFsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
