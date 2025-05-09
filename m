Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C8CC3ABBC
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+lTPnlvDgGgU5iEz5e9y2amrISXsyAORHXFK3hSoP4=; b=Slx7XpYdUjAsz5
	GZte/aKwmYZoxiaZkogOaPR8CoG66XdPLidMhoAxwcwhDDVc+2Wk/X+cVF2lSfj7GL+o/1YPrwbmX
	P6bydUojPJeZO8+ZFHT8ZrFhOKfXJRMiXM7XoD7Wf0/qgYnuBmvivegGhLGkKsh1l52sTm9J3T2zi
	kexTYXcU6x6wpFuGorYl14RTezWsNpBZB6ZqgvmeNgyoRiI+Z6Y5TQG3dZH7CANUadIr4Uo5r8XgH
	h5rDi9kK9kK0uDT0n6EWNU1O8dIzijjAEyS/dZPgr3Vm7uDELuaG7a46tKs5MyH/o2S0EzL280bKR
	AHV9Zm94qz5bKTDjgQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRhX-00000004SqE-2ECA;
	Fri, 09 May 2025 17:39:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPm1-000000046wY-1U6n
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:36:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so23692285e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746804988; x=1747409788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr3gBMo8q6x68iJStgZPxOvmsn126Utqtuli+zeHGe0=;
        b=twOPo7/MozSCFcmyqIzU5r0VXf695HRunBSSthIyQU1xzUBIX/3mxaOS8k7Km8ZAid
         nK5YbnL40Ncly4xAjXYeUiVDj8TZM9Xs5AD8OhRXa1UNXC40EWBT9h5H3lI5aIgMg1Ac
         RHrFnYgHENbBoLQ9irFgAqUHK1P6nMeQfMkF0pvCXAk5Wjynks9Visr7nXAru2o2GAk/
         7lt6tTK91LuFSDe5JvC8hPaMHIznt3eAaguB6EPJAs7cQf4E5Wf/JTWLHxnaj41A5JQp
         mj51XuUtd4Sv82iMxLsu9hPlDMsbra36p5E3zQALuhhEK3dLF00wynpQOhgLNcohDm2E
         s16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804988; x=1747409788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr3gBMo8q6x68iJStgZPxOvmsn126Utqtuli+zeHGe0=;
        b=NHuZZh2HEepR4o+ce9rz+YYlNbBEuare+1GbANn8Hb9G6j8zsWNpVT/jnI4BawGDBV
         7JBmxr1OKykWbJbVRM+rjjN9OcdAvd2+0kRnp+PGKnz5yaPqDfkbPvstw/qkJcIvXN1A
         ILe2dpF/Ehl7q7QdBO5o4H8eAKcN8kFEy9h35sqWfWE7CNVS3xbQagh7wavnTmlr31J0
         SDznkrsZ+OdQfKcFex2C+I6apVhcA9qE2JSEuUkEGkBzuJliygV+cHNuhOrGx29FUlPI
         RD+Jr+wOqnuP3DA9Wm3/1ksKFewCZfIgVJge2m+Rfjz3gXjPOtyZP5LoahZrQv8XoY1I
         AVDw==
X-Forwarded-Encrypted: i=1; AJvYcCVwA81ku3zJletnH0aNFXThIYa9lS/DyuSrrfUJgrCY4tiRsEduDMdQgK81kc52X+S1tyffZI4IKrUTzkdw@lists.infradead.org
X-Gm-Message-State: AOJu0YzJJSY6mEXrCNH2zE+8wddOZ2E9sxwoGW8WeFicNIOeIw1GHqNU
	e6dmX22WsY3Qvsi9VTNPa0o0BiuDDuBZ7j2mmb8JX2mAO2dhK13iWLdWHjqCOfo=
X-Gm-Gg: ASbGncuNIYzuqL7ijUVDddSYRhPYf/D3G9hGArdXIAZyPM2MjmquLPEVo45SKGXp1pN
	T8LDNGUTeDO10rvXPjbaYzyPCOSL2RhqhdGjLXNY54upmhbfMRqUCi4YLfJVQ9djWMqZ8Cw2Zs3
	+NcKsuDYzVaWri1PmEDHtmAVTtw6s9F5VpQXi5bgFrqTNMZQ+0MsVcIg9b4lXovWKxkuvdGGJtG
	787Ny+nWiLO7tktsAh6JepF37KPZparCvqo16cWjC78ZK6KM0fRBfxxb7LkXnaS1Y2fOmhMm8pO
	7Mss5d4IwJDO2d4l5j88N8A39gSCJIFySwMcovokJnc1NEX1iRqsLQR8+qZrsg==
X-Google-Smtp-Source: AGHT+IG1sfy4S5snxPV3S5e2QLDaSy+3C3D6NenHJmcIMFakCtQ2zu63e4yW4tOoetvrZI25/EewmA==
X-Received: by 2002:a5d:584f:0:b0:3a0:9f24:774c with SMTP id ffacd0b85a97d-3a1f6a3c21bmr3326299f8f.13.1746804987712;
        Fri, 09 May 2025 08:36:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm3551824f8f.23.2025.05.09.08.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:36:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
Subject: Re: (subset) [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Message-Id: <174680498703.3102335.4935499750020158309.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:36:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083629_411068_ECE41EEA 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, 11 Apr 2025 19:38:14 +0800, Kelvin Zhang wrote:
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v6:
> - Rebased onto the latest v6.16/arm64-dt.
> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/3] dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      https://git.kernel.org/amlogic/c/87b480e04af45833deb5af1584694b0077805ea6

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
