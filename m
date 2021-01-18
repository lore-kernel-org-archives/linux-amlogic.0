Return-Path: <SRS0=61z+=GV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A947C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jan 2021 13:37:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4FC2065E
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jan 2021 13:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4FC2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dbj872qaa+KkpmbNbHz4Y5zNxC76s9TkZPvMcadAliQ=; b=jecCKMTSX4nOQRvVfvqashGlD
	BuU4DWd53rU4cL53+eXURzunxrvQO8dm4MRAkXk3ElZWkCCm9HCGi7nehpFeqRkJjC0RiWE6TMq3r
	Zdx/7Qlf3N8dESHJAKj4lsQLE3O/2VaiI+gKzQbRNzNvqjSOpruJGTBnEcCrV97CXGjv5VkGjo5vA
	gjPphW8kyqWWsFXDAluOMbrGKhnKyY3KuY5pzJaUKGBNTT1U5pXVnbKdYLNauGRxU64qUmBwXeHp+
	74jKuOSf1/halCU4kmfiGsyls19PiNwonO/CwWWmtmOk/djG4uFhiL6L6ziDZIS3wdMfWxC6T1PlG
	396poIm5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1UiY-0002Zb-Dv; Mon, 18 Jan 2021 13:37:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1UiT-0002Xp-7p
 for linux-amlogic@lists.infradead.org; Mon, 18 Jan 2021 13:37:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 190so13631681wmz.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Jan 2021 05:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6v+bxQvzaDRlp681v+vNX4NHzW7KO4W7OiPqn1T/p4=;
 b=NNg83NF3jY+nojH9V9phZBGoFKVZOhG4iGJ5zKq1Ghm7UUNW7v9u1tJd3dacFVehIa
 x4JgxX3idusigLXFedoGBSSdoclxmnon1iGNyt95fYUPk2cdst/CRrogWQL/D0gkw0Dy
 XB8fYZ26xFOvAbAMyVH7RSye1EjK3EJTmPiT12e1MTkRIFSDg2hwf5NcGgNzuHAUcLtF
 J29VGbTWWQFpg+lizPIjapOjUuFTm0NtOU+agAMg9tAtpqI9+gnIcsrilYXdTWr2rgJ5
 YeFSanhhJ2v16+1N2Qhgq3sa+TTkcTuPMt3UXWbzujonKHrymGzeF7U5KGZWeOjHFTQD
 21oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c6v+bxQvzaDRlp681v+vNX4NHzW7KO4W7OiPqn1T/p4=;
 b=sC8Ep8+a3gAO6O0LzgRGxCZsGiiEWQwpLglcibCxNMiLOT7Bub6fIR7hmcv4Imtwm2
 6zOaafQrwzPtU5r8kQ3Dit3SFggitd1g0fui/zxovzjPBYI3KihJb+nrydbGZy6X6Umr
 gGBgfk/te0kKOfIFLOV8HHVJ9OcKDPkKVVoS/faBT4oyWiKDY5lYmoq8kMgG+uNMv33v
 7AHih9CmgSBSVDY59sHcxj+Bu9ie+GncMkSQ71pt2o/wFhENIGmYE4OPumxHPf08dLWp
 oN+mrJq9RRiVInPefIglikIZ5ztJJwMxJ9JytEwMvl7QayR3/4uODamFxggNDROjUyfN
 6nWQ==
X-Gm-Message-State: AOAM531/11zzlT5c8QZG+SPMbxuBYdF+hw2xbvB2aYNvEiHTWQ4ON69O
 3tyB8gR+AwokGaTMHb1LgqbUAQ==
X-Google-Smtp-Source: ABdhPJyoOinFGP9skdtep4SMtjUk1S9pxPifdPKh8DUlFAPHdyh5pZxN9joyKlIhmTkIFHJDWkT2RQ==
X-Received: by 2002:a1c:6283:: with SMTP id
 w125mr20705063wmb.155.1610977025520; 
 Mon, 18 Jan 2021 05:37:05 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:b8f6:a2f4:ce77:3e95?
 ([2a01:e35:2ec0:82b0:b8f6:a2f4:ce77:3e95])
 by smtp.gmail.com with ESMTPSA id q15sm29682249wrw.75.2021.01.18.05.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:37:04 -0800 (PST)
Subject: Re: Delay recognizing USB-Drive with Kernel 5.9.12
To: thilo <thibau@gmx.de>
References: <3b5d2496-9be6-fdef-5e12-27def85aeb5b@gmx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7655b38c-a1dc-7207-4fa3-e1321e414a74@baylibre.com>
Date: Mon, 18 Jan 2021 14:37:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3b5d2496-9be6-fdef-5e12-27def85aeb5b@gmx.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_083709_307240_04208ACF 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxNS8wMS8yMDIxIDE1OjI3LCB0aGlsbyB3cm90ZToKPiBIZWxsbyEKPiBJIGFtIG5l
dyB0byBsaW51eCwgcGxlYXNlIGV4Y3VzZSBmYWxzZSBzdGF0ZW1lbnRzIDotKSkuCj4gSSB0aGlu
ayB0aGVyZSBpcyBhIFVTQl9QV1JfRU4tcHJvYmxlbSBpbiB0aGUga2VybmVsIChVQVMtZHJpdmVy
Pz8/KQo+IE5PwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWxheSByZWNvZ25pemluZyBVU0ItZHJp
dmUgd2l0aCBrZXJuZWwgNC45LjI0Nwo+PjIwIHNlY8KgwqDCoCBkZWxheSByZWNvZ25pemluZyBV
U0ItZHJpdmUgd2l0aCBrZXJuZWwgNS45LjEyCj4gCj4gSW5zdGFsbGVkIEFybWJpYW4gb24gU0Qg
b24gYW4gT2Ryb2lkIG4yKy4KPiBXYW50ZWQgdG8gbW92ZSBzeXN0ZW0gdG8gVVNCLVNTRCwgdXNl
ZCBuYW5kLXNhdGEtaW5zdGFsbC4KPiBBZnRlciB0aGF0LCBkaWRuJ3QgYm9vdC4KPiBOZXcgaW5z
dGFsbCBvbiBTRC4KPiBSZWFsaXplZCB0aGF0IG1vc3Qgb2YgdGhlIHRpbWUgaXQgdG9vayA+MjAg
c2VjIHRvIHJlY29nbml6ZSBVU0ItU1NELgo+IEkgZmVsdCwgZmFpbGluZyBib290IHdhcyBkdWUg
dG8gc2xvdyBVU0ItZHJpdmUgcmVjb2duaXRpb24gKHN5c3RlbSBkcml2ZQo+IG5vdCBhdmFpbGFi
bGUgYXQgYm9vdCkuCj4gCj4gaW4ga2Vybi5sb2c6Cj4gLi4uIGxvY2FsaG9zdCBrZXJuZWw6IFvC
oMKgIDMzLjc2MDAzOF0gVVNCX1BXUl9FTjogZGlzYWJsaW5nCj4gLi4uCj4gLi4uIGxvY2FsaG9z
dCBrZXJuZWw6IFvCoCA1ODcuODM2MjY4XSB1c2IgMS0xLjM6IG5ldyBmdWxsLXNwZWVkIFVTQgo+
IGRldmljZSBudW1iZXIgNiB1c2luZyB4aGNpLWhjZAo+IAo+IERpZCBzb21lIHJlc2VhcmNoLCBm
b3VuZDoKPiBodHRwczovL2ZvcnVtLmFybWJpYW4uY29tL3RvcGljLzEzNTgwLW9kcm9pZC1uMi1r
ZXJuZWw0OS1uby1ib290LW9uLXVzYi1zYXRhLXNzZC8KPiB3aXRoOgo+ICdCVFcgd2hhdCBpcyBV
U0JfUFdSX0VOLCBhcmUgd2UgbG9va2luZyBhdCBzb21ldGhpbmcgaW50ZXJlc3RpbmcgaGVyZT8n
CgpVU0JfUFdSX0VOIGlzIHRoZSByZWd1bGF0b3IgdGhhdCBwb3dlcnMgdGhlIG1pY3JvIFVTQiBP
VEcgcG9ydCwgd2hlbiBub3RoaW5nCmlzIGNvbm5lY3RlZCBvciBhIGlzIGNvbm5lY3RlZCB0byBh
IFBDLCBwb3dlciBpcyBkaXNhYmxlZC4KQ29ubmVjdGluZyBhIGRldmljZSB2aWEgYSBtaWNyb1VT
Qi10by1VU0ItQSBjYWJsZSB3aWxsIGVuYWJsZSB0aGlzIHJlZ3VsYXRvci4KCj4gYW5kIGEgbGlu
ayB0bzoKPiBodHRwczovL2ZvcnVtLmFybWJpYW4uY29tL3RvcGljLzExNzQxLWJvb3QtZnJvbS1z
c2Qtd2l0aC1uMi9wYWdlLzMvCj4gd2l0aDoKPiAnTm9uZSAuLi4gZGVsYXkgd2FzIG5lY2Vzc2Fy
eSB3aGVuIHVzaW5nIGtlcm5lbCA0LjkueCBzbyAuLi4gc2VlbXMgLi4uCj4gcHJvYmxlbSB3aXRo
IHRoZSA1Lngga2VybmVsIHNlcmllcywgcHJlc3VtYWJseSBhcm91bmQgdGhlIFVBUyBkcml2ZXIg
Li4uJwo+IAo+IFdpdGggQXJtYmlhbi1jb25maWcsIGNoYW5nZWQKPiBLZXJuZWwgNS45LjEyIHRv
IDQuOS4yNDcgKGdsYWRseSB2ZXJ5IGVhc3kgd2l0aCB0aGF0ISkKPiBBZnRlciB0aGF0IHJlY29n
bml0aW9uIG9mIFVTQi1TU0Qgd2FzIGZhc3QuCj4gQW5vdGhlciBuYW5kLXNhdGEtaW5zdGFsbC4K
PiBOZXcgYm9vdCwgd29ya2VkOiByb290IHBhcnQgaXMgb24gVVNCLVNTRCEhIQo+IAo+IFNvOiBw
cm9ibGVtIHdpdGggNS54IGtlcm5lbCwgc2VlIHRvcCBvZiBtYWlsLgo+IAo+IFdvdWxkIGJlIGds
YWQgdG8gZ2V0IGZlZWRiYWNrLgoKQXMgTWFydGluIHNheXMsIHRoZSBBbWxvZ2ljIGtlcm5lbCBj
b250YWlucyBhIGxvdCBhIHR3ZWFrcyB3aGljaCBhcmUgbm90IHByZXNlbnQKb24gdGhlIG1haW5s
aW54IExpbnVlIHRyZWUsIG1heWJlIGlmIHlvdSBpZGVudGlmeSB3aGF0IGRlbGF5cyB0aGlzIGRl
dGVjdGlvbiB3ZSBtYXkKZmluZCBob3cgdG8gcmVkdWNlIHN1Y2ggZGVsYXlzIG9uIEFtbG9naWMg
U29Dcy4KCgpOZWlsCgo+IAo+IFRoaWxvCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
