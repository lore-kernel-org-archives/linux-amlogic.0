Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F052C77B7C
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 May 2023 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwVzUwAWB9JeL3hPrv+9pAMOu7QjGBvIZYvK13SlglI=; b=q71lS99R3xKJcf
	41RqNd3LZ0ov8TTSqWZ3HJ/KixaNpko5KBgCZ6euu39GtOtVU71jZXeLS/AY+lj6OeCTDRHWuruDO
	dRE4dMTt50TA3TehdNNOs5V9nREaGGToy/X8EhaQRX1TkeYnOr+t5KqJos4IN8H/O8LWOVDBLDykp
	qmrk+sHi8+h66lR3ymY9yiBqLr4pbWDKsvuhWBeKy0117KPgEVPEiG4k87LILO3+ImF8ZelX8kT6w
	xHesiSuuXgjgf3yHz1CjWSdsybUoQTbBa07ItH/iSmUtGG6m3jItw9F2yN7Q/taiGhqmI2pNxxzSn
	jcqgJ+KTchwHG+BjhQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwI3b-002Y3A-0V;
	Tue, 09 May 2023 07:46:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwI3X-002Y0U-2h
	for linux-amlogic@lists.infradead.org;
	Tue, 09 May 2023 07:46:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3062db220a3so3485053f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 May 2023 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683618398; x=1686210398;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TO2dRWQUgsejGnEeiYjVEtc/c2PN3FQf9RX/Sai4Z0U=;
        b=f0URIniH7B6XUsWL6muAGhjMQxBfGB4Uea4xGg5JShehqLBBmndI+Kicr6eiV2qT56
         JpOL/knVUaEtLxp8IDvnEMsNrmIv+sGpG0D+2AUGva76gS5skgt3yX7es8jSCr8T0djn
         x7TDpB8V6E0FzG7Fx3QQ2fR3tBCLWezRT5Qg59+Se1Vkg9skGICSop9WBhpowvnP93dF
         rmyqdg32UjzMHoTyFqNs//5TFX81w7cYTK9yykm3AepUpTMB4kHtiX+d6JFgNdChx3g+
         4t0H18JaT29josdXHu0MIPtbyWmUPHLCLI8JAdyYAyw63vW+3xfCepX+v0IKrWfYi+eZ
         aIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618398; x=1686210398;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO2dRWQUgsejGnEeiYjVEtc/c2PN3FQf9RX/Sai4Z0U=;
        b=hy13MpCs5HfTfttU5bNmwG7wd25Nr4TANm1BCOspkfuttSna1aVu9FxcfNUY9wZH4u
         5hT2i6B4WxtkCoM8Ixi0pNhQjElRtLHXe3Rk2Pg0DwrHwnefYez6pi8Oui9c5XvLVSBl
         YiPdIL5XpyqzXE07rNdk2BSrorRkmXQulEKWKkIi0BB1VslBwBPz0LRdEAown0salm9e
         tTRK2vT6f3BhQbCLUDxgXL3AdP3xAaInXqkmnZEpdzyRcFqK4Y5EF39th8Htwe4zR5Ln
         yatKrhN3uY5IaEUm/i5OEecoCO/N6oHj4HXZwCNH+xuNcWm3RO0dOJHwDzmefhDKVLhB
         vNig==
X-Gm-Message-State: AC+VfDyzb3Eg2RseJuS3/UWLSi0QXbHiibUqhjabCrF8h1f+uuGU13Xp
	0kh8JF9Tv2cprbRwG2qKRm6YyA1oWE/1eSyh1r3F0A==
X-Google-Smtp-Source: ACHHUZ7aKsNY8fHHLZ6UNl48B49PuAWVAgcEjJqUMww88nPdrrdixglqG21tYw77OS4xPT7Nv/5fdQ==
X-Received: by 2002:adf:fac9:0:b0:306:41d3:fca8 with SMTP id a9-20020adffac9000000b0030641d3fca8mr9133279wrs.69.1683618398463;
        Tue, 09 May 2023 00:46:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a15-20020adff7cf000000b002f6176cc6desm13505140wrq.110.2023.05.09.00.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:46:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421223211.115612-1-krzysztof.kozlowski@linaro.org>
References: <20230421223211.115612-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: add missing cache properties
Message-Id: <168361839771.3267036.7271499670705452140.b4-ty@linaro.org>
Date: Tue, 09 May 2023 09:46:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_004643_878104_1BDC6828 
X-CRM114-Status: GOOD (  10.42  )
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

On Sat, 22 Apr 2023 00:32:10 +0200, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified properties to fix warnings like:
> 
>   meson-a1-ad401.dtb: l2-cache0: 'cache-unified' is a required property
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/arm64-dt)

[1/1] arm64: dts: amlogic: add missing cache properties
      https://git.kernel.org/amlogic/c/c2258a94fae556797085b58c0b6839c41826bd3d

These changes has been applied on the intermediate git tree [1].

The v6.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
