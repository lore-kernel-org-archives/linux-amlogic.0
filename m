Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82A6C48BCF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4781260FDC
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4781260FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uvqO5BFazDVkLbfWc610RSuJ5nr1Oh28l6tFC8d7FQg=; b=osUQmDuqFvga92Qy2CGlSZsoaL
	h7uKUJ1fy+5/qU41bFRfFB9zATwRV9HY31dsLB6OS74iLgz1vkVmOta9IbFTCpWCnNmxcSwwgYiKN
	uxRmInZlcQiZSRozKqu84BcRJHpKxDQ3hVIL4hftF23w2khTxgOydv77I6hn8+oCTLpUFAFssKes9
	uQSVojzs09MXFTGYzMpRvuxhefNziFTrhMZgl3o7S3QxhmLwUvoYMo/07NGatAg7J4pi4RKnOhdnx
	8w0L9lLPcBNb21GWIg8cXW2u/5sJC6Yl3CtIKcwh4nTR1gizt54/xnDkaWU+SEDSrpYkHAqiNy4ep
	+oq6jDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0lE-00EnuM-Gz; Wed, 09 Jun 2021 16:08:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqzc0-00ER4l-Ar
 for linux-amlogic@lists.infradead.org; Wed, 09 Jun 2021 14:55:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so4012942wmq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jun 2021 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aqUXgxKem/FgFj2OMd/1PjPY57LBnc5X2h5rJOjG66g=;
 b=DfyNKmTodZSmubr8h4Gd9vq39IM67wd+xk00ybFXRBanS3aS5Ro/Ocm0/54zq49csE
 8b4UkVNN3MnDd0RDmKAE6gTZsx/KgIQmDairrr1iT223CnAToVNHQSiHKvbBTSdJe91G
 5mYr452Kvs5KcObJ81VXUFQH7zeGkkxLoqgDzWp03WOaApsqj/HEkERhMAP7QPc1Qq2s
 HnTTRtBN6JtH0zLpW4G9zwhxPUccJ1WrcBtK3YFI4w1tegyU+utDqwbcawBbM+D3GKDJ
 uTy0lLjxEeK/cAEzTHno+viQoEIEjIF4Jl8fauFOYYqT/q3Bkm2Zm+MmCQUTAP43AR5S
 2XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aqUXgxKem/FgFj2OMd/1PjPY57LBnc5X2h5rJOjG66g=;
 b=JVc6KvJ3I8ohOVrnqXNte4hPbRzuySAhG5aw0GxMnkVokZnaZlmx7XCmolahIpoYwA
 ia6O9aeHjghRom2LJnbzNdCkgnMvlluhOfwbk4rAW6w8IBOK3Ho0ioJQgkCKeaFZDt1+
 gGq5PQU6/o75RcCKgDgxqskAnMGHdYt8bWN5cvZu2OES0yDmLF+TtA6fxiu9OCl4QQcA
 DVBV5QF5EyBa1vnNYXgYBlK543iKUh43DjG6o4bjrkv5nwWc6JWAi4Et2hYYSVqIGxvr
 k2nu4HYj6Yx6jpPHmAwgp5HdLoB23ArO9WAHRmWQd23aR0R9/89QPmVvt5K6vMrzf6Cx
 ieWw==
X-Gm-Message-State: AOAM532jhRbERvzLW0VgimRFmZfG3OCDkyuosJJzHO97oU1oE0QoWNF+
 U49Cz6NE3dODK+L8uCUGqkFotA==
X-Google-Smtp-Source: ABdhPJyoyiHHWY07377g/rBQGUND7clmDjOwjTdSioN8Q1UBMK/7MPao/79fy28PA/aexKnh6iJ9ZQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr262420wmj.134.1623250518306;
 Wed, 09 Jun 2021 07:55:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f5b2:1a3b:b4d:517c?
 ([2a01:e0a:90c:e290:f5b2:1a3b:b4d:517c])
 by smtp.gmail.com with ESMTPSA id q5sm52991wmc.0.2021.06.09.07.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:55:17 -0700 (PDT)
Subject: Re: [RFC] mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
To: Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, ulf.hansson@linaro.org
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20210608153357eucas1p24cbc7a2ddb00beada8cdd51ae2337c53@eucas1p2.samsung.com>
 <20210608153344.3813661-1-narmstrong@baylibre.com>
 <e9f057f6-324e-0637-b57a-cc2f87e0d108@samsung.com>
 <ebb1421c-e55c-eee3-ea42-09ae051659d4@baylibre.com>
 <92024ca5-c6fa-0e6a-b6ba-f35f92222e76@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a59a4dd3-9a09-a9b4-71f2-7e37c92cf40e@baylibre.com>
Date: Wed, 9 Jun 2021 16:55:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <92024ca5-c6fa-0e6a-b6ba-f35f92222e76@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_075520_493440_4DC92139 
X-CRM114-Status: GOOD (  21.55  )
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

SGkgUm9iaW4sCgpPbiAwOS8wNi8yMDIxIDE2OjQ1LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24g
MjAyMS0wNi0wOSAxNDowNywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAw
OC8wNi8yMDIxIDE3OjUwLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+Pj4gSGkKPj4+Cj4+PiBP
biAwOC4wNi4yMDIxIDE3OjMzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBJdCBoYXMgYmVl
biByZXBvcnRlZCB0aGF0IHVzYWdlIG9mIG1lbWNweSgpIHRvL2Zyb20gYW4gaW9tZW0gbWFwcGlu
ZyBpcyBpbnZhbGlkLAo+Pj4+IGFuZCBhbmQgcmVjZW50IGFybTY0IG1lbWNweSB1cGRhdGUgWzFd
IHRyaWdnZXJzIGEgbWVtb3J5IGFib3J0IHdoZW4gZHJhbS1hY2Nlc3MtcXVpcmsKPj4+PiBpcyB1
c2VkIG9uIHRoZSBHMTJBL0cxMkIgcGxhdGZvcm1zLgo+Pj4+Cj4+Pj4gVGhpcyBhZGRzIGEgbG9j
YWwgc2dfY29weV90b19idWZmZXIgd2hpY2ggbWFrZXMgdXNhZ2Ugb2YgaW8gdmVyc2lvbnMgb2Yg
bWVtY3B5Cj4+Pj4gd2hlbiBkcmFtLWFjY2Vzcy1xdWlyayBpcyBlbmFibGVkLgo+Pj4+Cj4+Pj4g
Rml4ZXM6IGFjZGM4ZTcxZDliYiAoIm1tYzogbWVzb24tZ3g6IGFkZCBkcmFtLWFjY2Vzcy1xdWly
ayIpCj4+Pj4gUmVwb3J0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1z
dW5nLmNvbT4KPj4+PiBTdWdnZXN0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFy
bS5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPgo+Pj4+Cj4+Pj4gWzFdIDI4NTEzMzA0MGU2YyAoImFybTY0OiBJbXBvcnQgbGF0
ZXN0IG1lbWNweSgpL21lbW1vdmUoKSBpbXBsZW1lbnRhdGlvbiIpCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gSGkgVWxmLCBNYXJlaywgTWFyaywKPj4+Pgo+Pj4+IEkgaGF2ZW4ndCB0ZXN0ZWQgdGhl
IHBhdGNoIHlldCwgYnV0IHNob3VsZCBmaXggaXNzdWUgcmVwb3J0ZWQgYXQgWzJdLgo+Pj4KPj4+
IFdvcmtzIGZpbmUgaGVyZSBhbmQgZml4ZWQgdGhlIGlzc3VlLgo+Pj4KPj4+IFRlc3RlZC1ieTog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+Pgo+PiBUaGFua3Ms
IEknbGwgbmVlZCB0byByZXdvcmsgdG8gcGFzcyBhbiBfX2lvbWVtIHBvaW50ZXIgdG8gbWVtY3B5
X3RvL2Zyb21pbyBzbyBzcGFyc2UgZG9lc24ndCBzY3JlYW0gYW55bW9yZS4KPiAKPiBIbW0sIG1p
Z2h0IGl0IGJlIHdvcnRoIGZhY3RvcmluZyBvdXQgZ2VuZXJhbCBzZ19jb3B5X3t0byxmcm9tfV9p
b21lbSgpIGhlbHBlcnM/IEZyb20gYSBxdWljayBncmVwIEkgZm91bmQgYXQgbGVhc3QgbXZfY2Vz
YV9zZ19jb3B5KCkgYWxyZWFkeSBkb2luZyBlc3NlbnRpYWxseSB0aGUgc2FtZSB0aGluZyBhcyBt
ZXNvbl9tbWNfY29weV9idWZmZXIoKS4KCkl0J3MgZGVmaW5pdGVseSB3b3J0aCBpdCwgYnV0IHNp
bmNlIHdlIG5lZWQgYSBxdWljayBmaXgsIHdlIHNob3VsZCBoYXZlIG1lc29uX21tY19jb3B5X2J1
ZmZlcigpIGFzIGEgZml4IHRoZW4gd2Ugc2hvdWxkIGRlZmluaXRlbHkgbW92ZSB0byBzZ19jb3B5
X3t0byxmcm9tfV9pb21lbSgpIGhlbHBlcnMKCk5laWwKCj4gCj4gUm9iaW4uCj4gCj4+Cj4+IE5l
aWwKPj4KPj4+Cj4+Pj4gTmVpbAo+Pj4+Cj4+Pj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvYWNiMjQ0YWQtMDc1OS01YTk2LWM2NTktNWMyMzAwM2QzZGNkQHNhbXN1bmcuY29tCj4+Pj4K
Pj4+PiDCoMKgIGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgfCA0OCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5j
Cj4+Pj4gaW5kZXggYjhiNzcxYjY0M2NjLi44OWZmNjAzODA5MmQgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hv
c3QvbWVzb24tZ3gtbW1jLmMKPj4+PiBAQCAtNzQyLDYgKzc0Miw0OCBAQCBzdGF0aWMgdm9pZCBt
ZXNvbl9tbWNfZGVzY19jaGFpbl90cmFuc2ZlcihzdHJ1Y3QgbW1jX2hvc3QgKm1tYywgdTMyIGNt
ZF9jZmcpCj4+Pj4gwqDCoMKgwqDCoMKgIHdyaXRlbChzdGFydCwgaG9zdC0+cmVncyArIFNEX0VN
TUNfU1RBUlQpOwo+Pj4+IMKgwqAgfQo+Pj4+IMKgwqAgKy8qIGxvY2FsIHNnIGNvcHkgdG8gYnVm
ZmVyIHZlcnNpb24gd2l0aCBfdG8vZnJvbWlvIHVzYWdlIGZvciBkcmFtX2FjY2Vzc19xdWlyayAq
Lwo+Pj4+ICtzdGF0aWMgdm9pZCBtZXNvbl9tbWNfY29weV9idWZmZXIoc3RydWN0IG1lc29uX2hv
c3QgKmhvc3QsIHN0cnVjdCBtbWNfZGF0YSAqZGF0YSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgYnVmbGVuLCBib29sIHRvX2J1ZmZlcikKPj4+PiArewo+
Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHNnX2ZsYWdzID0gU0dfTUlURVJfQVRPTUlDOwo+Pj4+
ICvCoMKgwqAgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wgPSBkYXRhLT5zZzsKPj4+PiArwqDCoMKg
IHVuc2lnbmVkIGludCBuZW50cyA9IGRhdGEtPnNnX2xlbjsKPj4+PiArwqDCoMKgIHN0cnVjdCBz
Z19tYXBwaW5nX2l0ZXIgbWl0ZXI7Cj4+Pj4gK8KgwqDCoCB2b2lkICpidWYgPSBob3N0LT5ib3Vu
Y2VfYnVmOwo+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IG9mZnNldCA9IDA7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgaWYgKHRvX2J1ZmZlcikKPj4+PiArwqDCoMKgwqDCoMKgwqAgc2dfZmxhZ3MgfD0g
U0dfTUlURVJfRlJPTV9TRzsKPj4+PiArwqDCoMKgIGVsc2UKPj4+PiArwqDCoMKgwqDCoMKgwqAg
c2dfZmxhZ3MgfD0gU0dfTUlURVJfVE9fU0c7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgc2dfbWl0ZXJf
c3RhcnQoJm1pdGVyLCBzZ2wsIG5lbnRzLCBzZ19mbGFncyk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAg
d2hpbGUgKChvZmZzZXQgPCBidWZsZW4pICYmIHNnX21pdGVyX25leHQoJm1pdGVyKSkgewo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbGVuOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgbGVuID0gbWluKG1pdGVyLmxlbmd0aCwgYnVmbGVuIC0gb2Zmc2V0KTsKPj4+PiArCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIFdoZW4gZHJhbV9hY2Nlc3NfcXVpcmssIHRoZSBib3VuY2Ug
YnVmZmVyIGlzIGEgaW9tZW0gbWFwcGluZyAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoaG9z
dC0+ZHJhbV9hY2Nlc3NfcXVpcmspIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dG9fYnVmZmVyKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5X3Rv
aW8oYnVmICsgb2Zmc2V0LCBtaXRlci5hZGRyLCBsZW4pOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVsc2UKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweV9m
cm9taW8obWl0ZXIuYWRkciwgYnVmICsgb2Zmc2V0LCBsZW4pOwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9IGVsc2Ugewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0b19idWZmZXIpCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoYnVmICsgb2Zmc2V0LCBt
aXRlci5hZGRyLCBsZW4pOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweShtaXRlci5hZGRyLCBidWYgKyBv
ZmZzZXQsIGxlbik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIG9mZnNldCArPSBsZW47Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAg
c2dfbWl0ZXJfc3RvcCgmbWl0ZXIpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+IMKgwqAgc3RhdGljIHZv
aWQgbWVzb25fbW1jX3N0YXJ0X2NtZChzdHJ1Y3QgbW1jX2hvc3QgKm1tYywgc3RydWN0IG1tY19j
b21tYW5kICpjbWQpCj4+Pj4gwqDCoCB7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBtZXNvbl9o
b3N0ICpob3N0ID0gbW1jX3ByaXYobW1jKTsKPj4+PiBAQCAtNzg1LDggKzgyNyw3IEBAIHN0YXRp
YyB2b2lkIG1lc29uX21tY19zdGFydF9jbWQoc3RydWN0IG1tY19ob3N0ICptbWMsIHN0cnVjdCBt
bWNfY29tbWFuZCAqY21kKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkYXRhLT5mbGFn
cyAmIE1NQ19EQVRBX1dSSVRFKSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
bWRfY2ZnIHw9IENNRF9DRkdfREFUQV9XUjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFdBUk5fT04oeGZlcl9ieXRlcyA+IGhvc3QtPmJvdW5jZV9idWZfc2l6ZSk7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2dfY29weV90b19idWZmZXIoZGF0YS0+c2csIGRhdGEtPnNn
X2xlbiwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhv
c3QtPmJvdW5jZV9idWYsIHhmZXJfYnl0ZXMpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1lc29uX21tY19jb3B5X2J1ZmZlcihob3N0LCBkYXRhLCB4ZmVyX2J5dGVzLCB0cnVlKTsKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV93bWIoKTsKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoCBAQCAtOTU1LDggKzk5Niw3IEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBtZXNvbl9tbWNfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4+Pj4gwqDC
oMKgwqDCoMKgIGlmIChtZXNvbl9tbWNfYm91bmNlX2J1Zl9yZWFkKGRhdGEpKSB7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgeGZlcl9ieXRlcyA9IGRhdGEtPmJsa3N6ICogZGF0YS0+YmxvY2tz
Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdBUk5fT04oeGZlcl9ieXRlcyA+IGhvc3QtPmJv
dW5jZV9idWZfc2l6ZSk7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNnX2NvcHlfZnJvbV9idWZmZXIo
ZGF0YS0+c2csIGRhdGEtPnNnX2xlbiwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaG9zdC0+Ym91bmNlX2J1ZiwgeGZlcl9ieXRlcyk7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIG1lc29uX21tY19jb3B5X2J1ZmZlcihob3N0LCBkYXRhLCB4ZmVyX2J5dGVzLCBmYWxz
ZSk7Cj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgIMKgwqDCoMKgwqDCoCBuZXh0X2NtZCA9
IG1lc29uX21tY19nZXRfbmV4dF9jb21tYW5kKGNtZCk7Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+
Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+PiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
