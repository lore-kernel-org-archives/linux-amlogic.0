Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F346BC433E9
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 11:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA09B206EB
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 11:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3xMXkiE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SgES9OtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA09B206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMhtoulM58k/Dyum0+xkXLVM1/5NLOjOielRsrw64cA=; b=j3xMXkiEeUTAJe1f8k1pjbLCg
	BXUrZa4b/lG0r80dvKr5zyMGr91mAgtZvKjnLU5htStczjQ3tDFuM+iarbfTAed1zmBo9OfNF2ZoY
	9JYxBvgxf8g1mYqyTkXaYQYedVL108BqKmh42CjwS9M+H682gF7iDO7A/WFq4EUY381UmQakCtN51
	FXHmFOmT1bwh50KAq9D48T25Zk3bbngri3YkRHUnXbQkUpdYSznJrHxu/3brWFvTCnfLgcoLTUchR
	/bB9qhpG213+Rx+9TyfRIYRTsQIVAwG8ZAOfpR7MIqDeC1KR6U2kafRRcq3U6wq48u/ibd7jh8Vtr
	rHovRUBoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDniq-0000fc-40; Thu, 03 Sep 2020 11:48:08 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDnik-0000e9-7D
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 11:48:04 +0000
Received: by mail-ua1-x944.google.com with SMTP id f16so477102ual.11
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lF+Kc4r9sUDwFZ8bE5xtVYQtO57AZ59ErxR5WiW/3Dw=;
 b=SgES9OtTIMOLLR9GP0CgnxjBl8QnwGm0lnbEOFW3YZ4Umcbth07htLKrbtjPzoJrQN
 riHsXXueEfeQzGreBEqhUgL7qnCZ622H+IqZXNhqcioGKpE1EXPctfh1eMVAndcV4Bhb
 XyHMcTpFpYx8azbD9Jamf1pRcJZZD6V4M+4Rf4ds2nfXvcRcOuYB6EDeBvisP8w90yBY
 drtgRLbuUdVF7V4BNcf3684BR1CPveOvuE1JSePdKmugPHvpeRaojJUAE5IutFeKrTzS
 d32RKGZD2865aakLJfYtpDwq7Nb1hvCzLXd2UiG0wjnuPQaIQSzu2jdLcHapaRGIeRrw
 Spdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lF+Kc4r9sUDwFZ8bE5xtVYQtO57AZ59ErxR5WiW/3Dw=;
 b=rjqQvU8+F6J2o49UWl4uPXY/JMit7b6zA7t3FXiYSXo8QaQPHd7EifcUXMeXy4ny2G
 h7MHARdmubImd4+lDAjI7MyF2O2V6Dber8mtzqKE+X/ETFDBtqYun/HvqGTuGseBoBVj
 55M27tj7fBhgehLsMDVLf8zsEZ+1iDcZCuoiwfuAoJoVMIiJCtPKQQUXIVa1d+nKhfiq
 PJlzW0JYJlvyrGQoZVZGCP6OVVFXM4Slmc5ARObggGOmL88oo3TTYbY/MWXQG3SrGriZ
 3wmPVK+SgLQ++Kw1B8qX5C8mSzjPv08rvehHswSXt+IiCv2r/2DCp+7Dc2vTGuZr6xTN
 AJNA==
X-Gm-Message-State: AOAM531mTSX8rPwLH0dBZPJfMQMXvCeTZcY/p8MZQUKpz11Hz0erXGhg
 OiR3S7t6qMktDq1gtII8rGW56ATV3YYzDUCv+xMBiQ==
X-Google-Smtp-Source: ABdhPJw60X++tc8veDsSpQLnhcJtb/sfDLdknN30k3JsTHwZA+kgY04b4+NZKXDv5kVrAmvgSCiWFjVFdoodQnu3vjE=
X-Received: by 2002:ab0:5e43:: with SMTP id a3mr726376uah.19.1599133678563;
 Thu, 03 Sep 2020 04:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-5-krzk@kernel.org>
 <4RW2GQ.J2DD55HCZMCH2@crapouillou.net>
In-Reply-To: <4RW2GQ.J2DD55HCZMCH2@crapouillou.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Sep 2020 13:47:22 +0200
Message-ID: <CAPDyKFoXacPnq5Kv5QEvHjhQz+PN1jAzdGA=TR+e+MwB90Hafw@mail.gmail.com>
Subject: Re: [PATCH 04/11] mmc: jz4740: Simplify with dev_err_probe()
To: Paul Cercueil <paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_074802_571315_46204AC0 
X-CRM114-Status: GOOD (  21.36  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAzIFNlcCAyMDIwIGF0IDEyOjUwLCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4gd3JvdGU6Cj4KPiBIaSBLcnp5c3p0b2YsCj4KPiBMZSBtZXIuIDIgc2VwdC4gMjAy
MCDDoCAyMTozNiwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiBhCj4gw6lj
cml0IDoKPiA+IENvbW1vbiBwYXR0ZXJuIG9mIGhhbmRsaW5nIGRlZmVycmVkIHByb2JlIGNhbiBi
ZSBzaW1wbGlmaWVkIHdpdGgKPiA+IGRldl9lcnJfcHJvYmUoKS4gIExlc3MgY29kZSBhbmQgdGhl
IGVycm9yIHZhbHVlIGdldHMgcHJpbnRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21tYy9o
b3N0L2p6NDc0MF9tbWMuYyB8IDUgKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9o
b3N0L2p6NDc0MF9tbWMuYwo+ID4gYi9kcml2ZXJzL21tYy9ob3N0L2p6NDc0MF9tbWMuYwo+ID4g
aW5kZXggODFkNzEwMTBiNDc0Li4wYzViNTJiNTMzMDMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L21tYy9ob3N0L2p6NDc0MF9tbWMuYwo+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9qejQ3NDBf
bW1jLmMKPiA+IEBAIC05OTEsOSArOTkxLDggQEAgc3RhdGljIGludCBqejQ3NDBfbW1jX3Byb2Jl
KHN0cnVjdAo+ID4gcGxhdGZvcm1fZGV2aWNlKiBwZGV2KQo+ID4KPiA+ICAgICAgIHJldCA9IG1t
Y19vZl9wYXJzZShtbWMpOwo+ID4gICAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICBp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgZGV2X2Vy
cigmcGRldi0+ZGV2LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvdWxkIG5v
dCBwYXJzZSBkZXZpY2UgcHJvcGVydGllczogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAg
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJjb3VsZCBub3QgcGFyc2UgZGV2aWNlIHByb3BlcnRpZXNcbiIpOwo+Cj4gSSB0aGlu
ayB5b3UgY2FuIHB1dCB0aGF0IG9uIG9uZSBsaW5lLgoKSSBjYW4gYW1lbmQgdGhlIHBhdGNoIHdo
ZW4gSSByZWJhc2UgbXkgYnJhbmNoIG5leHQgd2Vlaywgbm8gbmVlZCBmb3IgYSByZXNlbmQuCgo+
Cj4gV2l0aCB0aGF0IHNhaWQ6Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3Jh
cG91aWxsb3UubmV0PgoKQW5kIEkgYWRkIHlvdXIgdGFnIGFzIHdlbGwsIHRoYW5rcyEKCktpbmQg
cmVnYXJkcwpVZmZlCgo+Cj4gQ2hlZXJzLAo+IC1QYXVsCj4KPiA+ICAgICAgICAgICAgICAgZ290
byBlcnJfZnJlZV9ob3N0Owo+ID4gICAgICAgfQo+ID4KPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
