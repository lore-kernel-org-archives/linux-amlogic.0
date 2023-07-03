Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314AAEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHqxdxQBmnXHrtxPqGThyiWWw+5WkJ8nhxF1NBcYQEw=; b=c3PR2FGAiE0ONM
	9eIBqzXxjTMffV2KclkrQfDMNtB3cVJ/vvN7xf+KRtZzFXEsoUjysJRAtvntlU9WT1ieqKW0M1/y+
	JAbOG9JSbGksY3h/taqMKAt3IVKJ8NSQivSBB3oVAU1MrAVR18Ybt5z9sqrRM4ubu1vkfopui9SCf
	vlfHEavvCDnvXADN0AjdNFNRj2KCPxySXV4bDOBJrjhJCFuOCoxRZiCptXvPTjoh/JKrshzwPC4lQ
	4ePXTa/tmd7G9dK8J1RMCkngJvRamulx+7HIFfLFIF5rmllIIxwIVGa45BGjhPrJhIJjBuGN1Ccuu
	pvHYs5fVvMKpRf77jF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7I-009ylw-2s;
	Mon, 03 Jul 2023 09:45:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7G-009yjc-03
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:45:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso35823145e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688377501; x=1690969501;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWRijkh1Cz7shs1vKxqe0+Zs7DVoINyukGAI1yjyh98=;
        b=zEJijkuwKNKpNjqksGIZlSAxW70/gyObVFg0GUnC7m4lBJ+Lg0AfxasdG39w1xA+hn
         RSFyob+aXfHL8qxITEZDI8M32O4fWeqGC7LvyO6O3ao1hpvbb5Z32s2LtoNxxgVmgp2r
         zwc9gmzCGRnVogReVfOIzhlStaAaBMUtez6EhICZa7aRw1t9rz4en2o5+rnXXCRLXH1z
         fR0xIbUap1SSwnM2kWB36Q+jwliXGxJh8yFBNDa/aQU9ew6qtvO5wM3B9EV0jTA5xIm9
         odfeHOwc4IkecenPDrHKJ4Adws4gh7qThsZMmikVp8Ls7VBHU4r/70mX6fnN8I+hPlb4
         LgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377501; x=1690969501;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWRijkh1Cz7shs1vKxqe0+Zs7DVoINyukGAI1yjyh98=;
        b=U6D49puibUstnKpl74xZg/XM1tGY6LuMVJPqJgziSqo886qbvcSl/Vzj8dGSVGhwYM
         /T+D1uhTiNJ7NCkvSquscK+L5EQUAQGvj06GVSj8+0CeJ+OUKWX/2LWA/3N3iNfELXNc
         eMQm8i4wkcQG9bn4Ex3EXk4AMyEHXwSM0EHWTQU5XB6EPqDzyPZ6hWe8s3tOqb+CF9j+
         ACALhev7tAFdB0gIIIzKN+Fhd79FcD5dsCNcxnVka+oewfe7R9Ic84jMeCxKNtIEv+Sz
         MhEkNgKUzWNdzIr2i9EqkVD8poixvaaUlx2/xaBjiHOWae049ZLe9zLLHGr3OAsCdcPx
         18AQ==
X-Gm-Message-State: AC+VfDxUeCOnqFAU4tjwd2X7047W6zvOELp8rdCG3H9oTJ7FxkA+mgfS
	c6f2HetFiDz3QYM68tnfQxrSDA==
X-Google-Smtp-Source: ACHHUZ6ZtFY37tY6pT1zUZzqmiG5cyIFC7oVykZP9ABODyv8PakLWqRyvRQngHCYivyFbNw9XuRhNA==
X-Received: by 2002:a05:600c:2259:b0:3f7:aee8:c23a with SMTP id a25-20020a05600c225900b003f7aee8c23amr12700275wmm.19.1688377501390;
        Mon, 03 Jul 2023 02:45:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbb346279dsm13805286wmd.38.2023.07.03.02.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 02:45:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Lucas Tanure <tanure@linux.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230629073419.207886-1-tanure@linux.com>
References: <20230629073419.207886-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v7 0/4] Add Amlogic A311D2 and Khadas Vim4
 Board Support
Message-Id: <168837750049.1068586.16885145268136151183.b4-ty@linaro.org>
Date: Mon, 03 Jul 2023 11:45:00 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024506_054646_4BC0D715 
X-CRM114-Status: GOOD (  11.24  )
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

On Thu, 29 Jun 2023 08:34:15 +0100, Lucas Tanure wrote:
> The Khadas VIM4 uses the Amlogic A311D2 SoC, based on the Amlogic T7 family.
> This chip is not the same as A311D used in Vim3 board.
> 
> Work based on Khadas 5.4 branch:
> https://github.com/khadas/linux/tree/khadas-vims-5.4.y
> 
> The current status is Vim4 board booting to emergency shell via uart.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/4] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
      https://git.kernel.org/amlogic/c/19f1263230b6c665d950d63290de6648ed81e0a9
[4/4] arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree
      https://git.kernel.org/amlogic/c/419b6066cf1ff2a5f29edf565d5ece55fceb4230

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
