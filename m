Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD41C76195
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifQIzZKWCdID/oypYbL2BtyVVyvYNAflQIhkm2Kbrco=; b=l0fFHmeISnqCa5
	DRekYmXri8GoxRhxltoUz2lqTzinx/ECWO1MHLCtyJFG0KB/oz0bDk82UQyLqQ/5Rc+fWoZqrstRR
	b/Ac3pLeqGRkf8Bd0QO4dIXj+ro+Y0VdoaUkNLkl9ue9J4aV5xxrDALJfLjT89si/nZ5k/Nk9ndXD
	ODRsvKPRa7W2ws7VRjMZEa+zZRKv1TS1dQ2tohcr6i2cP/lLoRFBJKk+zuMIXkfe7J2ED+93BqhTi
	9jM4G9fEDUezp5BXZDLeDwAK81S3Aq4FLMrT3ODP0HVDbuOisvn4bRIY8YTJoI9ECJMidysfIZAiy
	+/pAEbqslnf0B9kxT/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph461-00DWkI-02;
	Tue, 28 Mar 2023 07:50:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph45y-00DWiv-1e
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 07:50:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id n19so6363522wms.0
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Mar 2023 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679989809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SChvSSb/SRcsLKxwF2svsDucGRCoUm07182sZYmBoNM=;
        b=oj5Mdf2jkdk5NhG/RmJvDPSKUWbt8I4xdd/RR3JnfnBFAx3J54bf7VzK2Y3pw0NswH
         rU5AYkv8jYtKHoTGF3ySrsJHBEf2OpbTlflgeXDOexiD2gH456ytvZ9C6TBZlmxtIkyH
         7l+lh7abddcsUUj2tryK4rGg06QVfcOk9TvygRKfMXOX6IIGfhYPTCp9Cu7J6o1EBd4e
         040ae/MRjkjLB6ZxeUbVt7a0inP8xsoesHZIuRqbHc0LAYNeQzNEFNZlJ/UdpfdUzmBl
         dVVCbbNSwl9L1TbrGRFc6ithCohZzunH7YAy+fK+7R3yffRNmYq47+FyhBD4OCLRqWQ9
         UFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679989809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SChvSSb/SRcsLKxwF2svsDucGRCoUm07182sZYmBoNM=;
        b=uso6dmVtai947Q5NnjihvDLFCuNLuTFDj3GgYkCxMrzcEm/I8pKuRbuMciaNl94Mn7
         YbUI6zfxlwNesmlqFhR0XWzQS+3inPaQXRkcwiPsysRXI5fMfMU8bGyxEQBu9DOxqvBm
         w3++2twHbYoV2dKxRpcUpNSgewp2zOAdZkwI8AWrMzw5OhzrPcG6VLcdcB3YqKoPtAZt
         P1UCKZZ5EMINkNucdu70LKyTgXVoapdFQxkfYodUKQs3+XDCQSe7aDbX2OuxPjIIScEk
         FEUrW1hqv9mHtsn3f541IkGDgtYEA5qvQ7dpxbrJteLgjy2FB0+3Cawts1Lx2dhWFApO
         Vi/Q==
X-Gm-Message-State: AO0yUKVtDgQbxjVstIoecrKcMzNRn4hSZ5fseiMh+67ML4e3vKYoHn53
	JKZGRgZbgqTY7XoFbD4ufe7VLSyQ4vZGhVr+r+9rw5gm
X-Google-Smtp-Source: AK7set/L/mW1tAj1qo5ca5xnWMQ4csh1yJ7NP0m5e6IY+5PLNs11lRdHsi5Y6cgsmIrZinxOjMKR6g==
X-Received: by 2002:a05:600c:22d4:b0:3ed:b56c:9496 with SMTP id 20-20020a05600c22d400b003edb56c9496mr11274673wmg.31.1679989809280;
        Tue, 28 Mar 2023 00:50:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm26827310wru.67.2023.03.28.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 00:50:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230327170222.4107746-1-robh@kernel.org>
References: <20230327170222.4107746-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: amlogic: Drop unneeded quotes
Message-Id: <167998980857.903588.15028659186028325608.b4-ty@linaro.org>
Date: Tue, 28 Mar 2023 09:50:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_005018_552181_E13D057F 
X-CRM114-Status: GOOD (  10.16  )
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

On Mon, 27 Mar 2023 12:02:22 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[1/1] dt-bindings: soc: amlogic: Drop unneeded quotes
      https://git.kernel.org/amlogic/c/1b61fdfdd656b3940cff24c25c211777389174b0

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
