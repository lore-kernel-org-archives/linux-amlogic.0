Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8F5C35257
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771EC20758
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tytegxtm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gLCNZCVK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771EC20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DL9g4XBA3xQjd/uiWh2LHidGCUZg3rWUDwrHh0STr7Y=; b=TytegxtmCGA3EBV0DsA6qjQpa
	QDMTd0NmZRrBnPu5jMRKWDJCjDqr9+mCqZugNpNzUM9yri3ueNx9bwYGkIQdfJ4efRZdq8ei25K5p
	202lkpjzFQmhNgXkIi/Ulx2hDnDemAiHHxaqWTUUSipdRa2W7g4Ok9kViH3K/F7rP6D5xT5pxyuru
	hqntUShIcp0QSv4MgoExY92DKXQy4eHrrtoLx53jO5MR5cf6koMPgiGcNwv6yf4ncLAk+zAFtEgVO
	2uegvStewP5Rduy6m4MVqs6s530Ri1vlIct2hjfu4zNmfGqL9HV/yC+Ucd5jRVy8pnuhGm3iKNN1M
	LyTaOthSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQ3k-0004S4-A8; Fri, 02 Oct 2020 18:45:36 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQ3g-0004Qu-4y
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:45:33 +0000
Received: by mail-pj1-x1041.google.com with SMTP id gm14so1414927pjb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OSungDavzwrTiZitRW4ghbMXabyB4bs5Qc5OzKDq14w=;
 b=gLCNZCVKKahjlsvR18a1O6cNIq2HtJv6UlSb74OlnEVAGqsjVvDkQh8w5ZSpdqkx3N
 pggXv8wRYZBZKGMCAQwkVdO1idWpZjAmwtg/KwUJDIxfJKNefy25Utm40i866Xc2oDVx
 zeRutie6M7Dr2442uL2N1EYvuTPrJsYK6rUyU7Usw7ArZlqk4uw85EssAlV1xohVKqlY
 ZSYt62dHPPnwpez7VNe1fnliX6/4r0fS+Oz+g4F08Wf6By6nzPQTu3yC0FtOTiRzD3/0
 HzA604+V+2YM3hcCadwt9aY5VJbTS/z97cvOQFKtYJcEm/xkh936gNCROucrktaZvtL1
 ayMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OSungDavzwrTiZitRW4ghbMXabyB4bs5Qc5OzKDq14w=;
 b=o0UfNYE1ka46mwUkHIYijrgYV65huJcTGTBzUGIgOMicUxZe54JTai5nelyc0hwUNV
 KMAtBez+wh55dsper2jCkYYwrMEGbgXGlQWuw6myrhB7CFdOzHKglbd/+uZzigMXth88
 izdKVp6UpL2ci0RZFPH2qfFjtZRVkQISDlDkJqv66tLcrA87K4V1TEZpz/vEMhpfQJeb
 9E8j0YJqFjfKkHBwOUiMJsJu84CyKEuw+TYcswfFf/w/Z6g/cOqt2kQ5Q16+WLYxYq9F
 XQ409r75YZeskmkA4cBXBFlI2ulxuBzczn9smsJ2IXJyYhvPVCmcIxZqVCu35T/Fq4jb
 Gj2A==
X-Gm-Message-State: AOAM5338WU0SY/bvJMIVB6JOMwMkFf8pY6MQrDC+bejG0EDyZi/N7wOO
 JlsYP7nDaHM1hxlCJC3BtYqwZQ==
X-Google-Smtp-Source: ABdhPJzgkgvjeIzrjdaYP7uHPa/1T6V4wPyIUOvMTxYeSE4X1Re7n+1ESMdqoVJI7bFRzhx0ItfoIQ==
X-Received: by 2002:a17:90b:3882:: with SMTP id
 mu2mr3411253pjb.29.1601664329904; 
 Fri, 02 Oct 2020 11:45:29 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h2sm2932622pfk.90.2020.10.02.11.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:45:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
In-Reply-To: <785296E3-FA91-4F5E-A8C0-1FAA8C576A17@gmail.com>
References: <20201002141619.14387-1-christianshewitt@gmail.com>
 <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
 <785296E3-FA91-4F5E-A8C0-1FAA8C576A17@gmail.com>
Date: Fri, 02 Oct 2020 11:45:28 -0700
Message-ID: <7h7ds8mppz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_144532_219617_9E427278 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Q2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyaXRlczoKCj4+
IE9uIDIgT2N0IDIwMjAsIGF0IDY6NDQgcG0sIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGli
cmUuY29tPiB3cm90ZToKPj4gCj4+IE9uIEZyaSAwMiBPY3QgMjAyMCBhdCAxNjoxNiwgQ2hyaXN0
aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4+IFZJ
TTNMIG5vdyBpbmhlcml0cyB0aGUgc291bmQgbm9kZSBmcm9tIHRoZSBWSU0zIGNvbW1vbiBkdHNp
IGJ1dCBpcwo+Pj4gYW4gU00xIGRldmljZSwgc28gbGFiZWwgaXQgYXMgc3VjaCwgYW5kIHN0b3Ag
dXNlcnMgYmxhbWluZyBmdXR1cmUKPj4+IHN1cHBvcnQgaXNzdWVzIG9uIHRoZSBkaXN0cm8vYXBw
ICJ3cm9uZ2x5IGRldGVjdGluZyIgdGhlaXIgZGV2aWNlLgo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4+IC0tLQo+
Pj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRz
IHwgNCArKysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+PiAKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLWtoYWRhcy12
aW0zbC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLWtoYWRhcy12
aW0zbC5kdHMKPj4+IGluZGV4IDRiNTE3Y2E3MjA1OS4uZjQ2ZjBlY2MzN2VjIDEwMDY0NAo+Pj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wu
ZHRzCj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLWtoYWRh
cy12aW0zbC5kdHMKPj4+IEBAIC0zMiw2ICszMiwxMCBAQAo+Pj4gCQlyZWd1bGF0b3ItYm9vdC1v
bjsKPj4+IAkJcmVndWxhdG9yLWFsd2F5cy1vbjsKPj4+IAl9Owo+Pj4gKwo+Pj4gKwlzb3VuZCB7
Cj4+PiArCQltb2RlbCA9ICJTTTEtS0hBREFTLVZJTTNMIjsKPj4+ICsJfTsKPj4gCj4+IFRoZSBz
b3VuZCBjYXJkIGlzIHRoZSBzYW1lIHNvIEkgZG9uJ3Qgc2VlIHdoeSB0aGUgc20xIGJvYXJkIHNo
b3VsZCBoYXZlCj4+IGEgZGlmZmVyZW50IG5hbWUuIElmIHlvdSBhcmUgbm90IGhhcHB5IHdpdGgg
dGhlIG5hbWUsIHBsZWFzZSB1cGRhdGUgaXQKPj4gaW4gdGhlIGNvbW1vbiBmaWxlLgo+Cj4gSXTi
gJlzIGEgbmljZS10by1oYXZlIG5vdCBhIG11c3QtaGF2ZSwgYnV0IHRoZSBjdXJyZW50IExFIGlt
YWdlcyB0aGF0IGFyZQo+IGluIGNpcmN1bGF0aW9uIHVzZSA1Ljcgd2l0aCB0aGUgcHJldmlvdXMg
Ym9hcmQtY29ycmVjdCBuYW1lIHNvIEkgd2FzCj4gbG9va2luZyBmb3IgY29udGludWl0eS4gV2Ug
ZG8gc2VlIHVzZXIgZm9ydW0gcmVwb3J0cyAoaW5mcmVxdWVudCBidXQKPiByZWN1cnJpbmcpIG9m
IHdyb25nbHkgZGV0ZWN0ZWQgaGFyZHdhcmUgd2l0aCBvdGhlciBTb0MgcGxhdGZvcm1zIHdoZXJl
Cj4gc2ltaWxhciBuYW1lIGluaGVyaXRhbmNlIHN1cmZhY2VzIHRoZSDigJh3cm9uZ+KAmSBkZXZp
Y2UgbmFtZSBpbiBHVUlzLCBhbmQKPiBJIGxpa2UgYW55dGhpbmcgdGhhdCBhdm9pZHMgc3VwcG9y
dCB3b3JrLgo+Cj4gSeKAmWQgc3VnZ2VzdCBLSEFEQVMtVklNMy1WSU0zTCBhcyBhIGNvbW1vbiBu
YW1lLCBidXQgdGhlbiBpdOKAmXMgdGhlIG9ubHkKPiBkZXZpY2UgaW4gdGhlIGN1cnJlbnQgZGV2
aWNlLXRyZWUgc2V0IHRoYXQgaXMgbm90IHByZWZpeGVkIHdpdGggdGhlIFNvQwo+IGlkZW50aWZp
ZXIsIHdoaWNoIChPQ0QpIGZlZWxzIHdyb25nLgoKVHJ1ZSwgYnV0IHR1cm5zIG91dCB0aGVyZSdz
IG5vdGhpbmcgU29DIHNwZWNpZmljIGFib3V0IHRoaXMgc291bmQgYmxvY2sKc2luY2UgaXQncyBp
ZGVudGljYWwgYWNyb3NzIFNvQ3MsIHNvIHNwZWNpZnlpbmcgdGhlIFNvQyBpcyBiZWluZyB0b28K
c3BlY2lmaWMuIAoKT1RPSCwgd2hpbGUgSSBhZ3JlZSBpdCBsb29rcyAid3JvbmciLCBpdCdzIHBy
ZXR0eSBjb21tb24gaW4gTGludXggRFQgdG8KaGF2ZSB0aGUgU29DIHByZWZpeCB0byBtZWFuIG9u
bHkgdGhhdCBpdCdzICJjb21wYXRpYmxlIiB3aXRoIHRoYXQgU29DLApub3QgdGhhdCBpdCAqaXMq
IHRoYXQgU29DLgoKSG93ZXZlciwgSSBhZ3JlZSB0aGF0IHRoYXQgY2FuIGxlYWQgdG8gY29uZnVz
aW9uIHdpdGggZW5kIHVzZXJzLCBzbwpzaW5jZSB0aGlzIGNoYW5nZSBoYXMgbm90IGZ1bmN0aW9u
YWwgY2hhbmdlLCBhbmQgb25seSBhIFVYIGlzc3VlIGluCnVzZXJzcGFjZSwgSSdtIGZpbmUgdG8g
YXBwbHkgaXQuCgpLZXZpbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
