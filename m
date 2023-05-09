Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E06C77B7C
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 May 2023 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBQrvl0tMW/W9qM4KzX/GDsIEHDjwmpMUIylVtLUUb4=; b=A0SbxurXrnWqIF
	rSZ7Flw+JFeZeBbmYFF5u2R2ooPXZlFuIcZ1IfbemE3jD0UConEdqshcHDRrzR2ZrX0wiwgvOBzk9
	04caYBumobbS5xbA6rgE/b0HJowJHTnLkSCYAW02dReXGETxz1g2SA9T7AWVbfzqyPY9iRAGlkIGk
	XbUSkIslbafc/jaE2PIImp9Sj5uG+7htWcanGClpsyLMD9rHmKdw3iF8Q8DFEoO5EEer3m0HPWAc+
	zP+GxIBzQ6ejyix6J184ThSzYYhJ5cPTgjhlgRzZm4s05sKP3d4XSmjkOP+5wd2jL5LiZ455aNgQs
	i8OmdLyvc0o3ec49AbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwI3j-002Y7v-2i;
	Tue, 09 May 2023 07:46:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwI3g-002Y4R-1y
	for linux-amlogic@lists.infradead.org;
	Tue, 09 May 2023 07:46:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30626f4d74aso3432881f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 May 2023 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683618409; x=1686210409;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1iixLC9RX2qMWRpDfnEL3lMWKjk7W8OVMFDuz9hQ0s=;
        b=uDkUjjVOVU02sBKBne8xf0xR+N3JdspRULIu+uZoG013Jg6PvO8rTqm8LaAiMUR2RQ
         Rq/hxS+6502gWRo9fk1PR/vayt9qGNU+MNHrRfcmJ12inVGK/Uk8GGJPal5QzQHKJI39
         CX3eKzufst1ktiypBZHbHMeIf2R9h6XpFo2iSRH/Bq6z4xV0WTzrUjCfueXdCMvd1N7a
         mKItASdxjvZmbpA7PXuUQ+aYc0GYrhGarMCaG2PRD9hB378YMnS+y9KEs8X7i97OMlwM
         rElZjDRca4RuXh47Y/uAVmvZJ7BTdmCbJBEP97pqhVdHxBLCDAY2urJ3tz0KLQKasWcP
         EPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618409; x=1686210409;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1iixLC9RX2qMWRpDfnEL3lMWKjk7W8OVMFDuz9hQ0s=;
        b=iriA6CR6WjXVJvW+dzTi9UIxkJi3FlxY+Wxd/XGdnvwLf8Jn1cMMitreMl0quuc+z6
         sKK67Zt2jKh+ivAUMgjxNR8YADCNjHxRmIo1rmjHBiY3jhRhaoWdzICqDOy6IR0PZL2n
         6jPjw1jkZSmRl9dHC5i9NwqqwA76fsazpbtDUc2q1PLjBJL5ldO2kpqfFmCrJsZO1NBq
         qPDoMb7lQkm91x0mC29RMj6pewVKtsTKButbfM0w5SIZY/yPiWlLb/9PY8Lfm13A9ANf
         hAV20vwMZ3pUnyZKL5reIzR74I4zEAOnW7iDhLfhCP21cZpaaCMKt6SVUL5tE586MTjQ
         c9rA==
X-Gm-Message-State: AC+VfDxOPZzcirLioQIOWSiNIvqdSHQTkkdKUs9HOCjOAAv8CmtBW2+N
	USe/j6imVy/8mrIoTcZWBYvFaA==
X-Google-Smtp-Source: ACHHUZ5e8xCoGLYdKisfc9zZhJ3RhRhQsMhlp48C893h0J6BiBCK1oelOxCx/F7OgroHp3uvLsWbHw==
X-Received: by 2002:a5d:444e:0:b0:306:2c59:3838 with SMTP id x14-20020a5d444e000000b003062c593838mr9593954wrr.44.1683618408864;
        Tue, 09 May 2023 00:46:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q23-20020a7bce97000000b003f42d2f4531sm61501wmj.48.2023.05.09.00.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:46:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, hfdevel@gmx.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55>
References: <trinity-bf20bcb9-790b-4ab9-99e3-0831ef8257f4-1680878185420@3c-app-gmx-bap55>
Subject: Re: [PATCH v2] ARM: dts: meson8b: correct uart_B and uart_C clock
 references
Message-Id: <168361840805.3267296.10834531895749908992.b4-ty@linaro.org>
Date: Tue, 09 May 2023 09:46:48 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_004652_650835_C54CC864 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, 07 Apr 2023 16:36:25 +0200, hfdevel@gmx.net wrote:
> With the current device tree for meson8b, uarts B (e.g. available on pins
> 8/10 on Odroid-C1) and C (pins 3/5 on Odroid-C1) do not work, because they
> are relying on incorrect clocks. Change the references of pclk to the
> correct CLKID, to allow use of the two uarts.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/arm-dt)

[1/1] ARM: dts: meson8b: correct uart_B and uart_C clock references
      https://git.kernel.org/amlogic/c/d542ce8d4769cdef6a7bc3437e59cfed9c68f0e4

These changes has been applied on the intermediate git tree [1].

The v6.5/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
