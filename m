Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34341C27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1ZK+7RoRKRV7XxMUvTUMiBk+c9gMCCHrMDMKOqXDzs=; b=L0c2brNbrg245d
	dTSPiyDUmdqkqOOpMUGREwom/2Oza9Qbh1lb+UqXt2kycMbBTa8m/SegRVrsGhjyJgO+x/bSueLtP
	SaT3GQ9CTlp/EwQfKFLcJUJU18lCD2vPiolbQuzIF82KD6xBPxymdH8BI70QqZiEKkCtSprBGFmK8
	4814ioP8NPzt8yW0drb0CCVa3P6Gxi1suJgBV/4VHv66tW7HWpHBw5Rmpog1zezuXWwcJa9X9D0xi
	W8CpTMaYBGTYpPrBlIfPwuLlpK8wpFL3RE566MbY7MnFYV556d632FI87SWTxg3tNYyTWxR0naWyy
	ULHsmikmgzPbrmhZznOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnPG-00000005VCt-0OJo;
	Wed, 05 Jun 2024 09:58:10 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEnPB-00000005V9N-2sUj
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:58:07 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dfac121b6a6so624100276.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717581483; x=1718186283; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5mAYD1Avt8pq2XcOOEM7xebLX9m2RKKIBoR9HWmP6lo=;
        b=uV3iyvb5x4oD6bWev1dwwe3HTCOV1TVqD4DhatdSuH84hqvWhnlxssWQPRShq8WHLY
         8LJJEOJgj3YbDr6PEgH5xuIGAclAaIyu16QHPnj25+h8ObWT6cVsIomt8ihWLZF7B2W5
         yrx+nb2WWOOUXVoE6OWzkD028S5v7MsrFzOBAGc+mMLPVzpKcpA4RZ6hfWtTeileYkMS
         BfQ3880pJbSyv4J+WuAjzo9ES5yuomKyo7W5fC0yUaCAzyLVg4iRgWmzWccRsMCGuEsE
         PtGqIi6a8QieS+Uk/RBdwsi4kM8UnViWql3AmQbzDCcsnsbY50uEAsjaicTU75h3llx8
         4sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717581483; x=1718186283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mAYD1Avt8pq2XcOOEM7xebLX9m2RKKIBoR9HWmP6lo=;
        b=uTfPf+TK5CI6WQbthxRqtZy/Eb6yEX2UtlkqiyjXjTqvuvhX2RMYlqWfL1hdp3aSv2
         /wj2LRTdEABWxrmdMe0Qnb1AN1MlWCSUaEx2l1EusRL0N3E5HjoR7tQZu36KN0qYIsSo
         vuUMqTvFPGCs0LErUQhjJMUIWuhkDE0opjroTd4huyktUwu+qKWmklaKsQCOAw5kvvsa
         so120vJ+uuFxe/WTDQ599+CwLaTYOLGYamruZLlEhmJxoW0x3YxQFWRybsgB/A5oQPxJ
         e2zpdzkOtAV126qfqqHCugVXsX9A7gmKChpR/dKJR478vCRI4XFkYMLVLRXpnIycEbwy
         00uw==
X-Forwarded-Encrypted: i=1; AJvYcCUbORbG8D8levy/TMbb9SZxzOB42v3k6xLUtmCSeVc0SqiuxnEO22zJFpyWwXIUE3MQWKmDB20Tp2f+9PNo5+D/up/3P3RDt9P8EeX7m+bor8k=
X-Gm-Message-State: AOJu0YzghnobRlnorAoo49EXfgp0tzrFWZ63/0VW/zqXzvZ8+rvMYAJ5
	zv437w8o3ki5pkX+cXlXzUUmGWu27rvZOq6/BCjgo0Hzn1shNqzeQJQCw0lkpZXtXlN8ghRr8Pe
	/X+TA6IbBuCrNZMU6NuVhgxiSFL2OAqJrezWqvA==
X-Google-Smtp-Source: AGHT+IF2R/aghDc5IVYeX1rVhBtT3A6VAsaeguTPhS6sYRA62wpiuZD2zzzvBra0tS6pu+Cqh5RE9zZsadl70OemW/g=
X-Received: by 2002:a25:b88:0:b0:de5:8427:d66f with SMTP id
 3f1490d57ef6-dfac96febfemr1772988276.4.1717581482636; Wed, 05 Jun 2024
 02:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
In-Reply-To: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Jun 2024 11:57:26 +0200
Message-ID: <CAPDyKFo-V4aNKWQn2r61_Q5d9R2Lhj8d5Ri_b-zW7VMsVBHARw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Power: A4: add power domain driver
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_025805_925702_2696DB38 
X-CRM114-Status: GOOD (  11.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 29 May 2024 at 05:10, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic A4 SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v2:
> - dts: Move power-controller node to be a child of secure-monitor.
> - dts: Include power head file.
> - Link to v1: https://lore.kernel.org/r/20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com
>
> ---
> Xianwei Zhao (3):
>       dt-bindings: power: add Amlogic A4 power domains
>       pmdomain: amlogic: Add support for A4 power domains controller
>       arm64: dts: amlogic: a4: add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 10 ++++++++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++++++
>  include/dt-bindings/power/amlogic,a4-pwrc.h        | 21 ++++++++++++++++
>  4 files changed, 60 insertions(+)
> ---

Patch 1 and 2 applied for next, thanks!

Note that the DT patch (patch1) is also available on the immutable dt branch.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
