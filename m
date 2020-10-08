Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F72C4363C
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 05:11:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01942083B
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 05:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xq/LIWV6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfFdEtFh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01942083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qP+ErWb8EVIcE78on57XvCDFM6wQIV6Ju4kAFTxCijE=; b=xq/LIWV6tlH0+vOde5bM5whPd
	2XQcvkOe/K0zi0FAn0ZualemoKwwG2acsR0JyhkX699hdhV4NVJuxZvSXNevDVE+4fkUgWckIfLi8
	ByIx2xh9HxXFNLUp58opSxjeXqJc/n4kyS+SGLf+UNb/SgbIF8wuRs5NnJCTSqGHRe1zstmommbPg
	rmvlgFtNKlDRGsHrHXMrx3/vJd+pBiK3i90P/SEgTGxxtuZSXItgyc30v1Uo1JMPz2EpfHCMqbWRH
	FBn5r5rt00dqlLfSwS1HHcjEFJxHIzWY8Y4cpIgnyaBtljKFTPuU6KBb0A20PWWg/yMp31N4d0Wzm
	zFCZzOH5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQOD6-000865-4w; Thu, 08 Oct 2020 05:11:24 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQOD3-00085O-Me
 for linux-amlogic@lists.infradead.org; Thu, 08 Oct 2020 05:11:22 +0000
Received: by mail-pg1-x543.google.com with SMTP id 34so3225183pgo.13
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DGXqI+4Sh6rs8urwhC133dx8DNmlAjYdeCRk7jyHfZg=;
 b=OfFdEtFhTKkRCe5RhlJFEaguPGSub55q1j5ONalcOHYwpD35DWTogG8xfJy0GBysMo
 dxcYGiB8uyMdFWDnNUp7Hd1hPovvpAuxunu94srqIv0CH5Y6e48+RSphHQi8uqeyh8Da
 NR10jkXD0hVtDZjJIaqnPL+rlortGJ3JWWQUy4OcFaQj5dFCWB2MYVBCzgqh7XThOKLO
 XNUDKQBQ+/NmCUKSNM2WiorrxI9tZk3qOoqZxaHMhl/tTEx6ihRc1b8ABChignNYILSS
 RTfW+NoPm8MxlQ7BdzJigZFnU1+GryvjXu3yPndZip5zzdffGbaSC8zKCCstTDPilIbm
 viIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DGXqI+4Sh6rs8urwhC133dx8DNmlAjYdeCRk7jyHfZg=;
 b=H12to9cDZdtsG6LRjwufGf6ka+cRBXwHSo7ZkWvSlWOGcGZ3L8bh5NcrWCtBL2FA4J
 GR7n/sitOR0U9P+YYGdUcopXeaFgRuERKME0pLUCDVdLoQHpKDF6Vy9EOOMTcejyMMA+
 xreh2vvUeZIWRl/j50/5UXZMPFxJpgHPqGZFMweap/jy153Fz1yNXsflUv7HbylqHj89
 jCsGTknjnXz8q3wbEX4cK56jtTwuNvHTyBf1BrBo+faNBpV3e4Ws4zNKqoWLjkjSmJsr
 8RE6+D7JzN4gEpCp/c8Dfd+kDAIh49eN1m4LkMQmVRRRCelQ8ugXPlhem3GaLuylFUcY
 yB/Q==
X-Gm-Message-State: AOAM533OBhWbCkltpFfEz8YqUeC0+YUlPPZU3nbMrBP0QM0sUeh8IVmc
 QEzpS3QaTONonQufdkY6fgU=
X-Google-Smtp-Source: ABdhPJycc1QbXjDu44U3IZ20piKXkYt9w5+DehGFEbkwhNjBd2/NDvFAV6yf0lZsSAksNGlo65uF5g==
X-Received: by 2002:a17:90a:73c9:: with SMTP id
 n9mr6194715pjk.90.1602133877705; 
 Wed, 07 Oct 2020 22:11:17 -0700 (PDT)
Received: from ?IPv6:2402:b801:2840:8200:64bb:b626:4f99:bb54?
 ([2402:b801:2840:8200:64bb:b626:4f99:bb54])
 by smtp.gmail.com with ESMTPSA id k7sm4643537pjs.9.2020.10.07.22.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 22:11:17 -0700 (PDT)
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
To: Jerome Brunet <jbrunet@baylibre.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>
References: <e4e6cc45-bc18-40ec-035e-fdb45b9a8f46@gmail.com>
 <87o8lf74j5.fsf@nanos.tec.linutronix.de>
 <1jy2ki1db4.fsf@starbuckisacylon.baylibre.com>
From: Brad Harper <bjharper@gmail.com>
Message-ID: <c8a8797e-a8ef-6d22-be76-97c27cea6819@gmail.com>
Date: Thu, 8 Oct 2020 16:11:10 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1jy2ki1db4.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_011121_748673_397B6FE0 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNy8xMC8yMDIwIDEwOjMyIHBtLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFdpdGggYXJtNjQg
ZGVmY29uZmlnIG9uIEtoYWRhcyB2aW0zLCBubyBvYnZpb3VzIHJlZ3Jlc3Npb24uIExvb2tzIGdv
b2QuCj4KPiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+
Cj4gSSBkaWQgbm90IHRlc3Qgd2l0aCBSVC4gQnJhZCwgQ291bGQgeW91IGxldCB1cyBrbm93IGlz
IFRob21hcydzIHBhdGNoCj4gd29ya3MgZm9yIHlvdSA/IFRoeApUaGVyZSB3YXMgYSBtZXJnZSBj
b25mbGljdCBpbiBhcHBseWluZyBhZ2FpbnN0IHY1LjktcmM4LXJ0MTIgd2l0aApwYXJ0aWN1bGFy
IHRoaXMgcGF0Y2g6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3J0L2xpbnV4LXJ0LWRldmVsLmdpdC9jb21taXQva2VybmVsL2lycS9tYW5hZ2UuYz9oPWxp
bnV4LTUuOS55LXJ0JmlkPTE4ZGYwMGVmMGIyYjE1MTNkYzhmMWE5ZWQyNmIxMWZmZjIyNjFjMzAK
CkkgZGlkIG1hbmFnZSB0byBhZGQgdGhlIHBhdGNoIGFmdGVyIGF0dGVtcHRpbmcgdG8gcmVzb2x2
ZSB0aGUgY29uZmxpY3QKd2hpY2ggc29sdmVzIHRoZSBkZWFkbG9jayBpc3N1ZSBJIGFtIHNlZWlu
ZyB3aXRoIG1tYyBhbmQgd29ya3MgZmluZSBkdXJpbmcKdGVzdGluZyAoYSBrZXJuZWwgY29tcGls
YXRpb24gb24gcHJlZW1wdF9ydCBjb25maWd1cmVkIGtlcm5lbCkuCgppcnFfdGhyZWFkIGluIC9r
ZXJuZWwvaXJxL21hbmFnZS5jIExvb2tzIGxpa2UgdGhpcyAobm90IDEwMCUgc3VyZSBJCnNob3Vs
ZCBoYXZlIHBsYWNlZCB0aGUgaXJxX2ZpbmFsaXplX29uZXNob3QgYmVmb3JlCmFkZF9pbnRlcnJ1
cHRfcmFuZG9tbmVzcykuCgpCYXNlZCBvbiB0aGlzIEkgY2FuIHByb3ZpZGUKClRlc3RlZC1ieTog
QnJhZCBIYXJwZXIgPGJqaGFycGVyQGdtYWlsLmNvbT4KCi0tLQpzdGF0aWMgaW50IGlycV90aHJl
YWQodm9pZCAqZGF0YSkKewogwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNhbGxiYWNrX2hlYWQgb25f
ZXhpdF93b3JrOwogwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlycWFjdGlvbiAqYWN0aW9uID0gZGF0
YTsKIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGFj
dGlvbi0+aXJxKTsKIMKgwqDCoMKgwqDCoMKgIGlycXJldHVybl90ICgqaGFuZGxlcl9mbikoc3Ry
dWN0IGlycV9kZXNjICpkZXNjLAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb24pOwoKIMKgwqDCoMKgwqDCoMKgIGlm
IChmb3JjZV9pcnF0aHJlYWRzICYmIHRlc3RfYml0KElSUVRGX0ZPUkNFRF9USFJFQUQsCiZhY3Rp
b24tPnRocmVhZF9mbGFncykpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGFuZGxl
cl9mbiA9IGlycV9mb3JjZWRfdGhyZWFkX2ZuOwogwqDCoMKgwqDCoMKgwqAgZWxzZQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhbmRsZXJfZm4gPSBpcnFfdGhyZWFkX2ZuOwoKIMKg
wqDCoMKgwqDCoMKgIGluaXRfdGFza193b3JrKCZvbl9leGl0X3dvcmssIGlycV90aHJlYWRfZHRv
cik7CiDCoMKgwqDCoMKgwqDCoCB0YXNrX3dvcmtfYWRkKGN1cnJlbnQsICZvbl9leGl0X3dvcmss
IGZhbHNlKTsKCiDCoMKgwqDCoMKgwqDCoCBpcnFfdGhyZWFkX2NoZWNrX2FmZmluaXR5KGRlc2Ms
IGFjdGlvbik7CgogwqDCoMKgwqDCoMKgwqAgd2hpbGUgKCFpcnFfd2FpdF9mb3JfaW50ZXJydXB0
KGFjdGlvbikpIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcnFyZXR1cm5fdCBh
Y3Rpb25fcmV0OwoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcnFfdGhyZWFkX2No
ZWNrX2FmZmluaXR5KGRlc2MsIGFjdGlvbik7CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFjdGlvbl9yZXQgPSBoYW5kbGVyX2ZuKGRlc2MsIGFjdGlvbik7CiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFjdGlvbl9yZXQgPT0gSVJRX0hBTkRMRUQpCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF0b21pY19pbmMoJmRlc2Mt
PnRocmVhZHNfaGFuZGxlZCk7CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChh
Y3Rpb25fcmV0ID09IElSUV9XQUtFX1RIUkVBRCkKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaXJxX3dha2Vfc2Vjb25kYXJ5KGRlc2MsIGFjdGlvbik7Cgog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlycV9maW5hbGl6ZV9vbmVzaG90KGRlc2Ms
IGFjdGlvbik7CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVE
KENPTkZJR19QUkVFTVBUX1JUKSkgewogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbWlncmF0ZV9kaXNhYmxlKCk7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRfaW50ZXJydXB0X3JhbmRvbW5lc3MoYWN0aW9uLT5pcnEs
IDAsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXNjLT5yYW5kb21faXAgXiAodW5zaWduZWQgbG9uZykgYWN0aW9uKTsKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pZ3JhdGVfZW5hYmxl
KCk7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHdha2VfdGhyZWFkc193YWl0cShkZXNjKTsKIMKgwqDCoMKgwqDCoMKgIH0K
CiDCoMKgwqDCoMKgwqDCoCAvKgogwqDCoMKgwqDCoMKgwqDCoCAqIFRoaXMgaXMgdGhlIHJlZ3Vs
YXIgZXhpdCBwYXRoLiBfX2ZyZWVfaXJxKCkgaXMgc3RvcHBpbmcgdGhlCiDCoMKgwqDCoMKgwqDC
oMKgICogdGhyZWFkIHZpYSBrdGhyZWFkX3N0b3AoKSBhZnRlciBjYWxsaW5nCiDCoMKgwqDCoMKg
wqDCoMKgICogc3luY2hyb25pemVfaGFyZGlycSgpLiBTbyBuZWl0aGVyIElSUVRGX1JVTlRIUkVB
RCBub3IgdGhlCiDCoMKgwqDCoMKgwqDCoMKgICogb25lc2hvdCBtYXNrIGJpdCBjYW4gYmUgc2V0
LgogwqDCoMKgwqDCoMKgwqDCoCAqLwogwqDCoMKgwqDCoMKgwqAgdGFza193b3JrX2NhbmNlbChj
dXJyZW50LCBpcnFfdGhyZWFkX2R0b3IpOwogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cn0KCi0t
LQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
