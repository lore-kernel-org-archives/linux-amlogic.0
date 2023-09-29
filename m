Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69939CE7B1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4K2ocGf6aLDpmuTVD+McDtPPz9p/Cnyt8V218/hDytg=; b=MX0GiijtzjTiJy
	3D7CRls6vpP3ZRuumk79SQ6puOLQWJreUjLntapMAYY4gKUA2ev8CV6TjGxKh2AR/6NmiiqQnEwZX
	oz5jEFHFPg6ifmH64csqXhOGU8lPPdkt3LVI8HkFaXK520Gum+gnYkNpjxp8mp2Zs3HZg/0BQ3gYh
	0I8iuTNUZx6IfA6ZcxOmVkQBIfZbH4dJ4+KpZg/PHb9Mr5XhYQzlg3d7YQxxBiaYjF4Q+3NNgiGCi
	K0yo9Ty/AsQ1vKZi2/QWPmYZ3iFXAuaBm6A9Bsh9grGwwPXVxjow2nAYsGr8zHf/PyhE5GHcSiamN
	te1ZjFQ4sX00gApyw4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9OD-007QoI-1z;
	Fri, 29 Sep 2023 09:02:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9OA-007QnE-2I
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Sep 2023 09:02:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso107843525e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Sep 2023 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695978138; x=1696582938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQw+ZAMqlftuckLRitJgjf++YRzCOpCpcgRGGPh5T6s=;
        b=AZ185bHGokhECZUw7S10yfn0IHRKg2JD2tWYbpCFHBCHQuCyKV/HZs3tH2xjEF03vR
         AbX6XK3NM0yYcas4rubdMMxnJSLbkt4m9k4fz826CqQy6CWfnhEyBa3A0/ykd7vJT9SA
         0BF1RLT+6Lh5MVcU+LffbOz/US8u0JG9O4slH+xcuMzdpzLr6Gf1oM79iK5US23qBup/
         nhQ8f7ju9dCZVDpuTg6MVZG48/lzVVmWc5Ds2zarrFDvMLEtFixnGtYSnaB+pXeG+ANM
         lJi7WCpSkoZcvj0HOCX+fd8V2614ZOaMGmqb+zirnPy4399k+knjFRNjvRt5KDs4wGcf
         lg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695978138; x=1696582938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQw+ZAMqlftuckLRitJgjf++YRzCOpCpcgRGGPh5T6s=;
        b=XjuBYUd1zF90ycPmQc9WrqQr1fCcknDBlvBpMW+R5VSS7Q1wUty+wLDRH3lNWcHG3h
         K/9KHTgPYuZj4znX5wF2/dDKETh7szdGfx5juZgNTjB1UlLkVnRT4V30yx0wou1EBZaW
         oYYtSn/Mzz8zniY69TYOX61go2oW320dOJFc8s5lsJByFTdmApUqaxt8f2tL3/sPoPyO
         lEUYw5GjeWZewCQzLIlzDZhjAV7uz1iXmUXycpczaef3HbMoNC/+tsx1z3RLaLoOdpCf
         sUiGBGWjN/x6kDiMbz7bbD783jwjRTweO0s0PHi6+DBhbf5fjqx02kRTRItMVOigiTDk
         7UWg==
X-Gm-Message-State: AOJu0YwnnX4Ou6mIe8Jo3t3TBl+jvuol3nzXlBKXHQHRLtqP3xqNk3il
	EYoF7OHyEe1v7GmSHZpNAiYOOQ==
X-Google-Smtp-Source: AGHT+IFPLKjQaIsyW64BO9dLilNP/IcoX4nLkuiTxU375hcJNp1GRtnx7HtOH6n/o4cuI1EpZJ5thQ==
X-Received: by 2002:a7b:c448:0:b0:401:bd2e:49fc with SMTP id l8-20020a7bc448000000b00401bd2e49fcmr3482822wmi.24.1695978138163;
        Fri, 29 Sep 2023 02:02:18 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id p16-20020a1c7410000000b00402ff8d6086sm977137wmc.18.2023.09.29.02.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 02:02:17 -0700 (PDT)
Message-ID: <0b31dee8-a3bc-50a2-a7bb-9183370b5dce@linaro.org>
Date: Fri, 29 Sep 2023 11:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] thermal: amlogic: Fix build failure after conversion to
 .remove_new()
Content-Language: en-GB
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: kernel@pengutronix.de, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20230929061305.2351953-1-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230929061305.2351953-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_020222_796058_6DC1762A 
X-CRM114-Status: GOOD (  21.10  )
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

TGUgMjkvMDkvMjAyMyDDoCAwODoxMywgVXdlIEtsZWluZS1Lw7ZuaWcgYSDDqWNyaXTCoDoKPiBD
b21taXQgODhhZjhiNjZmZmVkICgidGhlcm1hbDogYW1sb2dpYzogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUKPiBjYWxsYmFjayByZXR1cm5pbmcgdm9pZCIpIGNvbnZlcnRlZCBhbWxvZ2ljX3Ro
ZXJtYWxfZGlzYWJsZSgpIHRvIHJldHVybgo+IG5vIHZhbHVlIGJ1dCBtaXNzZWQgdGhhdCBhbWxv
Z2ljX3RoZXJtYWxfc3VzcGVuZCgpIG1ha2VzIHVzZSBvZiB0aGUgaW50Cj4gcmV0dXJuZWQgYnkg
dGhpcyBmdW5jdGlvbi4gQXMgYW1sb2dpY190aGVybWFsX2Rpc2FibGUoKSByZXR1cm5lZCB6ZXJv
Cj4gdW5jb25kaXRpb25hbGx5IGJlZm9yZSwgYWRkIGEgcmV0dXJuIDAgdG8gZ2V0IHRoZSBzYW1l
IGJlaGF2aW91ciBhcwo+IGJlZm9yZSB0aGUgb2ZmZW5kaW5nIGNvbW1pdC4KPiAKPiBGaXhlczog
ODhhZjhiNjZmZmVkICgidGhlcm1hbDogYW1sb2dpYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQiKQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29l
LWtidWlsZC1hbGwvMjAyMzA5MjkxMjE0LkhqbjNnSjk0LWxrcEBpbnRlbC5jb20vCj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiBIZWxsbywKPiAKPiBzb3JyeSBmb3Igbm90IGNhdGNoaW5nIHRoYXQgYmVmb3Jl
IHNlbmRpbmcuIEkgZG9uJ3QgdW5kZXJzdGFuZCB5ZXQgd2hhdAo+IHdhcyB3cm9uZyB3aXRoIG15
IHRlc3Rpbmc7IEkgd291bGQgaGF2ZSBiZXQgdGhlIHNlcmllcyB3YXMgdGVzdGVkIHdpdGgKPiBh
biBBUkNIPWFybTY0IGFsbG1vZGNvbmZpZyBidWlsZC4gOi1cCj4gCj4gSWYgeW91IHByZWZlciBp
dCwgZmVlbCBmcmVlIHRvIHNxdWFzaCB0aGlzIHBhdGNoIGludG8gdGhlIG9mZmVuZGluZwo+IGNv
bW1pdC4KPiAKPiBCZXN0IHJlZ2FyZHMsIHNvcnJ5IGFuZCB0aGFua3MsCj4gVXdlCj4gCj4gICBk
cml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgfCA0ICsrKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIGIvZHJpdmVycy90aGVybWFsL2FtbG9naWNf
dGhlcm1hbC5jCj4gaW5kZXggMTQyNmYxZWI0YWM2Li41NjJmNjNiN2JmMjcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gKysrIGIvZHJpdmVycy90aGVy
bWFsL2FtbG9naWNfdGhlcm1hbC5jCj4gQEAgLTMwMCw3ICszMDAsOSBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkIGFtbG9naWNfdGhlcm1hbF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
PiAgIHsKPiAgIAlzdHJ1Y3QgYW1sb2dpY190aGVybWFsICpkYXRhID0gZGV2X2dldF9kcnZkYXRh
KGRldik7Cj4gICAKPiAtCXJldHVybiBhbWxvZ2ljX3RoZXJtYWxfZGlzYWJsZShkYXRhKTsKPiAr
CWFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKGRhdGEpOwo+ICsKPiArCXJldHVybiAwOwo+ICAgfQo+
ICAgCj4gICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGFtbG9naWNfdGhlcm1hbF9yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQoKQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
