Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9987B606A31F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=trKxIk1o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TvYMImfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mxj7T8yx64qZpM8uoYGjQ0Ywrm2+Ue1SmHBotwIr/h4=; b=trKxIk1ozM/7VJ/djlA4YD1lU6
	FloKgy2StjAgtgbqYZNiYicTTr0tr0VrhC8YBVaYfrjulv6ATXGPEfq0rWm1lKloJpLNWS8bCd14I
	shLbVN3NQu/mWVIimM/xLY1x7dS1xaEKQEJH6NAf5zqcWDXNbCucKAghwLyq3RVFCfn8mqq4WGxXn
	2NibQhEtskJJfvrlwrvFaQi2eezfIn28fkoiiiWCbrjU9VarapAzgSo65o6X260tgC6Vb/WtgsNAc
	uIRkhui3xEztrVcicL7hUzivaSuVzbJZPJEuODAuEyJRdQYczGTKAF5Y9qd2bg+Jl0U6ddSsORM6h
	xskwB1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShTw-00000000Tox-45Vm;
	Sun, 15 Nov 2026 21:09:48 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShTt-00000000To4-2Ul5
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:09:47 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67db763cec7so270597d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776984; cv=none;
        d=google.com; s=arc-20260327;
        b=RiMAdjTVM6/6cplSryGftrLFgDMI41fRHYT+kq1mtRlbQeNFvlZMHh1nWBFH6znwVb
         lO3PzUzLdJGXiwyt992xWNISwEp7DWGBZr4crB/1BSaVfuKeoUnU21MEks+irnsFDkGR
         diDzwXVMi9JIDchnTMO+vyWn91UYQFj6KcbSmgqCCLmwE38BFRSoeEz9WtlKL4iMQMdM
         GqQdvsbDEyzmxrndFp+mKG48LRWRPMtzOkJze9pn99kANH/Gciowfy4Mv6x6TGWA1BOj
         4Sg+Y0+i1iFovU2oQzWwPahl4yBSIBSQd/qr/TiJXY3bPvKFH7kvrfGKZ8jqxCxubcXP
         0gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        fh=e8euj3clBsC1opKhL+OkPJAdkKdqnVi/m6WQIevyKVg=;
        b=mZ4P2Xwk60yPO8zbrdvNRE2vmvPOZ2cOAkt/bSiETDluj3FV8mLfVxq9RlhC6WckxG
         uL2oCZYfjBiUTb8jSJ9DAOgQwY5Pra8bnkJiT5HvV+hlPrEdX9Osxcur+1J0KtgmV6mo
         WUuo/KuXap+axUkIF6Pf3aq7Y2abFS5HJTeyUXiIAmqhKy2ke+fOT1+Aks2Z7REQPYei
         tl4CQOigh/CPJ9T4ACQZzaf9Mpr6wnZkPAg0C9+zaCToZJSwCH4hjcDr5Jhu2k0Uya6g
         XzSpWBlDQeMUWVvLF4QlsPYZz52SpfpvhhRDZOOs38vdEzWsPar9QEcmbeEIcNsKQhk2
         F2vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776984; x=1795381784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=TvYMImfu8QIzopaLY/MQ6iopWvDZ9IdYLKz2FSRfL/ZC21G68O8hrVsKRCw1ZJVyA+
         xSYIJlQnpyYl2Yh5OYxFtuST2EEXm9avttyJ/xVUY6mVJxrfWnXygMs9cVGbD2+D5gKL
         GNeGOe4cam4NQl6g5rDNHV17jUtzbicDsBRjoN6NBhpxXVn+05sMeA6fzJxORuHyczRk
         yJsPDzx73mN/RAlaPA2q1t1T+AGsn7QZsE6t4J4PE4jl4bjTR13c/h0lroVxIeSpQ8yD
         jkG247RJkI7W2J1fG2gQ/WZS0QHnk+c5rQR+qZHb1o2ZFzmECQiWqS/OrovXYhEuwqrO
         ow1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776984; x=1795381784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFm2AgWq3aMA2NgcD6hx5PZ2S4O3KE/xlXyx3feIpKw=;
        b=mDguaQ2vB0ZGkIDk/R+dkRWqqxMSXla6F0MYcaNJiyQjk73UCaLXVZG0XzCRoeKZf8
         8MV0qL0AVley4K8s7/47ndCEWfn9cAx3HDvXkpKiX2eEXaECljfb2JGuzBqx11YzpJxM
         WxEGwcKmnAC361YR0PO2KFqOv0Q7kOAHXBxZ9tbO0HVHoTvSm4UB03i19K3z4GLX1bE3
         yWhqPWx0V04wN1llw3sLETaJ+pEOzcYREGRhy9/CLo/JsOGMPEBTFcJMmQ2cv1Ip02Nt
         D3XAOuUTCjFzXuZ2Y9WRIl+l1edVJGj+lGsUYzCghKOq0eoDcQXSQBYCpAH5JMF9BuPA
         BUzQ==
X-Forwarded-Encrypted: i=1; AL+hErFdauUbWTPv7kkpNXbvNkSERkpI0wc+T5xqwJNDrRZAN55urCfCJtqTFq9CK259uvkE6rQ2OmzhMwoeKRTR@lists.infradead.org
X-Gm-Message-State: APuU4Z+kwKL1kMjUV91rAn9pnZ4BIw+jqRJjUHClPuvXr0p+XYkD7zy8
	9uFkhpn4ZEh0CeUHERBS86u3tnZ3KRNDN+EBIWT3znJlbAxQ0I2E1XEWSBszkvAsHo4NULutPuA
	TivaR7A4Sg05qs1kFKnIDtX44YxcYjeA=
X-Gm-Gg: AYBFou2EUePddOCl+bLwaj+Q2HMD9MRdttx+Nt6VaZ62J6OqrHEs18NksebBMrfklVi
	ncXRsBezAPtD94f9X7/NL8Y6UO8FkoqdzHKPiWzuJkrQ39zxiA/breYZdqIBJyxbeTq8lqM2Cbr
	BTrpQcg++zXdn4EoAX6G/CGNmv+HHZc65eyueC1VLSe0+65GZzBgKbjx6cElqFSjVA6LI8XKpC5
	8KFy2vRvXDZ99Wu3nkCiGHzSD+g9rfX2mun4onGC+YqV4bs+rkE7A5aSvv8ubg9RekAVx5F+rsc
	ydj0F0LAOnN3HyrkTV1IdUeco/CpKF56wrm0oaitBER9G4Vw7GSckMSRTHUQ/aL3NToXf/AoEne
	uFxU406KhRSioRT0xoJYRgfQ6OSnR7D5ytpVyBvi/4ZyHK1NvE8WtbXbKsep7ngsG7mDPGA==
X-Received: by 2002:a53:ac9a:0:b0:67c:cd5:f5aa with SMTP id
 956f58d0204a3-67d89731e46mr4496105d50.122.1794776984233; Sun, 15 Nov 2026
 13:09:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:09:33 +0100
X-Gm-Features: AclHuK_ZuEq6J89mo54PdzP1OnTq4mPljqW6aT-mLz76EZXNOrQC8XCfvE0QC_0
Message-ID: <CAFBinCDB93uLnY9V-tLt4n77Oh5keji=rwA-VNbHm6V8rkYkJA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_130945_664643_63F35FA4 
X-CRM114-Status: GOOD (  14.86  )
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

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEEgcmVjZW50IFNhc2hpa28gcmV2aWV3IFsxXSBvbiB0
aGlzIGNvZGUgcmV2ZWFsZWQgdGhlIGZvbGxvd2luZyBwcm9ibGVtOgo+Cj4gICBJZiBhIHVzZXIg
b3BlbnMgYm90aCBzdHJlYW1zIHNvIHNuZF9zb2NfZGFpX2FjdGl2ZShkYWkpIGV2YWx1YXRlcyB0
byAyLAo+ICAgYW5kIGV4cGxpY2l0bHkgY2FsbHMgU05EUlZfUENNX0lPQ1RMX0hXX0ZSRUUgYmVm
b3JlIGNsb3NpbmcgdGhlbSwKPiAgIHNuZF9zb2NfZGFpX2FjdGl2ZShkYWkpIHJlbWFpbnMgMi4g
VGhpcyBza2lwcyBkaXNhYmxpbmcgdGhlIGNsb2NrCj4gICBkaXZpZGVyLgo+ICAgV2hlbiB0aGUg
c3RyZWFtcyBhcmUgc3Vic2VxdWVudGx5IGNsb3NlZCwgdGhlIEFMU0EgY29yZSBza2lwcyBpbnZv
a2luZwo+ICAgaHdfZnJlZSBhZ2FpbiBiZWNhdXNlIHRoZSBzdGF0ZSB3YXMgYWxyZWFkeSBjaGFu
Z2VkIHRvCj4gICBTTkRSVl9QQ01fU1RBVEVfT1BFTi4gVGhpcyB3b3VsZCBsZWF2ZSB0aGUgY2xv
Y2sgZGl2aWRlciBwZXJtYW5lbnRseQo+ICAgZW5hYmxlZCwgcG90ZW50aWFsbHkgZHJhaW5pbmcg
YmF0dGVyeSBvciBibG9ja2luZyBzeXN0ZW0gc3VzcGVuZC4KPgo+IFRoaXMgY29tbWl0IHJlc29s
dmVzIHRoaXMgcHJvYmxlbSBieSB1c2luZyB0aGUgJ2Nsa19lbmFibGVkJyBmaWVsZCBvZgo+ICdz
dHJ1Y3QgZ3hfc3RyZWFtJy4gSW4gcGFydGljdWxhciB3aGVuICdod19mcmVlKCknIGlzIGNhbGxl
ZCBvbiBhIHN0cmVhbQo+IHRoZSBjb2RlIGNoZWNrIHdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGUg
b3RoZXIgc3RyZWFtIGFuZCB0aGVuIG9ubHkgaWYKPiBib3RoIGFyZSBvZmYgdGhlIGNsb2NrIGRp
dmlkZXIgaXMgZGlzYWJsZWQuCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDkxNzIxMjAxOS40RUNFNjFGMDA4OTNAc210cC5rZXJuZWwub3JnLwo+Cj4gU2lnbmVkLW9m
Zi1ieTogVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
