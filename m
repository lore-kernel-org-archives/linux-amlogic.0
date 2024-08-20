Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE31C531DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZ/xaDMzrfgnDQnhB8Q4/DIMChU6IsbS+eJt729nkcc=; b=vx6LHL+QhJczKJ
	aBhPNS+jF9S23LOELRbh79wZ4RZISQEomZINwqHTIgKyHWgw5KQLvPr8ILa3z3wriPGHEI9xJOo27
	9fTraDO/Fc2OmIwRoTo14Tw2XQkVWh1+kWxi9oZiVv3o1CbBjSTLa/0zwUGe74KJWMclOVMoZ9JU7
	IgqWdCj07uJVNFTh4GnNjAjA7vJJKjiSchrQ5iCpAmfoo4RnLMVZ3Ko2M3TIxRsvxSd75sP8z425/
	H7+T12zvaAhDjDxAnBcNn+BaV47GbYTaDMoAtf/0WRrfXRthcHhAs3YDGtaRBm10iN9wjqxyNtA+c
	ttnCqejESToWdNwrk5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQpA-00000005qJG-2liA;
	Tue, 20 Aug 2024 15:31:08 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQoo-00000005qBd-1JLq
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Aug 2024 15:30:47 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3719f0758c6so2248139f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2024 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724167844; x=1724772644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qhgrtf6I3bZZq2qO8Kt7JLM5yKHi5OzFhJIAV+fYUc=;
        b=lo4b5C1xajo+vQJM8inbYE4nWKrd705Uc/b9WQp/BGrUav2yOPL5n3FGaZKzToFtRq
         B+D20Nn0grsMD44ZPO+59oGqf0MmVYjjsfFf+qSruEGcQLeL3tY4OrwLh8ZVCEmA+OLX
         JHqSQqRbs/a5jDm4mZ09hAeT6efqrGSwXdKOJMwQFBwXOe9irnM5oohEppkN48kyO3Tz
         SwyPJ+47rMgVBf8Mfaycs3N9WX5iPouSgjEiM9jAoAsGZojGzfyzEzj7u7iP5Lmk2GmR
         VmBONUf9d1dkyCpIbGk0ppu8rJBZ+8xI/cpPXz6CHJRLiYWPCHZV4Z1bqC5kkXhJrVQn
         7EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167844; x=1724772644;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Qhgrtf6I3bZZq2qO8Kt7JLM5yKHi5OzFhJIAV+fYUc=;
        b=SaJWmLalsJOEQjBh/1UT5WpHBs3ewFjJXDigv7S5llUA6Np3hgdAtSLWLXng55xsXD
         v+Pm19DJySk/1d9wdWn4TFXXCFaeKOjL25uBpr1604Qy2Qtub1VaOQ9Av/8ncJldpTiL
         pRBqzqwTYTgpzX/ALDQ+rl+0wYw7cMOaf9bqCJVnSJhFoSMuuqUkH6ffGvXSOptGGZyv
         9fWfbqE5TJPB4+nqcpG0/VIG3kzzaY4mshASD4vMTuWXSP1vuYADVMbRyAZpH12hkgrD
         VVZMtGJq6uYwS7z6gOI8g30uL0RkTcFs3w2zSZzlHfE08iYq2CN5hHvKR+RzzB9Kej02
         cROQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/Akb/tKoPSlN51hCeV17k/rPSLymRh1fCzBlpB50a+A8bewWJkSBJaD5M6qNfMWfkGcAzCk/QeOsK3c7z7xaiVL+TFmqY9bCIH13Yl6Vj9ag=
X-Gm-Message-State: AOJu0YylW0G0KT2zaDeR7MTPrk7wFxbXGBEkWpuZax0tTFO2M2gnAsjN
	mgnQA5kzCAiBdAbL9fyLzDNcmtAgRb2+AVzT19GQx9g1ackVI38s+E1eAfJ4eKw=
X-Google-Smtp-Source: AGHT+IHTy1L6M6bWuRv0bAMNMMxtANlI7zoSxkKwUl3KIWs98yZHIQ9y4X0KPyFbQw6o9GPoRQ+qJw==
X-Received: by 2002:a5d:6d05:0:b0:371:c51a:3b2a with SMTP id ffacd0b85a97d-371c5fa669cmr2038166f8f.4.1724167843430;
        Tue, 20 Aug 2024 08:30:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a311sm13439160f8f.23.2024.08.20.08.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:30:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240712215111.687478-1-naoki@radxa.com>
References: <20240712215111.687478-1-naoki@radxa.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for
 Radxa ZERO 2 Pro
Message-Id: <172416784208.3050902.355272849812987526.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 17:30:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_083046_394407_3EA277E3 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sat, 13 Jul 2024 06:51:10 +0900, FUKAUMI Naoki wrote:
> Radxa ZERO 2 Pro is a ultra tiny high performance SBC[1] using the
> Amlogic A311D chip.
> 
> [1] https://radxa.com/products/zeros/zero2pro
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add support for Radxa ZERO 2 Pro
      https://git.kernel.org/amlogic/c/8f97ee0c9f5c6fc250847d7492875a6d7152ba68
[2/2] arm64: dts: amlogic: add support for Radxa ZERO 2 Pro
      https://git.kernel.org/amlogic/c/69591796c5d585816a306134f6d565cf19da575e

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
