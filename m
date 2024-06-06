Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF80C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDmHggBtAe4GU4cFR4nVN2gMBETpOKhbPoNMi15pVJA=; b=tII1fGJGAPkvoU
	JqXpEgqKwXCKOzU76/Z+5QhjGLl/JcZXd6nFCAkIpstA4ShnIPBHGRbJrvRHqRfa7n19J/+4V0BGS
	Trc2FEShbRe/aDw/IiG2D6x/bLIg0lh6kKDxCJPeGIi4U2stjVq/eaQblJRoZye2nYb7KyBvtG/de
	AjdtaZ5sLc/pmzt5f4m5idu3xT4RQTRHESvBupTS8CbG6UuphgdGsJzw83PSBkZ78fxDpREyDm7nd
	AV1Vw+NfN4J4dDTLTsd/ZJaBwr2URli8HwMfUG6Y9m8csF7xQCzMpximdzjHYVXs98PRpXiBGcWUw
	Ke/6bDlp+jVhusBvXt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BY-000000093mg-3h4T;
	Thu, 06 Jun 2024 09:13:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9BU-000000093j8-3ftv
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:13:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso816333f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665203; x=1718270003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rV+wPIak8jDJVIln2KU5nBsAQyEDveq8MoQL7f6Gpw=;
        b=MlEJSWOwfsZRGNjmr+h7orRBAwa/Eqhlz9qRrq5vdT1BhN3WPWw1Z2EDMat2WzgOeX
         4GLrbk0Mr8LoBGA0aXxZSgOxn8XrfeCHa6+lSnPsoQtZBJbs0FO33cQwkMni8w3BSKx1
         Fai8eVrJuGX2sCgp5oxpgBGWtLTlt0kNsGmUh9jsFp9/ZE8YLPcJhky93XQI4xCNjKji
         gqSUVweWoHLKrcKGptnK0+i7eH1pAWjBgfONVISeOBV4UQgtA4H7y7cI2uZM8Pm+HQ19
         g3wcZlk/40fmoQGG79o6XnawubbXQ1fohN/dXfEQCVzYVDNQaDkZhjyhTYYTlHwIPz/f
         r11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665203; x=1718270003;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rV+wPIak8jDJVIln2KU5nBsAQyEDveq8MoQL7f6Gpw=;
        b=ZKCxac8miNfNVpQTQ8Goif/ZUw1FkcIAL39SbZ1gsaJBEk1bzl/EcWi7i8oyLy9FcK
         ynuNKN9zkyrRrIKz2GHMPUaj7UUJpycQFrOSzxx5xNTF+i5RPt8XPNnSN4pPWDF3rqD5
         1jDvidJLF/OyYj22Ghe2mJN6lWKGiM4onR7JvSbiQHI7/hpH4PogCsIpx0F48bdaKgp8
         HTgAgS92F8yjTn/grS+EUMhBAy8v1CA0Sd+JNKCsPx/vW6fEcS6rL1RJxyk1Rp7sJS9I
         76+VKvBVaTXIsugor9n8GqCtdYaaH/1j5xVyA/anm7VC9mhK0KsIffcdOM/aMY04aUVL
         D87g==
X-Forwarded-Encrypted: i=1; AJvYcCXI02F4duncmE6a8lYf/PzJAHx0Qtn3iJUa6BNSbFYJIBifuwVMm/jIBivptoZirht/Gg1RPwUTl+9iOhcy/tKfiWReig65ooGsnsdEPy1+ujE=
X-Gm-Message-State: AOJu0YyNa9WOz/wb3SW04wJbQhelMPUr6eHuIEoSZ5yKf3Vb4RoDIt0d
	xumeDD0QV3Z9j1kaFkaxwer3g4tNl1in1IN4bJ5KSkhodovBIr8qLC9R9Pso1QA=
X-Google-Smtp-Source: AGHT+IENoBRX9GZB8aiNkmV7wcMdCnCEvVTAjFXuir5TAL6BESM6I1wWByFMmTrTiJi75bRLz3bAJg==
X-Received: by 2002:a5d:5f8f:0:b0:355:2212:45fd with SMTP id ffacd0b85a97d-35e8ef7ea42mr4942853f8f.46.1717665203266;
        Thu, 06 Jun 2024 02:13:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d66d01sm1027407f8f.50.2024.06.06.02.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:13:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Yuntian Zhang <yt@radxa.com>
In-Reply-To: <20240606090615.3946433-1-christianshewitt@gmail.com>
References: <20240606090615.3946433-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson: radxa-zero2: add pwm-fan support
Message-Id: <171766520246.3911343.18150781840775151395.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:13:22 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_021324_948550_6832430E 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, 06 Jun 2024 09:06:15 +0000, Christian Hewitt wrote:
> The A311D on Zero2 needs active cooling and the board includes a header to
> connect a simple fan. Add pwm-fan support with basic thermal properties so
> the fan runs when connected.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: meson: radxa-zero2: add pwm-fan support
      https://git.kernel.org/amlogic/c/1d1239a1b0e502faffe43b97d530232285b9f061

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
