Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AF7D29FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRxDa0WtkjtRUXGgHm4UWAf1kfXjh66YIZRb0C3PsLs=; b=xV3SYRwLrvqHY0
	LgbsnFH2KQZfcw2d1qvxL5RZ8pnLfrzpBfeQZZI2iUuXTc3BYsBnywOJxCq6l5EU3QObo4eCrVPk1
	4nJEi3ogXPoQkAK4e3nsCX1yGB094vs3OsTpwvXrmU556o8fEcVnZLlS4on5ivYG8Tm/36y56hpFv
	SqdRf5zZyM7WTWZk7QlRgBa0gasgNDCgngw9C7/sJbBPIQvyfM8GrFSu8AdHJpeafiNC4foL+hDys
	5hkEcYn1qOLef+PeKt6MVRyq98o+59b0Jf6++qRX94iKgqTh9KrtHO+u1Z4FrD5EBVAVLkXyL6Bah
	f9xygTp8K+WME6EArrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzif-0000000978V-43Ru;
	Wed, 14 Jan 2026 12:11:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziU-0000000971W-0NkU
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:19 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so13931375e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392672; x=1768997472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luE4giNMbRl3MrVhKtHW9mq/sJHuHc9hfzaLz1OXmEk=;
        b=wMJqcK3pEz72IHb9eWcNqP/qkUcgi8/QUlXxurU6mbioNhYYr1lzwr4GVzWZwr6/Ru
         qHrImcioNxQJgZfgf3vz8AB8U4cp9f73Uy6RJjoOfVetVycbccfH/t8k6c/xYLRKJPEx
         nlxqe+l7KxDAEGpUugrn65cC42iJsG8denuXc6l5+auxkhe+lX3clstx7HczzepCVoEd
         RsudZ43CfQ3+rOCoLogTLAcllKfYfAHa2536bbHyPldkoRUYCnqn9rbyMMO0H557A4ow
         tjyQ5csq0SN1OXKN1Ab2dihZQjOs4nwgta8Xub6K2VtgoKZ/5KT8u6Jn6KpmB3XLzeBI
         lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392672; x=1768997472;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luE4giNMbRl3MrVhKtHW9mq/sJHuHc9hfzaLz1OXmEk=;
        b=O5L4uJ0LXbg8Ci4sOR+hxMJaxbRkPJKujoAUeUj3T3yyekc/ImSJkslLI6TjzWVOLD
         eMr9YB6vyjs0ro2ke+ekY0UPIZtnXTV+k8GfOO5aWgu+Jvpx9UEOzhawEpQB3W3mJq4i
         exfx2xNf8L2BYYp1CSRm5grw+efTD0qWzWrL01folzTVo2/Zys8fqktcG9c2+jVKLf1N
         Jh2wKz1JOGwrmhkqwgNmHXOyfkt5VhUiVZUkX22QMavJuxV9Xd9ZcYjzLcxpncfJRT4N
         DRsUycGCMBP1K6aLSHwfG0sExE9pq7DuE2HRgRcdkyes9BozkmcIq5yRXN5/CG8Y4Hn3
         Cgqg==
X-Forwarded-Encrypted: i=1; AJvYcCXVgtRnHgxnustuTySYh9njEtBARlfixY2Ykmt8eyPRz9JRy7ON08czsHmxxo+z75bVK6JqbOh0oLunQxt6@lists.infradead.org
X-Gm-Message-State: AOJu0YwFLVYeIoS/83nPQ6ROdw3wT1cAF0SUF50fMIzmM7y+mW6MoBlR
	RqhbhipgUWWoHTOwjTOfgvC8lcZ0fwE9hEdx5Dl0GbvKX+yd3iALrspZoO6lG+DqJyU=
X-Gm-Gg: AY/fxX7gv6gYlY5u78yTLMzg7CnCIXxJ9REwmvrMnBkJ1fLGY469AYCNjvLekzoSBls
	UZL8d/klpQX+ZAfotNHE4IbtEY5cVLqWpQXOE+zWWaFGADndVpbLiddj+eph9G8ej2BXe2hFgFx
	ZAIlzN42gHJi7nBjHKDUo7tTeVyj+c8FSCHHEdUUSeElM0RfgJr8T0VuuWG7oj3FBpZNc5N/J0j
	ws/Vnfthz387YMpvCk6y9Q5cNwlSWzv1m6SRwnRXiW4XsyV3x2C/40k0oqdLRGUJH11ZosFSABN
	p3qHKHV/wJ2mEnN9UlRrozf5HKN5BTaT+PBxKwaf7r3sukKQuy70D/bvE1Y8pELoxMeTQGKHkpe
	LQEHvfAbkG46q3GJVIjtJQRfRz/fpHKLY/d1NR1e7/Qj53mbqC/i9ThEotEZshe9NMXkg6mqFvL
	vgE/kFkIVMGB4sQJ1by1uodrYPsYPvt0w=
X-Received: by 2002:a05:600c:3b9f:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47ee47c9411mr21009765e9.12.1768392672151;
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Message-Id: <176839267143.2837299.3084525146366465270.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:11 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_474435_F9BFEDBF 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue, 13 Jan 2026 11:39:51 +0100, Jerome Brunet wrote:
> The patchset aims to address the issue raised here [1] for MMC B.
> 
> While checking this, I've found that MMC A and C also appear to be
> improperly described in this platform's DT. The 2nd change fixes that.
> 
> I do not have an s4 platform available with me, so these changes have only
> been compile tested but assigning the clock was actually tested on sm1.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      https://git.kernel.org/amlogic/c/86124a8becb43eed3103f2459399daee8af2c99d
[2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
      https://git.kernel.org/amlogic/c/3a115d42922cffc91b303992eadf220111d66c31

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
