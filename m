Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF91CCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/Ai4HrIvAgqtJjDbZqhMDTKPaYHLdT02/Ra58JJUtI=; b=h0bo6HKk3XWgxY
	UPgswG94WsFKM3NZJFC5/WCBenoXRpgY3BfxzdWUzlp7P2QhaPJn8yvTa7W28p0aIYoAiJ//E58A2
	XY5irbN5dCqej8FeGo/vqRs35XCm28xZM7HXsCTVEI0Hpn6MdRN1dglvabkqnVSPYjp03qllqsqdr
	q2KDjz5TAUicoB5sWn64Wj8kN+wBCYxrr6VssSG3XuYbfviEaBi5YK0eQSj83ErTmI0RugDQJsIuO
	xaRVjS1XBWtI5ZQB1ua1D66j3retGJ3Efvfd9TdTWmMBKihyMoUxSfH/ZxDDwc31VCehbqea1/9Fo
	g0b1CBCMLl8vc5R9SopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stW4t-00000006EVa-0DLc;
	Wed, 25 Sep 2024 17:45:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stW02-00000006DQC-05J3;
	Wed, 25 Sep 2024 17:40:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2057835395aso426965ad.3;
        Wed, 25 Sep 2024 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727286025; x=1727890825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu6Ob4lIhoBnF+vdDQ/YY5vwteehRkNIa8XoxhggZNQ=;
        b=YpyT/SGCuH+QOB+U2a1sb8BRtm2dR1DRH1fGtYBHJh+XpjjWbngX4PYliIWQRAE/vj
         FPT/U/3yT+QjRgW3nw0JSG+ZouUZs9eMxoOmCleKy7/KRCju85l/qDSZdF9Pw9O4Pn+N
         fKzZNdtiqiMBUgGRdabx3rPGV25AvbPyAt4bRgmCGwUnOwpFkYwKBNud/Ncl78W9VCxR
         G26gj9OOW/v7l2PgHfB8kaWw08LzbUzHzlB9/A2xE44Tpvd4IalRr1ME/m2dFOBay7nd
         l8JXAkDCi8q+Coyf63ZOjw87vmqr4rcqJxNIZlYu/VlQ0vvXM7w/4+tPjWUQLGbZT8vB
         O4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286025; x=1727890825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu6Ob4lIhoBnF+vdDQ/YY5vwteehRkNIa8XoxhggZNQ=;
        b=BB3Byl6yqVQJrQZdpNWfQ4xjzjQr+V5IQTrwShZ8po2V/kffxMGonSjt6Mez8UfNOh
         pK4gcyJP0a4XURjVa5W/9bn+522R8Dq3vRVWstFJX8oQepITUCfJ9VBhKLUB+Kc8e8rN
         YIGl4+QZ+eOdf15PxVgdpjPAhXLR+kb+u4XN02DIg+aHehkJ5W+nDfDXoPWul0TMcYQy
         SUacWcRjWi4wnzqUWtz4t7l1EgSEfXBgHe5GcDWFo07oVOeHIYnnRt/JwTQO4YhavBDo
         2zT3ZV1qlbdGq9KBXgYPF/QU9kn1jtvKb2j8cCNCtyl5dsUqPB0Iq3KBRYehjpfIn5WL
         X37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs5vOOGgHyqzbwCF45Yxh32YE+lJWxpGrvfIrOxBAcxlhTJk6TPPgrbEp/Y6VuEMz99asWmXJ7fssluPuVodVOjQ==@lists.infradead.org, AJvYcCXu2EA0Q61vFzdJY0SyQVdbzqUAI/KcROaJo1sUDK+MnNJoiUCcQSRwfXZ1zRpOqVCvsi7+ejzYPlmGw9tD@lists.infradead.org
X-Gm-Message-State: AOJu0YzbPI1wDShZA1JwpPM26nrsd6bU2/z3HrymGC+gWvuWr1krJKp5
	6Pk90r4aPFuUdiWL7As7edCLRo4aW6xo+SQAUOkYm2Zvl24OWmmzOmPMwqGX0Z7uQXCwJRwc5gS
	DZqLrm3HpIiS/Y7NJvmnBKjM5DJE=
X-Google-Smtp-Source: AGHT+IEmtvARj4KtUmFt/OSibe+kwjSpppkVNlDqMZFxMwPHvTaAXOY0uVlb3cI5jpp03AjMDEIwGFC7XkDw4+/BHT8=
X-Received: by 2002:a17:903:1cf:b0:207:146f:b35a with SMTP id
 d9443c01a7336-20afc4c1877mr43755635ad.46.1727286025356; Wed, 25 Sep 2024
 10:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-1-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-1-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:40:14 +0200
Message-ID: <CAFBinCB+ZmjRbUyJ9+4SCkMyP_g45W7DvHV35AeiM1seo813og@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ARM: dts: amlogic: meson6: fix clk81 node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_104026_080858_3DED2A41 
X-CRM114-Status: UNSURE (   8.62  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIHByb3BlciBub2RlIG5hbWUs
IGZpeGluZzoKPiBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uNi1hdHYxMjAwLmR0Yjog
LzogY2xrQDA6ICdhbnlPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoK
PiAgICAgICAgICdyZWcnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICAgICAgICdyYW5nZXMn
IGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvcm9vdC1ub2RlLnlhbWwjCj4KPiBTaWduZWQtb2ZmLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
