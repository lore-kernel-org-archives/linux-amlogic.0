Return-Path: <SRS0=Hahh=N5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA62C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 07:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8076360C3E
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 07:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8076360C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MpqLfV5/Z8utCrwfIiZsut2k5udW4jyq7jwwmqnRAjI=; b=Dm/H1AfGlAAFfBoILjUWfY+6w3
	fEeklgkwL5y7HRG2IgNNFUiR680y3cM6++Z0vuPVNDozk0eer0SGsTA8THvfFDLlmD7U6DzlvMpVW
	s8VIBaFIgWoIGxnbbh3KZvKWwC56vYXLZ180j4Mb5N7S1+tfc8HjD3fh1aW1aiFGIQ0Njvpoha6i/
	cBEl4P8/ARvyBL5lGXJEA/+4320DzyoqpwPwfbHNFEgvNqzNKwZl3TNxoX8UMxVRJiAFET1Fal9iy
	bLN2E3Mk1b8gJM7R4kcpjsYHT3lMTX2m4Ij7k7tT0rm1pRkFA8fk7v9LfnrDuDJsuTp9P099cWXQG
	MgSu3f8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNVEW-002fiu-2B; Tue, 07 Sep 2021 07:09:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNVEE-002fdn-L5
 for linux-amlogic@lists.infradead.org; Tue, 07 Sep 2021 07:09:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id z4so12870288wrr.6
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Sep 2021 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LIu3oOHWEmY3wQIAxqSNQIyaCKUxHsLssdTO6YON+08=;
 b=o/qBi4CH3HaRDR5bQWk1T7vSl1D/KMMjoEVRUtpQEYYYNtJoWsbsgVbv2hp3WxnoFC
 P1wqlO3zjnNVTmKXxBIS5CDmj25jPudO6R05EAS9k00Stq0pybfYUpIGNJtT3Ti9bqDX
 1/htb7JsW3Q1ddjf+Q/f494NOpHdO5Xjkukv/ADAAcRVSKSwbwR/Mfn5/49IHjuMMv9z
 tMM8YHFh8MLMrUoGMUGxc5usuvrIPaarFEkukcszcpR9WvX7NMBIoCOd7pOfiNNCtT/u
 Fe5/raK3tiuWJaCKFpwnAuzXXFNTqKkKkrqncMriKGWI0LYkhYcHbfje3BMPz4dK6lm6
 0tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LIu3oOHWEmY3wQIAxqSNQIyaCKUxHsLssdTO6YON+08=;
 b=bI91TagqGmjbh2nXA2BnTZlBNvfXxsto6/TPn5jbF0o2FZU3IZd2F31o2E5xmdJFTb
 IGBoruzVJLOWndQxKpvxWqSTRtW1q/r8hFTz/K/4H1BmqXXNGVD036QzlkR+Mx7x+1RO
 I9cpUmroU9Wkom5UqGxZ+JPbz0AJOH5FVE2U22oeO/Wmkwb27aobjTuN/+B++Hy3ogQn
 4F3v9oNmeirRKKEJdQwJXRvJEWSlI2i3ufDOFIggW6xypPZT7HkSH73txSI9WtvaIwXp
 qCJBPUOrDvOZuPMxjeoURimNJkkzfts6apYqFKEk64cz/aRdVgo7It0jpnMy/8Ue1DrN
 zs9Q==
X-Gm-Message-State: AOAM531ECWgu6xBooVyf8msN5Cp0F3q473Fr5YE6gaM4LigbqrPygthV
 v3qANu/mU6UDQsGkN7l2A7TlEQ==
X-Google-Smtp-Source: ABdhPJxBBb07iGeSfx+y8zGr1Fv3QEHQnM3o0CVUlxPEOvrWTeUEtyfU2Wnr0KYAvyj9J61Gqx8QYw==
X-Received: by 2002:adf:c7d1:: with SMTP id y17mr2514305wrg.214.1630998548660; 
 Tue, 07 Sep 2021 00:09:08 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:48a5:8e41:47ff:c025?
 ([2001:861:44c0:66c0:48a5:8e41:47ff:c025])
 by smtp.gmail.com with ESMTPSA id l21sm1462479wmh.31.2021.09.07.00.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:09:08 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] arm64: dts: meson-axg: add support for JetHub D1
To: Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210904142745.183875-1-adeep@lexina.in>
 <20210904142745.183875-5-adeep@lexina.in>
 <77699dc0-88d5-3462-15fe-eb376c862d30@baylibre.com>
 <c6430622-5857-877c-6293-fc101500a6e6@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <83730df2-5104-bfff-949e-4499e0c2612a@baylibre.com>
Date: Tue, 7 Sep 2021 09:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c6430622-5857-877c-6293-fc101500a6e6@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_000910_787966_3A1847F8 
X-CRM114-Status: GOOD (  17.23  )
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

SGksCgpPbiAwNi8wOS8yMDIxIDE3OjA3LCBWeWFjaGVzbGF2IHdyb3RlOgo+IDA2LjA5LjIwMjEg
MTU6MjYsIE5laWwgQXJtc3Ryb25nINC/0LjRiNC10YI6Cj4+IE9uIDA0LzA5LzIwMjEgMTY6Mjcs
IFZ5YWNoZXNsYXYgQm9jaGFyb3Ygd3JvdGU6Cj4+PiBKZXRIb21lIEpldGh1YiBEMSAoaHR0cDov
L2pldGhvbWUucnUvamV0aHViLWQxKSBpcyBhIGhvbWUgYXV0b21hdGlvbgo+Pj4gY29udHJvbGxl
ciB3aXRoIHRoZSBmb2xsb3dpbmcgZmVhdHVyZXM6Cj4+Pgo+Pj4gKwo+Pj4gKyZzcGljYzEgewo+
Pj4gKwlzdGF0dXMgPSAib2theSI7Cj4+PiArfTsKPj4gV2h5IGVuYWJsaW5nIGl0IHdpdGhvdXQg
cGluY3RybCBwcm9wZXJ0aWVzID8KPiAKPiBzcGljY3dhcyBwbGFubmVkIGZvciB1c2UgZHVyaW5n
IHRoZSBkZXZlbG9wbWVudCBvZiB0aGUgZGV2aWNlLCBidXQgaW4gZmFjdCBpdCBpcyBub3QgY3Vy
cmVudGx5IHVzZWQuIFBpbnMgZXhpc3Qgb24gZXhwYW5kIHBhZC4KPiAKPiBJdHMgYmV0dGVyIHRv
IGFkZCBwaW5jdHJsIGFzIGJlbG93IG9yIGxlYXZlIHNwaWNjMSBkaXNhYmxlZD8KCkFzIHlvdSB3
YW50LCBpZiB0aGUgSFcgaXMgcHJlc2VudCBhbmQgZnVuY3Rpb25hbCwgdXN1YWxseSBpdCdzIGVu
YWJsZWQgaW4gdGhlIERULgoKTmVpbAoKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1qZXRob21lLWpldGh1Yi1qMTAwLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGctamV0aG9tZS1qZXRodWItajEwMC5kdHMKPiBp
bmRleCBiYzEwZjMzNTdjMDkuLmVjZmZjOTBkOTg4NCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLWpldGhvbWUtamV0aHViLWoxMDAuZHRzCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1qZXRob21lLWpldGh1Yi1q
MTAwLmR0cwo+IEBAIC0zMTMsNiArMzEzLDggQEAgJnVzYiB7Cj4gwqAKPiDCoCZzcGljYzEgewo+
IMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPiArwqDCoMKgwqDCoMKgIHBpbmN0cmwt
MCA9IDwmc3BpMV94X3BpbnM+LCA8JnNwaTFfc3MwX3hfcGlucz47Cj4gK8KgwqDCoMKgwqDCoCBw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IMKgfTsKPiDCoAo+IMKgJmdwaW8gewo+IAo+IAo+
IC0tCj4gCj4gVnlhY2hlc2xhdgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
