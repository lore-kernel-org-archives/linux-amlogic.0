Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE8CD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31uqyehCi+VcMqUyGZDSJC3xYfgUYm/sdsTQ2ppbuvc=; b=lGC+dfQK/z1pQH
	MgiPTPpz37t8acwW+rl88dVJPKQ4sMz1Ww0e9PvZlXOT8Je0bb2n8SAvhp34JUvApH1Pq7c1iwvE+
	9UmKSCZHLAsIOTwLsZOW5U6jJZMmVQNllJ9LHN97z5CSHzqoulbyroiB6me2gIDza6w5Ohm7rtaVi
	3rNqB3D6HgyYoCM4+Tgv42/2+tJVjzAxBLj/ngDTFLVhWgxTWkBYsNj+483GL7aSm8U8zsoNZvRbJ
	lDx5u+88EwW2NVVRvBLk55026EYfEMZ6WtpCej0EFtt0ZNOVdsySTtQK5ZCqvLHl8ZNd2/Xm4eWn2
	bM5kZbnnspaa5BEHrLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraYU-0000000ASdx-0YkI;
	Tue, 02 Apr 2024 09:35:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rraYQ-0000000AScz-2txw
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Apr 2024 09:35:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3436ffe05c9so189686f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Apr 2024 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712050540; x=1712655340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t55JrH3SjWQfNiNN3GlWq9T+unk5wlRC/u7IUzNfWDo=;
        b=Qka1XS5LPsnMAKRB93vWxLc6w6CAfAzje4+FjAOxAzVfwaXVNQ6f12/eWcqs2zExAr
         FSfy7QSEe2IWzcS5vuMXoQIwBCqjI+Z+TAReW6UUMXyHpl1DQvLBNMiFsTNcqm8DMSoi
         EV6RbY7sLCOdHQqeZHSalRiywOLBC0dRO6sVMMSqLluEgR2XTA7ios0UYnf0jREc3JBk
         8xtXw1aoynzRL8ueSV6gtDHawhmZ6e3T2D4oJ3Cz4FruHstCBdnshLmEWG0pG0Toama0
         nK8lx6egG3jf5+tuTCEq0lX2/YzO9MhqlvXIV2z9MgNM1Vhv34ln4u3KYL+3hXanbsRO
         XRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050540; x=1712655340;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t55JrH3SjWQfNiNN3GlWq9T+unk5wlRC/u7IUzNfWDo=;
        b=DTB9+Kw7RuS98WQSHLxhoeEAZZnrTeDH6a2/Sz9Lg18Jwi3Se8082e9ARj+shS8WDY
         u+OheYiY834BB/rFjAZQQkYtIW/QK0Lg89dgwCflQoNtZ6QxxYdqFms2/HfjBmnGENuV
         u9glIH/Lm8j4aN/qGBDBoJfvkcY9YggEfLzc1u4G29hyWgNSekNWL5vQmX46uO0qzs1T
         yEEjWIbbjnhFRFdSQaSgSrDwxGMBuN6saOiXf23xph2eHvr8VxaPwuxW3HZ8bDg1mLPd
         C16y+FJZV/zsk6GBHey9NdDTlAdH1bIsLaPNIwazPulg15HBawLuCGRSYoh8QBhrf4sE
         zgWA==
X-Forwarded-Encrypted: i=1; AJvYcCXOEs8BQ618KPCgegT+ww4gMEPmCFU75A+03HCt1e45cJHe8g4oSjIa6G+FHEzEYHQTeKJG+wB9uEOocDZTtM1h78pn1eIecyQgNhuc6Zw3frQ=
X-Gm-Message-State: AOJu0Yw9BffI5kZIhOYJLFN+vIm0zL/NJxRxCQQAIuAea4x7PYQ8jba9
	uQiMwxDfdVRRSIPU/MjPyo5cPvVBr+Kh7h24qlCdo3pgwm2+kz52a4B3alc8WUU=
X-Google-Smtp-Source: AGHT+IHhm1TN2m/8h7xq9XVC6c2eoeVECv02Fp+GF4LtMIozj3PFQdmk7yKpQKnxTnferlbKIze4bQ==
X-Received: by 2002:a5d:4c86:0:b0:343:79b4:5371 with SMTP id z6-20020a5d4c86000000b0034379b45371mr89238wrs.69.1712050534961;
        Tue, 02 Apr 2024 02:35:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db22:d5c9:a527:a4cf])
        by smtp.gmail.com with ESMTPSA id dn13-20020a0560000c0d00b00341b7d5054bsm13754980wrb.72.2024.04.02.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:35:34 -0700 (PDT)
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-7-ddrokosov@salutedevices.com>
 <CAFBinCCC5KK-4_w41B-+ZJ3zdZckq_EDuAW+Kak2C0Ow8uuD6Q@mail.gmail.com>
 <20240401171237.qoewp2pgcdrqvc3e@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] clk: meson: a1: add Amlogic A1 CPU clock
 controller driver
Date: Tue, 02 Apr 2024 11:27:24 +0200
In-reply-to: <20240401171237.qoewp2pgcdrqvc3e@CAB-WSD-L081021>
Message-ID: <1jzfuchztl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_023542_740873_949A0D0D 
X-CRM114-Status: GOOD (  39.47  )
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

Ck9uIE1vbiAwMSBBcHIgMjAyNCBhdCAyMDoxMiwgRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBz
YWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIE1hcnRpbiwKPgo+IFRoYW5rIHlvdSBm
b3IgcXVpY2sgcmVzcG9uc2UuIFBsZWFzZSBmaW5kIG15IHRob3VnaHRzIGJlbG93Lgo+Cj4gT24g
U3VuLCBNYXIgMzEsIDIwMjQgYXQgMTE6NDA6MTNQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5n
bCB3cm90ZToKPj4gSGkgRG1pdHJ5LAo+PiAKPj4gT24gRnJpLCBNYXIgMjksIDIwMjQgYXQgOTo1
OeKAr1BNIERtaXRyeSBSb2tvc292Cj4+IDxkZHJva29zb3ZAc2FsdXRlZGV2aWNlcy5jb20+IHdy
b3RlOgo+PiBbLi4uXQo+PiA+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgY3B1X2ZjbGsgPSB7
Cj4+ID4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2RhdGEpIHsKPj4g
PiArICAgICAgICAgICAgICAgLm9mZnNldCA9IENQVUNUUkxfQ0xLX0NUUkwwLAo+PiA+ICsgICAg
ICAgICAgICAgICAubWFzayA9IDB4MSwKPj4gPiArICAgICAgICAgICAgICAgLnNoaWZ0ID0gMTAs
Cj4+ID4gKyAgICAgICB9LAo+PiA+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5p
dF9kYXRhKSB7Cj4+ID4gKyAgICAgICAgICAgICAgIC5uYW1lID0gImNwdV9mY2xrIiwKPj4gPiAr
ICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9vcHMsCj4+ID4gKyAgICAgICAg
ICAgICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgJmNwdV9mc2VsMC5odywKPj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAmY3B1X2ZzZWwxLmh3LAo+PiBIYXZlIHlvdSBjb25zaWRlcmVkIHRoZSBDTEtfU0VU
X1JBVEVfR0FURSBmbGFnIGZvciAmY3B1X2ZzZWwwLmh3IGFuZAo+PiAmY3B1X2ZzZWwxLmh3IGFu
ZCB0aGVuIGRyb3BwaW5nIHRoZSBjbG9jayBub3RpZmllciBiZWxvdz8KPj4gV2UgdXNlIHRoYXQg
YXBwcm9hY2ggd2l0aCB0aGUgTWFsaSBHUFUgY2xvY2sgb24gb3RoZXIgU29Dcywgc2VlIGZvcgo+
PiBleGFtcGxlIGNvbW1pdCA4ZGFlYWVhOTljYWEgKCJjbGs6IG1lc29uOiBtZXNvbjhiOiBtYWtl
IHRoZSBDQ0YgdXNlCj4+IHRoZSBnbGl0Y2gtZnJlZSBtYWxpIG11eCIpLgo+PiBJdCBtYXkgZGlm
ZmVyIGZyb20gd2hhdCBBbWxvZ2ljIGRvZXMgaW4gdGhlaXIgQlNQLAo+Cj4gQW1sb2dpYyBpbiB0
aGVpciBCU1AgdGFrZXMgYSBkaWZmZXJlbnQgYXBwcm9hY2gsIHdoaWNoIGlzIHNsaWdodGx5Cj4g
ZGlmZmVyZW50IGZyb20gbWluZS4gVGhleSBjbGV2ZXJseSBjaGFuZ2UgdGhlIHBhcmVudCBvZiBj
cHVfY2xrIGRpcmVjdGx5Cj4gYnkgZm9ya2luZyB0aGUgY3B1ZnJlcSBkcml2ZXIgdG8gYSBjdXN0
b20gdmVyc2lvbi4gSSBtdXN0IGFkbWl0LCBpdCdzCj4gcXVpdGUgYW4gImludGVyZXN0aW5nIGFu
ZCBhbWF6aW5nIiBpZGVhIDopIGJ1dCBpdCdzIG5vdCBhcmNoaXRlY3R1cmFsbHkKPiBjb3JyZWN0
IHRvdGFsbHkuCgpJIGRpc2FncmVlLiBNYXJ0aW4ncyBzdWdnZXN0aW9uIGlzIGNvcnJlY3QgZm9y
IHRoZSBmc2VsIHBhcnQgd2hpY2ggaXMKc3ltZXRyaWMuCgo+Cj4+IGJ1dCBJIGRvbid0IHRoaW5r
Cj4+IHRoYXQgdGhlcmUncyBhbnkgaGFybSAoaWYgaXQgd29ya3MgaW4gZ2VuZXJhbCkgYmVjYXVz
ZSBDQ0YgKGNvbW1vbgo+PiBjbG9jayBmcmFtZXdvcmspIHdpbGwgc2V0IGFsbCBjbG9ja3MgaW4g
dGhlICJpbmFjdGl2ZSIgdHJlZSBhbmQgdGhlbgo+PiBhcyBhIGxhc3Qgc3RlcCBqdXN0IGNoYW5n
ZSB0aGUgbXV4ICgmY3B1X2ZjbGsuaHcpLiBTbyBhdCBubyBwb2ludCBpbgo+PiB0aW1lIHdpbGwg
d2UgZ2V0IGFueSBvdGhlciByYXRlIHRoYW4gYSkgdGhlIG9yaWdpbmFsIENQVSBjbG9jayByYXRl
Cj4+IGJlZm9yZSB0aGUgcmF0ZSBjaGFuZ2UgYikgdGhlIG5ldyBkZXNpcmVkIENQVSBjbG9jayBy
YXRlLiBUaGlzIGlzCj4+IGJlY2F1c2Ugd2UgaGF2ZSB0d28gc3ltbWV0cmljIGNsb2NrIHRyZWVz
Lgo+Cj4gTm93LCBsZXQncyBkaXZlIGludG8gdGhlIHNwZWNpZmljcyBvZiB0aGUgaXNzdWUgd2Un
cmUgZmFjaW5nLiBJJ3ZlCj4gZXhhbWluZWQgdGhlIENMS19TRVRfUkFURV9HQVRFIGZsYWcsIHdo
aWNoLCB0byBteSB1bmRlcnN0YW5kaW5nLCBibG9ja3MKPiByYXRlIGNoYW5nZXMgZm9yIHRoZSBl
bnRpcmUgY2xvY2sgY2hhaW4uIEhvd2V2ZXIsIGluIHRoaXMgcGFydGljdWxhcgo+IHNpdHVhdGlv
biwgaXQgZG9lc24ndCBwcm92aWRlIHRoZSBzb2x1dGlvbiB3ZSBuZWVkLgo+Cj4gSGVyZSdzIHRo
ZSBwcm9ibGVtIHdlJ3JlIGRlYWxpbmcgd2l0aDoKPgo+IDEpIFRoZSBDUFUgY2xvY2sgY2FuIGhh
dmUgdGhlIGZvbGxvd2luZyBmcmVxdWVuY3kgcG9pbnRzOgo+Cj4gICBhdmFpbGFibGUgZnJlcXVl
bmN5IHN0ZXBzOiAgMTI4IE1IeiwgMjU2IE1IeiwgNTEyIE1IeiwgNzY4IE1IeiwgMS4wMSBHSHos
IDEuMjAgR0h6Cj4KPiBXaGVuIHdlIHJ1biB0aGUgY3B1cG93ZXIsIHdlIGdldCB0aGUgZm9sbG93
aW5nIGluZm9ybWF0aW9uOgo+ICMgY3B1cG93ZXIgLWMgMCwxIGZyZXF1ZW5jeS1pbmZvCj4gYW5h
bHl6aW5nIENQVSAwOgo+ICAgZHJpdmVyOiBjcHVmcmVxLWR0Cj4gICBDUFVzIHdoaWNoIHJ1biBh
dCB0aGUgc2FtZSBoYXJkd2FyZSBmcmVxdWVuY3k6IDAgMQo+ICAgQ1BVcyB3aGljaCBuZWVkIHRv
IGhhdmUgdGhlaXIgZnJlcXVlbmN5IGNvb3JkaW5hdGVkIGJ5IHNvZnR3YXJlOiAwIDEKPiAgIG1h
eGltdW0gdHJhbnNpdGlvbiBsYXRlbmN5OiA1MC4wIHVzCj4gICBoYXJkd2FyZSBsaW1pdHM6IDEy
OCBNSHogLSAxLjIwIEdIego+ICAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogIDEyOCBNSHos
IDI1NiBNSHosIDUxMiBNSHosIDc2OCBNSHosIDEuMDEgR0h6LCAxLjIwIEdIego+ICAgYXZhaWxh
YmxlIGNwdWZyZXEgZ292ZXJub3JzOiBjb25zZXJ2YXRpdmUgb25kZW1hbmQgdXNlcnNwYWNlIHBl
cmZvcm1hbmNlIHNjaGVkdXRpbAo+ICAgY3VycmVudCBwb2xpY3k6IGZyZXF1ZW5jeSBzaG91bGQg
YmUgd2l0aGluIDEyOCBNSHogYW5kIDEyOCBNSHouCj4gICAgICAgICAgICAgICAgICAgVGhlIGdv
dmVybm9yICJzY2hlZHV0aWwiIG1heSBkZWNpZGUgd2hpY2ggc3BlZWQgdG8gdXNlCj4gICAgICAg
ICAgICAgICAgICAgd2l0aGluIHRoaXMgcmFuZ2UuCj4gICBjdXJyZW50IENQVSBmcmVxdWVuY3k6
IDEyOCBNSHogKGFzc2VydGVkIGJ5IGNhbGwgdG8gaGFyZHdhcmUpCj4gYW5hbHl6aW5nIENQVSAx
Ogo+ICAgZHJpdmVyOiBjcHVmcmVxLWR0Cj4gICBDUFVzIHdoaWNoIHJ1biBhdCB0aGUgc2FtZSBo
YXJkd2FyZSBmcmVxdWVuY3k6IDAgMQo+ICAgQ1BVcyB3aGljaCBuZWVkIHRvIGhhdmUgdGhlaXIg
ZnJlcXVlbmN5IGNvb3JkaW5hdGVkIGJ5IHNvZnR3YXJlOiAwIDEKPiAgIG1heGltdW0gdHJhbnNp
dGlvbiBsYXRlbmN5OiA1MC4wIHVzCj4gICBoYXJkd2FyZSBsaW1pdHM6IDEyOCBNSHogLSAxLjIw
IEdIego+ICAgYXZhaWxhYmxlIGZyZXF1ZW5jeSBzdGVwczogIDEyOCBNSHosIDI1NiBNSHosIDUx
MiBNSHosIDc2OCBNSHosIDEuMDEgR0h6LCAxLjIwIEdIego+ICAgYXZhaWxhYmxlIGNwdWZyZXEg
Z292ZXJub3JzOiBjb25zZXJ2YXRpdmUgb25kZW1hbmQgdXNlcnNwYWNlIHBlcmZvcm1hbmNlIHNj
aGVkdXRpbAo+ICAgY3VycmVudCBwb2xpY3k6IGZyZXF1ZW5jeSBzaG91bGQgYmUgd2l0aGluIDEy
OCBNSHogYW5kIDEyOCBNSHouCj4gICAgICAgICAgICAgICAgICAgVGhlIGdvdmVybm9yICJzY2hl
ZHV0aWwiIG1heSBkZWNpZGUgd2hpY2ggc3BlZWQgdG8gdXNlCj4gICAgICAgICAgICAgICAgICAg
d2l0aGluIHRoaXMgcmFuZ2UuCj4gICBjdXJyZW50IENQVSBmcmVxdWVuY3k6IDEyOCBNSHogKGFz
c2VydGVkIGJ5IGNhbGwgdG8gaGFyZHdhcmUpCj4KPiAyKSBGb3IgdGhlIGZyZXF1ZW5jeSBwb2lu
dHMgMTI4IE1IeiwgMjU2IE1IeiwgYW5kIDUxMiBNSHosIHRoZSBDUFUgZml4ZWQKPiBjbG9jayBz
aG91bGQgYmUgdXNlZC4KCkFwcGFyZW50bHksIHlvdSBhcmUgcmVseWluZyBvbiB0aGUgU1lTIFBM
TCBsb3dlc3QgcG9zc2libGUgcmF0ZSB0bwplbmZvcmUgdGhpcyBjb250cmFpbnQsIHdoaWNoIEkg
c3VwcG9zZSBpcyAyNCAqIDMyID0gNzY4TUh6LiBJdCB3b3VsZCBiZQpuaWNlIHRvIGNsZWFybHkg
c2F5IHNvLgoKPiBGb3J0dW5hdGVseSwgd2UgZG9uJ3QgZW5jb3VudGVyIGFueSBmcmVlemUKPiBw
cm9ibGVtcyB3aGVuIHdlIGF0dGVtcHQgdG8gY2hhbmdlIGl0cyByYXRlIGF0IHRoZXNlIGZyZXF1
ZW5jaWVzLgoKVGhhdCBkb2VzIG5vdCBzb3VuZCB2ZXJ5IHNvbGlkIC4uLgoKPgo+IDMpIEhvd2V2
ZXIsIGZvciB0aGUgZnJlcXVlbmN5IHBvaW50cyA3NjggTUh6LCAxLjAxIEdIeiwgYW5kIDEuMjAg
R0h6LAo+IHRoZSBzeXNfcGxsIGlzIHVzZWQgYXMgdGhlIGNsb2NrIHNvdXJjZSBiZWNhdXNlIGl0
J3MgYSBmYXN0ZXIgb3B0aW9uLgo+IE5vdywgbGV0J3MgaW1hZ2luZSB0aGF0IHdlIHdhbnQgdG8g
Y2hhbmdlIHRoZSBDUFUgY2xvY2sgZnJvbSA3NjggTUh6IHRvCj4gMS4wMSBHSHouIFVuZm9ydHVu
YXRlbHksIGl0J3Mgbm90IHBvc3NpYmxlIGR1ZSB0byB0aGUgYnJva2VuIHN5c19wbGwsCj4gYW5k
IGFueSBleGVjdXRpb24gYXR0ZW1wdHMgd2lsbCByZXN1bHQgaW4gYSBoYW5nLgoKLi4uIEJlY2F1
c2UgUExMIG5lZWRzIHRvIHJlbG9jaywgaXQgaXMgZ29pbmcgdG8gYmUgb2ZmIGZvciBhIHdoaWxl
LiBUaGF0CmlzIG5vdCAiYnJva2VuIiwgdW5sZXNzIHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlID8K
Cj4KPiA0KSBBcyB5b3UgY2FuIG9ic2VydmUsIGluIHRoaXMgY2FzZSwgd2UgYWN0dWFsbHkgZG9u
J3QgbmVlZCB0byBsb2NrIHRoZQo+IHJhdGUgZm9yIHRoZSBzeXNfcGxsIGNoYWluLgoKSW4gd2hp
Y2ggY2FzZSA/IEknbSBsb3N0LgoKPiBXZSB3YW50IHRvIGNoYW5nZSB0aGUgcmF0ZSBpbnN0ZWFk
LgoKLi4uIEhvdyBhcmUgeW91IGdvaW5nIHRvIGRvIHRoYXQgd2l0aG91dCByZWxvY2tpbmcgdGhl
IFBMTCA/Cgo+IEhlbmNlLAo+IEknbSBub3QgYXdhcmUgb2YgYW55IG90aGVyIG1ldGhvZCB0byBh
Y2hpZXZlIHRoaXMgZXhjZXB0IGJ5IHN3aXRjaGluZwo+IHRoZSBjcHVfY2xrIHBhcmVudCB0byBh
IHN0YWJsZSBjbG9jayB1c2luZyBjbG9jayBub3RpZmllciBibG9jay4KPiBJbnRlcmVzdGluZ2x5
LCBJJ3ZlIG5vdGljZWQgYSBzaW1pbGFyIGFwcHJvYWNoIGluIHRoZSBDUFUgY2xvY2sgZHJpdmVy
cwo+IG9mIFJvY2tjaGlwLCBRdWFsY29tbSwgYW5kIE1lZGlhdGVrLgoKVGhlcmUgaXMgYW4gZXhh
bXBsZSBvZiBzeXNwbGwgbm90aWZpZXIgaW4gdGhlIGcxMiBjbG9jayBjb250cm9sbGVyLgpZb3Ug
c2hvdWxkIGhhdmUgYSBsb29rIGF0IGl0CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
