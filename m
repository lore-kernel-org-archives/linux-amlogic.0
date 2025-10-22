Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D30FCCD1BE
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Oct 2025 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ztt2VpKTNHDBW82xJGxeJoWS9GB6dyZaRR2C3FJtog=; b=MXsN3FL4AAaqv3
	fVCz5JuG9xIirWJR6d0gThE5460UQd8YTk3P0id72owh/lOOcqqwG7WccsXIPOxoFjpISCWLxKHyg
	BXdXS3ourypYB/KtTOAm+06P/fysmScZrumOcDf51/hWq7iq8FpiE3XMgk98Reo+CoXdn50dNEiZ3
	Rxkid5ai4ArbBB+qQDHSjTGp9k8ZllYw2XOe7XanwO2zSl74awlToajkhmAaeMFej+9iVkmedfkTD
	3gABZE8/QnuFkQQ2yFveuxohiywEaD2qKoVN9XgJ/fApazJYpLVPCsN3+ZAbTgi7YMUslUalvPzZa
	IOXrxX2Y66XVRjbQodQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT2U-00000001pQH-3NVk;
	Wed, 22 Oct 2025 07:13:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBT2R-00000001pPM-39wp
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Oct 2025 07:13:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-471131d6121so49210945e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Oct 2025 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761117218; x=1761722018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqMreim9nAYer1KCbouUlT+cwbSr2tN/sZopAV8oBn4=;
        b=guOVZ8Yn4HjBEu+d0GDVVxdt+igGOHDH+XTbaLN0EptfLPZ+JZukMbrSOSbIbPTAd2
         zyGrHHKnyHtdUi0oPmlGVVPr/aPbKTkwa/GRKRs7tUVlmBrYpSNfDe/PIJd8n2kuWXb2
         XR86MyxvBejXb4FKIBR3oeuSuN5MGiZiko3DeT6DWeQitRtIq71mENfCOZk1rLZ6fSA/
         9rDNFE/jtyxKaH/oyAUDAo72WFY/nbdhlRKHYhzdzkjtD14j6YEveuBM4XCpm2V8wNar
         TepV7HQqQLOs/SBKRvgWBb8ATHoaLGRmQ+0rm1oSChtTe4XGXKCDsDYn6NmGa/AYkaf8
         s2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117218; x=1761722018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqMreim9nAYer1KCbouUlT+cwbSr2tN/sZopAV8oBn4=;
        b=Y1VlLSwQYpL7284Kmqv7D8WIKNXaUx0q66TA2FcqZHO0qWN0ZBNnD63RCveLeX05IM
         8qeUp6Dccc7oyFvk+8CGIFBkeqO7AeynTzs2ZS/awW4wn6jlrk7S6mZZqyDdlNE3cM3U
         3JMOPTZmxO0qU5YH7aHA7dpyMAHrUGBtKiQOOQaBKAG3bfxqcUTYacDTVFnaxMFB23DC
         wCg1ABowvBqCDzC0RXh9z82AvwFimRHwyihMSSzrBjw7QYvO8nl3lD5dRHEIYr3GbmKy
         vg1IVIrpQFfbiqEo1jDnJBaupJ9qDXtYxCOB3bfG2X+2Us3Dlbjp0XqHTu9NX/v8WSIk
         gpBg==
X-Forwarded-Encrypted: i=1; AJvYcCVoP9jzIuNvm9ovppNeSUFACck1x+gnmB25XLsccwahqKU+/iHVj7BvY35NfzpawaqXyMuuKrx8IhBDcSaT@lists.infradead.org
X-Gm-Message-State: AOJu0YwvvU4finV2NwuhJGy/UDdxzrFaSog4QeGmMX938u69/bQLKSEF
	ZZ0en/IHkvNTuWNJDw9BRubAaFbEPnr14GiQi5sR0bb4tX+Fly0xSwx9QH6Qg2wkwoY=
X-Gm-Gg: ASbGnctZJO8h27ntgI3Q5gnIyCTtvX/EqED3Th7/TtCE+Puy1nZBgMBPVIkoSK9wjo8
	CVUaqqx7PVu6CoBMPJgeeCZjCVm9NDGLkDcmthCDq3kN+UCi5zbdC3H1Qj0IT/JGRjt5p1DEyO1
	Xzat88MyPLtBVUU9uVgnpigzt5NBS0qIvzyQBq1EBV+Rc1sYFWr4JX6MVrSx6VdRIrCamB8nwZU
	90sQoLaFrWz2skLeqqt21X2uoqlpTpR/Y0bc2PecKYBqwGflGNF1GqVUgjW10zQW7zFPCZu8kFb
	vwyim0fUFrNwhgssBxMjaDObqGqULaK7JaBbeVgKY19xfAqR3/VCuQN761JZ6HvdvmDDyMRyw+Z
	gbC5dtXnBrimqIRHAdvWAIvxixskaXwPwj9Fz1O4fqAjXhzubCOewY0SL9PqaBYe0PTNCBy0OCH
	RVanTqETm8MhL9R+jplhp9
X-Google-Smtp-Source: AGHT+IFrToHcy6QNjmKjXvKbtPCmRCoAalFEfH2Sz994Kb8x9DVcmCsK+N+zANuRJUkEATjH9AeXLw==
X-Received: by 2002:a05:600c:670a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-471179017f3mr128014945e9.21.1761117217823;
        Wed, 22 Oct 2025 00:13:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427c3casm29428155e9.4.2025.10.22.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:13:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251022-a5-pinctrl-node-v4-1-a71911852c4b@amlogic.com>
References: <20251022-a5-pinctrl-node-v4-1-a71911852c4b@amlogic.com>
Subject: Re: [PATCH v4] dts: arm64: amlogic: add a5 pinctrl node
Message-Id: <176111721718.2414958.3337470167774710768.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 09:13:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_001339_815262_A9675EEF 
X-CRM114-Status: UNSURE (   9.11  )
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

On Wed, 22 Oct 2025 13:04:48 +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A5.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] dts: arm64: amlogic: add a5 pinctrl node
      https://git.kernel.org/amlogic/c/a8b41683186d1465c06aabfee6e66ae0bb29f5fe

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
