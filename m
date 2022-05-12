Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B577CC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN0nmVSzG5AX/jqRvt8vYVU5a1JS4EUbAuE9rCNaLYE=; b=cE1BwqKNIiXS94
	Df6GcP6C+zPipTCraX4ciCCnb/InhKEYTKIGKhDUnr6qSjNCkegfZYBsagYopJenZBlWAhgV8SbF3
	ARbLsF1yDNEPj1fYnH7LXykugblfI7aTT1/Gz8ITIOoZN6eQD4l3bMFKVJHiT6VOliUEs3MX26i3f
	DOR+ilQkA4+jxO4H2avuFtDdi8HA9Z5WN2S/jAiasqzV99FQGiOU6Mgzf0ffIjh8JxGpvPRpM5stp
	n+K+7F0prTpHKedlXWsf5G5ErlrM7C+n9uUPiPFACMM+nY80/7Jzx9BXjhaYGPZzhneRkkP0+J+u1
	AcotN2BO/saJMFQH53cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6on-00BX6D-JV; Thu, 12 May 2022 11:17:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6ok-00BX3k-HN; Thu, 12 May 2022 11:17:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i17so4536273pla.10;
 Thu, 12 May 2022 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6WezROkLudrlqv8GY4bLrfI4SSzTy6BukYeueDgyVAo=;
 b=ZG4L8aWgWUMIdLTyMqlfwkAvbyFWFtdzShi8yQzpV4ha+8gdXHZZbgGM494CmV8pHZ
 KUM31+rCVQ+f+rjslddzbgtjw3rn2C95dgsbihhOPl5X/XaYuU7/xuS7HEoVPL+MIk5u
 2dGxoWbTHtMbwHgMC1tIngmH3I9TG8Ii0cpcFNvtmK1pBuJwOdRj5ivaKn72u2n//pOl
 oslhRY2fn1Kt39pV7ZEAnqs6g27CqHEPGBSBrFvSVn2KaWTNymdXDZ/zeIJDVKHfydiw
 kY/GrcdP6EysrjF/PAdFREfVaKlF+p9Bs81hJBKQDUh+Kftl4QmhGyooqZcSnMdtPjw7
 skeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6WezROkLudrlqv8GY4bLrfI4SSzTy6BukYeueDgyVAo=;
 b=LxT1jSVmeIiiFOxn52LlrDkHLwwGMYdijdQsbTgT1eLL5fmGXxthP9cj+Lef+tSHSt
 TXOjPNQOTSRFODN2GjdptX5tH6LpDr7MZSuxmW5cfykHupeXSgybOXj9kHIg5QwZ2+yd
 lbJFkSvHHRy9yPgdGSvUYvb7tbIrPyHXoeRw2dZCTdQ1ae6FChUqEsl770MBP5BLu7K0
 Wf4UBIH5/F/3v9odK+VPY3jTVPhS+IrWVX36rJ+a8gUMdtb4ANVu1HrzlWQLWyO419+X
 Z0h7w7os3l7TlygPqQOngGOvu/GAhkZCGxZF8Nu3g+IjvxTHFT8Rii9RJ2AgVGF76wVo
 gGIA==
X-Gm-Message-State: AOAM531Ytn3BMnjC51Y57oKN2njzsFqzs+tZRDx9nx+tNANBQ9hi9+Sr
 SmP9k19r1eKV/uYM5dWL0VQ=
X-Google-Smtp-Source: ABdhPJxOk00NN95KoR0NkGvXDc/PUUEbhiITRueHgKA7v2vPBSykitNg4nZw/ehY2YRTSOAYec1gmg==
X-Received: by 2002:a17:902:ea46:b0:15d:dbc:34f2 with SMTP id
 r6-20020a170902ea4600b0015d0dbc34f2mr29455881plg.60.1652354230773; 
 Thu, 12 May 2022 04:17:10 -0700 (PDT)
Received: from [172.16.10.243] ([219.142.146.170])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a63474f000000b003c14af5060asm1663230pgk.34.2022.05.12.04.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 04:17:10 -0700 (PDT)
Message-ID: <e778d50a-81c6-6dfa-a58b-73cda452f4e3@gmail.com>
Date: Thu, 12 May 2022 19:17:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220512092114.38426-1-linmq006@gmail.com>
 <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_041714_613509_A7EA965D 
X-CRM114-Status: GOOD (  15.81  )
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

SGksCgpPbiAyMDIyLzUvMTIgMTc6MzIsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IEhpLAo+Cj4g
T24gMTIvMDUvMjAyMiAxMToyMSwgTWlhb3FpYW4gTGluIHdyb3RlOgo+PiBvZl9maW5kX2Rldmlj
ZV9ieV9ub2RlKCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIGVtYmVkZGVkIHN0cnVjdCBkZXZp
Y2UsCj4+IHdlIHNob3VsZCB1c2UgcHV0X2RldmljZSgpIHRvIHJlbGVhc2UgaXQgd2hlbiBub3Qg
bmVlZCBhbnltb3JlLgo+PiBBZGQgbWlzc2luZyBwdXRfZGV2aWNlKCkgaW4gZXJyb3IgcGF0aCB0
byBhdm9pZCByZWZjb3VudCBsZWFrLgo+Pgo+PiBGaXhlczogMGFmNWUwYjQxMTEwICgiZHJtL21l
c29uOiBlbmNvZGVyX2hkbWk6IHN3aXRjaCB0byBicmlkZ2UgRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SIikKPj4gU2lnbmVkLW9mZi1ieTogTWlhb3FpYW4gTGluIDxsaW5tcTAwNkBnbWFp
bC5jb20+Cj4KPiBZb3UgYWxyZWFkeSBzZW50IHRoZSBzYW1lIHBhdGNoIHllc3RlcmRheSwgcGxl
YXNlIGF2b2lkIHRoaXMuCj4KU29ycnkgZm9yIHRoZSBtaXN0YWtlLCBJIHJlYWxpemVkIHRoaXMg
YWZ0ZXIgSSBzZW50IGl0LiBJIHdpbGwgYmUgbW9yZSBjYXJlZnVsLgoKCj4gTmVpbAo+Cj4+IC0t
LQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMgfCA0ICsr
Ky0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4+IGluZGV4
IDVlMzA2ZGU2ZjQ4NS4uZGU4N2YwMmNkMzg4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4+IEBAIC00MzUsOCArNDM1LDEwIEBAIGludCBtZXNv
bl9lbmNvZGVyX2hkbWlfaW5pdChzdHJ1Y3QgbWVzb25fZHJtICpwcml2KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sIG1lc29uX2Vu
Y29kZXJfaGRtaS0+Y29ubmVjdG9yKTsKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIG5vdGlmaWVy
ID0gY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIoJnBkZXYtPmRldiwgTlVMTCwgJmNvbm5faW5m
byk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIW5vdGlmaWVyKQo+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKCFub3RpZmllcikgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdXRfZGV2aWNlKCZw
ZGV2LT5kZXYpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX2VuY29k
ZXJfaGRtaS0+Y2VjX25vdGlmaWVyID0gbm90aWZpZXI7Cj4+IMKgwqDCoMKgwqAgfQo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
