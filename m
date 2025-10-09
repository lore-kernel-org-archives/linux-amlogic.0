Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E0CCA470
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Oct 2025 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1c6hM/ThHOYD0g48GD+wmIhNN6ezY/Dutxk/jeyf84=; b=gZqSq6ITtsTp1J
	NgB5WPoSxfcEBfJl6PEJDg/1ocCnv9Kw1wJir+/h4q7WcXA5It2dyy/ns0lnKfQanNiC7Zrm2MsY5
	FNXAKcdPzPdt4kL5UR+wQoJfwdZI6XC4SkEvkf8AIJx7HgEVn/kEoUZ3nu0K6ziyWbyrDcyRdAPE4
	RuqrfEjCBfvTDIukqQGfJy++6+U7S1i6iWPtX8IsBj/OBgUddu1kM9f3TT7W8pRXmc9XKEIMhC2nB
	zrE1SAU1D0mHYbmWvLUkijxUOsQpU+pX4/TxUE0GpW66YcAgrV6gFJQRMKB7ophGijpnPRzhvzlxS
	sX7msPRWqYL8F318CBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lYe-00000005QMh-2d7Q;
	Thu, 09 Oct 2025 07:59:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lYb-00000005QLP-1YG0
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Oct 2025 07:59:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3fa528f127fso518396f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Oct 2025 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759996763; x=1760601563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=Fsb3ucN4fhG72Sodj6LcyXrihZiVsbpa12YhXd9r4sMb8wNsnKNDX+Ih0KIm3hkBTZ
         SeojKG89xF9TmyNGgs1tQqlxn+mTFndiH9ihJ9b0z6G4mwhfUrQ8LH/tcXtFIA90iGKI
         HJ71+Iv0PCwfJoTEhYiroi4BgN0gpnpEwJFy0poVpcZvxOHRkoCKuDRO0UXrmSFy043f
         88bGKh2pTRvSlv6fA4CanuwiAu4S3F022SoiUnaBofsS2oGbVUSYk1/R/ZYxkY+WMnjg
         teoXvWI59MbbVwEKprixVLJLP1/zgEc09reJLMHLWYTaKL2/uCLoQL6kWqRN2ZOm579j
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996763; x=1760601563;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utVwjhO8Z9nfTT7T332+x9pXtf82IVN0SHJivYwFQFM=;
        b=DbProygPuLwELIWGwQGfKCleIV8HoWoaxKz2cY8CQwRR1BMjcNX3fCdpT5gvThzXCW
         +cNz+ob6OuBp7z+eEa3ETjyCFP6PT84TQVat55w0sqjTiFyWw3/AzwX7VtTwpN8ytB+S
         3lg8g13ITrFM0sDO0wUcD/GkmylxA76VSumiC8RlUn4vyx6P1CdO387f291u9hYbhICN
         IXWJUvO8gPLh2MtjIT6SAk+TZpx1yvd8QFll+6EjtpGUk2iPO/EIwXnwP2CJiMzcrkpF
         zOCck/Bi0njp1W0s6+0odHtynuestHIoJPL9X5/kGU6+ngZh36mBg7UlxJ71EVYD4dw1
         Lryg==
X-Forwarded-Encrypted: i=1; AJvYcCX5x9HLsbGVDbrKH9Slbilo/q7h3uBrLoJckTZdvbzriZJgujR29NMDjlxhcBoPfd9LeCLatE6XK2z7NUzP@lists.infradead.org
X-Gm-Message-State: AOJu0YzO2ssBm7e35e0tMGyEenq1RtQP8vYVEHl7vtZV/+z7qNEAT0oC
	RG+/opKa2dLfIUUZvlj7sdB5gciiJ4D0uHQkylnPQmrFuYaEKnOWDAFCU/UnElhRczk=
X-Gm-Gg: ASbGncuYE21KIWDkHBRfc4GDDsUmsZWLa+TQA/0rZqc4iu/D7UBWnOSjYK1/QfCseIP
	MudOssG81NX12FyQDLJhRDXsjJ7dud96P6U7hobhMuU1Fkhbv9ar/mHSnJUYW31eTF5lifjRVSE
	mDwRklZcmhdS+ykyKBvkUCtpN67JcgDrb5K0hs820xFoIf3RRSyclPb3H0jx9W8bNkaTjI3Bjrq
	vUKUDByC+r4ji4yIYpiq9m7cVoea4UDl63VvnVWo6uS2e5UvaBD5OgCAOD6HZZAZS4BtqtskirQ
	h5ObG4Z2ORPGQxM8N6FQ7jXFeFf7Awl1/vYSgNhOMxoLKD9+l/LuMtQVrh5oZ3YcCF5NXx1PW9y
	3tTr3DfkqXsytFtIwJRVhBErJ5cPIHrSN1ujYFJXjbeRXzqW0wN6jH4BT
X-Google-Smtp-Source: AGHT+IG5pvNgDMJPTKAtRd4veVO0FFUkU2pJXXO+YNn1lCJbx4D7Y9oh8jCMqxVVxc+i8Y4GbC2AVA==
X-Received: by 2002:a05:6000:2c02:b0:401:ae97:a1ab with SMTP id ffacd0b85a97d-42666aa67f9mr4871037f8f.10.1759996763143;
        Thu, 09 Oct 2025 00:59:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1753:6135:be55:f8ab])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8ab8fdsm32990864f8f.15.2025.10.09.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 00:59:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
In-Reply-To: <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com> (Chuan Liu's
	message of "Thu, 9 Oct 2025 11:09:25 +0800")
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
	<1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
	<b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 09 Oct 2025 09:59:22 +0200
Message-ID: <1jh5w84iat.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_005925_434457_23AAD82F 
X-CRM114-Status: GOOD (  27.95  )
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

T24gVGh1IDA5IE9jdCAyMDI1IGF0IDExOjA5LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIEplcm9tZSwKPgo+IMKgIMKgIFRoYW5rcyBmb3IgeW91ciByZXZp
ZXcsIGJlY2F1c2UgdGhlIG5hdGlvbmFsIGRheSBob2xpZGF5cyBkaWQgbm90Cj4gdGltZWx5IGZl
ZWRiYWNrLgo+Cj4KPiBPbiAxMC8xLzIwMjUgMzo0NSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIFR1ZSAzMCBTZXAgMjAyNSBhdCAxNzozNywg
Q2h1YW4gTGl1IHZpYSBCNCBSZWxheQo+PiA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21A
a2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+PiBUaGlzIHBhdGNoIHNlcmllcyBpbmNsdWRlcyBjaGFu
Z2VzIHJlbGF0ZWQgdG8gdGhlIFBMTCBhbmQgcGVyaXBoZXJhbAo+Pj4gY2xvY2tzIGZvciBib3Ro
IHRoZSBBNCBhbmQgQTUgU29Dcy4KPj4+Cj4+PiBUaGUgcGF0Y2hlcyBmb3IgQTUgd2VyZSBwcmV2
aW91c2x5IHN1Ym1pdHRlZCB1cCB0byBWMyBieSBYaWFud2VpLgo+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwMTAzLWE1LWNsay12My0wLWEyMDdjZTgzYjllOUBhbWxvZ2ljLmNv
bS8KPj4+IEFmdGVyIGZyaWVuZGx5IGNvb3JkaW5hdGlvbiwgSeKAmXZlIHRha2VuIG92ZXIgYW5k
IGNvbnRpbnVlZCB0aGUKPj4+IHN1Ym1pc3Npb24gYXMgcGFydCBvZiB0aGlzIHNlcmllcy4gVGhl
IGR0LWJpbmRpbmdzIHBhdGNoIHJldGFpbnMgUm9iJ3MKPj4+IG9yaWdpbmFsICJSZXZpZXdlZC1i
eSIgdGFnLCBhbmQgSSBob3BlIHRoaXMgaGFzbuKAmXQgY2F1c2VkIGFueQo+Pj4gYWRkaXRpb25h
bCBjb25mdXNpb24uCj4+IC4uLiBhbmQgeWV0IHlvdSByZXN0YXJ0IHRoZSB2ZXJzaW9uaW5nIG9m
IHRoZSBzZXJpZXMgbWFraW5nIGl0IGhhcmRlcgo+PiBmb3IgcGVvcGxlIHRvIGZvbGxvdyB0aGF0
Cj4KPgo+IFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSBjYXVzZWQuIFRoZSBtYWluIGNoYW5n
ZXMgY29tcGFyZWQgdG8gdGhlCj4gcHJldmlvdXMgdmVyc2lvbiBieSBYaWFud2VpIGFyZSBpbiB0
aGUgZHJpdmVyIHBhcnQuCj4KPiBUaGUgZHQtYmluZGluZ3MgcGFydCBvbmx5IGhhcyBtaW5vciBt
b2RpZmljYXRpb25zIGluIFtQQVRDSCAxNC8xOV0uCj4KPiBUaGUgZHJpdmVyIHBhcnQgaGFzIHJl
bGF0aXZlbHkgbGFyZ2VyIGNoYW5nZXMgYmVjYXVzZSBpdCBuZWVkcyB0byBiZQo+IGJhc2VkIG9u
IHRoZSBjb2RlIGJhc2UgeW91IHByZXZpb3VzbHkgc3VibWl0dGVkLgoKSSdtIG5vdCBzZWVpbmcg
YSBqdXN0aWZpY2F0aW9uIGZvciB0aGUgbWVzcyBpbnRyb2R1Y2VkIGFuZCBJJ20gbm90Cmxvb2tp
bmcgZm9yIG9uZSB0byBiZSBob25lc3QKCj4KPj4+IEJvdGggQTQgYW5kIEE1IGJlbG9uZyB0byB0
aGUgQXVkaW8gc2VyaWVzLiBKdWRnaW5nIGJ5IHRoZWlyIG5hbWVzLCBvbmUKPj4+IG1pZ2h0IGFz
c3VtZSB0aGF0IEE1IGlzIGFuIHVwZ3JhZGUgdG8gQTQsIGJ1dCBpbiBmYWN0LCBBNSB3YXMgcmVs
ZWFzZWQKPj4+IGEgeWVhciBlYXJsaWVyIHRoYW4gQTQuCj4+Pgo+Pj4gU2luY2UgdGhlcmUgYXJl
IGRpZmZlcmVuY2VzIGluIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2NrcyBiZXR3ZWVuCj4+
PiB0aGUgQTQgYW5kIEE1IFNvQ3MgKGVzcGVjaWFsbHkgdGhlIFBMTCksIGFuZCB0YWtpbmcgaW50
byBhY2NvdW50IGZhY3RvcnMKPj4+IHN1Y2ggYXMgbWVtb3J5IGZvb3RwcmludCBhbmQgbWFpbnRh
aW5hYmlsaXR5LCB0aGlzIHNlcmllcyBkb2VzIG5vdAo+Pj4gYXR0ZW1wdCB0byBtZXJnZSB0aGUg
dHdvIGludG8gYSBzaGFyZWQgZHJpdmVyIGFzIHdhcyBkb25lIGZvcgo+Pj4gRzEyQS9HMTJCL1NN
MS4KPj4gLi4uIGFuZCB3ZSBlbmQgdXAgd2l0aCAxOSBwYXRjaGVzIHNlcmllcyB3aGlsZSBpdCBj
b3VsZCBiZSBzcGxpdHRlZCBpbnRvCj4+IG1hbmFnZWFibGUgc2VyaWVzLCBmb3IgZWFjaCBjb250
cm9sbGVyIG9mIGVhY2ggU29DCj4KPgo+IEknbSBub3Qgc3VyZSBpZiBJIHVuZGVyc3Rvb2QgeW91
IGNvcnJlY3RseS4KPgo+IERvIHlvdSBtZWFuIHRoYXQgSSBzaG91bGQgc3BsaXQgdGhpcyBzZXJp
ZXMgb2YgMTkgcGF0Y2hlcyBpbnRvIG11bHRpcGxlCj4gcGF0Y2ggc2VyaWVzIGFuZCBzZW5kIHRo
ZW0gc2VwYXJhdGVseT8gRm9yIGV4YW1wbGU6Cj4gc2VyaWUgMTogQTQgU0NNSSBjbG9jayBjb250
cm9sbGVyIChkdC1iaW5kaW5ncykKPiBzZXJpZSAyOiBBNCBQTEwgY2xvY2sgY29udHJvbGxlciAo
ZHQtYmluZGluZ3MsIGRyaXZlciwgZHRzKQo+IHNlcmllIDM6IEE0IHBlcmlwaGVyYWxzIGNsb2Nr
IGNvbnRyb2xsZXIgKGR0LWJpbmRpbmdzLCBkcml2ZXIsIGR0cykKPiAuLi4gQTUgc2ltaWxhcmx5
PwoKVGhpbmdzIHRoYXQgZG8gbm90IGFjdHVhbGx5IGRlcGVuZHMgb24gZWFjaCBvdGhlciBvciB3
aGljaCBhcmUgbm90Cm1lcmdlZCB0aHJvdWdoIHRoZSBzYW1lIHRyZWUgc2hvdWxkIG5vdCBiZSBz
ZW50IHRvZ2V0aGVyLiBUaGVyZSBpcwpub3RoaW5nIG5ldyBoZXJlLiBTYW1lIGJhc2ljIHJlbWlu
ZGVycyBvbiBlYWNoIHN1Ym1pc3Npb24uCgo+Cj4KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGluY2x1
ZGVzIGFsbCByZWxhdGVkIGR0LWJpbmRpbmdzLCBkcml2ZXIsIGFuZCBkdHMKPj4+IGNoYW5nZXMg
Zm9yIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2Nrcy4gRm9sbG93aW5nIG91ciBwYXN0IGNv
bnZlbnRpb24KPj4+IGZvciBjbG9jay1yZWxhdGVkIHN1Ym1pc3Npb25zLCB0aGUgZHRzIGNoYW5n
ZXMgYXJlIHBsYWNlZCBhdCB0aGUgZW5kCj4+PiBhbmQgc3VibWl0dGVkIHNlcGFyYXRlbHkuIElm
IHRoaXMgb3JkZXJpbmcgbWFrZXMgaXQgaGFyZGVyIGZvcgo+Pj4gbWFpbnRhaW5lcnMgdG8gcmV2
aWV3IG9yIHBpY2sgcGF0Y2hlcywgcGxlYXNlIGZlZWwgZnJlZSB0byBwb2ludCBpdCBvdXQuCj4+
Pgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2lj
LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5j
b20+Cj4+PiAtLS0KPj4+IENodWFuIExpdSAoMTkpOgo+Pj4gICAgICAgIGR0LWJpbmRpbmdzOiBj
bG9jazogQWRkIEFtbG9naWMgQTQgU0NNSSBjbG9jayBjb250cm9sbGVyCj4+PiAgICAgICAgZHQt
YmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBBNCBQTEwgY2xvY2sgY29udHJvbGxlcgo+Pj4g
ICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTQgcGVyaXBoZXJhbHMgY2xv
Y2sgY29udHJvbGxlcgo+Pj4gICAgICAgIGNsazogYW1sb2dpYzogT3B0aW1pemUgUExMIGVuYWJs
ZSB0aW1pbmcKPj4+ICAgICAgICBjbGs6IGFtbG9naWM6IENvcnJlY3QgbF9kZXRlY3QgYml0IGNv
bnRyb2wKPj4+ICAgICAgICBjbGs6IGFtbG9naWM6IEZpeCBvdXQtb2YtcmFuZ2UgUExMIGZyZXF1
ZW5jeSBzZXR0aW5nCj4+PiAgICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgQTQgUExMIGNsb2NrIGNv
bnRyb2xsZXIgZHJpdmVyCj4+PiAgICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgQTQgY2xvY2sgcGVy
aXBoZXJhbHMgY29udHJvbGxlciBkcml2ZXIKPj4+ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2lj
OiBBNDogQWRkIHNjbWktY2xrIG5vZGUKPj4+ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBB
NDogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPj4+ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2lj
OiBBNDogQWRkIHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgbm9kZQo+Pj4gICAgICAgIGR0
LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgU0NNSSBjbG9jayBjb250cm9sbGVyIHN1
cHBvcnQKPj4+ICAgICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBbWxvZ2ljIEE1IFBMTCBj
bG9jayBjb250cm9sbGVyCj4+PiAgICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dp
YyBBNSBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyCj4+PiAgICAgICAgY2xrOiBhbWxvZ2lj
OiBBZGQgQTUgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCj4+PiAgICAgICAgY2xrOiBhbWxv
Z2ljOiBBZGQgQTUgY2xvY2sgcGVyaXBoZXJhbHMgY29udHJvbGxlciBkcml2ZXIKPj4+ICAgICAg
ICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIHNjbWktY2xrIG5vZGUKPj4+ICAgICAgICBh
cm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPj4+ICAgICAg
ICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxl
ciBub2RlCj4+Pgo+Pj4gICAuLi4vY2xvY2svYW1sb2dpYyxhNC1wZXJpcGhlcmFscy1jbGtjLnlh
bWwgICAgICAgICB8IDEyMiArKysKPj4+ICAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTQt
cGxsLWNsa2MueWFtbCAgICAgICAgfCAgNjEgKysKPj4+ICAgLi4uL2Nsb2NrL2FtbG9naWMsYTUt
cGVyaXBoZXJhbHMtY2xrYy55YW1sICAgICAgICAgfCAxMzQgKysrKwo+Pj4gICAuLi4vYmluZGlu
Z3MvY2xvY2svYW1sb2dpYyxhNS1wbGwtY2xrYy55YW1sICAgICAgICB8ICA2MyArKwo+Pj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNC5kdHNpICAgICAgICB8ICA4MCAr
Kwo+Pj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNS5kdHNpICAgICAg
ICB8ICA4NyArKwo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1MyArKwo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4+PiAgIGRyaXZlcnMvY2xrL21lc29uL2ExLXBs
bC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4+ICAgZHJpdmVycy9jbGsvbWVz
b24vYTQtcGVyaXBoZXJhbHMuYyAgICAgICAgICAgICAgICAgfCA3NjQgKysrKysrKysrKysrKysr
KysrCj4+PiAgIGRyaXZlcnMvY2xrL21lc29uL2E0LXBsbC5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMjQyICsrKysrKwo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9hNS1wZXJpcGhlcmFscy5j
ICAgICAgICAgICAgICAgICB8IDg4MyArKysrKysrKysrKysrKysrKysrKysKPj4+ICAgZHJpdmVy
cy9jbGsvbWVzb24vYTUtcGxsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA0NzYgKysrKysr
KysrKysKPj4+ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNzYgKy0KPj4+ICAgZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5oICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKwo+Pj4gICAuLi4vY2xvY2svYW1sb2dpYyxhNC1wZXJpcGhl
cmFscy1jbGtjLmggICAgICAgICAgICB8IDEyOSArKysKPj4+ICAgaW5jbHVkZS9kdC1iaW5kaW5n
cy9jbG9jay9hbWxvZ2ljLGE0LXBsbC1jbGtjLmggICAgfCAgMTUgKwo+Pj4gICBpbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTQtc2NtaS1jbGtjLmggICB8ICA0MiArCj4+PiAgIC4u
Li9jbG9jay9hbWxvZ2ljLGE1LXBlcmlwaGVyYWxzLWNsa2MuaCAgICAgICAgICAgIHwgMTMyICsr
Kwo+Pj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTUtcGxsLWNsa2MuaCAg
ICB8ICAyNCArCj4+PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1zY21p
LWNsa2MuaCAgIHwgIDQ0ICsKPj4+ICAgMjEgZmlsZXMgY2hhbmdlZCwgMzQwNiBpbnNlcnRpb25z
KCspLCAyOCBkZWxldGlvbnMoLSkKPj4+IC0tLQo+Pj4gYmFzZS1jb21taXQ6IDAxZjNhNmQxZDU5
YjhlMjVhNmRlMjQzYjBkNzMwNzVjZjA0MTVlYWYKPj4+IGNoYW5nZS1pZDogMjAyNTA5MjgtYTRf
YTVfYWRkX2Nsb2NrX2RyaXZlci0yYjdjOWQ2OTU2MzMKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+
IC0tCj4+IEplcm9tZQoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
