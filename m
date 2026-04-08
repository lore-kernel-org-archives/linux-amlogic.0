Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7427FD5F94
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KA6ZR1yzx8TYiEqB9g/xe05Vqb1Mgcc6d2SFK4LrEM=; b=ABCFLttoJuXrhP
	Md7kZ+3AJXNnVwU/H1FwXCKhRyyyK2MG7orGjLePxZWcuM967I3KmMzVV1QR35aPUAFomfWLOZixp
	mRmOGMQlQMqcxRzuDmeN6UNj1AgipVf0XdSqAKA+Y1RFy3lQwQd8nHXvDz8Dt7i9mEj/j+qm5R+eD
	jE97HjhQvsosKF4HugHqPE+1HEwFxAoWV6vWRlIOf0lGnJi27SsE9nFUSVIJtIv411kRIQQtjEpNu
	urCgy8doA4HUGUMrOGdbIGqG6zWbkvq05tMBc5WVC09oSg5E01cPqo9eeNIq9gjGBETC1pV8EQihR
	WSx3uBDHeAfFM9O/1+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO9D-00000008VuN-3ZBf;
	Wed, 08 Apr 2026 08:20:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO99-00000008VtP-1PZT
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 08:20:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d23305225so4538505f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775636421; x=1776241221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=EtwK+rDW5DCVN/WklLdwj2E4Jhvg7zl+uVAUe5eRSpOCXy+8UJ3S4LMKQUNFmmhT/w
         ftlHibTcTJo9jjt5NyHJgKR0Vf4i6UZxwLJAJNbbyWVGbgkwkHGlTQLSnjzUcwQdrAdS
         0E1ECrh+beBjOkBmWPPz0V3UjIwFzjYjPcyRB9lqZwAWUFSY5xb96WsOnC32cSzgy0Cw
         QiNwqvfN4tpXifKBjBRe4pqhm63SQCe7F6XQsUBwxxM0IpszwwwNQPUleR4Epu3A5Xnc
         qdUmyvIQE2CXhr/2KiEWooVkIwK3zDt5VvbVYLnpHbkhuEPUxm+5I07CcWAcEdc5sZz/
         4UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636421; x=1776241221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=P1BwthDfiDiJAnMZ1lICCXAC7i9+9LTwy9Q3HMuhO4BkQLA3IIvghPe7tJpcbZ8UGx
         3VE4daHlxzEFdhSe3fJuoKsYhnXjGireaZ/q+UvZxH/9XN7Z0H2b2YKhdTypW2uFwGfy
         IaoSuBQJTytflEtKScs9qGdwVYO+UHRutNMGyloaMArnYmCWXc8wJsrzbD1+DEtKM6yi
         ftbXL34Ep3SF4oGtnB2/KMyfTFKnxoJY0aA0kXg4H7lGf1kO42LIyYj1W9ly80WOrSxu
         jm8T6C/nr0Y289AmsNYeJBZ1FL9MOElfiYtRDawNG90I/AbiMqigLD7GiQ19mSgICx6n
         //oQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8oDItyhbdPBZuZrKVCy7BaKru7AocXlHufdDzBNg1iwjGZBGp4NMbwgP0ebKTvqzZjDXOPsbcgu0XSGf9@lists.infradead.org
X-Gm-Message-State: AOJu0YyhBfuV3xKE2+AvEsl894SBg1SnoZkipEzz1PU5ryfiTRXIkxLk
	bZVMy29ncAl6Ek2ogl8wdj54MjwhHsxR1JDHVW7MFdUkhpqYJ5AdzihvAYaKKr+6MiQ=
X-Gm-Gg: AeBDieviK0kRf9J9KG/h+E+6kECKVBn/tzHhx4/kzUwjNZXXG/wMVbRJWjziRe4szQJ
	pFMrN00xmn/Z8aWsWF3plZVXeWfLFcgEgsvyg83FCOJAQp0rpneZhep4TTwFDKjZy8RMInTDbFb
	kkODMNtU78whVsFxCx8JGHYJ44BOdUgh71ad4NW4UBZJ8BlSX7wIB8z/gZazYjEXMO4tfPb8nQv
	xOZ3sPxooupawPOlVj3TJG8gqLzqKlcpaDYZNLltb+i6KK/+oOtr6avYVY23Klcm9MtbuLPXdJi
	v4nsu/1iiI2+i3F+DfiN7oDojjtoAPX7qBzzL93zarDEc8g1nhouQIRmEMBw2aLzFcELiyzK7AN
	5n0E+r6kQoTtZ+F/njnDgXL7KE6ZN/gwo6i6zRaIdJJ+j6NUdlfigZF28lPeKGzz69PSbojNvO7
	82Sj+dSfYXZAEC0b6T5p2SCA==
X-Received: by 2002:a05:6000:18a9:b0:43c:f90b:5663 with SMTP id ffacd0b85a97d-43d292d4753mr27905582f8f.37.1775636420996;
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6715:3376:7379:78d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e2a6f1esm54494851f8f.2.2026.04.08.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563641892.1659838.16115307647051827681.b4-ty@b4>
Date: Wed, 08 Apr 2026 10:20:18 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_012023_636341_3E0E6B81 
X-CRM114-Status: UNSURE (   4.47  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      https://github.com/BayLibre/clk-meson/commit/6d6be1cca2c9
[2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
      https://github.com/BayLibre/clk-meson/commit/87edca62c4f5

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
