Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A458606A31C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SdvbZrHU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ksstibeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gGH+YZzfmYSE7H/9VuxKkpOmFBoAFmGMOeg6TbchVew=; b=SdvbZrHUX/5LTR4WRijRJuR62K
	o6LLrt63FKoe+J37F1AxXXsbMNQCndNNKuC09swcJQ8KpEx0kSXphLvqU6444fcc12wFfNRMqXB4C
	/sNO4KDQlM17NrXpLupTgTjMbFwdtWui1sJBG89pZ08Mld9uiHUxbqe14Aax59q28y8RvGA+qbdHV
	LoiXT99KaHXWUAb5Tq49HNc+ROHoejplGHsMcP8dlDY5NaHudwKTSfVsiVvSP7JOJoq12xg4QAJ0r
	4MAw5HMJMW5dt8lSr+JZa2sXm5/r8sfNZ/p5PI3lBel9V3545+SsdQrUt1y4G7o8RAgtxhQMAvR8+
	tFidqeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6M-0000000Gfnj-3jOP;
	Sun, 08 Nov 2026 21:06:58 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6K-0000000GfmU-36u0
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:06:58 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-677af43eed4so248203d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172015; cv=none;
        d=google.com; s=arc-20260327;
        b=EpymGTnY29EJ/Nny5SokiayXMW+hjeSt5Pe9wP0eqOWX2P5UdoU5XA5rf62+JpBLGK
         nPd7a98vxAOQskhYF319tGDxBKm3tjP+MqdoIibzixKw/8N9XjNlnRUc6AES+f2l14E2
         kmzlJMYdkxVqd0Xc/VrHZNMnrQKVOXpMNMF+6FMh+89omNZFUzfcTq2BykdyPxvhYPtI
         /ordz8PXrqpBd8ZYHtTljqwlqnoC62XASIHGjpHCqF2GeWhi7EtVIEyrSjKZscqR1U2a
         LDOqZyYovk8rgHFH/FOcnL1478RyQ9Y11MROQiZC45nTNmc4YNrQwZdDDWnNBGLOnQ3k
         g2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        fh=s5YjH/e10hnWxYAGSJ5cz/oSMe0eRF80ku9HsrlbFyg=;
        b=BCTGRagUBcsWYFxoHqXFs1C76WljdcI9mTUvk9y0xtwpim5H2aA8uGIaCehaPmEkDJ
         Fo0Hsny4fJAITAnuWAQJYV6VrZAwkbcyJAKrRXPQyNQP+Tnat30OPyM6yZewla0GE8a6
         sk+MfVbg6rA8r66UkHO8kQkZfkzsDAJ5FlB4irLWDfLvdYuUJUBEvToGkVOGSH57acSd
         EGyMFX8SunHpQSo7HgF4giazMBsNhA8rNszKqGDgnAfXHKoM1K+mAe8UIc4KH3spwABY
         8Wav8C8JFW92gSgZ/Y7VLxFAVKIjEyH/tooIxENLyx3Iepymhm18OtF1nUUi5xF7XkjA
         5bZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172015; x=1794776815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=Ksstibeu1S57AmXkfkUzArNa2AEobO3k9XKgalvu0v7QgTtTcTJNAGWnNoQag4DklB
         P8RZxuzxaHx4JHzL/8t/kOiMs2tENu+WsZmgesB0VKjIHyGvND0MVG2iocPTHzkil/pd
         PaxTJQIon8Z1wtFDBc3jKMeco2UPnDBHFncY72Ca0gJZSiqNyEV3ajFhvnopV40vzF1M
         eyCSjOXGieu1Rtc5aj5VpEA7h08hfmxdFkMOcIi/lDjb5j8Wd1MXaSVUzbpUJrfssDqh
         bhP0PjhBDWbiXIevGz4A3FmwbXi0qQZWAolZ9ExfBoufadXkfD3lEXsfRjorXX0bi8Lc
         foeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172015; x=1794776815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lri/WTSWkrPmnkfmb8OPckDNaNfPxlDZN6oZYmR6lYc=;
        b=PgaTxALJ4IdB7jXAX2sK9asCyGePHh7fqk8VaUoqcDYezpG+V4XraZYR89PCZWQJ5N
         oHVYKA3Z5jNd96gH2kVc4rM+qHdCoM4qhN3B2aUFMwExNTJ+quJyyPv3hK6MBBGDI7JA
         s+OO88c5VjO9eDu+liIpsg3PmSj22QVfSpEO5AGTFDprl3CU6UBw+vD5NNj+Ks90fasN
         j+IQv4MQBR3Sy0qiStlRazmUYi1Ph1QgF0hc2Qt+Yn34WHhw+zOS65effStS9gWq0y32
         Gv+xC+jop7yH042i23kSmxSn320ODq7CjV+4BTzI/4jjBLejigL9MBJk11tm5CsY3lmM
         5lwQ==
X-Forwarded-Encrypted: i=1; AL+hErGMvO2UH8MP4o1FoRUFlIUiaaxqT43Tlx5EW2DjyBn8Kr4oOQ2wBFKaFxRO/1ywyBhPgFT/lmSQ41X4V4qN@lists.infradead.org
X-Gm-Message-State: APuU4Z/9aRfX00HUD5HbrHpTuVvy85pFVioU28x0B0S8Iiw0CQ58WsCM
	cWkbz0zyFbSb3WCzhJaTc7XRxAvf/8Q/GV4SPCdcp0d1/7YRmlY8COcBIjw6h32e36yD5+S3Jo6
	qe64PpKvG3bibSWVKaVxgVQIlWhpmNxU=
X-Gm-Gg: AYBFou3L8NnhJ752pyE9DRllUUNk0Y1NINX0BQXR5bpuHYrurbFLJXIkaFfxRlm7REG
	ZciEoqzaAqATaJHNs3x+tSkSkivTzNWC7qPbmI567/xifgvQQ5syOsi4djInCG8Bn5paFt4irwe
	QB3cga5o/qdUpXj8uk+svZdtc8VVQsoHEm2KIJpRhAvoRLgjdETJjYo4xtkOUIgERWEMsohCNkv
	nmBALLY9KGineZK6Ozna7YHSmh/GTaKXHSeVFyd18n2vryaJXQaXaUdbX58Sg79s4cUC4fdtTIf
	jfvf5L0ZX/su6LjYqhf1Eq4vHHW2pwFGKCs+3Iv7fM3k3OEbsqWfLGMd4nl5EE2TbnqOQZnacJy
	DqMCB7RaKr95yRul3ScbuY8hKhAOoOjn4k7aLaMsGVu5de0l/3kGnapozQMdMlcEqy9t+oQ==
X-Received: by 2002:a05:690e:4084:b0:67c:307:205f with SMTP id
 956f58d0204a3-67c3d9bdaffmr1517575d50.50.1794172015392; Sun, 08 Nov 2026
 13:06:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-4-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:06:44 +0100
X-Gm-Features: AclHuK-74c2fIbgObwWVEcBBZUrlkOFXR6g67QOovSh9WdTOcreJmeRwgf3g9rg
Message-ID: <CAFBinCDKUmA8UPL86znCo1XwvDrwcvDsO9ZWgs1KkWSA9kZxcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] thermal/drivers/amlogic: do not log the secure
 monitor deferral as an error
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130656_798803_E4482595 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMToxOeKAr0FNCjxjaHJpc3RpYW4ua29ldmVyLWRyYXhs
QHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSB0aGVybWFsIHNlbnNvciB1
c3VhbGx5IHByb2JlcyBiZWZvcmUgdGhlIHNlY3VyZSBtb25pdG9yLCBzbyB0aGUKPiBmaXJzdCBh
dHRlbXB0IGFsd2F5cyBkZWZlcnMgYW5kIGxvZ3MgIkZhaWxlZCB0byBnZXQgc2VjdXJlIG1vbml0
b3IKPiBmaXJtd2FyZSIgYXMgYW4gZXJyb3Igb24gZXZlcnkgYm9vdCwgYWx0aG91Z2ggdGhlIHNl
Y29uZCBhdHRlbXB0Cj4gc3VjY2VlZHMuIFVzZSBkZXZfZXJyX3Byb2JlKCksIHdoaWNoIHJlY29y
ZHMgdGhlIHJlYXNvbiBmb3IgdGhlCj4gZGVmZXJyYWwgaW5zdGVhZCBvZiBsb2dnaW5nIGl0Lgo+
Cj4gUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZl
ckBvdXRsb29rLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
