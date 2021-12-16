Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45E2C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Dec 2021 03:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEMmeQfip3bnzjcA9mp/j343/GUOwgeVi0d4zuWQnWc=; b=eB8my1rrn6x+rznX1TiutBU2RB
	Q21pz4nq7RuggvB4Ax/s1034QsptP43Y4/REfyqTGJ5ow3pskoCo9yOB+O/msw6Sh95mc9aKmnI5M
	LBmAf8TKP5vGpk81JCb4pXzlGdweZbmHRTXFlioTGOacCIj47XS9q+pU4hiDmQimXBfdEhH/P1VeL
	UsYASIKFztX0D2UXbhbI3RTC/dpmGnXoj1MNNoTPTUv+4yyoBW9Z4sULq3GbjBkSUdQ3fbFH1mmGH
	pMsZO1HZJDrw6oCioAjxdzHARIWMegcmQDY8V9k+JwkVBkjbAm/JsWg/KH7qx6zYeVEcFo1MFHAiW
	2mB0Wveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxhNJ-003S6B-Bn; Thu, 16 Dec 2021 03:24:09 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxhNH-003S54-7B; Thu, 16 Dec 2021 03:24:08 +0000
Received: from [10.28.39.221] (10.28.39.221) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 16 Dec
 2021 11:23:59 +0800
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
 <CAHp75VczRGaKY_O3SV9xx-G95Rk8uFPwNFuVE1iy+HAxgL+oVg@mail.gmail.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <774cd3ba-1f43-ae00-12b8-b2959ab7d987@amlogic.com>
Date: Thu, 16 Dec 2021 11:24:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VczRGaKY_O3SV9xx-G95Rk8uFPwNFuVE1iy+HAxgL+oVg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.221]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_192407_304091_8D8ADD6A 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksQW5keQoKT24gMjAyMS8xMi8xNCDkuIvljYg3OjU3LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gVHVlLCBEZWMgMTQsIDIwMjEgYXQgNjoyNyBBTSBRaWFuZ2d1aSBTb25nIDxxaWFuZ2d1
aS5zb25nQGFtbG9naWMuY29tPiB3cm90ZToKPj4gQWRkIG5ldyBwaW5jdHJsIGRyaXZlciBmb3Ig
QW1sb2dpYydzIE1lc29uLVM0IFNvQyB3aGljaCBzaGFyZSB0aGUKPj4gc2FtZSByZWdpc3RlciBs
YXl0b3V0IGFzIHRoZSBwcmV2aW91cyBNZXNvbi1BMS4KPiBsYXlvdXQKPgo+IC4uLgphd2t3YXJk
Cj4KPj4gK2NvbmZpZyBQSU5DVFJMX01FU09OX1M0Cj4+ICsgICAgICAgdHJpc3RhdGUgIk1lc29u
IHM0IFNvYyBwaW5jdHJsIGRyaXZlciIKPj4gKyAgICAgICBkZXBlbmRzIG9uIEFSTTY0Cj4+ICsg
ICAgICAgc2VsZWN0IFBJTkNUUkxfTUVTT05fQVhHX1BNWAo+PiArICAgICAgIGRlZmF1bHQgeQo+
IFdoeSBpcyBpdCBuZWVkZWQgb24gb3RoZXIgKG5vbi1NRVNPTl9TNCkgU29Dcz8KPgo+IC4uLgoK
dG8ga2VlcCBjb25zaXN0ZW50IHdpdGggcHJldmlvdXMgY2hpcHMgY29uZmlndXJhdGlvbiwgbWF5
YmUgYW5vdGhlcsKgIApwYXRjaCBzZXQgdG8gwqAgcmVtb3ZlIGFsbCBkZWZhdWx0IHkKCmZvciBh
bGwgcHJldmlvdXMgU29Dcy4KCj4KPj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgaTJjMV9n
cm91cHNbXSA9IHsKPj4gKyAgICAgICAiaTJjMV9zZGFfYyIsICJpMmMxX3NjbF9jIiwKPj4gKyAg
ICAgICAiaTJjMV9zZGFfZCIsICJpMmMxX3NjbF9kIiwKPj4gKyAgICAgICAiaTJjMV9zZGFfaCIs
ICJpMmMxX3NjbF9oIiwKPj4gKyAgICAgICAiaTJjMV9zZGFfeCIsICJpMmMxX3NjbF94Igo+IElu
IHRoaXMgYW5kIGFsbCB0aGUgcmVzdCBzaW1pbGFyIGNhc2VzIGxlYXZlIGEgY29tbWEuCk9rYXku
Cj4KPj4gK307Cj4gLi4uCj4KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1l
c29uX3M0X3BpbmN0cmxfZHRfbWF0Y2hbXSA9IHsKPj4gKyAgICAgICB7Cj4+ICsgICAgICAgICAg
ICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXBlcmlwaHMtcGluY3RybCIsCj4+
ICsgICAgICAgICAgICAgICAuZGF0YSA9ICZtZXNvbl9zNF9wZXJpcGhzX3BpbmN0cmxfZGF0YSwK
Pj4gKyAgICAgICB9LAo+PiArICAgICAgIHsgfSwKPiBXaGVuIGl0J3MgYSB0ZXJtaW5hdG9yIGVu
dHJ5LCBubyBjb21tYSBpcyBuZWVkZWQuCndpbGwgZml4IGl0wqAgaW4gbmV4dCBwYXRjaAo+Cj4+
ICt9Owo+IC4uLgo+Cj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9zNF9w
aW5jdHJsX2RyaXZlciA9IHsKPj4gKyAgICAgICAucHJvYmUgID0gbWVzb25fcGluY3RybF9wcm9i
ZSwKPj4gKyAgICAgICAuZHJpdmVyID0gewo+PiArICAgICAgICAgICAgICAgLm5hbWUgICA9ICJt
ZXNvbi1zNC1waW5jdHJsIiwKPj4gKyAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG1l
c29uX3M0X3BpbmN0cmxfZHRfbWF0Y2gsCj4+ICsgICAgICAgfSwKPj4gK307Cj4+ICsKPj4gK21v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIobWVzb25fczRfcGluY3RybF9kcml2ZXIpOwo+IFN3YXAgYWJv
dmUgdHdvIGxpbmVzLCBmaXJzdCBtb2R1bGVfLi4uKCkgZm9sbG93ZWQgYnkgYSBibGFuayBsaW5l
LgpPa2F5Lgo+Cj4+ICtNT0RVTEVfTElDRU5TRSgiRHVhbCBCU0QvR1BMIik7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
