Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB41C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BG//aSUaHswe1KHHx2TID0RyYZMlm2/QGQuMeI9U5IM=; b=Kpn3KIUfvOiPd4
	T00O1ozdCb19XJBMKPd/9llY5e+y21ROZTdsT2OtbpsMehjw+My5vLtw9DhBSzK2GjsVn3dQ1/Mu4
	FoCJ2n3xUGL4OgRUT/ZPhF82PNDtsgcfL9/RYqM6wCllyUgPrpb11tf6zQIqi8PYIES+uld9mO74j
	62FIQ82UCYWXSHGrNl64cVQWt8xg7Y8ntRq8Gpy/2HFYcT5ahd7Sr5HFBAuJCG5761cr3ldIt4fqc
	/aXhNQkJ7i5jMoOAMeaOWMh0bI371a6GxhSgzxXXdZlbnJSKaTOehMQkRh5GxitOuJWWQCnO4VKIA
	7to43j4OdUrRQ9bsa8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HdW-00Gmlz-1G;
	Wed, 31 May 2023 08:56:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HdU-00GmfD-1B
	for linux-amlogic@lists.infradead.org;
	Wed, 31 May 2023 08:56:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so553882f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 31 May 2023 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523404; x=1688115404;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exzz6pAeE8UvoElYgU8je4n0hY+uXNzHEMLEFlVL23o=;
        b=fGhNTIeXBBRs2kumWzyzJepFEZ4JgIPKU7lkqJTxf4R5QFfcKfhMI/ujsekrCiPVWx
         D9Pc9aD/Coo3KK4G0R1OK8phLndB7GD0B0zajNlxQBoFarKb2MYyu7jA4I0X462DtXGu
         92Mg5Ig12pPOGY9u0NOF8l7A68EwfHxnxOra5j2/GRIAxXj15c2LzuGnQLqF9NAw9qaY
         Y2KYmMHjV/KM8jMjeIE5sztS6ZObz+xJ6e9qBd4Wun9Johcg3rxOeEcKQiClAUCDWBe2
         qzCTX/2on0n2AY/Pp8xyt5NKkLJ5na+ieaV2FJva8z/ygN6+s4WCn4e7vUL/CGJOuNT3
         cRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523404; x=1688115404;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exzz6pAeE8UvoElYgU8je4n0hY+uXNzHEMLEFlVL23o=;
        b=GblKRbp/zS43INCIkSR7d/W9jIdwGVn8fPY430dSTAdN0pjUYCp9HAe0bWZKs5aX1l
         l/kXAXlENju2+yWi0g+Kd50MWa6dSzt6MMclcLaMtUCuBTLdnaBqOtgTzgXFH2BiyTAz
         7EzR9G9K0N4cEn5BcuWd5Gs5pVhE89u9qJgNS1oPOyDRSiT/ZfKuZIEdqJ4FcgFtzBI1
         xeCY+us3sKUAxKDcq1WO0Ng4h34N1IiL75DPFK2R05x+X6kLBwtgZLMzWrfrBcJ+r9kI
         QQagVVxtrt9o81GamQ5qAokV60RJy8N43WTZ3AGqWwaH0MuDxi8/Ji80kCeBAtY/T0vz
         FUNg==
X-Gm-Message-State: AC+VfDztSnrq0oERtB/FlCZ6A8pdjmj9obb7eUx5LfrAKl0J9FkxNf2s
	FDuTjwbLMENB1aoFp2pxuJ/C0Q==
X-Google-Smtp-Source: ACHHUZ6UuXtxDIm/fOFuqamiq5/YRQFeSq1dyqtPf0kIc9s9Of0DFxwhdnZ+zYh3NZx626Dfyp1H/A==
X-Received: by 2002:a5d:6ac3:0:b0:30a:ebdb:908c with SMTP id u3-20020a5d6ac3000000b0030aebdb908cmr3755201wrw.16.1685523404537;
        Wed, 31 May 2023 01:56:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x2-20020adff0c2000000b0030af20aaa3fsm6050551wro.71.2023.05.31.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:56:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans-Frieder Vogt <hfdevel@gmx.net>
In-Reply-To: <20230516203029.1031174-1-martin.blumenstingl@googlemail.com>
References: <20230516203029.1031174-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3] ARM: dts: meson8: correct uart_B and uart_C clock
 references
Message-Id: <168552340376.1980576.16108743746787991413.b4-ty@linaro.org>
Date: Wed, 31 May 2023 10:56:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_015652_414864_91FEFBEE 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, 16 May 2023 22:30:29 +0200, Martin Blumenstingl wrote:
> On Meson8 uart_B and uart_C do not work, because they are relying on
> incorrect clocks. Change the references of pclk to the correct CLKID
> (UART1 for uart_B and UART2 for uart_C), to allow use of the two uarts.
> 
> This was originally reported by Hans-Frieder Vogt for Meson8b [0], but
> the same bug is also present in meson8.dtsi
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/arm-dt)

[1/1] ARM: dts: meson8: correct uart_B and uart_C clock references
      https://git.kernel.org/amlogic/c/98b503c7fb13a17a47d8ebf15fa8f7c10118e75c

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
