Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802F6C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 19:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AFA2082B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 19:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHlRzEER";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JUy7xZ1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AFA2082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O22B5it5jpCo68vcQ6KKuzl7lrBJ7J95GPiqr9Q8QiI=; b=EHlRzEERQV8JBa
	/S/MJvhAiCEZNmmoEQl0svvY7dxBrSw91SF3BjZRI8IqZzXlnQzOjNixwqT8fW/kW/4oE7oxxo/kN
	b8mvq4FEmUceMXXjnhQEkNGPZjvXhnXDK7dInbAIXXS6JhQM5DizczXIRm+oXe3MT/X96F8zbJhLf
	o5R8HxoLi8MsBewQ+TCpKUDgCwBKVmqHQ6bKEbmNXiKlc7yZQa9kT1UfvyVX8UpEF7SkzhWzjyfHN
	etNeJ0iQ2cwar2XciM/VswRs/kXQtLCJjqEl686DbV/abSY0/TGEER5P9v2ww2DG1MezW2LoBK2PL
	eU8jig/OFr8f9aVClW+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUGRz-00044p-Qn; Tue, 04 Dec 2018 19:33:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUGRw-00042l-LS
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 19:33:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id t27so17211475wra.6
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=U1ZYP6oYAAntHDYYsujvmJKRg1jgOj9qNI/7yXapawo=;
 b=JUy7xZ1y+ZHjNaY0AH8j9gg20kS6LbUmskvJBrXKCzG+yEqOH20s+A3rbBaoDFf3sI
 QcNN5/ify7QgiMjC1CSNSqpCoX21B0qwZLyQAXE/LwUXkv2OiGocZ2owihJBOtD5d11P
 UDs35/bUhcrsK6pKE+ubYJayEPTOoHM21HJXiJtfsMA1p0RX634H0ygbfKbHC8v8BwTA
 ztTlRagwwjr36ER4swjGaRRpelwQJM+UPMTAem7zv/lqigCDvR2MCoTQqBa+uNZo9atM
 OQHwB9XpQzr1f3eF2UgJyLC8TepoLU3HkLqtMUXeYTDLmUvrBrSCmLM3U7IN3jefW4hq
 0Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=U1ZYP6oYAAntHDYYsujvmJKRg1jgOj9qNI/7yXapawo=;
 b=gl//J8vjmLMP3TL2u1BWxuDxE+7BV4gjKrUQFniFXOBt21adJhVHnxwOXisM/q4MGy
 MPC/eN8DNq/TFUKKVddSoH51MtTcuKsBjLBO0m3mZVNzBEol1VzAeMcbO3Zc71kjoHja
 aohLBkExVm8mljZVXkMCiVvBZUU17+CcdVYicXSPC4DI5hRgTgh3nHsPG4B3iu/w1NRY
 0Ho+quSrXOwiZFodo2vuyNmSu02UsCdPtga1grbyV+v5GFeAkIt5odF+UndspHkT0h4g
 8LA5xEKZiBxNqq7mRM+jCL/t4kUL8mth2LQ5OWgFmBNFmKeSuar5wEKCnYUQom1sxicr
 DrlA==
X-Gm-Message-State: AA+aEWbTGd/G7CGPaszM2EGxjKE0pVDybJfc1j7tKJee+hkfWy0zCv3t
 zCJpB3xogjHCw/xshwtl/G6eBQ==
X-Google-Smtp-Source: AFSGD/X7r16gWudQW2YVxqV2zTsyBJntvrarll+US+93cB8FRkbTvOLXkx+FFZAWkdJo+Ni5nyeP/A==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr4659731wrt.241.1543952007805; 
 Tue, 04 Dec 2018 11:33:27 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:cb1d:4ce:ea00:457b:c7f4:7108:f8c4])
 by smtp.gmail.com with ESMTPSA id z17sm15702072wrv.2.2018.12.04.11.33.26
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Dec 2018 11:33:27 -0800 (PST)
Message-ID: <5C06D686.50108@baylibre.com>
Date: Tue, 04 Dec 2018 20:33:26 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stephen Boyd <sboyd@kernel.org>, jbrunet@baylibre.com
Subject: Re: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
References: <20181204125839.14505-1-narmstrong@baylibre.com>
 <154394543049.88331.11854270462393390489@swboyd.mtv.corp.google.com>
In-Reply-To: <154394543049.88331.11854270462393390489@swboyd.mtv.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_113340_840842_12668C00 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgU3RlcGhlbiwKCkxlIDA0LzEyLzIwMTggMTg6NDMsIFN0ZXBoZW4gQm95ZCBhIMOpY3JpdCA6
Cj4gUXVvdGluZyBOZWlsIEFybXN0cm9uZyAoMjAxOC0xMi0wNCAwNDo1ODozOSkKPj4gTWFrZXMg
dGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZ3Mgc2lsZW50Ogo+PiBkcml2ZXJzL2Nsay9tZXNv
bi92aWQtcGxsLWRpdi5jOjU4OjI2OiB3YXJuaW5nOiBzeW1ib2wgJ19nZXRfdGFibGVfdmFsJyB3
YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJzL2Nsay9tZXNv
bi9neGJiLmM6MTU4NToxMjogd2FybmluZzogc3ltYm9sICdneGJiX3ZpZF9wbGxfcGFyZW50X25h
bWVzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJzL2Ns
ay9tZXNvbi9neGJiLmM6MTYyMDoxMjogd2FybmluZzogc3ltYm9sICdneGJiX3ZjbGtfcGFyZW50
X25hbWVzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJz
L2Nsay9tZXNvbi9neGJiLmM6MTk4MDoxMjogd2FybmluZzogc3ltYm9sICdneGJiX2N0c19wYXJl
bnRfbmFtZXMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4+IGRyaXZl
cnMvY2xrL21lc29uL2d4YmIuYzoyMDM2OjEyOiB3YXJuaW5nOiBzeW1ib2wgJ2d4YmJfY3RzX2hk
bWlfdHhfcGFyZW50X25hbWVzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGlj
Pwo+IAo+IEkgZml4ZWQgYWxsIG9mIHRoZXNlIGFscmVhZHkgaW4gdGhlIHBhdGNoIEkgc2VudCB5
b3UuCgpTb3JyeSBJIG1pc3VuZGVyc3Rvb2QuLi4KCgo+IAo+PiBAQCAtMTk4Myw3ICsxOTgzLDcg
QEAgc3RhdGljIHN0cnVjdCBjbGtfZml4ZWRfZmFjdG9yIGd4YmJfdmNsazJfZGl2MTIgPSB7Cj4+
ICB9Owo+PiAgCj4+ICBzdGF0aWMgdTMyIG11eF90YWJsZV9jdHNfc2VsW10gPSB7IDAsIDEsIDIs
IDMsIDQsIDgsIDksIDEwLCAxMSwgMTIgfTsKPiAKPiBJIHdhcyB0YWxraW5nIGFib3V0IHRoaXMg
bXV4X3RhYmxlX2N0c19zZWwgYXJyYXkuIENhbiB0aGlzIGJlIGNvbnN0Pwo+IAoKT3RoZXIgbXV4
IHRhYmxlcyBhcmVuJ3QgY29uc3QsIEplcm9tZSBzbyB5b3Ugc2VlIGEgcmVhc29uIHdoeSB0aGV5
IGFyZW4ndCBjb25zdCA/CgpOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
