Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D659C36002
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Apr 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHyOUcdCUlnT6cXnp6MARGPxPs4FeilhStvlWGJOwb0=; b=xDQsEk2tfmOQTc
	sr0broxxKNfvG7vkLRcxaZgnz1Sb8EWTyQbiHwjXzisT5T5S9J2GCkYF/NPyB5w3UosDje6t8zuFG
	rnfa9kOLuFsa60tQXERCNR6CjADAGq5ri+YX6YihvjsqIOSRLzDINtPjDYD7VH7Zrh7wHtnejoEn/
	hGt/4kH/eZDjMeI1/nm2E0KQ3UefQ104pGKyY00nbI3IH3is3asDjx3hleMNqz0e1Ec9ul+RIvA0Z
	rzs+Psq0xZJ+1NioHsRF5T5ns5UV9+QCwYfLhggciT0SmyJi4KbX6/Et39R4jvIfmFubVvnu0IkGy
	XUw5ajAPm/IBKX/D2P0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WgK-0000000FmUh-3oje;
	Sun, 06 Apr 2025 20:33:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WeW-0000000FmM4-02lF;
	Sun, 06 Apr 2025 20:31:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22409077c06so45057985ad.1;
        Sun, 06 Apr 2025 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971495; x=1744576295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JgDkSkEEcDLTsZdbQJiXeVweECmbECSQZoVfGZG0Ts=;
        b=NDR/aZrngw5aR04IHLAkINC1bgA2F/3zFq1tcDL7oWd2gQURpVDz+pNJhKFWDJutFa
         VuHqYM5Ta4hTVUWSa+th6dXr2igo167aYnysr1wu4Htx3mAdwBKY4Qw+ZicpLIdFb00e
         JCtBipmO+pR1ZzozzNCc1jok7Jj9YCAwblXq/nvDtMlqIWIw5ETST/mdxF/HL+kOLq1a
         dTZ4I3O3oaRO0xicVUXmBghhULlEmt3tjiI5/5fW70C6knNnHwjEzZKSecu93NsYlEpu
         EgnktFUy4a8C+i+9W6m7qab/nvCDR4eAeaoFsqFENZ6/kAVN+LY4/EJgZaJ0My2HJ4b/
         /9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971495; x=1744576295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JgDkSkEEcDLTsZdbQJiXeVweECmbECSQZoVfGZG0Ts=;
        b=GOSpfQg1DPKnCMge6Xa5fwpQHjdpD9RbTrDPK2bnrDYMCo8nSbpp34nb4euTT1lRdk
         oxxYDofaA8qj8NZFdhV0miw5QrEyYrkn1UXc/gdXS5gs7iHRBzLnn4mVtX0GP6/B0sEJ
         btHH5nZyecaJLJ90WQEyabJUAZTGKNmuZbNDvTM8I+orM4Tgr3+gthdxW87oGLIkQsBT
         nZa3DFTto3Ll9OOgC7sdUti4XHpXuyhg5JPfTf51jBNlNbPxkVn0FQjvLI4ZLt2MS+26
         jEfDVPGjggKSgzAqDuRraKVnyl5JdJm7u1th7OccBBXzJsKQHcKnV0A2ZDo/jgjpCyX4
         cyAg==
X-Forwarded-Encrypted: i=1; AJvYcCUwOyBzoKjt7+BvMBjpZcSUZTRGJ0CSiOUSD6mlr2exYdJzilhcWBIOVsq8MOkoRZLpJYANk2JReHN8Dn3Y@lists.infradead.org, AJvYcCX7m/S93Pu5xmsAf15wWUNH+2TvhMH2BGH9MG/7i7D+7psYlZQIaYZLFitkqr0btqTXdpXZeUsj7MW8HidQFa8YFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNVQs/Jfkm3l+D9gn/X1LvvqQMum4Mk11CV+HQx5UQxFyGJja+
	cbWkKzJViz7H4LMQzjGaStSIiV4KuEYG6+IshV1Fv5eeAgE5Ft4xhfbLWZArnSzvDdh11Dumi8f
	DipXwzm9oK/ZBV3Ae7yZ6xyRTq3g=
X-Gm-Gg: ASbGnctGjbeL9WbhNvNpdCjRdW+br/7AekYaqXDjxFxsOPaEGDwd6XfnlTLbPZIuior
	bZ7fjk201CRU0w6WY/7D4x7GWEYNHe8vagKa7Ffh3cnJv7R2YcWwFfaAwJVZ1ZxraFdLSqs1OjX
	uf6FT/DEilb47iZ93bpZPez8+8S+hzVSf6HYBo/P90
X-Google-Smtp-Source: AGHT+IExK3rgstJKKKtoG9Q+crnhTsYrlTj7SKtkXlz2UX4GnZK54G+TsdpXNABvaY1e4/m9JtjPFbBfqcIQ/eTpRDo=
X-Received: by 2002:a17:90b:5448:b0:2f6:be57:49d2 with SMTP id
 98e67ed59e1d1-306a6179aa1mr15876246a91.17.1743971494658; Sun, 06 Apr 2025
 13:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:23 +0200
X-Gm-Features: ATxdqUE1UrOGrlQFeIQJTFzofnatItzhBtfjuCm7JYGAi3H-c4k4SlKtOVMPYWc
Message-ID: <CAFBinCDkH8dMUpzbHy2kM6ZtUOfjRmHQzHxSMFeZeSNzjivG-Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: meson: Do not enable MESON_SM by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133136_157272_2AB6812A 
X-CRM114-Status: UNSURE (   6.35  )
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

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCAyOjM54oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEVuYWJsaW5nIHRoZSBjb21w
aWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0aWMgZW5hYmxpbmcgb2YgYWxsCj4gZHJp
dmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
