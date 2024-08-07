Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ACFC3DA7F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atBlNxdo8/vIT/sDyUI/UY4rTieZtK59SyDWo3p2f/I=; b=jbKq/1GhCGN46a
	Eh+X8llLuTx70DYxk4HI3z/WNY/6OyjfgzCTpcXiiRnWBFLfbjLXWKTAEXGlf7Cy7zlMdyS9xWgFc
	8oMWCw7V0y0l3xrsQ+DAtNaovTN8sTztUuTUGHGeKfkL1gqTtbfnh+EPfD8K3HynCbu5BFhX9zWRd
	Bz3lfHmj4hxsu53fngJ8QIWXYT4OvyemolSSoi3A1QPdahL6HYVxJcAV/ehrN2ij/5WZm6+qQ2oYD
	7VdX5a9qp+FeKMBAIQERmbBcBWq1CeLFJJ9lyc39sbOz4Gy5NKz0lcIwZbGdO2T1bUd11iPxnLLyR
	WwKjiQPEEI9nTK04OSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiV3-00000005UnZ-2bNj;
	Wed, 07 Aug 2024 15:22:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiUz-00000005UlH-3BCG
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 15:22:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so6422465e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723044167; x=1723648967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b400N+knfVALmbzGgPj3BTbRD+oELeXUCqkW+G8VIW8=;
        b=2/rDO55GSTEf/MAM7ksGE3PFLuF10AJbGcm1Y3oFwsCT0JolRPty1E7xMGq7zV3jv+
         y/gHAJ8yHnx2D5U07Caw8sEmcv17HTs9xoBN4FvZh0v2WPE76QH0qsbTHe4MuS/HpCyT
         ZLMjrrJKj0P7ABAeQARaUGT1azRpSHfclugPi+nzkC8ZIvkt5UO68S10Dj6S8vOwxmZO
         vEM/hTtgYi/SKsYJX3yPD0HLbqY0c6EJ27240aDXS3j0gRz6Cay71D5SgLYWhpmFSWRB
         0EGnSCtWN2uVvrwkEi+Qbwe818JKUMLeLvYMpDqEz0UUJxpjVGCZ8r2eZjh+pc253iiV
         V2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723044167; x=1723648967;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b400N+knfVALmbzGgPj3BTbRD+oELeXUCqkW+G8VIW8=;
        b=E9w4v3kMG0fjzyPSIEwN1brp1rHAokXJZnoFQp4mFYM/LdsxIu1GND1HsxV/YfJhjo
         xBEH34L3GRxGUD6kSgJGJeKNt8DEE8WLg7O82E25elusMZJs7/xizU6AWAJgQDitZ/xW
         EbzuTEL18I8tASo/iMG5awfpsMC9gPLbKW82U+J/cDePfCPIT+xulcmvq6wfzagqOh+/
         YbB04Fmw2iRgEyUgofy/RhU0i9GVc5gjsp/2GYCYJYY5Vaq/s1MMaB5yoTxbckZ+d92q
         00P9+GJkw50wg04dCWk5RjX8V1f4S5tMehtmuyixWP6UOoIVU+msJg/5v9/X9M9tXrLU
         0liQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgci3//ZjiZ4D0BeapjNCPVTs1f55IknOEVkT8ue+tQz+7mv+f2tcxsIPYqibPUbzgSaa3Rx16sgrFOKmz7/n4rnkNkQj7UP+WcPbWJNMs0AA=
X-Gm-Message-State: AOJu0YxW8IdgOJDLA4gdSKlQCAwfnNuxsr2gDYI4xQi6iCeJEoPu1Hod
	ED1CU3QRQV3YV0h8sOPjzHkSD2ONKp4xKsXhnP2lQdIReFTIKZQ3OR2UxzmDYvs=
X-Google-Smtp-Source: AGHT+IEee9/+95rBHM9qmfhHhWhuk6lT6qGII5W5sxauIeebfdopV9mCLXxpK67d6U+eT9QpOoZVag==
X-Received: by 2002:a05:600c:4f14:b0:426:698b:791f with SMTP id 5b1f17b1804b1-4290509fda7mr20851805e9.3.1723044167397;
        Wed, 07 Aug 2024 08:22:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c970sm34320015e9.46.2024.08.07.08.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:22:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org,  neil.armstrong@linaro.org,
  khilman@baylibre.com,  martin.blumenstingl@googlemail.com,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
In-Reply-To: <c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr> (Christophe
	JAILLET's message of "Wed, 7 Aug 2024 17:08:27 +0200")
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
	<1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
	<c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr>
Date: Wed, 07 Aug 2024 17:22:46 +0200
Message-ID: <1jttfwxsqh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_082250_087883_BB0B8C4B 
X-CRM114-Status: GOOD (  14.20  )
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

T24gV2VkIDA3IEF1ZyAyMDI0IGF0IDE3OjA4LCBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9w
aGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKCj4gTGUgMDcvMDgvMjAyNCDDoCAxNjoxNCwg
SmVyb21lIEJydW5ldCBhIMOpY3JpdMKgOgo+PiBPbiBXZWQgMDcgQXVnIDIwMjQgYXQgMTE6MzAs
IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3Rl
Ogo+PiAKPj4+IFRoZXNlIDMgcGF0Y2hlcyBjb25zdGlmeSBzb21lIHN0cnVjdHVyZXMgaW4gb3Jk
ZXIgdG8gbW92ZSBzb21lIGRhdGEgdG8gYQo+Pj4gcmVhZC1vbmx5IHNlY3Rpb24sIHNvIGluY3Jl
YXNlIG92ZXJhbGwgc2VjdXJpdHkuCj4+Pgo+Pj4gSXQgaXMgc3BsaXR0ZWQgaW4gMyB0byBlYXNl
IHJldmlldy4KPj4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGl0IGVhc2VzIHJldmlldyBpbiB0aGlz
IGNhc2UuCj4+IElmIGEgdjIgaXMgbmVjZXNzYXJ5LCBJIHRoaW5rIGEgc2luZ2xlIHBhdGNoIHdv
dWxkIGJlIGJldHRlci4KPj4gCj4+PiBQYXRjaCAxOiBzdHJ1Y3QgbWVzb25fcG14X2dyb3VwIGFu
ZCBtZXNvbl9wbXhfZnVuYwo+Pj4gcGF0Y2ggMjogc3RydWN0IG1lc29uX2JhbmsKPj4+IHBhdGNo
IDM6IHN0cnVjdCBtZXNvbl9wbXhfYmFuawo+PiBJcyB0aGVyZSBhbnkgcmVhc29uIGZvciBsZWF2
aW5nIG91dCAnc3RydWN0IG1lc29uX3BpbmN0cmxfZGF0YScgYW5kCj4+ICdzdHJ1Y3QgbWVzb25f
YXhnX3BteF9kYXRhJyA/IEkgZG9uJ3QgdGhpbmsgdGhleSBnZXQgbW9kaWZpZWQgYnV0IG1heWJl
Cj4+IEkgbWlzc2VkIGl0Lgo+Cj4gTm8gZ29vZCByZWFzb25zLgo+Cj4gSSdsbCBzZW5kIGEgdjIg
d2l0aCBldmVyeXRoaW5nIGNvbnN0aWZpZWQgYWxsIGF0IG9uY2UuCj4KPiBTaG91bGQgSSB0YWtl
IHRoZSBSLWIgYW5kIFQtYiBiZWxvdywgZm9yIHRoZSB2Mj8KPgoKTGVhdmUgdGhlbSBvdXQuIEkn
bGwgdGVzdCBhZ2FpbiBhbmQgcmVwb3J0LgpUaGFua3MgZm9yIHRoaXMKCj4KPiBUaGFua3MgZm9y
IHRoZSByZXZpZXcgYW5kIGNvbW1lbnQuCj4KPiBDSgo+Cj4+IAo+Pj4KPj4+IEFsbCBwYXRjaGVz
IGFyZSBvbmx5IGNvbXBpbGUgdGVzdGVkLgo+PiBMb29rcyBnb29kIGFueXdheQo+PiBSZXZpZXdl
ZC1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+IE9uIHRoZSB2aW0z
bDoKPj4gVGVzdGVkLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4g
CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
