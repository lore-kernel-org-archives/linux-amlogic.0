Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45131CA0FE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Aug 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MV3uf6eJ/ZwxxSqOiaIp2xkqHpj/1NARz+FPTVtoHk=; b=zrWwp+hl6hjszu
	OyAEw3pGap58o1hi1BJe9ylDCVR5+yKwUsamvyHJBDtXtmo29CYswixujS14GbBVlm++qww6zXesd
	dKmaXrEwcD6xp4Rce/tGUaHgmgoyTHYGIscN7H1V/rtI7TLqWoT93gJ/Ikyxk+wZYxfnZQN/tbtHC
	Lc4yg22pBo5kbK3fJWzzLhicXxORDntk33slnHHrnrf025AhV64Z78CEi+DFGozznGhi4kZgup/ft
	piNMTX4rNVkQKXbERqv0bGB54VjyLZrRwViLscT6LJxFPuQd4YkYZ/z76jKPT3zOVahipfwvkcPDA
	qngZyUD8mq323jCVIyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqplO-0000000BIAJ-0GhM;
	Tue, 26 Aug 2025 09:14:46 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpiJ-0000000BG7N-2sKS
	for linux-amlogic@lists.infradead.org;
	Tue, 26 Aug 2025 09:11:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so4010565f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 26 Aug 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756199494; x=1756804294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=i8cXVTlhjmuuPbtEt1rFZnskfFOhx/k+O61n2HbBf0Q/nlwvv+Sp2SZQG5BBPd9o4G
         qm/ax2YahVqDzwC6152oB987nEFPjFtKflPfL7ta88F5TlCMhZPeQHk1ed9sjVl92Oyv
         5fTv/wGooJjfunjHZeNW2y78nJdw87wM/D8gXMg037KzErAjRgT2F9ZXV3wpwGteho0C
         I2oaToMmtBkOZwtRdZyBe6g2MrVyIWXfN27v67U6swDlgk1YwHpfSnEiTBwugL6MiNcK
         5vYqYU0ukVSD/Df9tiidpRvK69TXvqFURTXgZaiDDiRlOTlaqK7PESMBmEUczZMGgL2w
         HSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199494; x=1756804294;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSGgiA7okXMSZ3FGPGzhv/sQluxvM/Gr3n+FFVx6Zrk=;
        b=U0vJ7DugIB9aI+KrkLgUHoc0QHrlgHpDtQfYQ3bfVUWUsY9vGV3ZXXMrmmJL4+Iwls
         fQTpoq8J6CAtJ+TtjHQXnA8Ux7bAp1rXqmwizO168EgLyhPgXnkjzrH3p4Rp7BsimfOc
         OtpSiYziGUU8Z4pu9wPsq+RgW7o9l1K5JSZLUARvOL/wjsYMt9oUzXJIsz8YRPj5SW9c
         4uSKi1sVhorxqrdy7cfPTgstHbTxF4UV/txLy6ulBTgl4S2b1x2MpKNc4WNdKd28MWoa
         R0uISnmSboYi1xqtSTsEa2uYeusw1ktqwwgZIU3wUQ/T8atQClstlysFNXlbWXWhQDti
         ffdw==
X-Forwarded-Encrypted: i=1; AJvYcCVBoZ5xRd560rSNX6LXnWqFDndVKGFN2gS9F347ql4nIvl1JWKsGiEJMfVag+dDAcYfv4XR5U/PKWJYgZJN@lists.infradead.org
X-Gm-Message-State: AOJu0YxqiaeAWSDJ8SPKl3i+Jhx9LAt+iFOydrSn1YncODWY3kPCC8Su
	wmuvOeB9GzPBfrPepwzOxqcFqmWHk5SpXa2TPhzwb7WkAqdxw397jVLtQqf0BNGeGZg=
X-Gm-Gg: ASbGnctsVvZU0eBM/eghs07Mxi92Qs7qaB37ioNl+2K0eq+PMgstcw8AchAad0JODbW
	W1Hi4C+XjYAgMT2R5zX7HCV9AFNTfq73KBbyfXRua6ip8RRSHSQjIiLUeRDvhiWhS8gbNFUOqof
	UoEe7HmA8hkzueRQ2rx6NYVGfy0Y6uyDKHFXdELHtXKwem4LRVKawuOwubFwnkwP16OsTzyjN9J
	zvQEyHadnipamiBAx1PS4X2ihaZEPxX07WvHTOX8xcOhi36/DgpyjzpUVgxjPzzY1abfoX0Pujw
	4stj1l7URIEKpYOcf3B6jqwN2Xt+dOrSFuX5FxVj1l4ATiprZyrxtTvti64CcRwwrM68EpuSJII
	Kpa3ZLNHOzXesqWcR3mDsPX0UYhZ943A=
X-Google-Smtp-Source: AGHT+IFtBWXrOWyVTOM6kOSvzOnSizJ26W7d5kPzjQBIk8HokgLiwvROTQt35HufZ0kQxPuRV/tMwg==
X-Received: by 2002:a05:6000:400f:b0:3c8:eead:3d2f with SMTP id ffacd0b85a97d-3c8eead4359mr5090468f8f.41.1756199493485;
        Tue, 26 Aug 2025 02:11:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:46d7:73a6:7b7:2201])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cad431ea49sm4204236f8f.42.2025.08.26.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:11:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Da Xue <da@libre.computer>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jian Hu
 <jian.hu@amlogic.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com> (Chuan Liu's
	message of "Tue, 26 Aug 2025 15:59:32 +0800")
References: <20250822002203.1979235-1-da@libre.computer>
	<c0e8cf9a-b5c7-4369-8b6a-c4f80a6bc398@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 Aug 2025 11:11:32 +0200
Message-ID: <1jy0r64fcr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_021135_823330_E1952246 
X-CRM114-Status: GOOD (  25.48  )
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

T24gVHVlIDI2IEF1ZyAyMDI1IGF0IDE1OjU5LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIERhOgo+Cj4gwqAgwqDCoFRoYW5rcyBmb3IgeW91ciBmZWVkYmFj
ay7CoGJ1dCB0aGlzIHBhdGNoIGlzIHdyb25nLgo+Cj4KPiBPbiA4LzIyLzIwMjUgODoyMiBBTSwg
RGEgWHVlIHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gVGhlIGJpdCByYW5nZSAx
NzowIGRvZXMgbm90IG1hdGNoIHRoZSBkYXRhc2hlZXQgZm9yIEEzMTFEIC8gUzkwNUQzLgo+PiBD
aGFuZ2UgdGhlIGJpdCByYW5nZSB0byAxODowIGZvciBGSVggYW5kIEhJRkkgUExMcyB0byBtYXRj
aCBkYXRhc2hlZXQuCj4KPgo+IFRoZSB1cHBlciAyIGJpdHMgKGJpdDE4LCBiaXQxNykgb2YgdGhl
IGZyYWMgd2VyZSBkZXByZWNhdGVkIGxvbmcgYWdvLgoKZGVwcmVjYXRlZCA/IHRoYXQgaXMgcmVh
bGx5IGNvbmZ1c2luZwoKVGhhdCBzZWVtcyB0byBpbXBseSB0aGF0IGl0IGRvZXMgaGF2ZSBhbiBl
ZmZlY3QgYnV0IHlvdSBhcmUgY2hvb3Npbmcgbm90CnRvIHVzZSBpdC4gUGxlYXNlIGNsYXJpZnku
Cgo+IFRoZSBhY3R1YWwgZWZmZWN0aXZlIGJpdCBmaWVsZCBmb3IgZnJhYyBpcyBiaXRbMTY6MF0u
IEhvd2V2ZXIsIHRoZQo+IGNvcnJlc3BvbmRpbmcgZGF0YXNoZWV0IGhhcyBub3QgYmVlbiB1cGRh
dGVkLiBJIHdpbGwgcHJvdmlkZSBmZWVkYmFjawo+IGFuZCB1cGRhdGUgdGhlIGRhdGFzaGVldCBh
Y2NvcmRpbmdseS4KPgoKV2hhdCBhYm91dCBiaXQgMTcgYW5kIDE4IHRoZW4gPyBkb2VzIGl0IGhh
dmUgYW55IGVmZmVjdCBhdCBhbGwgPwoKPgo+Pgo+PiBUaGUgZnJhYyBmaWVsZCBpcyBtaXNzaW5n
IGZvciBzeXMgcGxsIHNvIGFkZCB0aGF0IGFzIHdlbGwuCj4KPgo+IFBMTHMgd2l0aCBmcmFjIHN1
cHBvcnQgYXJlIHVzZWQgaW4gc2NlbmFyaW9zIHJlcXVpcmluZyBhIHdpZGUgcmFuZ2UKPiBvZiBv
dXRwdXQgZnJlcXVlbmNpZXMgKGUuZy4sIGF1ZGlvL3ZpZGVvIGFwcGxpY2F0aW9ucykuCj4KPiBT
aW5jZSBzeXNfcGxsIGlzIGRlZGljYXRlZCB0byBjbG9ja2luZyB0aGUgQ1BVIGFuZCBkb2VzIG5v
dCByZXF1aXJlCj4gc3VjaCBmcmVxdWVuY3kgdmVyc2F0aWxpdHksIGl0IGRvZXMgbm90IHN1cHBv
cnQgZnJhY3Rpb25hbCBmcmVxdWVuY3kKPiBtdWx0aXBsaWNhdGlvbi4KCllvdSBhcmUgbWl4aW5n
ICJIVyBzdXBwb3J0IiBhbmQgInVzYWdlIGNob2ljZSIgaGVyZS4KCldoYXQgSSByZWFkIGlzIDoK
KiBEYSBzYXlzIHRoZSBTWVMgUExMIGRvZXMgaGF2ZSBIVyBzdXBwb3J0IGZvciB0aGUgZnJhYyBw
YXJhbWV0ZXIKKiBBbWxvZ2ljIGRvZXMgbm90IHNlZSB0aGUgcG9pbnQgb2YgdXNpbmcgaXQgc2lu
Y2UgdGhlIENQVSBkb2VzIG5vdAogIHJlcXVpcmUgZmluZSB0dW5pbmcgb2YgdGhlIHJhdGUuCgpJ
cyB0aGF0IGNvcnJlY3QgPyBvciBpcyB0aGUgSFcganVzdCBubyBwcmVzZW50ID8KCj4KPgo+Pgo+
PiBQYXRjaGVkOgo+Pgo+PiArIHN1ZG8gY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdWZy
ZXEvcG9saWN5MC9jcHVpbmZvX2N1cl9mcmVxIFwKPj4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1ZnJlcS9wb2xpY3kyL2NwdWluZm9fY3VyX2ZyZXEKPj4gOTk2OTk5Cj4+IDUwMDAwMAo+PiAr
IHN1ZG8gY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29uLWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5
Cj4+ICsgZ3JlcCAtaSAnXChzeXNfXHxoaWZpX1x8Zml4ZWRfXClwbGwnCj4+ICAgaGlmaV9wbGwg
ICAgICAgICAgICAgICAgICAgICAgMCAgICArLy0xNTYySHoKPj4gICBzeXNfcGxsX2RpdjE2ICAg
ICAgICAgICAgICAgICAwICAgICsvLTE1NjJIego+PiAgIHN5c19wbGxfY3B1Yl9kaXYxNiAgICAg
ICAgICAgIDAgICAgKy8tMTU2Mkh6Cj4+ICsgc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xr
L2Nsa19zdW1tYXJ5Cj4+ICsgZ3JlcCAtaSAnXChzeXNfXHxoaWZpX1x8Zml4ZWRfXClwbGwnCj4+
ICAgICAgaGlmaV9wbGxfZGNvICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAw
ICAgICAgICAwCj4+ICAgICAgICAgaGlmaV9wbGwgICAgICAgICAgICAgICAgICAgICAgMCAgICAg
ICAwICAgICAgICAwICAgICAgICAwCj4+ICAgICAgc3lzX3BsbF9kY28gICAgICAgICAgICAgICAg
ICAgICAgMSAgICAgICAxICAgICAgICAwICAgICAgICAzOTk5OTk5OTg1Cj4+ICAgICAgICAgc3lz
X3BsbCAgICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgICAwICAgICAgICA0OTk5
OTk5OTkKPj4gICAgICAgICAgICBzeXNfcGxsX2RpdjE2X2VuICAgICAgICAgICAwICAgICAgIDAg
ICAgICAgIDAgICAgICAgIDQ5OTk5OTk5OQo+PiAgICAgICAgICAgICAgIHN5c19wbGxfZGl2MTYg
ICAgICAgICAgIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgMzEyNDk5OTkKPj4gICAgICBmaXhl
ZF9wbGxfZGNvICAgICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAgIDEgICAgICAgIDM5
ODc5OTk5ODUKPj4gICAgICAgICBmaXhlZF9wbGwgICAgICAgICAgICAgICAgICAgICAzICAgICAg
IDMgICAgICAgIDEgICAgICAgIDE5OTM5OTk5OTMKPj4KPj4gVW5wYXRjaDoKPj4KPj4gKyBzdWRv
IGNhdCAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHVmcmVxL3BvbGljeTAvY3B1aW5mb19jdXJf
ZnJlcSBcCj4+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdWZyZXEvcG9saWN5Mi9jcHVpbmZv
X2N1cl9mcmVxCj4+IDEwMDAwMDAKPj4gNTAwMDAwCj4+ICsgc3VkbyBjYXQgL3N5cy9rZXJuZWwv
ZGVidWcvbWVzb24tY2xrLW1zci9tZWFzdXJlX3N1bW1hcnkKPj4gKyBncmVwIC1pICdcKHN5c19c
fGhpZmlfXHxmaXhlZF9cKXBsbCcKPj4gICBoaWZpX3BsbCAgICAgICAgICAgICAgICAgICAgICAw
ICAgICsvLTE1NjJIego+PiAgIHN5c19wbGxfZGl2MTYgICAgICAgICAgICAgICAgIDAgICAgKy8t
MTU2Mkh6Cj4+ICAgc3lzX3BsbF9jcHViX2RpdjE2ICAgICAgICAgICAgMCAgICArLy0xNTYySHoK
Pj4gKyBzdWRvIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkKPj4gKyBncmVw
IC1pICdcKHN5c19cfGhpZmlfXHxmaXhlZF9cKXBsbCcKPj4gICAgICBoaWZpX3BsbF9kY28gICAg
ICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKPj4gICAgICAgICBo
aWZpX3BsbCAgICAgICAgICAgICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDAK
Pj4gICAgICBzeXNfcGxsX2RjbyAgICAgICAgICAgICAgICAgICAgICAxICAgICAgIDEgICAgICAg
IDAgICAgICAgIDQ4MDAwMDAwMDAKPj4gICAgICAgICBzeXNfcGxsICAgICAgICAgICAgICAgICAg
ICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDEyMDAwMDAwMDAKPj4gICAgICAgICAgICBz
eXNfcGxsX2RpdjE2X2VuICAgICAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDEyMDAw
MDAwMDAKPj4gICAgICAgICAgICAgICBzeXNfcGxsX2RpdjE2ICAgICAgICAgICAwICAgICAgIDAg
ICAgICAgIDAgICAgICAgIDc1MDAwMDAwCj4+ICAgICAgZml4ZWRfcGxsX2RjbyAgICAgICAgICAg
ICAgICAgICAgMSAgICAgICAxICAgICAgICAxICAgICAgICAzOTk5OTk5OTM5Cj4+ICAgICAgICAg
Zml4ZWRfcGxsICAgICAgICAgICAgICAgICAgICAgMyAgICAgICAzICAgICAgICAxICAgICAgICAx
OTk5OTk5OTcwCj4+Cj4+IEZpeGVzOiAwODVhNGVhOTNkNTQgKCJjbGs6IG1lc29uOiBnMTJhOiBh
ZGQgcGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIikKPj4gU2lnbmVkLW9mZi1ieTogRGEgWHVl
IDxkYUBsaWJyZS5jb21wdXRlcj4KPj4gLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vZzEyYS5j
IHwgOSArKysrKysrLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jIGIv
ZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4+IGluZGV4IDY2ZjBlODE3ZTQxNi4uZjc4Y2NhNjE5
Y2E1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPj4gKysrIGIvZHJp
dmVycy9jbGsvbWVzb24vZzEyYS5jCj4+IEBAIC0xNTcsNyArMTU3LDcgQEAgc3RhdGljIHN0cnVj
dCBjbGtfcmVnbWFwIGcxMmFfZml4ZWRfcGxsX2RjbyA9IHsKPj4gICAgICAgICAgICAgICAgICAu
ZnJhYyA9IHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX0ZJWF9Q
TExfQ05UTDEsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAuc2hpZnQgICA9IDAsCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgIC53aWR0aCAgID0gMTcsCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIC53aWR0aCAgID0gMTksCj4+ICAgICAgICAgICAgICAgICAgfSwKPj4gICAgICAgICAg
ICAgICAgICAubCA9IHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJ
X0ZJWF9QTExfQ05UTDAsCj4+IEBAIC0yMjMsNiArMjIzLDExIEBAIHN0YXRpYyBzdHJ1Y3QgY2xr
X3JlZ21hcCBnMTJhX3N5c19wbGxfZGNvID0gewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
LnNoaWZ0ICAgPSAxMCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC53aWR0aCAgID0gNSwK
Pj4gICAgICAgICAgICAgICAgICB9LAo+PiArICAgICAgICAgICAgICAgLmZyYWMgPSB7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX1NZU19QTExfQ05UTDEsCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC5zaGlmdCAgID0gMCwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgLndpZHRoICAgPSAxOSwKPj4gKyAgICAgICAgICAgICAgIH0sCj4+ICAgICAgICAgICAg
ICAgICAgLmwgPSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAucmVnX29mZiA9IEhISV9T
WVNfUExMX0NOVEwwLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSAzMSwK
Pj4gQEAgLTE5MDEsNyArMTkwNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBnMTJhX2hp
ZmlfcGxsX2RjbyA9IHsKPj4gICAgICAgICAgICAgICAgICAuZnJhYyA9IHsKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIC5yZWdfb2ZmID0gSEhJX0hJRklfUExMX0NOVEwxLAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLnNoaWZ0ICAgPSAwLAo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAud2lkdGggICA9IDE3LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAud2lkdGggICA9IDE5
LAo+PiAgICAgICAgICAgICAgICAgIH0sCj4+ICAgICAgICAgICAgICAgICAgLmwgPSB7Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAucmVnX29mZiA9IEhISV9ISUZJX1BMTF9DTlRMMCwKPj4g
LS0KPj4gMi40Ny4yCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
