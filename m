Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D7CA0EFC
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Aug 2025 04:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSxYP1SWLXq3Bt1ewJ4rjsginv6TrY2LL+a4LrSuZog=; b=g1vTpb5lAWcDgz
	2P6RY7skfXSS15EDaO2Ov5TJiehmJuVIgMIZ8SXfE81hdOSs1sM6sNy0Fhc5i/ueazQBI1W7jsLof
	exN0YMQ8FpO9bd4brLmjuCwu3yxKcHsKZuNpFNJVIk1s2GcnVG7APGHuoiVk2HW5PnrgLVwjwHs7h
	Y5mHrqfPrS4HjuGR6KPQ5+1GaMQle6xjlZURi5H71ZOm+JpzDRiM2Ae0t1TpXUkTGKGygMQiUfVvv
	BG5+P6/3Uj26EPntQP6OqvJ7UBZfvyLXqy+ReuCFmsg8D41+6nl0gb4YmtUKQt1BBsUU/TcwA33yK
	XbROMBZsLp6hXeNdwlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJTd-00000001Vmg-4ADj;
	Fri, 22 Aug 2025 04:34:09 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDfZ-00000000jXg-3HOy
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Aug 2025 22:22:07 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-71d603cebd9so16967447b3.1
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Aug 2025 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755814924; x=1756419724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=JFqepFP6WTLC9ukFxVc0v0Crwtn1zmocKru8S7hczPlRwkjPbe3YjpYAnmxyhlv7gS
         2lVuXJSvPuNuizZzvGksACsn5TvO7RXUI55fFBqgmm3Hb63zdKaVFoFFddCdHOtkhcVb
         gxTVv8+wyVd/9szIMujc3mRzDgLoCFw+60u7nCcmf/ClrIEF7SWdW6yVOeV027NBPFhG
         DntyFKFIA22h6+2eFzzVddM2AQ0pCHUXUr8opYK0zB0Mxr+TKWsushtJs9DpLmJoAK2e
         6zPfQZZTAOCXm4L+qIJxzYyFULqgw2BfnAhrWmDjJJcsb4X00P1aPkpo+la+QT1IjBmD
         Hx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814924; x=1756419724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=CHdSMdWb2+NDuSpxdIIJ4e+uoWqrD/y4FtJU6bZFRRKH5lw0keCsMMEj7H5H/q/GKt
         +f9h6YuxWjsXJWJXjBxxQZDqTGpBB+ruRIDfqw5Wmok4ZLaNSEBnLwLobS8R++Dvad2u
         hp5+7+0D79mNfC8lTIIIlh+f9/UpR5OYIoBZzuceara9HdD8qGgv4HsGSOTfHkHr5xGy
         wQy+L1jrc2h8k2j73xp95JUfQhB6nKV3rxfsLcM26dkOcWliEEdZePpaEeG3kZv9h2ww
         CHo1ukHT5cVichGZnePWfJCggx2ZR/1kTACG8nXz71iHM00Acytb4Jw9ZDBmqPTNKvlI
         NB8w==
X-Forwarded-Encrypted: i=1; AJvYcCXlYnQKf2uiU1BrfmP7IxJV48ulrUdsoZRMpHSAl4Ka0Iu9FoqJhHyGZ+amuSHW3A7e+V2dk2vRF/LDDOh0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfR4/nX128e+LhnyBKIM/SIau6g84C811hdYVjBUYdlhkYAsUc
	ik4cxAQpRzL3eQo/jugZYvrC3mMQjV5CEk16hdfF6VnZRSvyrkCkm5zRwTCpVFfkk3H2DhHgFsD
	H1uP68TvAxUUpH/aJZWWjyORUvbxG8lmv62I7ZpVf
X-Gm-Gg: ASbGncuP4KZBYOZzD/uEbT4YQV5zU+aMwnpqPgeRfqt6uoPM9sHlc+yeY4vvSBZLqHc
	WG1Ma3ytU77K20INzOudlXWKvoTdeoRa6pjTMGj7PZGRQHYrJPY0bT7jTWO4+kiToeonQBIgK4P
	F90eqlNmNIjqRR8Vin79dHm5xTqYwgm9luZM4H8iqjJTtM3KkoikU1WkRBEgTExVcHglGSm4Lps
	no/FrRIvnd7PCquipt8h2t/PXPDW8UEpGNsNF7l0Vr64Dq4E28rD6zQt+4pLw==
X-Google-Smtp-Source: AGHT+IGsRvIzVdiLiubOw6s26FCV+8GUBa/zvOZHQKwnuxp9m8DDW2C1NVHDopq1Qw9f3dHJcaZcP9J53I+yjNcPN2E=
X-Received: by 2002:a05:690c:9a01:b0:71f:96b4:9adc with SMTP id
 00721157ae682-71fdc327bd2mr9169047b3.18.1755814924223; Thu, 21 Aug 2025
 15:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250814200953.1969944-1-da@libre.computer> <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
In-Reply-To: <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Aug 2025 18:21:53 -0400
X-Gm-Features: Ac12FXxi99gixxdRQMIukXDBwJ56n_o8uuNClN7qs096fAcZ04uxsTATA3IRRuY
Message-ID: <CACqvRUaZaoh7vV7Qo_dtnxC-NE227rY7EQe=dx2a_nCcfiZB2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_152205_890215_709BE0A6 
X-CRM114-Status: GOOD (  18.85  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNDo0M+KAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcg
MTQsIDIwMjUgYXQgMTA6MDnigK9QTSBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPiB3cm90ZToK
PiA+Cj4gPiBUaGUgYml0IHJhbmdlIDE3OjAgZG9lcyBub3QgbWF0Y2ggdGhlIGRhdGFzaGVldCBm
b3IgQTMxMUQgLyBTOTA1RDMuCj4gPiBDaGFuZ2UgdGhlIGJpdCByYW5nZSB0byAxOTowIGZvciBG
SVggYW5kIEhJRkkgUExMcyB0byBtYXRjaCBkYXRhc2hlZXQuCj4gSSBoYXZlOgo+IC0gIFM5MDVY
M19QdWJsaWNfRGF0YXNoZWV0X0hhcmRrZXJuZWwucGRmCj4gLSAgUzkyMlhfRGF0YXNoZWV0X1dl
c2lvbi5wZGYKPiAtICBBMzExRF9EYXRhc2hlZXRfMDFfV2VzaW9uLnBkZgo+IFRoZXNlIHN0YXRl
IChmb3IgYWxsIHRocmVlIFBMTHMpIHRoYXQgLmZyYWMgaXMgWzE4OjBdICh0aGF0J3Mgc2hpZnQg
PQo+IDAgYW5kIHdpZHRoID0gMTkpLgo+IEkgZ2V0IHdoZXJlIHlvdSdyZSBjb21pbmcgZnJvbSB3
aXRoIDE5OjAgLSBpbiB0aGUgY29udGV4dCBvZiB0aGlzCj4gcGF0Y2ggdGhpcyBjYW4gYmUgbWlz
bGVhZGluZyBhcyBpdCB3b3VsZCBtZWFuIHRoYXQgdGhlIGZyYWN0aW9uYWwKPiBkaXZpZGVyIGlz
IDIwIGJpdHMgd2lkZS4KClllcywgSSB3YXMgaW4gYSBydXNoIGFuZCBtaXNzZWQgdGhpcy4gVGhl
IGRlc2NyaXB0aW9uIGlzIGJhZCBhbmQgSSdsbApzcGluIGEgdjIgd2l0aCB0aGUgRml4ZXMgYXMg
d2VsbCBhcyByZXBvcnQgdGhlIGNsb2NrIGRpZmZlcmVuY2VzLgoKPgo+ID4gVGhlcmUncyBubyBm
cmFjIGZvciBzeXMgcGxsIHNvIGFkZCB0aGF0IGFzIHdlbGwuCj4gSSBmaXJzdCByZWFkIHRoaXMg
YXMgc3lzIHBsbCBkb2VzIG5vdCBoYXZlIGEgZnJhY3Rpb25hbCBkaXZpZGVyLgo+IFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0OiAiVGhlIGZyYWMgZmllbGQgZm9yIHN5cyBwbGwgaXMgbWlzc2luZyBz
byBhZGQKPiB0aGF0IGFzIHdlbGwiCgpXaWxsIGNvcnJlY3QgaW4gVjIuCgo+Cj4gSSBndWVzcyBh
dCB0aGlzIHBvaW50IHRoaXMgc2hvdWxkIGluY2x1ZGU6Cj4gRml4ZXM6IDA4NWE0ZWE5M2Q1NCAo
ImNsazogbWVzb246IGcxMmE6IGFkZCBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIiKQo+ID4g
U2lnbmVkLW9mZi1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KCkFjawo+Cj4gWy4uLl0K
PiBIYXZlIHlvdSBjb21wYXJlZCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21lYXN1
cmVfc3VtbWFyeSBhbmQKPiAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkgYmVmb3Jl
L2FmdGVyIHRoaXMgcGF0Y2g/Cj4gSSdsbCB0ZXN0IHRoaXMgZHVyaW5nIHRoZSB3ZWVrZW5kIGFu
ZCB0aGVuIGdpdmUgbXkgVGVzdGVkL1Jldmlld2VkIGJ5CgpXaWxsIHByb3ZpZGUgaW4gVjIuCgo+
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
