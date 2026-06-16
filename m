Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4085FCD98DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EpRij0ZWfpzaFuxNYEwoB6t+XgUGr845z4jo+XBQGE=; b=II5Cq/r1DKzsnw
	+UdP6uReKiMpgEP+g0kcr9FVnguLfv97uuXVUqhIicQDtVajvsqEDjhAkAsgzXappIMTNWjjmDc82
	okj9tNNY92sxeDQ/UeZ/B1oONrowFQ0VHKuRSCI1+UPfJNtyhLFaM5NYRlUSu73AmoLue8/pmFgjZ
	Tz4seqBItwkW1Fc8PmBZT0eih2duoXEmgKbt7BuQll12sD8lQpP4sSvGh7ZmfQKoqEyXAWqOy9zgG
	3KHNC9f28uyDxiA6JYL/0HmXFPQ1fWpxRmPjdR0vrHLd/FqmHAvanH+iyqYz0PV6DqSAzPFgzBZOf
	0JMvjWznjV2plkXvICbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOaT-0000000FOl1-2Zxe;
	Tue, 16 Jun 2026 07:51:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOaR-0000000FOk1-0vXq
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 07:51:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cdae130cso20441945e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781596313; x=1782201113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=dRF7lF4O3rRuCa0DjFawaZIHgUMpq1M565ZanQ9KrjDjGaRk5bJuvhIoaN9cnWX5Ja
         hZaWNytH4O5AWufHqwIJaHXfYO/KDGcUM55nZeNQn/ZnPudoGZAthTmRcP9evyMZDUiZ
         +BKjwTbgGFjffc9kSop41cvMOB2yQowxfiRLAMzfErr/bL4tmZA30equowozSha8oOIJ
         w7iHTSZgoNilhSfvoyUYLizjNhZD2UIusIvNqoHcxOomm0nOzNY8CISDO2jIP2SjM/6N
         PTza6GgArJZjF+mR/gB8ETCwbVp3FHIIZxwYMZS+O7jOZoeZ53KFtiJmXk2GG6MpWWUA
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596313; x=1782201113;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0OjWrZ0BE9WcD5kr2mtCjZUpgtvkrbCT2yX0mivnT4=;
        b=sxl3XspX4ctwFjqcTr85X74ax5X2VsAN6oVLgucUtzeZLfMpwQDvXYxxOpxXwbvuLz
         F7onm3CUQ2imFqDm9cKX6FP7U8AM4y1ZjInIeorUYrlOWUgbt//hc0GX8ZYeRDtuFdlW
         Zih//wzn6MF+uyS3b7ty2ikYYiKrp9s8dNtpg8a+o3GrQPeYoYBxyJRJGk3ftOcikSLj
         kWYWtq4dB/hMhVwIdmlVRhayKfDqQyq+WBU8o96t7Znaep186/ikpADtM65u+Xvtnn6R
         ucb1PZBokO/puC19XRpkJb9QdXXnjc8BgP7SfJd77D5Ipp3o4+j2vhJX6W/0osNHBRgV
         64sQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dQK8OpRwLDOCjQGMT8LQC7Rd+vHHIvHb7tyAncMAJnnrqzOQu861RuIJwhjBhEA/76x+EPUvFkr1Gwyip@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3huywLLQDMV8k+JL58D85iJ7gzkqLjuqzxhQ5DhlQljWm2bP
	FJbnF538wi+iFq6T4ppvppMP6OFVvMKfGwKVQjTXA5YnobyYo26vcbhkrxsT1ZqQi6E=
X-Gm-Gg: Acq92OHb9+GBtBkeTaCJ4ty8BNCSuofdlis8HAeu4oPZzFynVAZpbRtLDKKRkmydqYU
	p8neq0qMMH8jYnXAFBaHJWS318qaqRN5/piREquSUmRCX4xIAvKMO59MhV0niXVzOkV099eSOWP
	SsUL03JV4MZKsOqN20g94dPV6/wvGIgOWy+GXYSWJnSv9sjX5d2rHkSKfBADEXrXEaKYyXARdJg
	yFB5Oc3X5HN3g9SURsAxPQM4MrUTcvRoAybaz0vTheRNXd524PKlMFlQX3dnzElIqpwKOEYq37L
	MM5elVxQJ1wrplwQH0dOVOLLJTRk7/TY8Kunn9sn3BAvT/b4f9o8iiYzDPlapu7iug1ipNhWpPN
	bsm0+TcR57M5nJmFhuqKe7VtU5lOXnmWqrX2zQFYxYJyxfnxf8kN6TQYJ5bXuT68GwB4liCIuD0
	5J5gFA4oAAq9KQicGB8npj2w==
X-Received: by 2002:a05:600c:e547:20b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-49220061ff2mr123752675e9.12.1781596313269;
        Tue, 16 Jun 2026 00:51:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9756:c1bb:8271:9937])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49230a8ebe3sm30950255e9.11.2026.06.16.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:51:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com> (Jian Hu's
	message of "Tue, 16 Jun 2026 14:12:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
	<1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
	<5601fe65-777b-4db0-a6e5-8d2cdcde7e53@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 16 Jun 2026 09:51:50 +0200
Message-ID: <1jpl1qdisp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005155_269300_D37BD66B 
X-CRM114-Status: GOOD (  16.34  )
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

T24gbWFyLiAxNiBqdWluIDIwMjYgYXQgMTQ6MTIsIEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5j
b20+IHdyb3RlOgoKCj4+Pgo+Pj4gSWYgeW91IHRoaW5rIHNwbGl0dGluZyBpdCBmdXJ0aGVyIGlu
dG8gc2VwYXJhdGUgaGVscGVyIG1hY3JvcyB3b3VsZCBpbXByb3ZlCj4+PiByZWFkYWJpbGl0eS4K
Pj4gT25lIGNsb2NrIHBlciBtYWNybyBwbGVhc2UuIEhpZGRpbmcgMiBkZWNsYXJhdGlvbiBpcyBy
ZWNpcGUgZm9yCj4+IGRpc2FzdGVyLiBGb3IgZXgsIGhlcmUgdGhlIGZpcnN0IG9uZSBpcyBzdGF0
aWMsIHRoZSAybmQgaXMgbm90Cj4KPgo+IEknbGwgc3BsaXQgaXQgaW50byBzZXBhcmF0ZSBoZWxw
ZXIgbWFjcm9zIHNvIHRoYXQgZWFjaCBtYWNybyBleHBhbmRzIHRvIGEKPiBzaW5nbGUgY2xvY2sg
ZGVmaW5pdGlvbi4KPgo+IFRoZXkgYXJlIGRlZmluZWQgYXMgZm9sbG93czogKEV4Y2x1ZGluZyBz
dHJ1Y3QgY2xrX3JlZ21hcCkKPgo+ICNkZWZpbmUgQTlfVkNMS19HQVRFKF9uYW1lLCBfcmVnLCBf
Yml0LMKgIF9wYXJlbnQpIMKgIMKgIMKgIMKgXAo+IMKgIMKgIMKgIMKgIC5kYXRhID0gJihzdHJ1
Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpeyDCoCDCoCDCoCDCoCDCoFwKPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAub2Zmc2V0ID0gX3JlZywgwqAgwqAgwqBcCj4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLmJpdF9pZHggPSBfYml0LCDCoCDCoCDCoCBcCj4gwqAgwqAgwqAgwqAgfSwgwqAgwqAg
wqAgXAo+IMKgIMKgIMKgIMKgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgeyDC
oCDCoCDCoCDCoCDCoCBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm5hbWUgPSAjX25hbWUg
Il9lbiIsIMKgIMKgIMKgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5vcHMgPSAmY2xrX3Jl
Z21hcF9nYXRlX29wcywgwqAgwqAgwqAgwqAgwqAgXAo+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7IF9wYXJlbnQgfSzCoCDC
oCBcCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLm51bV9wYXJlbnRzID0gMSwgwqAgwqAgwqBc
Cj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVCwg
wqAgwqAgwqBcCj4gwqAgwqAgwqAgwqAgfSwKPgo+ICNkZWZpbmUgQTlfVkNMS19ESVYoX25hbWUs
IF9yZWcsIF9kaXYpIMKgIMKgIMKgIFwKPgo+IMKgIMKgIC4uLi4KPgo+IHN0YXRpYyBzdHJ1Y3Qg
Y2xrX3JlZ21hcCBhOV92Y2xrX2RpdjJfZW4gPSB7Cj4gwqAgwqAgwqAgwqAgQTlfVkNMS19HQVRF
KHZjbGtfZGl2MiwgVklEX0NMS19DVFJMLCAxLCAmYTlfdmNsay5odyksCj4gfTsKPgo+Cj4gc3Rh
dGljIHN0cnVjdCBjbGtfcmVnbWFwIGE5X3ZjbGtfZGl2MiA9IHsKPiDCoCDCoCDCoCDCoCBBOV9W
Q0xLX0RJVih2Y2xrX2RpdjIsIFZJRF9DTEtfQ1RSTCwgMiksCj4gfTsKPgo+IE15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCB5b3Ugd291bGQgcHJlZmVyIGhlbHBlciBtYWNyb3MgdG8gY292ZXIgb25s
eSB0aGUKPiByZXBlYXRlZCBpbml0aWFsaXplciBmaWVsZHMsCj4gd2hpbGUga2VlcGluZyB0aGUg
YWN0dWFsIGNsb2NrIGRlY2xhcmF0aW9ucyBleHBsaWNpdC4KCkkgZG8gbm90IGhhdmUgYSBkZWZp
bml0aXZlIHByZWZlcmVuY2Ugb3ZlciB0aGlzIGJ1dCBJIGRvIHdhbnQgdGhpbmdzIHRvIGJlCmNv
bnNpc3RlbnQsIGF0IGxlYXN0IHdpdGhpbiB0aGUgZHJpdmVyLCBnbG9iYWx5IHdoZW5ldmVyIHBv
c3NpYmxlLgoKTG9vayBhdCB0aGUgb3RoZXIgbWFjcm9zIHlvdSBoYXZlIGFscmVhZHkgZGVmaW5l
ZCBpbiB5b3VyIGRyaXZlciBhbmQgZG8KdGhlIHNhbWUgdGhpbmcsIGluY2x1ZGluZyB0aGUgd2F5
IHlvdSBkZWNsYXJlIHRoZSB2YXJpYWJsZS4gQXBhcnQgZnJvbQp0aGlzLCBpdCBzZWVtcyBmaW5l
LgoKPgo+IElmIHRoYXQncyBub3Qgd2hhdCB5b3UgaGFkIGluIG1pbmQsIHBsZWFzZSBsZXQgbWUg
a25vdy4KPj4+IEkgY2FuIGRvIHRoYXQgYXMgd2VsbC4KPj4+CgotLSAKSmVyb21lCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
