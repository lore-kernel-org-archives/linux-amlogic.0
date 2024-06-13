Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B5C27C6E
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aph3ZEoV19NniGpg6avSrt6NwpLedL4qgbkJ/nnHv7w=; b=wbVPo51PvxUIK9
	qKDFW1LhPlsxRRSvdTcXWk0Ev1T+n9XWr5p+pf5/INBYZYRyB3ky5RJprqkLTeZUaDIqZzthxZ/if
	QZftCmi9Yd83gz63G9G3YsnKDMvueEE9qurAXNXVePzTzL6fkSAUFachoGWtWPnDsLHDKOjDyvzb4
	Qty8YrYeu1lKrwg6fgPziWWhaVY6Lgo85CACyyHSKfl1X6XQNmbohZ8vzWrcrBP0A/KE3YGQcgJOI
	bY3wX2VsLAK1QTMszL0UM0yf+UA5oRw7VTuqm1H/qZAiSmTM2DwiMuy8A+nvCLQrGZ5V76s6SP8Og
	LqpHalAIxB0HL1GMMfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHojO-000000000JJ-0kUN;
	Thu, 13 Jun 2024 17:59:26 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHojK-000000000HR-3uS7
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Jun 2024 17:59:24 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7960454db4fso73406685a.2
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2024 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718301561; x=1718906361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DxvYUGVHxRZE8NgyFyBxxrydXJ+gJq/RSG2sz2esD8=;
        b=t/vwuklwRY4UoB1YKcLkGBEX0NK5O/kzllKjrDqjST3JVf75hBiQzPdnbhCoSNcUJO
         hnXeHJGgqobDrWjNjdvvF0OeM7QJOWyepV5Q82687e0n78DT2W++6HX3UuQ4E2wf/x5m
         uS4lZ2QQeRwnZCll2ga9xNLO0ijKFGXnpMAEMoO3TgHX03DhCqiGmRHzkbeg8obK9WIB
         CvNMG5d+9TUf5DrQXjtF3HiiTk/4E3F74H35wy03clmcY4Nea8s/eMJ/ict5GW1NqRgP
         HEslFhhFilj/mOdZfCKSVTuCEKncV+bLgi2NSe0i3mMPX4q3C1x29O6fpmHBrjTy0CJ7
         Scbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301561; x=1718906361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DxvYUGVHxRZE8NgyFyBxxrydXJ+gJq/RSG2sz2esD8=;
        b=EPi+u+Bsau0E4aMmGUtutzLC+78ODvXLIk0gunG9kGSdc3X4P+pJC3ncDA1J8FINZ6
         NgRyRo7RALAbWHgmGaJJbIG91JuTaq27cwNYLAEj+/VqrbYQhk+kHZaN5vqHbBqQhOzl
         mPzbFI0eDCskskzxnyGKzQisr6fLjqc+f6xaPDJQySbNHYG8BAZ9YzZ/6V8hhslzHYtN
         LmSN/OC+rBYEKAQvbPjYIcQ8njrzNuLvkC505McHRnp8RHluNI1rT5tF1Th4jeY7RJem
         LY3bwH52sIVzAayWvVU6FQeeguY+J11dshm4LZw7UluFkSRzF+K8E6RG+QuU5F3kwmzI
         9uWA==
X-Forwarded-Encrypted: i=1; AJvYcCUXx+TwQBwjmN8fVjMEjNgY/S+vi04qwP7BaIlFBVwxfsxH8pTGftodfuUJp22KEkAKucoXdTsEVC7apUjdLnlaSPZwq99yYwcqqrl9J7fEhac=
X-Gm-Message-State: AOJu0YwwAsOvOrpKbdaTNTnW8wHCW3HZZHmp8YLteVmJQ+t5G9LCY/Tw
	OghCXtuf2OLZpTehOboPErJMXnEdWaRERyTS4vftJd7y+42Pn4vLdlNVUqFeRMk=
X-Google-Smtp-Source: AGHT+IHYu0HIgU07HmWdvzdf4u4qWBn8WlIILCE4f7D5lT6HmhfiWx5mZ5m4ZVSvcO8gHLmSoTykaQ==
X-Received: by 2002:a05:620a:44d1:b0:795:4d93:9e86 with SMTP id af79cd13be357-798d2411207mr28622885a.22.1718301560815;
        Thu, 13 Jun 2024 10:59:20 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798a9d8fb49sm73268185a.0.2024.06.13.10.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:59:20 -0700 (PDT)
Message-ID: <0003e57b-4c6a-470b-a0d8-20a13091d325@baylibre.com>
Date: Thu, 13 Jun 2024 13:59:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH] iio: simplify with regmap_set_bits(),
 regmap_clear_bits()
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
 <20240613182021.00005072@Huawei.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240613182021.00005072@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_105923_087714_63BFFDD5 
X-CRM114-Status: GOOD (  20.02  )
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

Ck9uIDIwMjQtMDYtMTMgMToyMCBwLm0uLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+IE9uIFR1
ZSwgMTEgSnVuIDIwMjQgMTI6NTI6MDYgLTA0MDAKPiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5A
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+PiBTaW1wbGlmeSB0aGUgd2F5IHJlZ21hcCBpcyBhY2Nl
c3NlZCBpbiBpaW8gZHJpdmVycy4KPj4KPj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRl
X2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNlCj4+IHJlZ21hcF9zZXRfYml0
cygpLgo+Pgo+PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNz
aW5nIHZhbCA9IDAsIHVzZQo+PiByZWdtYXBfY2xlYXJfYml0cygpLgo+Pgo+PiBTdWdnZXN0ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgo+IExv
b2tzIGxpa2UgYSBnb29kIGNoYW5nZSBpbiBnZW5lcmFsLiBIb3dldmVyLi4uCj4KPiBUaGUgcHJv
YmxlbSB3aXRoIGEgY2hhbmdlIGxpa2UgdGhpcyBpcyBpdCByZXN1bHRzIGluCj4gbm9uIHRyaXZp
YWwgYmFja3BvcnRpbmcgaWYgd2UgbmVlZCB0byBkdWUgdG8gYSBmaXggaW4gcmVsYXRlZAo+IGNv
ZGUuCj4KPiBBcyBzdWNoLCB3aGlsc3QgaXQgd2lsbCBvYnZpb3VzbHkgZ2VuZXJhdGUgYSBsb3Qg
b2YgcGF0Y2hlcywgSSdkCj4gbGlrZSB0aGlzIHNwbGl0IHVwIGludG8gYSBzZXJpZXMgc28gZWFj
aCBwYXRjaCB0b3VjaGVzIG9ubHkgb25lIGRyaXZlci4KPiBGaW5lIHRvIGtlZXAgYSBzaW5nbGUg
cGF0Y2ggZm9yIHRoZSBtdWx0aXBsZSBtb2R1bGUgZm9yIGEgc2luZ2xlCj4gZGV2aWNlIGNhc2Vz
IHRob3VnaC4KPgo+IEFsc28gc29tZSB2ZXJ5IGxvbmcgbGluZXMgdGhhdCBuZWVkIHRoZSBsaW5l
IGJyZWFrcyBwdXQgYmFjay4KClRoYW5rIHlvdS4gSSdsbCByZXN1Ym1pdCBhcyBhIHNlcmllcyBv
ZiBzZXBhcmF0ZSBwYXRjaGVzIHdpdGggdGhvc2UgCmZpeGVzIHNvb24uCgpUcmV2b3IKCj4KPiBK
b25hdGhhbgo+Cj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jIGIv
ZHJpdmVycy9paW8vYWNjZWwvbXNhMzExLmMKPj4gaW5kZXggYjhkZGJmZDk4ZjExLi40MGU2MDVj
NTdhZGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCj4+ICsrKyBi
L2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCj4+IEBAIC0xMDM0LDEwICsxMDM0LDggQEAgc3Rh
dGljIGludCBtc2EzMTFfY2hpcF9pbml0KHN0cnVjdCBtc2EzMTFfcHJpdiAqbXNhMzExKQo+PiAg
IAkJCQkgICAgICJmYWlsZWQgdG8gdW5tYXAgbWFwMC9tYXAxIGludGVycnVwdHNcbiIpOwo+PiAg
IAo+PiAgIAkvKiBEaXNhYmxlIGFsbCBheGVzIGJ5IGRlZmF1bHQgKi8KPj4gLQllcnIgPSByZWdt
YXBfdXBkYXRlX2JpdHMobXNhMzExLT5yZWdzLCBNU0EzMTFfT0RSX1JFRywKPj4gLQkJCQkgTVNB
MzExX0dFTk1BU0soRl9YX0FYSVNfRElTKSB8Cj4+IC0JCQkJIE1TQTMxMV9HRU5NQVNLKEZfWV9B
WElTX0RJUykgfAo+PiAtCQkJCSBNU0EzMTFfR0VOTUFTSyhGX1pfQVhJU19ESVMpLCAwKTsKPj4g
KwllcnIgPSByZWdtYXBfY2xlYXJfYml0cyhtc2EzMTEtPnJlZ3MsIE1TQTMxMV9PRFJfUkVHLAo+
PiArCQkJCU1TQTMxMV9HRU5NQVNLKEZfWF9BWElTX0RJUykgfCBNU0EzMTFfR0VOTUFTSyhGX1lf
QVhJU19ESVMpIHwgTVNBMzExX0dFTk1BU0soRl9aX0FYSVNfRElTKSk7Cj4gVG9vIGxvbmcKPgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jIGIvZHJpdmVycy9paW8v
YWRjL2NwY2FwLWFkYy5jCj4+IGluZGV4IGI2YzRlZjcwNDg0ZS4uOGZhYmY3NDhjMzZiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvY3BjYXAtYWRjLmMKPj4gKysrIGIvZHJpdmVycy9p
aW8vYWRjL2NwY2FwLWFkYy5jCj4+IEBAIC0zODUsOSArMzg1LDggQEAgc3RhdGljIGlycXJldHVy
bl90IGNwY2FwX2FkY19pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+IEBAIC00MjQs
MjMgKzQyMywxNyBAQCBzdGF0aWMgdm9pZCBjcGNhcF9hZGNfc2V0dXBfY2FsaWJyYXRlKHN0cnVj
dCBjcGNhcF9hZGMgKmRkYXRhLAo+PiAgIAlpZiAoZXJyb3IpCj4+ICAgCQlyZXR1cm47Cj4+ICAg
Cj4+IC0JZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FE
Q0MyLAo+PiAtCQkJCSAgIENQQ0FQX0JJVF9BVE9YX1BTX0ZBQ1RPUiB8Cj4+IC0JCQkJICAgQ1BD
QVBfQklUX0FEQ19QU19GQUNUT1IxIHwKPj4gLQkJCQkgICBDUENBUF9CSVRfQURDX1BTX0ZBQ1RP
UjAsCj4+IC0JCQkJICAgMCk7Cj4+ICsJZXJyb3IgPSByZWdtYXBfY2xlYXJfYml0cyhkZGF0YS0+
cmVnLCBDUENBUF9SRUdfQURDQzIsCj4+ICsJCQkJICBDUENBUF9CSVRfQVRPWF9QU19GQUNUT1Ig
fCBDUENBUF9CSVRfQURDX1BTX0ZBQ1RPUjEgfCBDUENBUF9CSVRfQURDX1BTX0ZBQ1RPUjApOwo+
IFRoYXQgb25lIGlzIG92ZXIgMTAwIQo+PiAgIAlpZiAoZXJyb3IpCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9neXJvL21wdTMwNTAtY29yZS5jIGIvZHJpdmVycy9paW8vZ3lyby9tcHUzMDUw
LWNvcmUuYwo+PiBpbmRleCBhNzkxYmEzYTY5M2EuLmZmMWM4MTU1MzA0NSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9paW8vZ3lyby9tcHUzMDUwLWNvcmUuYwo+PiArKysgYi9kcml2ZXJzL2lpby9n
eXJvL21wdTMwNTAtY29yZS5jCj4+ICAgCj4+IEBAIC01MTMsMTIgKzUxMyw4IEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCBtcHUzMDUwX3RyaWdnZXJfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpwKQo+PiAg
IAkJCQkgIkZJRk8gb3ZlcmZsb3chIEVtcHR5aW5nIGFuZCByZXNldHRpbmcgRklGT1xuIik7Cj4+
ICAgCQkJZmlmb19vdmVyZmxvdyA9IHRydWU7Cj4+ICAgCQkJLyogUmVzZXQgYW5kIGVuYWJsZSB0
aGUgRklGTyAqLwo+PiAtCQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1wdTMwNTAtPm1hcCwK
Pj4gLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMLAo+PiAtCQkJCQkJIE1QVTMwNTBfVVNSX0NUUkxf
RklGT19FTiB8Cj4+IC0JCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCwKPj4gLQkJCQkJ
CSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfAo+PiAtCQkJCQkJIE1QVTMwNTBfVVNSX0NUUkxf
RklGT19SU1QpOwo+PiArCQkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKG1wdTMwNTAtPm1hcCwgTVBV
MzA1MF9VU1JfQ1RSTCwKPj4gKwkJCQkJICAgICAgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwg
TVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCk7Cj4gS2VlcCB0aGUgbGluZSBicmVhayB0byBzdGF5
IHVuZGVyIDgwIGNoYXJzLgo+Cj4+IEBAIC05OTcsMTEgKzk5MSw4IEBAIHN0YXRpYyBpbnQgbXB1
MzA1MF9kcmR5X3RyaWdnZXJfc2V0X3N0YXRlKHN0cnVjdCBpaW9fdHJpZ2dlciAqdHJpZywKPj4g
ICAJCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiAgIAkJLyogUmVzZXQgYW5kIGVuYWJsZSB0aGUgRklG
TyAqLwo+PiAtCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUw
X1VTUl9DVFJMLAo+PiAtCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwKPj4gLQkJCQkJ
IE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QsCj4+IC0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJ
Rk9fRU4gfAo+PiAtCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCk7Cj4+ICsJCXJldCA9
IHJlZ21hcF9zZXRfYml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCj4+ICsJCQkJ
ICAgICAgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX0VOIHwgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JT
VCk7Cj4gRm9yIElJTyBzdHVmZiB0cnkgYW5kIHN0YXkgdW5kZXIgODAgY2hhcnMgdW5sZXNzIHRo
ZXJlIGlzIGEgc3Ryb25nCj4gcmVhZGFiaWxpdHkgYXJndW1lbnQgZm9yIGdvaW5nIGxvbmdlci4g
IEhlcmUgdGhlcmUgaXNuJ3Qgb25lLgo+Cj4+ICAgCQlpZiAocmV0KQo+PiAgIAkJCXJldHVybiBy
ZXQ7Cj4+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
