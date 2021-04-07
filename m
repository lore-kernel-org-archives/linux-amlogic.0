Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD366C43460
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:18:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5908761260
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5908761260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aaPIL5i4cnl+e36rnDnOm/2cT1aKodZJC2xLjFfH8dw=; b=eelw9UQMcMlHaeCZQ4VI54U54
	reOah2xlYNOoArzgqmVySBSF2rk9vPjSY4K27N/+gtd7FN4vs6177fWdzSyhAZnWTd+Tdwgi+YgRy
	HnSsDkTQRh3iSSYyPPr2IRr/2Yuu7+95b7+GGIOxL+htAcKnrHT3AyjJDiXSINgP9Rzwzq8d8d7JO
	F9j50sOF+bnAHQr4kOHXjosLSzZ2weQraqMjjPEksbAgAIaFGrvoD1cHeR0qN26G/+69eYbc0qFrz
	I3QZY+yZ4lvGDRxNskaDciD5dwXl6jiENrBPFOTKUmAeXDqgZAvuiWJzIZD4KH+V0ri7j1PSNI4ly
	JW4tE3/5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAsN-005RDB-El; Wed, 07 Apr 2021 16:17:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAs7-005R9t-1v
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 16:17:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id b17so9783831pgh.7
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Apr 2021 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5sD1KlKL6NAnii2NS6zkOfpdYsLdAUo/LvqCAHs1nNo=;
 b=TV/8kyuwv6Q823GyE5cYC37jhXDpseW1gp6Hg13zwlM1j4ZTuoCjeGhm46uQo4SBVt
 I/MVnOEFgZP/rO3grbKEpjlOZhARUh5y2fnfLkw/tVKmS6BdySq2aS3hsge9YB6oGFz2
 TkW3RFw56uY1frS4SN1SriL/kz0pWmj+8vi9QS4Cb2VkxXNJo+xFGxW934CUOhwr5N/E
 u1mqbyRA7GlKB+xL0YcpLfW6F+alXQ12RmQjcZwkZoAijHSEI8TBokJd485wvuIweuus
 CLQ3Rg6YKWfOM20Jsbf0IYPXEWpm+gmendmoiNpdXil24/ZHTfWlQx88q7vYHtxoH12J
 ljOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sD1KlKL6NAnii2NS6zkOfpdYsLdAUo/LvqCAHs1nNo=;
 b=dk8rA4KHOV3qvQSoroC9rvYRZdV3K41/bbKUC5UwND2C/OuJvySmnhr1pal2qAChFy
 waofwstaipcaG3GRGLjeBNzM0r6DxUSvxNCSr242vorHJwQOM4f6LmbqNR53mR76ieys
 HFXP18cRhLqukWR458b/W4MI8L+vUeeUhPHtSvZkpFdTwmfhbsvnu2i2iQs3F6+ym51A
 oJikF7ZWEZV79RIL9nRVDb7F0esI1diftMjrGWvxOYwDYdleqSg7/EPKQOG6HVqTszy0
 tBA3kOHs3HIOW1dx9ttYcv8dnYVypHMEH666dPxyCdF2Btub43aAeNylZrdzSZGg09Dh
 yNgA==
X-Gm-Message-State: AOAM530aomoJTsltBaDdhRzEfsVxuDqe/FXKDytPVVZAChWx6TuFjMb6
 DwxCWZs1dG4Kr2wZewKgIiRKqw==
X-Google-Smtp-Source: ABdhPJyauxOAKJWC5ozcJeVms8NkDT3FDTFrUBz5vGNLUWx8mAFiWf2HhkDwdQX6643m3TV7klOMPw==
X-Received: by 2002:a63:d242:: with SMTP id t2mr3968380pgi.431.1617812247023; 
 Wed, 07 Apr 2021 09:17:27 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m195sm3009559pfd.99.2021.04.07.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 09:17:26 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: add support for MeCool
 KII-Pro/KIII-Pro
Date: Wed,  7 Apr 2021 09:17:24 -0700
Message-Id: <161781223327.25927.15332865097812413350.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402064521.30579-1-christianshewitt@gmail.com>
References: <20210402064521.30579-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_171739_701689_BFFBFE85 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, 2 Apr 2021 06:45:18 +0000, Christian Hewitt wrote:
> This series adds support for the MeCool (Videostrong) KII Pro (GXL)
> and KIII Pro (GXM) Android STB devices. These are quite popular due
> to the embedded multi-standard tuner card (which is sadly not-yet
> supported in the kernel). Both devices closely follow the Amlogic
> reference designs with keys/buttons/LED details taken from known-
> working vendor kernel device-trees.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
      commit: 0bbfea7c0469cbe0914c1800b70f607ed7638870
[2/3] arm64: dts: meson: add initial device-tree for MeCool KII Pro
      commit: d5454e7ce24a28bd22beb2fc02f1571b5748dfbb
[3/3] arm64: dts: meson: add initial device-tree for MeCool KIII Pro
      commit: 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
