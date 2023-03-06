Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E6EC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eGymXNO15gFSbVDVgVbxUx03zunwSWFN63RMA02BqA=; b=uTo2fhXG57vcXh
	MzrhUGMOnqB6kU6/7ehvgL7EPAaK969V72uimHRENanrNcp2gvjTW4fLL98moPcAaFX5hfKFizDe9
	WlT5S/UNqrM+wmKj0P7wkgu/+RVDfCAofgEIqPraJQzfQdHL5WGJVWLAmlk3xYub733JnfSPxWAeL
	AZ91YptogGTrf4u5aW9ytSf/F2aEgOGxPM9QF9SVMu8DxxPhyYAvrPrLDnt1OKT0fwrrDD1Qb2Urt
	X/svLuHtP/62EeMYGrJcY3gHI/aMVR6FcGJOJxfAskL3Ks63uuUkExoeM0XCS3x1Ue4yrDPKd9ZEE
	lVQ0HYTFaxEjDRvCsgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ70a-00C3se-0S; Mon, 06 Mar 2023 09:19:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ70V-00C3qr-UR
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 09:19:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l1so7992560wry.12
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 01:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTmNLGYu5Mcu9P2jNHBIhC8Wi04M9rJBLk23XMtTHVY=;
        b=CmkBs+vWBlDaCqs84t52YAjZMnusZpu95a2vLlP42QmVjEgTR2gS56anHe4kAmzUxa
         7wfejXFKjA1tstajkNkVzhvJoLwT4xHqmPqazFwbEq6rkWW+R7ZRaHKNNWlJDLc7Qt8u
         9U8wHQybDDyDDj981o37ScOd7XKI/l1cluI1kjMOoGPscG4r6sa+8E++vz1bEcZGd3KE
         nympXTGHNVAbkptz4Z6vU4fiNEgegs1632HCTLz+wD7mH6XGc/Mh3WHDzNGi2vkCl6mL
         Kmq/skKEqbwc+0yTNwlbra0ZophJnPDiuArflOcXqOJC13Ss3GVEo7t0RZqwqSTf0ZvG
         C9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094385;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTmNLGYu5Mcu9P2jNHBIhC8Wi04M9rJBLk23XMtTHVY=;
        b=LNv/g9RbiX5Nk/7UHPZzfjhRIp1AA8klGYfgpCMz5iCJKChvSUN1a2lDe3VDFO2duB
         iK6yK4+CLWL/HknrPSgWboSN142VMc6je3+DZWs8MGWXeZjZukqdhYlNRixq+mD4ntq5
         5tLG6sfcCKLeAs6viuR1OvWTc623xqxHxfe4sUrrqXnehu8JW0mRTcLRCTWO1Doglmoo
         xqdjmkyYG9UUAPhE0mjSZmHjq6aRHe/+CKTq/nZft2VHqsVP5XJQxp7sAfREiGAOOpMi
         hiZl5mxEbur9OEAPqAw0AWDQRPc44WK75r82okg8Zz5driAbvV+kZd5vBnVHHVaJJx70
         UGKA==
X-Gm-Message-State: AO0yUKXetTO9Rw0a763xrrCw+cWzt2yIOomsQ7bkbhTFZ9QUN/h7vTlE
	q/zdwrHAtKLJgCxCAnVfvUxz1A==
X-Google-Smtp-Source: AK7set8LhmIS/Ewr0ABinGsnVv0gYSTQkOzX04VwMgU2SuXX1uxXZJQqh0ye5JCeOBKU0KFVlm1N+w==
X-Received: by 2002:adf:e908:0:b0:2c3:e0a0:93f with SMTP id f8-20020adfe908000000b002c3e0a0093fmr6170846wrm.8.1678094385375;
        Mon, 06 Mar 2023 01:19:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d628b000000b002c707b336c9sm9151304wru.36.2023.03.06.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:19:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: devicetree@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
In-Reply-To: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
Subject: Re: (subset) [PATCH 0/4] soc: amlogic: switch bindings to yaml and
 adjust some dtbs's
Message-Id: <167809438458.62434.12865612944830154623.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 10:19:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_011948_033015_5378EE51 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, 01 Feb 2023 20:57:48 +0100, Heiner Kallweit wrote:
> Switch two Amlogic Meson bindings to yaml. As prerequisite adjust the
> order of some compatibles first.
> 
> New versions of the bindings have been submitted as individual
> patches in between. Put it into a series again.
> 
> Heiner Kallweit (4):
>   arm: dts: meson: adjust order of some compatibles
>   arm64: dts: meson: adjust order of some compatibles
>   dt-bindings: pwm: Convert Amlogic Meson PWM binding
>   dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO
>     interrupt controller binding
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm64-dt)

[2/4] arm64: dts: meson: adjust order of some compatibles
      https://git.kernel.org/amlogic/c/4dcc844c99d3e47820f574911b495b58f7da1d94

These changes has been applied on the intermediate git tree [1].

The v6.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
