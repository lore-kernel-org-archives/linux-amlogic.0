Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6E6EB64DA
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Jun 2023 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfSrqfmA13E1wBZpEtxBI2B/JJthSiWGpUm6QprQn0E=; b=IktQtrHrP4No/I
	7N+piGemN3lhdyRDRftyuzg+ZjjlumzJrK4kIGplKwk/uk50qiMDlLITDJ/quW0bNreIZI8Du1kRi
	IUoucC1B/CEfSC5hu9sLnWXcqHbLQWg3KV4Out7ro5CT1gUq3wuxGP5/0JVrdhVv+sGWPXlsBVMZR
	fTdRryfGAc5NAyBQFZSGpLwVCxPP7fNSWp+0KoiT1/v2/zDJ4loch9A0aGw/6VDiCesaviyKY/qFR
	viZGfo+WsteBWrXAsm+59xzDSFtyIoo+MY2ZjEKlffktWCwGz+maey71QuwzhyzyL27P/FtoY2XN6
	lF9PyWHrqSWCEDiquuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD5fs-006DUA-1K;
	Sat, 24 Jun 2023 15:59:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD5fn-006DSb-0f;
	Sat, 24 Jun 2023 15:59:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so3480558e87.0;
        Sat, 24 Jun 2023 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687622373; x=1690214373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxD3mnsyxsM9A/pK/r4bmilX/vIQZZ/iBExyMlW0hWI=;
        b=CdxPGMxddVeIEqvQbb6zVuOBbZtFYaa46/5i1pb94WXHhCEK8ugsf1ZTdByvsXJ9of
         dBth1XXjCG2yJj5u+9HOPMcVNny4WjJUpJgz0CobZcjC57wmrTKxEEuHYVy04+piY0my
         0p3mWYKl94I53iWEvqGMeEL8nIXLm0EE9+75vrzyC6zTHek0kGWZufe35BAdQ4eChRqU
         qHRBezqnI7fzTqgEEboO8aNRTdgc+DTRyAyov2bQ4f2T2EeHOPixlNqOufs6J7eDbIPC
         IG2TQn8AXJNmpRter5Aqx1JRrxJnLdBscufmaqzPjzt750Hj1vkRRiKAhho2hC76ShVe
         R+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687622373; x=1690214373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxD3mnsyxsM9A/pK/r4bmilX/vIQZZ/iBExyMlW0hWI=;
        b=CjiSkvFdXZyhG6HnKHyqrIOLd+1Nh0Vo0trhjIu06oUSsvZymdYvFrqxo/JqHizuO9
         RR3qqNxdNkMmqrD+OirnrpxZQ+wASoL0o7AxHIqiEltB5bnRZ0ZvGMJ3osW0ZnZw3r9d
         Gfuf5ZWrNXtQ1rMhakw0heCuI1G5sKlR/7ZQWIOq9m1k7djCBfz5rkTYgMDTMZA8KmBt
         iiGQdpVP33l+TObLMKpHVTpc22cRbzIhldZ+2taWbdktzjYGBGENoDje3zQY5p+xxjWy
         1gLSmFiuJGeXrgBHbn7QaLmV2biUtFIqG1WiTgIK3zA7UO1hvco9QZZYli0+yNNOAQrj
         1hqQ==
X-Gm-Message-State: AC+VfDyfgWsZ2qXBBjg47otuQnGIftvhKHTULDMvi0e0jSgGs5WFL+AH
	mwW3mba0H73KXNIKEi5CAJo=
X-Google-Smtp-Source: ACHHUZ7WNyxGMyfLzLSOkyJb4r3sDazr+QBWvq4tE/boVMXXeJq4RitMkVuWZUYRRMXR8/WZubyoMA==
X-Received: by 2002:a05:6512:3c89:b0:4f8:78a8:bfea with SMTP id h9-20020a0565123c8900b004f878a8bfeamr5774392lfv.16.1687622372625;
        Sat, 24 Jun 2023 08:59:32 -0700 (PDT)
Received: from [192.168.1.100] ([185.8.126.245])
        by smtp.gmail.com with ESMTPSA id m25-20020ac24ad9000000b004fad16596fasm31748lfp.21.2023.06.24.08.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 08:59:32 -0700 (PDT)
Message-ID: <a0d74f3f-4208-d7e3-7eed-481a06b13308@gmail.com>
Date: Sat, 24 Jun 2023 18:59:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 6/6] meson saradc: support reading from channel7 mux
 inputs
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 andriy.shevchenko@linux.intel.com, nuno.sa@analog.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@sberdevices.ru
References: <20230623022334.791026-1-gnstark@sberdevices.ru>
 <20230623022334.791026-7-gnstark@sberdevices.ru>
 <CAFBinCBv993Xv_wk9fE-U0Tw2mzTB1z22Tj6x8Uy1rRw_dztng@mail.gmail.com>
From: George Stark <stark.georgy@gmail.com>
In-Reply-To: <CAFBinCBv993Xv_wk9fE-U0Tw2mzTB1z22Tj6x8Uy1rRw_dztng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_085939_262970_B18D5805 
X-CRM114-Status: GOOD (  28.58  )
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

SGVsbG8gTWFydGluCgpUaGFua3MgZm9yIHJldmlldwoKT24gNi8yMy8yMyAwOToxNiwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBHZW9yZ2UsCj4KPiBPbiBGcmksIEp1biAyMywgMjAy
MyBhdCA0OjIz4oCvQU0gR2VvcmdlIFN0YXJrIDxnbnN0YXJrQHNiZXJkZXZpY2VzLnJ1PiB3cm90
ZToKPiBbLi4uXQo+PiBNZXNvbiBzYXJhZGMgY2hhbm5lbCA3IGlzIGNvbm5lY3RlZCB0byBtdXhl
ciB0aGF0IGNhbiBzd2l0Y2ggY2hhbm5lbAo+IEkgdGhpbmsgdGhhdCB0aGlzIHNob3VsZCByZWFk
OiAuLi4gaXMgY29ubmVjdGVkIHRvIGEgbXV4IHRoYXQgLi4uCj4KPiBbLi4uXQo+PiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyBtZXNvbl9zYXJfYWRjX2lpb19jaGFubmVsc1td
ID0gewo+PiBAQCAtMjQ1LDYgKzI4MCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19jaGFu
X3NwZWMgbWVzb25fc2FyX2FkY19paW9fY2hhbm5lbHNbXSA9IHsKPj4gICAgICAgICAgTUVTT05f
U0FSX0FEQ19DSEFOKElOREVYX0NIQU5fNiksCj4+ICAgICAgICAgIE1FU09OX1NBUl9BRENfQ0hB
TihJTkRFWF9DSEFOXzcpLAo+PiAgICAgICAgICBJSU9fQ0hBTl9TT0ZUX1RJTUVTVEFNUChJTkRF
WF9DSEFOX1NPRlRfVElNRVNUQU1QKSwKPj4gKyAgICAgICBNRVNPTl9TQVJfQURDX01VWChJTkRF
WF9NVVhfMF9WU1MsIDApLAo+PiArICAgICAgIE1FU09OX1NBUl9BRENfTVVYKElOREVYX01VWF8x
X1ZERF9ESVY0LCAxKSwKPj4gKyAgICAgICBNRVNPTl9TQVJfQURDX01VWChJTkRFWF9NVVhfMl9W
RERfRElWMiwgMiksCj4+ICsgICAgICAgTUVTT05fU0FSX0FEQ19NVVgoSU5ERVhfTVVYXzNfVkRE
X01VTDNfRElWNCwgMyksCj4+ICsgICAgICAgTUVTT05fU0FSX0FEQ19NVVgoSU5ERVhfTVVYXzRf
VkRELCA0KSwKPj4gICAgICAgICAgTUVTT05fU0FSX0FEQ19URU1QX0NIQU4oKSwgLyogbXVzdCBi
ZSB0aGUgbGFzdCBpdGVtICovCj4gSSBoYXZlbid0IGhhZCB0aGUgY2hhbmNlIHRvIHJ1biB0aGVz
ZSBwYXRjaGVzIHlldCBidXQ6IEkgdGhpbmsgdGhleQo+IGFyZSBicmVha2luZyB0aGUgdGVtcGVy
YXR1cmUgc2Vuc29yIHJlYWRpbmdzIG9uIE1lc29uOC84Yi84bTIgYm9hcmRzLgo+IFNlZSBhcmNo
L2FybS9ib290L2R0cy9tZXNvbi5kdHNpIHdoZXJlIHRoZSB0ZW1wZXJhdHVyZSBjaGFubmVsIGlz
Cj4gYmVpbmcgcmVmZXJlbmNlZDoKPiAgICBpby1jaGFubmVscyA9IDwmc2FyYWRjIDg+Cj4KPiBX
aXRoIHRoaXMgc2VyaWVzICh0aGlzIHBhdGNoIGFuZCBJIHRoaW5rIGFsc28gcGF0Y2ggMy82ICJt
ZXNvbiBzYXJhZGM6Cj4gdW5pdGUgaWlvIGNoYW5uZWwgYXJyYXkgZGVmaW5pdGlvbnMiKSB0aGUg
bnVtYmVyaW5nIG9mIHRoZSB0ZW1wZXJhdHVyZQo+IHNlbnNvciBjaGFubmVsIGNoYW5nZXMuCj4K
PiBUbyBtYWtlIHRoaW5ncyB3b3JzZTogaW4gdGhlb3J5IHdlIGNhbiB1c2UgbWVzb25fc2FyYWRj
IHRvIHJlYWQgdGhlCj4gU29DIHRlbXBlcmF0dXJlIHNlbnNvciBvbiBHWEJCLCBHWEwgYW5kIEdY
TSBib2FyZHMgKHBvc3NpYmx5IG9uIEFYRyBhcwo+IHdlbGwgYnV0IEkgY2FuJ3QgcmVjYWxsIGZy
b20gdGhlIHRvcCBvZiBteSBoZWFkKSBpbnN0ZWFkIG9mIGdvaW5nCj4gdGhyb3VnaCBTQ1BJLgo+
IEkgaGF2ZSBleHBlcmltZW50ZWQgd2l0aCB0aGlzIGluIHRoZSBwYXN0IGJ1dCBuZXZlciBnb3Qg
aXQgdG8gd29yay4KPiBEb2luZyBzbyBpbiB0aGUgZnV0dXJlIGNvdWxkIGxlYWQgdG8gYW5vdGhl
ciBjaGFubmVsIGluZGV4IGNoYW5nZSwKPiBkZXBlbmRpbmcgb24gaG93IHdlIGRlY2lkZSB0byBn
byBmb3J3YXJkIG5vdy4KPgo+IFRoZXJlJ3MgdHdvIHRoYXQgSSBjYW4gdGhpbmsgb2Y6Cj4gLSB1
cGRhdGUgbWVzb24uZHRzaSB0byB1c2UgdGhlIG5ldyBjaGFubmVsIG51bWJlcmluZyAoSSBkb24n
dCBleHBlY3QKPiBtYW55IDMyLWJpdCBTb0MgdXNlcnMgb3V0IHRoZXJlIHVzaW5nIG5ldyBrZXJu
ZWwgKyBvbGQgLmR0YnMsIGJ1dCBpdCdzCj4gaW1wb3NzaWJsZSB0byBzYXkgZm9yIHN1cmUpCj4g
LSBvciBrZWVwIHRoZSBkcml2ZXIgYmFja3dhcmRzIGNvbXBhdGlibGUgKHRoYXQgaW52b2x2ZXMg
cmUtYWRkaW5nIHRoZQo+IGNoYW5uZWwgdGFibGVzKQo+Cj4gV2hhdCBkbyB5b3UgdGhpbms/CkFj
dHVhbGx5IHdlJ2QgaGF2ZSB0byBtYWtlIDIgcGF0Y2hlcyB0byBtZXNvbi5kdHNpLCB0aGUgZmly
c3QgY2hhbmdlIAo4LT45LCB0aGFuIDkgLT4xNC4KQW5kIGlmIHRoYXQgaW5kZXggZXhwb3NlZCBl
eHRlcm5hbGx5IChBQkkgbGlrZSkgSSdkIG5vdCBjaGFuZ2UgaXQgCndpdGhvdXQgZ29vZCByZWFz
b24gYXQgYWxsLgpTbyBJIHRoaW5rIHRvIHJldHVybiB0byBkb3VibGUgZGVmaW5pdGlvbiBvZiBt
ZXNvbl9zYXJfYWRjX2lpb19jaGFubmVscyAKYW5kIGtlZXAgdGhlIGRyaXZlciBiYWNrd2FyZHMg
Y29tcGF0aWJsZS4KCkkndmUganVzdCByZWFsaXplZCBhbm90aGVyIG1vbWVudCB3aXRoIGNoYW5u
ZWxzIGRlZmluZWQgYWZ0ZXIgCk1FU09OX1NBUl9BRENfVEVNUF9DSEFOIGluIGNoYW5uZWwgYXJy
YXkuCkluIGR0cyBieSBkZWZhdWx0IGNoYW5uZWxzIGFyZSByZWZlcmVuY2VkIGJ5IGNoYW5uZWwg
YXJyYXkgaW5kZXggbm90IApldmVuIGJ5IGNoYW5uZWwgbnVtYmVyLgpTbyBjaGFubmVsIGUuZyBN
VVhfMF9WU1Mgd2lsbCBoYXZlIHRoZSBzYW1lIG51bWJlciAoZHVlIHRvIGVudW0gcGF0Y2gpIApi
dXQgZGlmZmVyZW50IGluZGV4IG9uIG1lc29uOCBhbmQgZ3hiYi4KQXMgYWx0ZXJuYXRpdmUgd2Ug
Y2FuIGltcGxlbWVudCBmd25vZGVfeGxhdGUgbWV0aG9kIGluIG1lc29uIGFkYyBkcml2ZXIgCmFu
ZCB1c2UgY2hhbm5lbCBudW1iZXJzIGluIGR0cwoocHJvYmFibHkgbm90IGluIHRoZSBjdXJyZW50
IHBhdGNoc2V0KS4KCkJlc3QgcmVnYXJkcywKR2VvcmdlCgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1h
cnRpbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
