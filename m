Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBA4C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 16:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9DC608FB
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A9DC608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUYBoaAfGN1uZRkjWNGshzuAgR3ILTqamIzzKwYWuQo=; b=JPJ/Rlw/aOqpxnDkOlNQJDdXy4
	2D4/eDxdY3yRBxJt81zKAHb5CPPhbXDkph0pZG00eJv7/nqO41ZQYN0OzBliDavopBIgGr1ehvyE3
	Aa45VkgjeEEUIRtBZE8BYpVPyWo43lzeS/pQPdIKZBZXy/b9z0ZR3hTKkVjVrA8Vn3xbWi4DufnKj
	0uJooIpiyZVwKc/9TAqt4CynBIy2NQrwdb3QYzJGjaPyj4VWMToy3L61ZzGdxVZLu9Xre/u86Z2ts
	W8UMTOMYhUcDVBq0qErbn+hZOv+Wynxg16Ey2217QF7p4+oSxnyy3b2yRWjKimARoyLkIl26NuNa4
	SVOqN5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNHJn-001I83-Bj; Mon, 06 Sep 2021 16:17:59 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNHJk-001I7W-Ru; Mon, 06 Sep 2021 16:17:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9AC66DBF84; Mon,  6 Sep 2021 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630945074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GicACZtYZZ5mQZ04xB3/h4BclRBZg2hz9eM8DndurI0=;
 b=FlDp7/FQ6lm87sDvO+gXkGSq3J74j2cE4+Z4XMkk7CuWBv6P6gCMmrKDWI5mMt4cUUfDtp
 B/5kXYjnAhXZ0OuZhCNntOt/AS74KNCeCDNkpfZJV1E6Li0w0Ac5exuptTeLe4HF8tZvCp
 PpAfkC2wcQOPxfkACJbxOaMrxvHq0VhNniINLUkrOZVyvhFKnT9iGesoANDZRzJ1UPKHNt
 1s8RWnZ2QhMh8p1Y9GR4CghuHdPJXVn7RweHzsgqJ/VI7lGpYnOzvoseszxkp+eDbDigV2
 +ZU4SeqQoJQHc5A1YsqWgcX7Xjddaj1OuXDa8mzUYXmCVSKMKfZpVXo/iq9CwQ==
Subject: Re: [PATCH v3 4/4] arm64: dts: meson-axg: add support for JetHub D1
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210904142745.183875-1-adeep@lexina.in>
 <20210904142745.183875-5-adeep@lexina.in>
 <77699dc0-88d5-3462-15fe-eb376c862d30@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <3f58923c-b765-7359-a225-964a9f0a4609@lexina.in>
Date: Mon, 6 Sep 2021 19:17:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <77699dc0-88d5-3462-15fe-eb376c862d30@baylibre.com>
Content-Language: ru
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_091757_264722_FD3AE9D5 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

MDYuMDkuMjAyMSAxNToyNiwgTmVpbCBBcm1zdHJvbmcg0L/QuNGI0LXRgjoKPiBPbiAwNC8wOS8y
MDIxIDE2OjI3LCBWeWFjaGVzbGF2IEJvY2hhcm92IHdyb3RlOgo+PiBKZXRIb21lIEpldGh1YiBE
MSAoaHR0cDovL2pldGhvbWUucnUvamV0aHViLWQxKSBpcyBhIGhvbWUgYXV0b21hdGlvbgo+PiBj
b250cm9sbGVyIHdpdGggdGhlIGZvbGxvd2luZyBmZWF0dXJlczoKPj4KPj4gKwo+PiArJnNwaWNj
MSB7Cj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+PiArfTsKPiBXaHkgZW5hYmxpbmcgaXQgd2l0aG91
dCBwaW5jdHJsIHByb3BlcnRpZXMgPwoKc3BpY2N3YXMgcGxhbm5lZCBmb3IgdXNlIGR1cmluZyB0
aGUgZGV2ZWxvcG1lbnQgb2YgdGhlIGRldmljZSwgYnV0IGluIApmYWN0IGl0IGlzIG5vdCBjdXJy
ZW50bHkgdXNlZC4gUGlucyBleGlzdCBvbiBleHBhbmQgcGFkLgoKSXRzIGJldHRlciB0byBhZGQg
cGluY3RybCBhcyBiZWxvdyBvciBsZWF2ZSBzcGljYzEgZGlzYWJsZWQ/CgpkaWZmIC0tZ2l0IAph
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGctamV0aG9tZS1qZXRodWItajEw
MC5kdHMgCmIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1qZXRob21lLWpl
dGh1Yi1qMTAwLmR0cwppbmRleCBiYzEwZjMzNTdjMDkuLmVjZmZjOTBkOTg4NCAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1qZXRob21lLWpldGh1Yi1q
MTAwLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLWpldGhv
bWUtamV0aHViLWoxMDAuZHRzCkBAIC0zMTMsNiArMzEzLDggQEAgJnVzYiB7CgogwqAmc3BpY2Mx
IHsKIMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKK8KgwqDCoMKgwqDCoCBwaW5jdHJs
LTAgPSA8JnNwaTFfeF9waW5zPiwgPCZzcGkxX3NzMF94X3BpbnM+OworwqDCoMKgwqDCoMKgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiDCoH07CgogwqAmZ3BpbyB7CgoKLS0KClZ5YWNoZXNs
YXYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
