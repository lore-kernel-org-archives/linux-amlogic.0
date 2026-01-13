Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C10D0C84C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dsm/YQo/8RWfA1+5023CXQfdz26JO8AtEgUNNn413Zc=; b=isGAz9BrLsz8Jc
	DrzXYA+Q+Vu28lWWCVR1jAvgJWsMt06iiVJ2r13zlVWF6xxErwfX3fbvEtyOQnJow5EiF2Qp+cB/m
	JKqhdUjaEOmu3C3wND0ZERwnwCMbexmQr7TdocIcguMzkLWIQioqpLw4HU2ToTQz2IRHnCd0kph+l
	oMhO5+i+ozrU42U1yQ0F35SjwsQq/a+VGYVUDD6tolhGQhmAsxcdMlz//bh0uqmHEjOZ+K7T7UWvM
	ItU9i3MI9GPOAl0r8PGwvu93gFd2AiIlIxqVMnW87+TBJ7m7ZM3ljeXAbK0Gg0PB6zDbZlV6issaC
	X0rUERlmS8MhI8vWGf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbp0-00000006vAj-24At;
	Tue, 13 Jan 2026 10:40:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbot-00000006v8S-2eEB
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 10:40:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-432d256c2e6so3845310f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 02:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768300814; x=1768905614; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXYPhxT4VFsm4+vuJl0AaBhCYe20t+H2B88DUgUIoBc=;
        b=Fe0lkXYSISk1ZJB7zdRIsyRth7bL7j/Kx64HxpoBE/QaqaO8r+AqwRZP9me/szmWwQ
         FmGhbMkgno/A927hXS9DiQpZ9NO72fZwU2FdkeW0fV0DruloFOyprNORLg/hqxTFHj+j
         Y6xmKTdsGQCMhtF01OfjQeua4ubuoqJ42EsN15W6MPWelC9H4FgOEolW4P0EoGqCwuEC
         n1WMFoilhJjYOnLohz8ZdXujJdLXVxCMTGFrpiz0UuvWSwvzQXZMSWRcCuQcWkhVPi9Y
         6aFZSVc/iygT/8o4BOCmHGkM39JdCnVS1YudAfDHRJ1tNfiHKjYllYHFP+01m+iig+mr
         FXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300814; x=1768905614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXYPhxT4VFsm4+vuJl0AaBhCYe20t+H2B88DUgUIoBc=;
        b=jI49ITUqginevutUsoBrApZoZNgCSMOrOWVR6C232t5MwT7hoLjPSF2qhKYjWU/hzE
         xo5A7i2EOEJoW5j4AFm3Fupe0vvSYTYt+lWAt1rDD8M16gH9BdoAdzuxgISkn822Aqf3
         NZAv4qofwW2Je2pu3tnkRSW945CiyKRDbVNtrTEWWgGnmUZav1A3Gnvf8T48EbsZmn/h
         aaGQcoLltda1Pzk05QrlPhQTKaSquisjbIBJwmaeEzMmyhazlv1hvMFCSR/Spzwqn+Ht
         VvGTapaYPqIQWXnpJKJVtWq7qllooaRxhN5rTDRCeDi07oHt0w7t2jQNumoywV3tRfvR
         SkLg==
X-Forwarded-Encrypted: i=1; AJvYcCWiiBy4SY2zvu6F9EUQxenlMSDOAjGY4D/ZYScjE+dT9lGWYIPaQgfBF9ZJ4DgIOHjZkeS81qv09IKIQbC8@lists.infradead.org
X-Gm-Message-State: AOJu0YxekeAs8ZdVWILMXlom5jUlivrCyaKMIOXjD8z9QJjl6XNrNSpI
	gaByHyry19s1M8onkBeKHUGUkr2Gd6lR8Hnr84IaHmh6kEa0EDBJIQ+Zm3qx23UpeWaDE2V/j63
	EvTYZ
X-Gm-Gg: AY/fxX54fhidM9qqNcKIdzqY3oIGV/SwQmABXpLCWvj+43dPz0lKB51MLYVejldQ7+o
	W1GBcvrlmm+5m3aQRLCc99+6AoxztSMGUa30S2DmAscZq0zXAwDFiH4LmTNbucsLGifFxYj5nwZ
	+i1I0dDzlVvORNXQ76Kjj0K9OXf+f3Fyan1C5IEDfjCG1RpCFaQ5d+DwxdD9S4cbTju5OW5+R3c
	QH96woPDV/WegU4YjV5B6o9DGYcskHr5Kftsev7fao8kpzvE91//1Ffw21gWMeiCYj61VHQKN1b
	4hdTR/RSV3fGQBGiOmREIZu9/G4drdUvn4NXgauTJf6+fJfWkdNQ6/LzLcmdbC2nUEZ/q+4Xzn5
	P9Cvy5CmOGAyJkng4ldtSO46zZtqrUQ3WR43G4DAAJY8iqMUq5ytIoXfKjQCHuhSbSgg69Aso5d
	RaJhu8+scJ
X-Google-Smtp-Source: AGHT+IHFzNYoWJwOUEYhgDUL2jzgr59pL14dNINqiejD4tK6O1TDnQY0+fHQGFbBHWVT74A5TNYbVg==
X-Received: by 2002:a05:6000:1366:b0:430:fd84:315a with SMTP id ffacd0b85a97d-432c3798332mr20221772f8f.39.1768300813665;
        Tue, 13 Jan 2026 02:40:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e16d2sm44942027f8f.13.2026.01.13.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:40:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Tue, 13 Jan 2026 11:39:51 +0100
Message-Id: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPcgZmkC/x2MQQqAIBAAvxJ7bkEtKvtKdFDbbCErlCKI/p50H
 IaZBxJFpgR98UCkixPvWwZZFuAWs3lCnjKDEqoRUlZowrp7dphqDMHhzPd5oFZm6qwWtrUEOT0
 iZfFvh/F9PzWi7KdmAAAA
X-Change-ID: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=teOBXSGPl+wXTHvtP2Og0GZe2H53L4WVvkddC0eSMu8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZiEJ+z5RHj+9WnWssofwZJOg33B60V2w+bpBd
 qY0coeQCL+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWYhCQAKCRDm/A8cN/La
 hfaZEACF5pgbd/q1o0s2UUMpaNbWIzuF7TlR4wFpW2nULLpPJ23Kr2F/i7q4Ajygd1+LhPVt/PJ
 uSefmwSXECTBZF43x64tJCn6oWhXMYUDVDgTuCr4l9t0iY8LBgAEP2MnmhPg4LyjtaoT0i0A1n6
 XtffOMurVTWkGKbJt5bci+A9el8wET1gos/S0CN0Cg1tPq+Y380BjUxvM4dSh0dpb/nWFhcm4OF
 M6yRYjj/+3jlmNgrRp+bVOq1QkDTYubZowzsnqUF2JZ/LyempgIeptjs1JrcSO5x3xwUf+1aYnR
 qItk2ttafdTSCAT5B+/J/kkzAgQdPqbkcXUK2QXajdLgqsRLgmHkiSRHC803SzcAAXou5krZwoO
 MLVkjDRKtYq/KvX+sbfkeuMm9A6qDHhk5ocmd8T3iggOVH5z/TYSgStkgWR6t70iEfXKCpqAU0x
 ZwNp+xeIJVabXyF/Ks4hwNbFZKvY3LcttP5QAgnTq85yIBC9HuSEoptApQUcDocEgFGrZLz7nbV
 m+VhY4CHq8sHSFoPkRZ18DNbsN0d6KZDTrg/6drh7AaeuwTxWzUO+jdcwDGs4Hl7FO+ounKmhD9
 YG1mY52rteCT4GkwtKKQmWaJ9exSyTfPaIId/Uw9gZEoie/GkeOf5p7BbXvssbdCoXegMGyufa+
 EtrJMazGI0Eiy3A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024015_692949_A5F55635 
X-CRM114-Status: UNSURE (   8.25  )
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

The patchset aims to address the issue raised here [1] for MMC B.

While checking this, I've found that MMC A and C also appear to be
improperly described in this platform's DT. The 2nd change fixes that.

I do not have an s4 platform available with me, so these changes have only
been compile tested but assigning the clock was actually tested on sm1.

To be on the safe side, the MMC clock should also be assigned on the other
SoCs. More changes will follow once things are sorted out for s4.

[1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
