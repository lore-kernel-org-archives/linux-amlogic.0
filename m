Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9022C2D0E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:36:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649722080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jd12lOp3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XLVJN4sT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649722080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEEDBaNZsKrP4QD++sWh1y2FexKEG902dT+9yAZylkg=; b=Jd12lOp3EAPceZRPXyMZ18iE9
	CzRzQRfvru40FVX1cypdCu1nA7sTelLH0cbEL1hwacpEz/xz1aVrCeZxHrM4B2X143onYCGxwixoj
	mwG5dMcAZPt3jmmLmClBPs+Ay17SnF6uLSIP8DPSuTPkUjgBWCRiHWResSTk9sHX2qt7sFpHtB8+R
	8SOwi7uknp4jTOzx5z3jIK3FnSYNSvhLyWFtw5IK93Mv3Sg1viW+CIs0fNYHIP84V1TPPfYZX82QG
	G87Dd91RVOj8PAtHG7PYs10YyZkOQ1cHEFO3tlzEa/kKpUp6YLPbRc4cM+E/B6OGcuIk+ZtQ7jPuk
	v0LJ6/UMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGkB-0001Yt-1y; Tue, 15 Sep 2020 19:35:59 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGk8-0001Xf-6F; Tue, 15 Sep 2020 19:35:56 +0000
Received: by mail-ed1-x542.google.com with SMTP id e22so4214876edq.6;
 Tue, 15 Sep 2020 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w5DZX3eWvSoTmXVB42kPw0noPkujBlH+pDQ/FSsc/aU=;
 b=XLVJN4sTxaKStlkogEKqSBimD3s2VkE4DJj7bCKcgQvdDvr/v7YXkYisST8KKwh4B9
 hJ5NrAHVqRTIlSJE17cQdHhB6+TqDfaklrZUL3W51F+6vTFn9bcvMoQD5ghqELgV52V9
 k2z95lgSh2lNsDnFd4ULZWmRm1VI2idoOfGHAqiJDRBe3mkmREvDg8PlahBnnf5Bh3pq
 e7Tkz6YDfZ+9AUivVJkpox2bgz3uD9O67AKVAuxZxGQvDLIl4MtLw/TXBhHTEIHx+MlP
 5ERHtG8RLvLwxqbfJbSOo/TFp77kEmHm89KR1GEEuyOUhBdJDaFv/FJBRO8wkHUnFahS
 Yg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5DZX3eWvSoTmXVB42kPw0noPkujBlH+pDQ/FSsc/aU=;
 b=AcVo5UJD79Aywphaeca8vVlb8TUHNoqAYgE9edJetVoN0A8dKM2B03INkUsS/sOVEO
 lXojEn7bjT3VIXHXakTvuKAN6RBH3EuyCQzix1rLbNxwQcHVdK/g7yHKukDcgFxf/5rl
 XqFNneDWLEfmNmMf7/py9I+QFmAIAe4YAIKEwtSBqCiE36m2ODPSqn1kQ/fnI+nT2ZhR
 PVDQYYg73VwfLUiC0HgGOHmKmdgwUIA5H+kQVR3bS7ba4BgbNl5X82Aw+diz2OvYQlJo
 wYG+JG9igOYPlI+eDWIibTXbPovRJb2bxDAL+No+4uLZZu4XshGJwethOWC+3u0lBini
 C96Q==
X-Gm-Message-State: AOAM531+i0owUZhelxqenzo0u0+cwNQHyOYvDju+ipPyH1KrrdwrH3Fe
 3M6GaSv3AS6abDzkQBC/r1WlTozpptcc0xEhGLw=
X-Google-Smtp-Source: ABdhPJxiIi9JX5OzGcYW437my9UEkoilSioerQxNoy4e4v1R4QhmFSBQoACqmJA+TVlfnhOxlJFIHDIMBSuMURy+5W8=
X-Received: by 2002:a50:fb98:: with SMTP id e24mr23683587edq.130.1600198554625; 
 Tue, 15 Sep 2020 12:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200915152432.30616-1-narmstrong@baylibre.com>
In-Reply-To: <20200915152432.30616-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:35:43 +0200
Message-ID: <CAFBinCBk050aCFC6hzgaYZB219jdAdEE1djzwCpU6iQGR4CAnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: add support for ODROID-N2+
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_153556_240224_C2549D12 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tobetter@hardkernel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 5:25 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> Christian Hewitt (3):
>   arm64: dts: meson: convert ODROID-N2 to dtsi
>   dt-bindings: arm: amlogic: add support for the ODROID-N2+
>   arm64: dts: meson: add support for the ODROID-N2+
for all three: thank you and
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
