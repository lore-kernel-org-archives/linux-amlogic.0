Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BCBC7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lwD3w9zs1Pge5NAmVG/tQk9glkti3IlzKNTNB+hlnE=; b=SAlKJB7hPnySnt
	adEJ62j69ojG0oq0oaUzp48oUbhU+YN83ucLqmBJHNfHCQfiJM112BWP7n0UwMdCu1Clu2agK4F2J
	ZRF1EMFBtVFMGUz3xDd+eA+IV/iYbWewIhPgMa9FSsOa4S4JujmCpwoNTM236KWVY6W187x2uWyr2
	2VsCiwdpipLogqDOFY41fyNPxjKE4eZJcSzMWDFPSyx73iw008PXz13e31+sIWK19K7MDcBItAnAu
	p2yvTfOGd+CqC32S0fMqdIQOTv9YxJoqj6HO6EU/tfKUaBNAhQxW3/CDQYCmdkAm9SCa+D7xeunx0
	ODok1y8DlUuhmlnc6Hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPwF-007RuY-2I;
	Thu, 06 Apr 2023 13:46:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPwC-007Rse-2P;
	Thu, 06 Apr 2023 13:46:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9338d479a21so128721166b.1;
        Thu, 06 Apr 2023 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680788760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkHFpCD/XQeLxofMjQT3jwfPpJhgnEHgCex2rD4ksk8=;
        b=lKMqG7lIc47IvaYySaSBUJFH/hA+mln853cL8/jfrpRJEPRmwW4vpmxSTWBVyKIk18
         HReWO6yNVMsO8DPtbjjD0PjwHr5xKWAv3p0ciM7B1PSuvZbhJ80gT48ce5t2ve6posfM
         8hp9pp1wToANmgTh5LIwI6suCjGhAZbFfn8TETLcUpXPnseDFgkUzhl2RG+z5kgEBaJN
         rYnoAs3keLhepHWdqGD5Y50Sbv1R799at6hBKuSNACGwxqiHVOqc+tHpL4fsRIqm5Kfr
         SkD8e1NgX2/yzMkqHX4+EKa+0c6DEK/HBMIXvny7nkWaOrMZA/ROssHZBeHAIhooC9aZ
         kOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680788760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkHFpCD/XQeLxofMjQT3jwfPpJhgnEHgCex2rD4ksk8=;
        b=eums/+kmLYDFGACFGljNwoqK04K/oeZu3afoIE0820fg1/Hqaa7blddyZjFbStyvoH
         f9AYw0svIdVN1BqV1xEn3oDzzj2PGepttLZJxLe5BqfGvDntVYZqn2muVQWybRm6kTmA
         3jbO3n3hg01U7F1PAM8h+TviZIMnKh7VZOeiGL6dfVwJi3ig+8AQN//8aLwGu0JJFdu5
         FR2HIGuvoKWQYwf2TwYsWqCvPtEbQQ3s+GK6vo/C70oDJnymJE2kk8755KRelIGTQmJk
         w7jrDFh476+bjTC7gtnym0FX4LK42XwitEEIOHlAW+ZKqmCBdcN96QXTDPpn/ckUiYMv
         PD+A==
X-Gm-Message-State: AAQBX9cflKrz2YyfMqPj1pd9iy0krvIVU4pXzoQPLoenbwaF4nH28uVf
	CEftcstxN7d9+CoiV33qn9s=
X-Google-Smtp-Source: AKy350ZFYf29eCxG6wCnL3JIuIp+ieQKorpdGdk2B232Ai9lNGOwLmUA+hdGHUvuhBjF8/BVi+o5Yw==
X-Received: by 2002:a05:6402:1804:b0:502:6726:89c3 with SMTP id g4-20020a056402180400b00502672689c3mr5410333edy.23.1680788760431;
        Thu, 06 Apr 2023 06:46:00 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k6-20020a50cb86000000b00501d73cfc86sm773352edi.9.2023.04.06.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:46:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Date: Thu,  6 Apr 2023 15:45:59 +0200
Message-Id: <168078873512.1715717.5725405826072466849.b4-ty@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
References: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_064604_788087_53CEDCD9 
X-CRM114-Status: UNSURE (   6.45  )
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

On Mon, 20 Feb 2023 22:19:30 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: pwm: Convert Amlogic Meson PWM binding
      commit: 43a1c4ff3977f0ccd1d99e36d74e525aced5bb3a

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
