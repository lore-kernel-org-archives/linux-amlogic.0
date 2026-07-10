Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C472C44501
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+C0gxXBvaD9KbMNfCjc7AVooqHxtHNsmP4oAodlS/2U=; b=0hDTcYDoCAgA/K
	pUZDr1L53LsqeZVSgjZanL9/h8KRKpm3Ff/FNW85wQIHQFRoVNFLMTd81vWZu0oDHc1TMZ7HAfsN4
	2kemyR2MV0x5QtUx3LA7BjbTpyj44ZsxghCoEfmJqqEvyHgu+ao/g3kVBw++YnhFZ0qoVwEKCvg/0
	t0+6Pwdwl/KTqPl4/8dz0WTGvgcu2VY0TxAok0ULrxTOXyTcwyoQwQXc+Fk48nQUZWHKjufVgpgGR
	YXCWfMJvkiGERIBlV3GYzbwd4cCUZvj17J9X3ORttgWqUhX+pNZzj9hHCbI9T6xrcUR+Bjx79t3G9
	LThcI+oqIZCTwI1ilQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi48O-00000004Dvl-1tFF;
	Fri, 10 Jul 2026 05:50:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi48L-00000004DuD-0rTc
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 05:50:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso7142515ad.3
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2026 22:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783662644; cv=none;
        d=google.com; s=arc-20260327;
        b=rzkKssgxRnK3ey4uZTFmMZzITDJ2vDFbhpFzWyeDKhXrj3Y/rPi1y9aZ58gVhdBm2R
         NYGvwTotWGfNOYPOuwj7JTNiY6lNKk0zzZ3sefGiA1ZMWAOPnyXP1DCKdK4HZHtHu/6W
         HpaRVTab+HIadVrZISchWEmlYw0NRVTvauhScuTbn+Dxtmb2v/Aou4lYK4Px4Lf0Rzxb
         gBcVMG1J5mFMW7rMXZslT2U2dz6vTTm1TCzS8EnaEYvlM1nCrHr9SovC6X8t/Iszcgh0
         DuNFvtJpykZyiAnMkyQ/sgc3VvJRdQHpX6WCIG7WubmFIOoUEX7YI9Aw1VfkSFG6IqIf
         Gjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        fh=dj6CSvJJ4SPrdmIN3Gt0//o+zCfmjdju/HhM25u9Xug=;
        b=IHTpmfyvk3yQJQm8QkeRWepNaxJsffhqI35b4UH4nxr2NDK7gckhNdd3TiBUx8S3uU
         Rl2gXM8jD8fF8qayVRqF3PTx1iT7PX8716QN/bmlG7CViemN9rzCvQCzAxHsgn2QpzDU
         YXqEw+KyJnkvS8ZUYZJ/jASEmQ6TmqP5pS3rcl20SimUoKKr7Hgt7ZExklKgsDXY2BSv
         ArjG6X8oiC37BluykgqHM88SDT5KJziM5NFTvuDjQUtvFk2hxJNOKoSYnj3d9Wk0+086
         nVJBF8Oi2ae+z7aLT1ogqH0VrQxMPA1QL4JBKEqNDBLlmWnVtqiCIE9w6x70fmw9WuxY
         oOIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783662644; x=1784267444; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        b=m9f0qpTyvPapCYk/FoQFam4DwfSVHnWXcgnfC94PYumZ4md9wr6a9+RVSt5uzAl/sM
         v/JhH9RyPySCj16SK1WqgLlxacZZ2M+HxP7hHaPpNJuR+eeqyLB67Uuirh0ObcvJo1eH
         oSAxgKaWDJIUZym5K1LLX6Vlnf0k7a/WoB+vi/vrRSD+HrWc7SvjXge6o54APk4JQIbQ
         /6q61EXU6gV7NDDPsmjPAdUHLqJQGIy7O+qy/qQygroJSwl0oqHwCbP/2xIxAW9gbRQZ
         RJkrv082Lp/Q9licn6TY34dhycllQ9IwCjSQTb79PwsqAGPFXoYNb3pEHRJqum+X5Uak
         ai8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783662644; x=1784267444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DddMInZ7IA1pfySnmNQl3FXCwNGcPaWp2vWIBS2398=;
        b=jfvW36uDLoSPa/6uZgFPQPWM8OIpls2deH8hmn5ny+jNp7eUZkK83wsyGcqjeC5CTh
         glem/pEs6VnM7c7wuaMReZTVwsUqQp597MaqsVPsYAgk0wxWyX3qTicXBanQeo4aIidF
         pspCsKXbYBADCP2FcdHiWZeqO5lWIIp2X/fa0eJ/SzKKVFxhGYg/1ol+lFXqhjw8Rtez
         5pGEKr6E1D9r6Q/X5ZU01aNY/teqzDcgPjXBDWE3oTgl/PKCI1wwKsjFJ0yq+VXQWH50
         MA3wYN4Mj0kBSZiApKLT9/QlQ/5DpAZSDPf6y6biZffpZp5swWLcbCCaygdyoUcUuTYT
         I9qg==
X-Forwarded-Encrypted: i=1; AHgh+Ro371+2+VW8p7+7Rr7TyH+DxO+qodxtp/BDBF/ayha45bdDjZntddkn9OfLjFnHyRa/Fo4LcOtCvrDyluSo@lists.infradead.org
X-Gm-Message-State: AOJu0YyNM3lrA4dy1UEbr3muZGjy8Cp7kwdbUHFUJ59JYLTJ/hXwpPwb
	jjXrZ7QX4BzrvXlbC2XIokeLL5MhrqrF69NbUjDjkX2bhvG2tAtKW0/tUYFCOnHAHdzgIMyL/cs
	0Sr8vHzArgwCXuocDoMT/Pe7hvkBcuA8=
X-Gm-Gg: AfdE7ckUalg1rHDrXonpkrNhXW/B/wibDsA9CkbPYo74fTl4CkMcsbcqrG/voqftGAN
	RVulZnSiy5LVcw56PceGsULCUk26W+oFeqUGx+RrUM4aBaNTdiS2EHPtieGZyar1Ejb/pps4x/C
	PVvgDLrLvWHFzbvlCez7dh1RX8VJkielunSwSo6ZFKtAvCC7la1QOLC0SXPMyUnQqOxwzQaVPuU
	Z7hU7nR7LDIgSECJnQJ4ZQyezPwik1lWXYKQVj5haTlt8FOm2gIK1wCeeBQvdv7fKVKGbpBJgMd
	VA5QBrUf6t258w76JF07v4p/iVSnIA==
X-Received: by 2002:a17:902:f78b:b0:2ce:6d4a:5b8a with SMTP id
 d9443c01a7336-2ce6d4a5c71mr61147605ad.38.1783662643951; Thu, 09 Jul 2026
 22:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260709205538.73157-1-zuiderhoekl@gmail.com>
In-Reply-To: <20260709205538.73157-1-zuiderhoekl@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 10 Jul 2026 07:50:31 +0200
X-Gm-Features: AUfX_myPorv7UXy0UOv5TQvSWql4a3XLrVFEv1QWo1DUc3NB-2t7-ryf9s8Kppg
Message-ID: <CAFBinCDVn0+m1MybMvoNOXyNk+8KuxQrxrou=KseHue+EZbP5g@mail.gmail.com>
Subject: Re: [PATCH] GPU: drm: meson: inline call to drm_simple_encoder_init()
To: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_225045_237763_F8A44559 
X-CRM114-Status: UNSURE (   8.60  )
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

SGVsbG8sCgpPbiBUaHUsIEp1bCA5LCAyMDI2IGF0IDEwOjU24oCvUE0gTGlhbSBadWlkZXJob2Vr
IDx6dWlkZXJob2VrbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBjb21taXQgaW5saW5lcyB0
aGUgZnVuY3Rpb24gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQgZm9yIHRoZSBtZXNvbgo+IGRyaXZl
ci4gSXQgcmVwbGFjZXMgdGhlIHNpbXBsZSBlbmNvZGVyIGluaXQgY2FsbCB3aXRoIGRybV9lbmNv
ZGVyX2luaXQKPiBhbmQgYSBjdXN0b20gY2xlYW51cCBzdHJ1Y3QuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMaWFtIFp1aWRlcmhvZWsgPHp1aWRlcmhvZWtsQGdtYWlsLmNvbT4KV2hhdCBhYm91dCBtZXNv
bl9lbmNvZGVyX2RzaSBhbmQgbWVzb25fZW5jb2Rlcl9jdmJzPwpGb3IgYWxsIHRocmVlIHRoZXJl
J3MgYWxyZWFkeSBhbm90aGVyIHNlcmllcyAtIG1heWJlIHlvdSBjYW4gaGVscCByZXZpZXcgaXQ6
IFswXQoKClRoYW5rIHlvdSBhbmQgYmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDI2MDUzMTA3MzUzMi44NjA5LTEtbmFtYW5h
cm9yYTAyOUBnbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
