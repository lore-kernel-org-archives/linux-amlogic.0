Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A2C7EE30
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jun 2025 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhxR1gBFEpa3NL/KitnjOfXVId8570NWtgvOIHckMi8=; b=Fd1uYg8LINFhMa
	nWjHg9edIX35Yhl/gpvCy23zL1Xx6ildfcicpj/uZfGpiPlRU48jC2yblw3yVxBUEy9PnPvemwV6T
	2jS2/5AY/OnF7J7n9gLbkg5KjwA2W9SotIhDEskpiWB3xyBpKGkEcMY7TD7lJK5/ktd6A6MfPBd0E
	6ozVrd2Ink54O6sFBQfWeGp/AMZuVFNqj/KH3VcVZQHIRY0U9eECKVUSWM+WXZfZSq214kyC6lZCi
	/m9LX393qkzg7/3bqr2CfXIlMjd+bf9+fIlT8NGB/COsECOk0xskkLSxLEmcIA9c5UfcZXEd09Hiu
	YQ+1nSiXRwbkV986chLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMpB-00000008DAk-0XjJ;
	Wed, 25 Jun 2025 09:53:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKpa-00000007rMi-1S21
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Jun 2025 07:46:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso48104735e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jun 2025 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750837564; x=1751442364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G38oZPD0ZUO+4eufUOOmiC+1nFVfHKSYBYFSxQkb+SY=;
        b=0Ys3Ivtx9v08r9NOfMXBZjO/AMbDyVWXDX/141ISjRZ2oGEbxckWl+TuWe+d9+q2RT
         DgjjTsyLvZKVBe+x3mDrukRRcj6x1dM/VNCFnN0PJGspo4gPl8Hx04vAdU9lL1ZdnuWj
         fpg54Gky/i3l9R/MeCsOp/fpl5Ibrffaa7gbLZswnlbPA7bPYmWb8nvnNUQJ3wBDr3bO
         KDb7f4DCJ1QqNkx4DDhA/smd1fwGoencVuFamI9R9YoYpTdKz35yvtiEwcLSXd/72y/C
         GJd0O9sW7P/ajbi6VpzryMCunqAS/Nm9FqcHqEhkGSXVHOTB7V8Qrwzys4fyDd4bHOWT
         Xf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837564; x=1751442364;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G38oZPD0ZUO+4eufUOOmiC+1nFVfHKSYBYFSxQkb+SY=;
        b=e2Rxyn9gAVYy7tukhyACgsYH3rGR53DETaAhwZRjJbdtj1sZ6qakEJ3KPIDlVFW8z9
         foqWfchFZhRyiWYplEtTEg0A3ciA7aN9/xokWaoL78A6vqDNSW/UaTCdZlqMPM0WaAz+
         0nmtKW2/LcWrZ2h/IWBu7u+06X8vIEZybwo3hD54hFXfFJRwkYDNqXr6ycIkv7wGcwdW
         SoiiEVy3FgQjWzI/ypzePZ8CYOPBugXIzh97oEmy0waX5MygffcnVjQp1BM7ad3zXfjF
         iO5R+VELTSaoWanbgh+Othpd1CQP5y8PkHz7O+XHr30CLi45zTT0e4gq971sT5bT2CoQ
         cxLA==
X-Forwarded-Encrypted: i=1; AJvYcCXq4XOvUO6FuyGgSxEiu+RghQa9AaSmQ2/MpJGeEuKSZPTzWAgD60f9f00oK5r2LB2f4NIYfFYcKxJ5z2JB@lists.infradead.org
X-Gm-Message-State: AOJu0YyGzgjROl3SoIlDUAXpZU4ca2utPmzHHc8Uwa+CguTJfSzifwfn
	dyOhgMMmSKGvqtueUctokSjSvroF86+6pp4ZFGtMHJu7RuJFbGGFewfhE7ZXJaUyKiA=
X-Gm-Gg: ASbGncs7jvl0pqphPfU+nsi4zyg1Br6KJnyNUrrCr7Q4H2Jw4Zkow4LwpXx21wFT6vh
	nadBJLHHm3CXeHOjysn3e7JW9Ybkv0N5IwQbyb98mLCCLaOBkBLNAksTNm6ndoQFU6qjeSPzLu1
	lhH1KcKNezBmZ4Hi7hg/J63ZmriPurqpefbw2d3us4nKloCYfpWtbL5Iza6qRnP73gCD0dOJpI9
	WT0tOPFEzRbn6SGqpj7Vuu3bkxnBwOfLNfdNUHuah6JCClfxXK7+QKLUoFYnS7jIUy/sMaFEpuX
	m320F5xfCmGEOt7RMdK+w+2xbGjCNI3f82hd4R0pJmnDJsvlUceq5eYw4PkZ0tw5r1BbMCHs
X-Google-Smtp-Source: AGHT+IEFcmap2xUg1PMroE0rTK44KQv6jBprJalyHbE1zkENpItZBZ87xVowh0/gWqyHbHbnprwUrg==
X-Received: by 2002:a05:600c:4684:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-45381ae456bmr17467905e9.16.1750837563946;
        Wed, 25 Jun 2025 00:46:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:87a0:eae0:c854:b578])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45380fd167bsm14015175e9.0.2025.06.25.00.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:46:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
In-Reply-To: <22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com> (Jian Hu's
	message of "Wed, 25 Jun 2025 10:52:28 +0800")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-5-jian.hu@amlogic.com>
	<1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
	<4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
	<1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
	<22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 09:46:02 +0200
Message-ID: <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_004606_502008_416A21FD 
X-CRM114-Status: GOOD (  16.26  )
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

T24gV2VkIDI1IEp1biAyMDI1IGF0IDEwOjUyLCBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29t
PiB3cm90ZToKCj4gT24gMjAyNS82LzE3IDA6MjcsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+IFsg
RVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiBUaHUgMTIgSnVuIDIwMjUgYXQgMjE6MDIsIEppYW4g
SHUgPGppYW4uaHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pgo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMg
c3RydWN0IGNsa19yZWdtYXAgdDdfcGNpZV9wbGxfb2QgPSB7Cj4+Pj4+ICsgICAgIC5kYXRhID0g
JihzdHJ1Y3QgY2xrX3JlZ21hcF9kaXZfZGF0YSl7Cj4+Pj4+ICsgICAgICAgICAgICAgLm9mZnNl
dCA9IEFOQUNUUkxfUENJRVBMTF9DVFJMMCwKPj4+Pj4gKyAgICAgICAgICAgICAuc2hpZnQgPSAx
NiwKPj4+Pj4gKyAgICAgICAgICAgICAud2lkdGggPSA1LAo+Pj4+PiArICAgICAgICAgICAgIC5m
bGFncyA9IENMS19ESVZJREVSX09ORV9CQVNFRCB8Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgQ0xLX0RJVklERVJfQUxMT1dfWkVSTywKPj4+PiBXaGF0J3MgdGhlIGJlaGF2aW91ciBvZiB0
aGUgZGl2aWRlciBvbiB6ZXJvIHRoZW4gPwo+Pj4KPj4+IElmIHRoZXJlIGlzIG5vIENMS19ESVZE
RVJfQUxMT1dfWkVSTywgdGhlcmUgaXMgYSB3YXJuaW5nIHdoZW4gcmVnaXN0ZXJpbmcKPj4+IHQ3
X3BjaWVfcGxsX29kLgo+Pj4KPj4+IGxpa2UgdGhpczoKPj4+Cj4+PiAgICAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+ICAgIFdBUk5JTkc6IENQVTogMSBQSUQ6IDEgYXQg
ZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYzoxNDAKPj4+IGRpdmlkZXJfcmVjYWxjX3JhdGUrMHhm
Yy8weDEwMAo+Pj4gICAgcGNpZV9wbGxfb2Q6IFplcm8gZGl2aXNvciBhbmQgQ0xLX0RJVklERVJf
QUxMT1dfWkVSTyBub3Qgc2V0Cj4+PiAgICBNb2R1bGVzIGxpbmtlZCBpbjoKPj4+ICAgQ1BVOiAx
IFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPj4+IDUuNC4yODMtMDk5NzYtZ2E4
MDNlOTRlZWQ4OC1kaXJ0eSAjOTEKPj4+ICAgIEhhcmR3YXJlIG5hbWU6IHRtMl90OTYyZTJfYWIz
MTEgKERUKQo+Pj4gICBDYWxsIHRyYWNlOgo+Pj4gICAgW2ZmZmZmZmMwMjAwMDM3NTArICA2NF1b
PGZmZmZmZmMwMTAwZTNlM2M+XSBkdW1wX2JhY2t0cmFjZSsweDAvMHgxZTQKPj4+ICAgIFtmZmZm
ZmZjMDIwMDAzNzkwKyAgMzJdWzxmZmZmZmZjMDEwMGU0MDQ0Pl0gc2hvd19zdGFjaysweDI0LzB4
MzQKPj4+ICAgIFtmZmZmZmZjMDIwMDAzN2IwKyAgOTZdWzxmZmZmZmZjMDExMzBhMmU4Pl0gZHVt
cF9zdGFjaysweGJjLzB4MTA4Cj4+PiAgIFtmZmZmZmZjMDIwMDAzODEwKyAxNDRdWzxmZmZmZmZj
MDEwMTBjNDg0Pl0gX193YXJuKzB4ZjQvMHgxYjgKPj4+ICAgIFtmZmZmZmZjMDIwMDAzOGEwKyAg
NjRdWzxmZmZmZmZjMDEwMTBjNWY0Pl0gd2Fybl9zbG93cGF0aF9mbXQrMHhhYy8weGM4Cj4+PiAg
IFtmZmZmZmZjMDIwMDAzOGUwKyAgNjRdWzxmZmZmZmZjMDEwNjFkMzY0Pl0gZGl2aWRlcl9yZWNh
bGNfcmF0ZSsweGZjLzB4MTAwCj4+PiAgIFtmZmZmZmZjMDIwMDAzOTIwKyAgODBdWzxmZmZmZmZj
MDEwNjI0ZTg0Pl0KPj4+IGNsa19yZWdtYXBfZGl2X3JlY2FsY19yYXRlKzB4NzQvMHg4OAo+Pj4g
ICAgW2ZmZmZmZmMwMjAwMDM5NzArICA5Nl1bPGZmZmZmZmMwMTA2MTZhNTQ+XSBfX2Nsa19yZWdp
c3RlcisweDYyYy8weGI3OAo+Pj4KPj4+IHNvIGFkZCBpdCB0byBhdm9pZCB0aGUgd2FybmluZy4K
Pj4gVGhhdCBkb2VzIG5vdCByZWFsbHkgYW5zd2VyIG15IHF1ZXN0aW9uCj4KPgo+IFNvcnJ5LCBJ
IGRpZCBub3QgZ2V0IHlvdSBiZWZvcmUuCj4KPiBJIGhhdmUgc2V0IE9EIHRvIDAuwqAgQW5kIG1l
YXN1cmUgcGNpZSBmcmVxdWVuY3kswqAgSXQgaXMgMzcuNU1oei4KPgo+IDQ4MDBNaHovMi8zMi8y
PTM3LjVNaHosIGFuZCB0aGUgT0QgZXF1YWwgemVybyBtZWFucyBkaXZpZGVkIGJ5IDMyIGluIGZh
Y3QuCj4KCkNMS19ESVZJREVSX01BWF9BVF9aRVJPIG1heWJlID8KCj4gSGVyZSBpcyB0aGUgdGVz
dCByZXN1bHQ6Cj4KPiBkZXZtIDB4ZmUwMDgxNDAgMzIKPgo+IDB4RDQwQzA0QzgKPgo+IGNhdCAv
c3lzL2tlcm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21lYXN1cmVfc3VtbWFyeSB8IGdyZXAgcGNp
ZQo+Cj4gWzE2XSBwY2llX2Nsa19pbnAgwqDCoMKgwqAgMzc1MDAwMDDCoCArLzEgMzEyNUhaCj4K
Pgo+IHRoZSBPRCBkaXZpZGVyIGlzIE4gY3Jvc3NvdmVyLiBpdCBpcyBvbmUgYmFzZWQuCj4KPiBh
bmQgSXQncyBwb3NzaWJsZSB0byBnbyBmcm9tIDEgdG8gMzEgY3Jvc3NvdmVycy4KCi0tIApKZXJv
bWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
