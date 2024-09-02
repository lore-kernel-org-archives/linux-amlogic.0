Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194E9CD13CF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RybfYEv4RXH3Iv+D0G/xjlg1+ijBbQeakRT5mWEmN6c=; b=EwltB6KkI68zVK
	nOHB4ns3FdAs6I0rUH7l9vMmTZc4i6BCHJMQNCticpy/NRaNozG+HQJejqV2V6Xj71LJrm/vIdVdx
	DGWyevwDp5yfLyrR1oFRb6LiIPSwS6xptO6h7EuIcSxXPKv7dynMNvO2L5+0ZbDTZKZPgv+BG9gS1
	IfbZcBaDcg+t+ALSAGO+X4tFpYqcQfqmURPD0rojtO73eFSjjJ8KmtFzmWg4MaULgEkdyTI9vkyUU
	Ivfrohf7k95PdJCPFD0H4kA4UEypgBaqszki1wyOndFFWCxjM3L+TDebZDnOFrmCLh6LKkzKTWfCF
	a6xrPkaKy/mr1VI2NE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2Xy-0000000DXlM-15kh;
	Mon, 02 Sep 2024 08:36:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2W8-0000000DXBQ-3FR7
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 08:34:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so16504925e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Sep 2024 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725266071; x=1725870871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTtz4aJ6WOg0pDCld3WKbgJIlmwIlok5mPiJNkSVlqI=;
        b=kuoLn4mSlvB0nYgB5MO3MSllw/ejZr6zZe1HMagBFyB2KOYSk3xoHlXWTu1moCae+p
         +mXMXg3lBUO3Ba1/AaPe28jBlZEpr7pzNsOBesO2ZdaD1MfoAGoDK9tPtHdkGCKYAq7W
         0G+4I9Wccu1DsLJkSLmHo+JC8oPB4mtvco4nqSGXWjzmO8MQ0g8bZ4zwUvTVUhw7pn/4
         XTJ1RNSX0TVZusOSc0S3Ccwa2mYIIu2WPkv/FjIOUVFakSJHcoCEHoUdJwDFT1rsY38t
         8Sr6jYLuGIpI10NPEoxDLTCA6z76RA12dfVAVaw+eAneAlIXBwE3OWJp4YDFV4EDFNea
         IL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266071; x=1725870871;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTtz4aJ6WOg0pDCld3WKbgJIlmwIlok5mPiJNkSVlqI=;
        b=J4MDF/3lJh2CKo6M044lLKrnfvI2iWZ+hsdVcb4dTO7VP8yF4AGQlhWn2Br+RbIWNq
         wgkJuUz17bs78g0nVDcCgcZ8IC+rzREL18CpRiVZSD33RL+R6rYAs9bsHCkqg18aD6Nr
         XoH40u6sv9lRBxNcrTauuDO3xxn6B7rA3RWjTbTsvjmOPRfWrc32C30lza7fF1k+mE0m
         v4wh9KOJakk8pjgvvgX9Jq47+qL3VkfCeK4XlXxCG1RW3y7so3N9wPjmFWGIOiqG3QK7
         7FT/vJzWoNnDjtM4t1hAfVI6pReSEcNTTBRM4ewKisPp4XmP7MoBm2WHFatWMWgMj+IB
         I9OA==
X-Forwarded-Encrypted: i=1; AJvYcCUbbzS0DVrGf5PVrwYWDPPuW7v2MIujzaIqFkhfK0R0ZlC1q+FcEEhvfb2/Qpd4a1EQ0368bWd6OA1u4gkR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx9AFT3Bht3t34IxMtpJeVjazog0XV/fQtJFMO9AhE3n1KribY
	2QFw6OmITfcAga/jTpRRdqN9PZquSp2+EuecbqSSTgkt1c5rT6fLjh4yU0wtOi8=
X-Google-Smtp-Source: AGHT+IEW/pesy5OKJ0IGSRRTNmo3lQ2HG8HktgHM07V8Q3+5V8e1ooBtP7Edf8e8UGZ5iZ6agRXHgQ==
X-Received: by 2002:adf:f4cb:0:b0:374:c03e:22d4 with SMTP id ffacd0b85a97d-374c03e253cmr3159185f8f.1.1725266070437;
        Mon, 02 Sep 2024 01:34:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bfbfc7b7sm5807456f8f.88.2024.09.02.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 01:34:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: dt-bindings:
 amlogic-sound-cards: document clocks property
Message-Id: <172526606951.2176850.4026983419764013991.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 10:34:29 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_013432_820833_3952EFDB 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, 28 Aug 2024 15:53:53 +0200, Neil Armstrong wrote:
> Following an off-list discution with Jerome about fixing the following
> DTBs check errors:
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>     sound: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[3/3] arm64: dts: amlogic: add clock and clock-names to sound cards
      https://git.kernel.org/amlogic/c/9b5d25117985e51faf61a808c4b3e15432d55f85

These changes has been applied on the intermediate git tree [1].

The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
