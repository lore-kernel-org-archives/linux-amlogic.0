Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC96CCA474
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Oct 2025 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82IR+mrD1LNgrINbxO4nh/0bIZM9yJQMX0uAJ3eJHoc=; b=pci0NVSTq3nqYP
	0ubVd5rNkgIHbk41SNbdZ6o38PMJtTz2FH+E5v6379ZRkMWIWUFhcHrOp/URjyxnP8FUjPAwZgJsB
	48H2r5Io6PiWITTf7A9tz4+GuvvznEhl4OeP4Bokj0DoBxSEtmMRGoTkoWhpP2RUN5/oyT9JWaw/D
	BAiHyjKZZhOut4zSO5h81w8iXxeaXwSHj0iM27aeglvVrw11/j59egBlr3JXmlF5iThRQvhRV5yuZ
	7NCr/EwFyX5VHVXnqZXg+JTmtLfMPviH0WE4dLYHLpLa36de/SADYszdMlkSVqTjbo9wDyRAIB0Bm
	1PlpxdVOGP4uwDbqyfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rWS-00000006wJK-3bVJ;
	Wed, 01 Oct 2025 07:45:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rWQ-00000006wIT-0acY
	for linux-amlogic@lists.infradead.org;
	Wed, 01 Oct 2025 07:45:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so52703665e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Oct 2025 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759304708; x=1759909508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg7VWjS0JkeDUM38Rnu5q8oeFtV0qmFaVpXseuYx1QE=;
        b=DjuqbijF1H9t7TSZhEb8HK1hAHTA27wpSefXrerhymehCrSXZuRpGK1raZ57qGDiWq
         Ny6xCr01rkTR3ljWMsNGrTQsEYXsxzPyUEum+WrlaV7jXEx9/6xHqE2jumZ8gyPaN6lp
         ABykNEPvp/bJ18BU0nospEsuu0zr2rSEh5w4/mw18ijmlz5setUhdrz9Xup2RTIovBxZ
         sX8bYekYOLcO8fxQUzmAP4baIrQDBelGTNUmtjGddmZzBapRcnibzyoZYPERa75tM8bQ
         iq6NxOvLmWjKxLOF1r1CcjgakcBIEJ3FZgLEZnKBHIe3LhIkaQIxRRvla8pAhbNpfbqF
         KTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759304708; x=1759909508;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qg7VWjS0JkeDUM38Rnu5q8oeFtV0qmFaVpXseuYx1QE=;
        b=ZzxwgAa9s46+r/DidU7Jsh1p9iqzBw0V5omvAYw7qy7pv4E/+j7tnATVwfp+33A/gb
         Y5sySGurOplguJbCBTl5JE1uu/tNMmW9xQSLN3pKY7mNPR87998wijml+IgsjnAJ3AR7
         qqFaKCYDQNHCG5Oe61m7hF4gxUBipI1HYzl/DSyYt2F+pjnNLti38NDIDyF3VW51K+XJ
         JFkVoYyv+Eko6iOT0R+vSj+5fWYJFzsV8PWQ6uAqlDH4G5IYyFm54+hRzbSvmtJzOh7e
         E/ESy6urP1iRZpcCekbzqP308ZpXfTW8DTFNtVBPGd0DOwtbW0ASyXLb03cT1cRtn1WS
         NJcA==
X-Forwarded-Encrypted: i=1; AJvYcCXFcuOt4/1rZYpO3ghkklQOFBtph2wo7H+Xl+AmwqSBlWK+kTSYzuyDY/t2jX4ihtRoWq2pVHj5gPCW97CO@lists.infradead.org
X-Gm-Message-State: AOJu0YwQtsdw5b5gH9lA00M6lhw/H5JOkgnRTFB3eQCt1b5TxaZRv9sb
	RMHXvxoI3Ga2DeYTgwumXdqHqzM95Mi8qyiPee45RkNoqPQMbW6hdtghbAIl2i+TvF4=
X-Gm-Gg: ASbGncvs6elx45Fg1bGAdCpUVpboS+VCdpNNTQGqbnemez6X4K7TJ7966uIYdeXhjUe
	zwYTiBhGagTO34T8EGnQvOenp+dKnU+f5a8wNeAy6AX75doD+QprLMUTDPPDU5R1GIIjdnwp0y7
	cmXNJKM6pmYjFpYENkeTj7WRbNAhGA9x1wo/FvMnJdiyeXXRAkGoeb9pmY41i/M0AhrC4JWbMM/
	TJTknrq9kfO6opWIomRbtTr+ZT2IgMyjBYl17PzO6LrvscwDGqVUaNEn2XRNmYLyIEEmEciihNX
	a9Uh9fLxfPtavcBhjMQB6sgxk4VqBCnRvPw0sTesva1VU78/8WnEzh8Uo/hr+BZGywzJobo2Z0v
	3ybhtYQ6yHz8co2vXxJpT/QXpMN1D4BN4ON1FMvEpjrBy5A==
X-Google-Smtp-Source: AGHT+IFoRjI2Zw2x09D63Jf0YC7whoQC5cYnsETwVyuJVa3Ra7wHW3S2yFZ3fp1jDTOz8cPlStVCVA==
X-Received: by 2002:a05:600c:6812:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-46e611a1fa9mr20772605e9.0.1759304707793;
        Wed, 01 Oct 2025 00:45:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ec6d:2bf4:7406:4872])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619a6fc8sm26382545e9.13.2025.10.01.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:45:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
	(Chuan Liu via's message of "Tue, 30 Sep 2025 17:37:13 +0800")
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 01 Oct 2025 09:45:06 +0200
Message-ID: <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_004510_450484_47B7A270 
X-CRM114-Status: GOOD (  22.25  )
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

T24gVHVlIDMwIFNlcCAyMDI1IGF0IDE3OjM3LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5IDxkZXZu
dWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhpcyBwYXRj
aCBzZXJpZXMgaW5jbHVkZXMgY2hhbmdlcyByZWxhdGVkIHRvIHRoZSBQTEwgYW5kIHBlcmlwaGVy
YWwKPiBjbG9ja3MgZm9yIGJvdGggdGhlIEE0IGFuZCBBNSBTb0NzLgo+Cj4gVGhlIHBhdGNoZXMg
Zm9yIEE1IHdlcmUgcHJldmlvdXNseSBzdWJtaXR0ZWQgdXAgdG8gVjMgYnkgWGlhbndlaS4KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMDMtYTUtY2xrLXYzLTAtYTIwN2NlODNi
OWU5QGFtbG9naWMuY29tLwo+IEFmdGVyIGZyaWVuZGx5IGNvb3JkaW5hdGlvbiwgSeKAmXZlIHRh
a2VuIG92ZXIgYW5kIGNvbnRpbnVlZCB0aGUKPiBzdWJtaXNzaW9uIGFzIHBhcnQgb2YgdGhpcyBz
ZXJpZXMuIFRoZSBkdC1iaW5kaW5ncyBwYXRjaCByZXRhaW5zIFJvYidzCj4gb3JpZ2luYWwgIlJl
dmlld2VkLWJ5IiB0YWcsIGFuZCBJIGhvcGUgdGhpcyBoYXNu4oCZdCBjYXVzZWQgYW55Cj4gYWRk
aXRpb25hbCBjb25mdXNpb24uCgouLi4gYW5kIHlldCB5b3UgcmVzdGFydCB0aGUgdmVyc2lvbmlu
ZyBvZiB0aGUgc2VyaWVzIG1ha2luZyBpdCBoYXJkZXIKZm9yIHBlb3BsZSB0byBmb2xsb3cgdGhh
dAoKPgo+IEJvdGggQTQgYW5kIEE1IGJlbG9uZyB0byB0aGUgQXVkaW8gc2VyaWVzLiBKdWRnaW5n
IGJ5IHRoZWlyIG5hbWVzLCBvbmUKPiBtaWdodCBhc3N1bWUgdGhhdCBBNSBpcyBhbiB1cGdyYWRl
IHRvIEE0LCBidXQgaW4gZmFjdCwgQTUgd2FzIHJlbGVhc2VkCj4gYSB5ZWFyIGVhcmxpZXIgdGhh
biBBNC4KPgo+IFNpbmNlIHRoZXJlIGFyZSBkaWZmZXJlbmNlcyBpbiB0aGUgUExMcyBhbmQgcGVy
aXBoZXJhbCBjbG9ja3MgYmV0d2Vlbgo+IHRoZSBBNCBhbmQgQTUgU29DcyAoZXNwZWNpYWxseSB0
aGUgUExMKSwgYW5kIHRha2luZyBpbnRvIGFjY291bnQgZmFjdG9ycwo+IHN1Y2ggYXMgbWVtb3J5
IGZvb3RwcmludCBhbmQgbWFpbnRhaW5hYmlsaXR5LCB0aGlzIHNlcmllcyBkb2VzIG5vdAo+IGF0
dGVtcHQgdG8gbWVyZ2UgdGhlIHR3byBpbnRvIGEgc2hhcmVkIGRyaXZlciBhcyB3YXMgZG9uZSBm
b3IKPiBHMTJBL0cxMkIvU00xLgoKLi4uIGFuZCB3ZSBlbmQgdXAgd2l0aCAxOSBwYXRjaGVzIHNl
cmllcyB3aGlsZSBpdCBjb3VsZCBiZSBzcGxpdHRlZCBpbnRvCm1hbmFnZWFibGUgc2VyaWVzLCBm
b3IgZWFjaCBjb250cm9sbGVyIG9mIGVhY2ggU29DCgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaW5j
bHVkZXMgYWxsIHJlbGF0ZWQgZHQtYmluZGluZ3MsIGRyaXZlciwgYW5kIGR0cwo+IGNoYW5nZXMg
Zm9yIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2Nrcy4gRm9sbG93aW5nIG91ciBwYXN0IGNv
bnZlbnRpb24KPiBmb3IgY2xvY2stcmVsYXRlZCBzdWJtaXNzaW9ucywgdGhlIGR0cyBjaGFuZ2Vz
IGFyZSBwbGFjZWQgYXQgdGhlIGVuZAo+IGFuZCBzdWJtaXR0ZWQgc2VwYXJhdGVseS4gSWYgdGhp
cyBvcmRlcmluZyBtYWtlcyBpdCBoYXJkZXIgZm9yCj4gbWFpbnRhaW5lcnMgdG8gcmV2aWV3IG9y
IHBpY2sgcGF0Y2hlcywgcGxlYXNlIGZlZWwgZnJlZSB0byBwb2ludCBpdCBvdXQuCj4KPiBDby1k
ZXZlbG9wZWQtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgo+IC0tLQo+IENo
dWFuIExpdSAoMTkpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTQg
U0NNSSBjbG9jayBjb250cm9sbGVyCj4gICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1s
b2dpYyBBNCBQTEwgY2xvY2sgY29udHJvbGxlcgo+ICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazog
QWRkIEFtbG9naWMgQTQgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgo+ICAgICAgIGNsazog
YW1sb2dpYzogT3B0aW1pemUgUExMIGVuYWJsZSB0aW1pbmcKPiAgICAgICBjbGs6IGFtbG9naWM6
IENvcnJlY3QgbF9kZXRlY3QgYml0IGNvbnRyb2wKPiAgICAgICBjbGs6IGFtbG9naWM6IEZpeCBv
dXQtb2YtcmFuZ2UgUExMIGZyZXF1ZW5jeSBzZXR0aW5nCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBB
ZGQgQTQgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBB
ZGQgQTQgY2xvY2sgcGVyaXBoZXJhbHMgY29udHJvbGxlciBkcml2ZXIKPiAgICAgICBhcm02NDog
ZHRzOiBhbWxvZ2ljOiBBNDogQWRkIHNjbWktY2xrIG5vZGUKPiAgICAgICBhcm02NDogZHRzOiBh
bWxvZ2ljOiBBNDogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPiAgICAgICBhcm02NDogZHRzOiBh
bWxvZ2ljOiBBNDogQWRkIHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgbm9kZQo+ICAgICAg
IGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgU0NNSSBjbG9jayBjb250cm9sbGVy
IHN1cHBvcnQKPiAgICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBbWxvZ2ljIEE1IFBMTCBj
bG9jayBjb250cm9sbGVyCj4gICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBB
NSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQg
QTUgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQg
QTUgY2xvY2sgcGVyaXBoZXJhbHMgY29udHJvbGxlciBkcml2ZXIKPiAgICAgICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBBNTogQWRkIHNjbWktY2xrIG5vZGUKPiAgICAgICBhcm02NDogZHRzOiBhbWxv
Z2ljOiBBNTogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPiAgICAgICBhcm02NDogZHRzOiBhbWxv
Z2ljOiBBNTogQWRkIHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciBub2RlCj4KPiAgLi4uL2Ns
b2NrL2FtbG9naWMsYTQtcGVyaXBoZXJhbHMtY2xrYy55YW1sICAgICAgICAgfCAxMjIgKysrCj4g
IC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE0LXBsbC1jbGtjLnlhbWwgICAgICAgIHwgIDYx
ICsrCj4gIC4uLi9jbG9jay9hbWxvZ2ljLGE1LXBlcmlwaGVyYWxzLWNsa2MueWFtbCAgICAgICAg
IHwgMTM0ICsrKysKPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTUtcGxsLWNsa2MueWFt
bCAgICAgICAgfCAgNjMgKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMt
YTQuZHRzaSAgICAgICAgfCAgODAgKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2Ft
bG9naWMtYTUuZHRzaSAgICAgICAgfCAgODcgKysKPiAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTMgKysKPiAgZHJpdmVycy9jbGsvbWVzb24v
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwo+ICBkcml2ZXJzL2Nsay9t
ZXNvbi9hMS1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMv
Y2xrL21lc29uL2E0LXBlcmlwaGVyYWxzLmMgICAgICAgICAgICAgICAgIHwgNzY0ICsrKysrKysr
KysrKysrKysrKwo+ICBkcml2ZXJzL2Nsay9tZXNvbi9hNC1wbGwuYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDI0MiArKysrKysKPiAgZHJpdmVycy9jbGsvbWVzb24vYTUtcGVyaXBoZXJhbHMu
YyAgICAgICAgICAgICAgICAgfCA4ODMgKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMv
Y2xrL21lc29uL2E1LXBsbC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDc2ICsrKysrKysr
KysrCj4gIGRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDc2ICstCj4gIGRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICsKPiAgLi4uL2Nsb2NrL2FtbG9naWMsYTQtcGVyaXBoZXJhbHMtY2xrYy5o
ICAgICAgICAgICAgfCAxMjkgKysrCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxhNC1wbGwtY2xrYy5oICAgIHwgIDE1ICsKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9h
bWxvZ2ljLGE0LXNjbWktY2xrYy5oICAgfCAgNDIgKwo+ICAuLi4vY2xvY2svYW1sb2dpYyxhNS1w
ZXJpcGhlcmFscy1jbGtjLmggICAgICAgICAgICB8IDEzMiArKysKPiAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9hbWxvZ2ljLGE1LXBsbC1jbGtjLmggICAgfCAgMjQgKwo+ICBpbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTUtc2NtaS1jbGtjLmggICB8ICA0NCArCj4gIDIxIGZp
bGVzIGNoYW5nZWQsIDM0MDYgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gLS0tCj4g
YmFzZS1jb21taXQ6IDAxZjNhNmQxZDU5YjhlMjVhNmRlMjQzYjBkNzMwNzVjZjA0MTVlYWYKPiBj
aGFuZ2UtaWQ6IDIwMjUwOTI4LWE0X2E1X2FkZF9jbG9ja19kcml2ZXItMmI3YzlkNjk1NjMzCj4K
PiBCZXN0IHJlZ2FyZHMsCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
