Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602AAC77B78
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 05:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TLE9szX+SqdBrnUyrhoIWB4bkHCic3uKPT/7oKz8inA=; b=k52+2hwswOjY6q
	7Hhuf81kToG+UreeuuOv9Q5OOR9UEtB0DXXPjerT5kDntJf1IK5tKJGjPKGr2xjtQWM8qzC70mBUT
	Cupl1Lpv/lqCoanJ+lub3gPX9d4juuPTT/NK046HjPImBnEsNIOwU2x82cHsgvqJBK6hD0D19y28w
	J/vm3hAS8enq0Lqhr0iMvuyzyMMWLP4DWjxPLTcqOjKtxuZAFe+H6vy5SV/S9nMt/sy9R4dfwV+Ka
	xj01o9Xx5jg8jkC+x+9dUren6DZ7GBdviMoUQUPl0RPITU3EVdhf2lxBaIRtdV7NhF8VJ4ZoPJzI7
	hi5efik241R0y6aw+/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puRdN-006ek6-0a;
	Thu, 04 May 2023 05:36:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puRdK-006ejJ-0J;
	Thu, 04 May 2023 05:36:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9619095f479so4638966b.1;
        Wed, 03 May 2023 22:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683178559; x=1685770559;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B0t5YGI0IKM6eJmALhq9Gwt5nHb+W20+Of1xihS5tU=;
        b=CwILioX0YQcUeq9+Eli1Hmp2zaY8kTSpsMSQhAfhkU+sNv5U947J2jYAg6jqzFl4d/
         ZTRAhIsGHAR0UYT2ym2Lf3L6sP3R9RUE0485DEr9p7vgRL+u71GLkZx+aCCCi5CJaywS
         1KcbB+QYRBDqBUeOYZc30PMXEi0pJORquK9u7wTzQuuKXwOsEGb6nQQxU7lyLWizXw+C
         n4ixejUlzJp576TWcpb1xBKLxu4ZxEzmPnUB7HcgTishIGyHWFDFD6hxaqruxeINe945
         LAiPzlsalTFyrPhfmtLDHhhuxr1+bpVHS3gvGj5HJA4JHA10ld3fK0NZfdOv2jN0DpcK
         hs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683178559; x=1685770559;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2B0t5YGI0IKM6eJmALhq9Gwt5nHb+W20+Of1xihS5tU=;
        b=WhV43bJky/c1ZvZAAysFrVSpHwTQBM40Jqs/so0qO9OFaolwtz4I4h7U2DCWBh1u62
         D2JQrvCM/3JAzIkW2tFjTaJkJJe1qQzMVjX34loRVqViU+lSCaiTtKS6PiQFXXpl7IGq
         kdGdOeayW7t6bUrLJj3QMnUmpooI9zWSLyTQ2x/m+uttjugs2fgnhkEU9AT/yOHP1GbZ
         xpJCD7ULrYpO3/TsoxFvK92CmRRjB3fN/0r3pZjCGfEFyjeQiYiy7vFYkSouVR+ofiI7
         a3BvJo+A6jtNy88p7NujK7sKP1tHugd4tYls30SmscOvjDj+huC7vca9D+on4SN8i50H
         pB0Q==
X-Gm-Message-State: AC+VfDxcmQjkw833J22tS9PQDSMa0+vec4LuxVMgltMQSkAxigFdwekg
	e6zR22/CaC821OucpBfV9iM=
X-Google-Smtp-Source: ACHHUZ5FtRAYDi71Gl+BLlzVhBBkGmjcV75ZWWjXELJJn89EBnz0Q1Ap2oGatIcuHtImFMJU5FLkPA==
X-Received: by 2002:a17:907:70b:b0:94f:296d:75d0 with SMTP id xb11-20020a170907070b00b0094f296d75d0mr5134611ejb.30.1683178559131;
        Wed, 03 May 2023 22:35:59 -0700 (PDT)
Received: from ?IPV6:2a01:c22:77ba:7e00:1ea:4329:c109:e987? (dynamic-2a01-0c22-77ba-7e00-01ea-4329-c109-e987.c22.pool.telefonica.de. [2a01:c22:77ba:7e00:1ea:4329:c109:e987])
        by smtp.googlemail.com with ESMTPSA id sb21-20020a170906edd500b0094f4d2d81d9sm18226897ejb.94.2023.05.03.22.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 22:35:58 -0700 (PDT)
Message-ID: <d2aa9fa6-4513-c3e8-493a-3a34d5a1143b@gmail.com>
Date: Thu, 4 May 2023 07:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: pwm-meson: remove not needed check in meson_pwm_calc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_223602_140918_C70ED467 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ZHV0eSA8PSBwZXJpb2QgaW1wbGllcyB0aGF0IGR1dHlfY250IDw9IGNudC4gV2UgdmVyaWZpZWQg
YmVmb3JlCnRoYXQgY250IDw9IDB4ZmZmZiwgdGhlcmVmb3JlIHdlIGNhbiBvbWl0IHRoZSBjaGVj
ayBoZXJlLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPgotLS0KTm90ZTogQXBwbGllcyBvbmx5IGFmdGVyICJwd206IHB3bS1tZXNv
bjogZml4IGhhbmRsaW5nIG9mIHBlcmlvZC9kdXR5IGlmIGdyZWF0ZXIgdGhhbiBVSU5UX01BWCIK
LS0tCiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJp
dmVycy9wd20vcHdtLW1lc29uLmMKaW5kZXggMzMxMDcyMDRhLi5hYWQ0YTBlZDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
CkBAIC0yMDQsMTIgKzIwNCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IG1l
c29uX3B3bSAqbWVzb24sIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCWNoYW5uZWwtPmhpID0g
MDsKIAkJY2hhbm5lbC0+bG8gPSBjbnQ7CiAJfSBlbHNlIHsKLQkJLyogVGhlbiBjaGVjayBpcyB3
ZSBjYW4gaGF2ZSB0aGUgZHV0eSB3aXRoIHRoZSBzYW1lIHByZV9kaXYgKi8KIAkJZHV0eV9jbnQg
PSBkaXY2NF91NjQoZmluX2ZyZXEgKiBkdXR5LCBOU0VDX1BFUl9TRUMgKiAocHJlX2RpdiArIDEp
KTsKLQkJaWYgKGR1dHlfY250ID4gMHhmZmZmKSB7Ci0JCQlkZXZfZXJyKG1lc29uLT5jaGlwLmRl
diwgInVuYWJsZSB0byBnZXQgZHV0eSBjeWNsZVxuIik7Ci0JCQlyZXR1cm4gLUVJTlZBTDsKLQkJ
fQogCiAJCWRldl9kYmcobWVzb24tPmNoaXAuZGV2LCAiZHV0eT0lbGx1IHByZV9kaXY9JXUgZHV0
eV9jbnQ9JXVcbiIsCiAJCQlkdXR5LCBwcmVfZGl2LCBkdXR5X2NudCk7Ci0tIAoyLjQwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
