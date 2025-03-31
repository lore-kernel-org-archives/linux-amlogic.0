Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79B9C36018
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2q5sXcj27Pi6m4+C1eFBcoHYzaF9OrIsV8luGYu6/x8=; b=FQ1OYN/CIu5M7+
	C6oKXLAUMZBrSLGnteyqfQLQErn9hv59BB1uNYstJ7Uem3ZYOF1vLBSBDPgAKcXGP2uSeI4z8qqke
	iVZC87D16ygIgjI6qssENJiG+0eNR2/LqF1tH0FTGSYNPe/BQOXwZtxZGn8X2spPR3rzrtAUeQEd+
	W7RxcR8kG2f2do4dUZLUX0t5VDGoYdeAqdi7zMnSMKq7b5P/Y1FiLLA7YagHnmNLeV4Zb5+FXYR3f
	H89hMKDZodQ/jjiDs8wS1GwLKgWp0Sn7moNNCD9JqblmLN5lZuqOXQetVGwFKW586zC3s8K2Y0s8k
	etabChfJrr6a9TZYNZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Bv-0000000H9rG-1DGn;
	Mon, 31 Mar 2025 07:04:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz99T-0000000H9Ux-2D4o
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 07:01:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3525273f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Mar 2025 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743404502; x=1744009302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaZet+achYItbJKpiG/xx1boWkF1GMxAKa+bQtO4ts4=;
        b=NcK1hr7ojFh8ASO2/8RFcAHls1YeBN4O0m+svIyxBcLbGqZVLZsKBd14tKrKxVX5JH
         dOskF2lePlXRTLrCS3iwh4nA4K22uNXc9Pwp4vY3nehKhEhnBx1vKqkmfP1blaQmxCce
         qmXhlYEV9srGoE52Esd923l6/f4H1kQTQ+ZHLfa49j8zAL16rUkX7cQbE4OXG1RE3F08
         FM+Z65nKUuT75L2ysyJEUfIA9jWdTpLnJnfoZO2ShHH8dBUi3wS43/AgLXENQpghrcz0
         deLvoA3M0Lifqf12IECe6gpWINLU+FHC/yKjipqiLdBGb1qsNPu9su+BuX1EPEEVLFEW
         M1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743404502; x=1744009302;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaZet+achYItbJKpiG/xx1boWkF1GMxAKa+bQtO4ts4=;
        b=Nb9eU2NjYoFQgTlHApyklWvDM9CkYC6Ft5/1oaj23Y8UeNMZvUSNDAf2ocqHyhcAkt
         qD0HVbKuF+N672qCzipG2S4Rn5jvw3H6IXT30Ugys0xjjpMNa71KmTcMBJfDKQVs7mcL
         njKFSZTsfhkyW0RzBNRR5CgJv/eIhaW4V5t9gJBbQgRsx3JxDK+vHL9STPW27lUp1PbS
         mbf6unXSOpgiy69HcSN/kJWPXhM94k39YhDM25bRROgh9YCJvXMOmdYpYnkkM/RO/per
         7eO4Y7cAEUIJuiFs0UXTXr0kCbnBSk92iN+G7TWDy19oUSpdA8Ge6TzFIkK+00VqHSGV
         bRYg==
X-Forwarded-Encrypted: i=1; AJvYcCX0sx8mwSH/gYHjQNZoib1fESYD9LIgH2zndFrhvD3ALzhvE9f28RuW200Q4YOhsrFKBv6G1oEBAQkPXsyk@lists.infradead.org
X-Gm-Message-State: AOJu0YwaE+9m65HTuMFBC9D91qD64ziXekCzSljURxJ6Lr1iffD9JIrQ
	F7BCK0MtsLoKJmGMo05S6IBNmBbIDjSiPprWLTKw//odKW+bx+E4Cfy32FIrSjI=
X-Gm-Gg: ASbGncswyatNTyWvz61ASpKS/GnpAK8PlMN/3m+afuoNhMTMtNWMqFYHI0crbugPI8V
	VjqxfEPhogu3OIGM8W2UgxF42N6UEQSW0cHOIeh1TbahxRRlKpSJFTi0DijPrQ2+tC3mZObKfrS
	lXDoy9pwuDbUgJU1XcYUNEDCMYIRL/yKKSmjQ9kDKyatyrO1bSFMVsvF0asqPRExFpYlHuy5IEe
	ZkAq0ZdijsXb+ZgufIMjBpIZrT1+AL/lKa6KdSMjBJ4nvAVBOl+SSN2IViizhj2lCRgLSHqotPK
	QoR4aBUoT5fbmx7rbw9pxCRPsG9tEyU6eCPVHUAJy8dsOdEE476npnAweSKeD9mcgg==
X-Google-Smtp-Source: AGHT+IHddxB5k0FnXCNZBeNjRDemX9kB1JsqOq32EQuLUtsmc+/DgPdv1Z5DHh144VpkY69PlzIWUQ==
X-Received: by 2002:a05:6000:420d:b0:391:2e31:c7e1 with SMTP id ffacd0b85a97d-39c120c8df3mr5450139f8f.4.1743404501733;
        Mon, 31 Mar 2025 00:01:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm158442325e9.10.2025.03.31.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:01:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc
 compatible
Message-Id: <174340450091.221709.5889306683742068023.b4-ty@linaro.org>
Date: Mon, 31 Mar 2025 09:01:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000143_568064_98D56572 
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

On Sun, 30 Mar 2025 14:32:54 +0000, Christian Hewitt wrote:
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
      https://git.kernel.org/amlogic/c/cb99bb034123ef8b8dd533fc4c42164b049515a2

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
