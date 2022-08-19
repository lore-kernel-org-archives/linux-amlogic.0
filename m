Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA717C25B0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBSPL+m3yUrNdSXmcC6KIZWwHlZEW9LtSVWMuyu42BQ=; b=QwfqFaA7f/I0vM
	w3XCDDpE20Ws9EEgwz7zFZZXn0fmKlI4Gv2+orPHT24ywtsba10XQqTfnmmpKXokhsWPrFPIcvLK5
	69BhNQ2hpYy6GdCduqz8S2I7pD7+p4vEaurWsxSFjsiCJAA+51sjfymNdDTjlxnQqVaRnJgrsV/pk
	CBTk8WFqJBKQDbJsLRy9427ZzqA7yPiXNx8P+SKsFHPincZodIQr8UBobj5bhFSLoBbO5vC0i2feM
	DioinXoyuVyz9d89LugWTtA64kNkmPJwKZy5FhUlek+uLife/ruMpiYm5YDINUG/H7W6p2AgGUWm6
	lZyom2p4pVfA1RkiusGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxq8-004STp-JY; Fri, 19 Aug 2022 08:58:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxq4-004SFN-EX
	for linux-amlogic@lists.infradead.org; Fri, 19 Aug 2022 08:58:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k16so4397780wrx.11
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Aug 2022 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=Ffq4pm+fBB/gtznE6uzX6IlBd2C6b+2crFJbBiVCYtQ=;
        b=8VkEaXPL3aUVEP3xoIeg33AjWpzKZwXE2gqCdHw5p9R8nSxW4kxlM6fPaINhC5ekFT
         t0uxzysoj5lVT/Kuu4TqZMM1Ky7EdQIyvJcOkkIxFUe4lPghaLZEmSEXPAavpDtQ53op
         O0R5nrfJtG8HS9btNLxeDpgTm5SZZcNnKDZLI8MnV2Df/49wVMu/kTjtZLNtwOlqDRw2
         SYEGuYLcgyfwurUiSH+E2Qqf/QtnLT3wOdEOkVrwVCv3G6CpQS0Z5NeeK/th9PbeE/Qo
         PnkKV1dBYAxeStHgCseXyw58ZqWie+3mDw4WmF3PHj4yaDT45SMCu+WM82pov/cAcJxJ
         MMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=Ffq4pm+fBB/gtznE6uzX6IlBd2C6b+2crFJbBiVCYtQ=;
        b=rH2dBtNT5K/wjtvZ4/jzrZ/eXgoISE7IdFeKz2/TqsgiQTTUNTI/CFYR0J8QHZj8eY
         tLw2jWIFvwfFj6kuGBWEH30ikYMRz6V4n36GVKefD31cY8PHLGpD0WGPe6eFWIB+4y9S
         dLdE/mdrqgq9Ji8mf3HyfW4eShVzTDk3aZDkBSxJbxGXj0//NJEagPE5pjK4VaYvM1Qk
         FVqHbInOBB0IzFAlQBdCNpcNRfjPdeLZIBwNw06fVL7FeWltOq+7/AJXPAXPyqAkawjP
         0w0ug9Wac8WAJ4HKogRtfvtKBBOxeN09peIzvyVNOQQfOqA6keYAKeB2GSFpn6vovTzI
         wcOg==
X-Gm-Message-State: ACgBeo0uUyKbHnkYigYEkRy0piKAUlbTCMDj3ZiF98ds007RH3LEQqgC
	+Rrz9UpBaYUdzQX6SXpKw/MH6Q==
X-Google-Smtp-Source: AA6agR44T/L9Brv1d9i92rACo/P9wJDvvm/ddfSSTDIy5nJySAfUIW7ZgMh1piSA1Fg7P41G6UNHfw==
X-Received: by 2002:a05:6000:1e0e:b0:220:5c9f:a468 with SMTP id bj14-20020a0560001e0e00b002205c9fa468mr3434353wrb.587.1660899524029;
        Fri, 19 Aug 2022 01:58:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a02:227:fda7:6a0? ([2a01:e0a:982:cbb0:5a02:227:fda7:6a0])
        by smtp.gmail.com with ESMTPSA id o14-20020adfcf0e000000b0021f1ec8776fsm3542436wrj.61.2022.08.19.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:58:43 -0700 (PDT)
Message-ID: <6ddb18be-2b89-03ca-a839-4ec97fe9f8d4@baylibre.com>
Date: Fri, 19 Aug 2022 10:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] media: meson: vdec: add missing
 clk_disable_unprepare on error in vdec_hevc_start()
Content-Language: en-US
To: Xu Qiang <xuqiang36@huawei.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, mjourdan@baylibre.com,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, guohanjun@huawei.com, weiyongjun1@huawei.com
References: <20220818065753.104050-1-xuqiang36@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220818065753.104050-1-xuqiang36@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_015848_848178_D66A8C33 
X-CRM114-Status: GOOD (  14.72  )
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

T24gMTgvMDgvMjAyMiAwODo1NywgWHUgUWlhbmcgd3JvdGU6Cj4gQWRkIHRoZSBtaXNzaW5nIGNs
a19kaXNhYmxlX3VucHJlcGFyZSgpIGJlZm9yZSByZXR1cm4KPiBmcm9tIHZkZWNfaGV2Y19zdGFy
dCgpIGluIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlLgo+IAo+IEZpeGVzOiA4MjNhNzMwMDM0MGUg
KOKAnG1lZGlhOiBtZXNvbjogdmRlYzogYWRkIGNvbW1vbiBIRVZDIGRlY29kZXIgc3VwcG9ydOKA
nSkKPiBTaWduZWQtb2ZmLWJ5OiBYdSBRaWFuZyA8eHVxaWFuZzM2QGh1YXdlaS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjX2hldmMuYyB8IDYgKysr
KystCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWNfaGV2
Yy5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlY19oZXZjLmMKPiBpbmRl
eCA5NTMwZTU4MGU1N2EuLmFmY2VkNDM1YzkwNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjX2hldmMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9tZXNvbi92ZGVjL3ZkZWNfaGV2Yy5jCj4gQEAgLTE2Nyw4ICsxNjcsMTIgQEAgc3RhdGlj
IGludCB2ZGVjX2hldmNfc3RhcnQoc3RydWN0IGFtdmRlY19zZXNzaW9uICpzZXNzKQo+ICAgCj4g
ICAJY2xrX3NldF9yYXRlKGNvcmUtPnZkZWNfaGV2Y19jbGssIDY2NjY2NjY2Nik7Cj4gICAJcmV0
ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNvcmUtPnZkZWNfaGV2Y19jbGspOwo+IC0JaWYgKHJldCkK
PiArCWlmIChyZXQpIHsKPiArCQlpZiAoY29yZS0+cGxhdGZvcm0tPnJldmlzaW9uID09IFZERUNf
UkVWSVNJT05fRzEyQSB8fAo+ICsJCSAgICBjb3JlLT5wbGF0Zm9ybS0+cmV2aXNpb24gPT0gVkRF
Q19SRVZJU0lPTl9TTTEpCj4gKwkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShjb3JlLT52ZGVjX2hl
dmNmX2Nsayk7Cj4gICAJCXJldHVybiByZXQ7Cj4gKwl9Cj4gICAKPiAgIAlpZiAoY29yZS0+cGxh
dGZvcm0tPnJldmlzaW9uID09IFZERUNfUkVWSVNJT05fU00xKQo+ICAgCQlyZWdtYXBfdXBkYXRl
X2JpdHMoY29yZS0+cmVnbWFwX2FvLCBBT19SVElfR0VOX1BXUl9TTEVFUDAsCgpSZXZpZXdlZC1i
eTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
