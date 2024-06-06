Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06421C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRkqK6/gBhFFUUsPrVYRZUBlFw4QfLTTnr0/Dblikq0=; b=sl4Zjtt+VSuSGg
	WALrvjjqHEX3+ajk6Kx3doUk3WnZKuv5D0ZtRYKzmDFk+QHMCzkpv8IaPG0tyrKqnuT7umSad7J6h
	rVvsdIA67Afcy4Q9tZ/82wVakVCjI9Ee2fN35Y6QRJdB3kXuMEkqYTqOEdhezMx+gUNUxsveXgn4z
	LqLlxCNV8HNjaCVq/0AZjg5G0SG+XUfy6OR3ybPrQ3Lz4xH8HLo+yUqZm4lliPtN1+9pETQhG/7mD
	6SPEmNVlv4tq2XtR1u8QMi+X7B5fECbXIyPi/ixjJWSPOQEuXIi/2Lawt+diLCxc/Kd2OVFJLOE+Q
	XjXmAyj5t00jDDhRSegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Bp-000000093zB-1IBx;
	Thu, 06 Jun 2024 09:13:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Bi-000000093su-19rO
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:13:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42155e7084cso7723535e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665216; x=1718270016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7hiDQFRdRBFfKeqxCjHkLufjUfT0buj2+w6oCqBN/o=;
        b=n+DMwKOBjkhfcIJi7nQW6NGCwD3P2EDx9b8b20YKG71cTlFoyzm1DEfC6oGIXJ0SBF
         guf3whmRgOi7bNckrJgZVWWXi2zCWXELzFypiV2TmuG4arXp09JY5AT+OYtU0RaXVvyf
         iEb44OK8kJ8Jbrtr012DCeMkAcV+u9q74yUSmZhYcE8P0kXIlfMLE448eTZBxBnHrfEd
         0InMWKqDQNiLd02lNEsDN2n9FLrnS2h83RTfZcpG5edYJhrf9kGlCHEkYOwWYJs2jaRp
         w5+HNH3swXR/GeTpPm+M1mcYz7irOMlEiDs/CaIo7gHbKL2yWt+cpIx2C82+D95ArRj2
         qLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665216; x=1718270016;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7hiDQFRdRBFfKeqxCjHkLufjUfT0buj2+w6oCqBN/o=;
        b=cQZZxo1B10jl/tHY+jwabgkbRKUhqeqZCyBv+pcaeRqp3ujuwkEW2i41UrEuaaeQ9s
         pHvDIzv84Vgo0v/6L1XY2La4LBVUmG1H+2ZEpFTFqNn5z9uQjxk8VY5hGhqxWCCyzdN4
         e+JuauIcZoyKNhRDZl90DTmQQRZ3tbo+jiWb3bqu5TyZRYsjNW/xAmXjI0tieNcTJ1Cj
         1kPMo80yAlOxXxfeYjppablpMcHEgKLA5u6xMGVvmOnmFiMFUDzdFw5v75wErfrGs18d
         OwQ0iX7xDnQlHPVYZemt+B9c2mwwqIdgiFopcdHpR2mEonzDtM+/ha8TvdhNTU+hL4Wm
         P7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUrg34V3tyxueGTgHyhJve3a/tCxubveBcoPxXjrV38nJsj69Eab/ZG9Agybcg58Z5PWaRwcCDUrn76EaDaKqeSBvoyPrSFmNuiRSBErFB56l8=
X-Gm-Message-State: AOJu0YwxQDKXve6Pn4RfHMVJ11hElcFl2l/p8thU7XREZw3YnJYaEs8U
	nLfqdMbv9pFoSm1vdBAdcFCF8PzdTSSKgzCE6LzZ08UAaDdnjI3+jHytP/rdzR4=
X-Google-Smtp-Source: AGHT+IHtyCwh9CmHAU8WBlcMrLbk+Z5UM643qQi3c42FsuzxsDGC7SvGqqn2rUSLfqFXsl549PS0sQ==
X-Received: by 2002:a05:600c:45c8:b0:420:d54:7003 with SMTP id 5b1f17b1804b1-421562de063mr35200745e9.20.1717665216650;
        Thu, 06 Jun 2024 02:13:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2a544bsm15038175e9.21.2024.06.06.02.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:13:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Viacheslav Bocharov <adeep@lexina.in>
In-Reply-To: <20240604140612.1179323-1-adeep@lexina.in>
References: <20240604140612.1179323-1-adeep@lexina.in>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: add new A113X SoC id
Message-Id: <171766521601.3911648.2220702176918701226.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:13:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_021338_538936_222D786E 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, 04 Jun 2024 17:04:51 +0300, Viacheslav Bocharov wrote:
> Add new definition for Amlogix A113X SoC found in JetHub D1/D1+ devices:
> 
> soc soc0: Amlogic Meson AXG (A113X) Revision 25:b (43:2) Detected
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/drivers)

[1/1] soc: amlogic: meson-gx-socinfo: add new A113X SoC id
      https://git.kernel.org/amlogic/c/2faaab64de0e89697e01f1a0c5d401ea74d52447

These changes has been applied on the intermediate git tree [1].

The v6.11/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
