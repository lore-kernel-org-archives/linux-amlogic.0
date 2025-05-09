Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04965C3ABCC
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6nYANeOE8ko9N4PugXEnsI/ZeVG5Q8mY1LPLHzY76A=; b=FEkZPoSC4tCosy
	819lCzhTI7AQzPlevawbpN4gAYJ8jOLXgiFq3gAy4HEMqfMhryCePcTGkPQsAhGb54amhj8Z8C+oi
	oonUPQmwug3ou5xQhIce8EGKwvmLJES5hK3LuFHu5fZTY0hmnZBoDK58jX19mw//Six0tVtVgJKoO
	kLKMrMwoMmeNFAMUkEwb85WxkzYG4yxz7YY+38aCUjmaScWD2WQqOzrrYcqzSxdVtAz0e9j1EIB0I
	77V7SknuKP0J8nNxubD+CTj33Rkf8J4j5y6mx4sJw6UXrUwJ8n1UpPfwNtQ0Ib5sIx3ldCoT2g45j
	k+gjDkFskN12/KHdzk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJu-00000004y34-22kR;
	Fri, 09 May 2025 21:31:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSt9-00000004ck6-1uf1
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 18:56:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d0618746bso18993315e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816962; x=1747421762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=HznAcXjI0faantbIi6hVOxubb7/ee+/iMHurpcne9oy/JxrbyEB7CCNr2CIBQYzJ0n
         lZGC7FkmnMBAYZ/D8U769N9PcaoBP2XAGfZQKMl9P6PTheffxo/rXKHyxBdSK2ixgcft
         X9MFi6UTVAvmFAD+6VOI/q/SywMOAR6yPI31Bgy2SwykLtjIb4OYeKrr5yOryMPfgZzG
         iubcRm8J7LJRG3zTZDM1sba8xKziBPe6mmEyccw8rmsjVT/Ov9z1aAAdIep314hJ+1AB
         OudfrducIFp+YqvOyni/S4Rkk8iayOuFsEvSs7j+ggx95+zrWE8wZYpRF7tkj/hvQj5j
         62Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816962; x=1747421762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
        b=wG0jJmu9zZJBdeeqRpQChUhuzQh9aO1VlVcy2Kr8K7WNTcSWX8CnfgLHck+KzVNSNr
         dDLzHAKH21p+daajiKAioSQOFNKV6MMmcSHKC3xFfVL5MRFyyG3NrXSqanIKMn8cfPny
         qf9NN+YvfHitfVClP9weCdYUVF34AVMFTfo8G4d7/2qAIT4pzDM+fbgR+u5rKtjbT0np
         ks3ZSOeCRjpN/zur+W2+XzBapDyUtfGy402uh9nQIABMXsCUWQD+ZbH6kcn0hVUC/1hk
         2LGtqJLdxkzRURcvv+aa88/ZS3GBY/w1lvrQvyURAlBW+7vTU2e93ah0bftT7AADDkh6
         ogUA==
X-Forwarded-Encrypted: i=1; AJvYcCUkJ1rNFk8HuCYZPyEnL24Ry+MDagueXtHj6keMCwZpeBDcrAzzQ1gctX99D0yL9vpRvcJ6d77+Ogz9ojmh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnbl0dZh0E3kLYo5Ak7A+nQouLm2QmiKnjby1IMzNqObJFVufN
	HaTaBRoWNheNUiSNwQMCao4LH2i+TRMLh+iMOW8LidgZIr0/nyLOtnI4jJwBNgA=
X-Gm-Gg: ASbGncsgUvE7STdBFrxzKT18w+L4wQ0Gf2QjPW3vlya1ZMndclMy20VpnFFoJxU4K8B
	jNLs67R2TcQEurvkiPa2eeKx6LB0INmoYwqbI73dBcT6sIwlVa+cl84ggemLTH1PnKFD1IksmY4
	9BWIFDg/G3mCC5vf3B/kS518c5MHUIvu5o4r96DcJhvO3mlWdje3VH8GH7VB5qJXPkXTvOlsSNg
	RJoIEDOi8FNU40ClT0M/DtiDUPNQII0JH0Iz71KGE6KfwCjs3ob5VcCJ26DRhq27e7Bmas1Oqgy
	GG7y125iSicbK4K1IawhDKS4IrDga3bN8KGXHOMzbaT+6mlXB24j0Zo4xQfgGAt2HiU5httF
X-Google-Smtp-Source: AGHT+IHYQkpkKi8CkEHzddCWOZceMUv66ifC4WqdnYwF4TBNK6QI+OtfU0ViTWxy69iYNRZgfgnN0g==
X-Received: by 2002:a05:600c:1550:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-442d6d6abfdmr45281565e9.17.1746816961791;
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm38009955e9.37.2025.05.09.11.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:56:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
References: <20250505184338.678540-1-richard120310@gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with
 mode->clock
Message-Id: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
Date: Fri, 09 May 2025 20:56:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_115603_502197_90627E9E 
X-CRM114-Status: UNSURE (   5.22  )
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

On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: Use 1000ULL when operating with mode->clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
