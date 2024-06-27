Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99015C3064D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXtDpdJF2cin02qLc3HnP3EuhaGtb93gkHvLiCCs3/w=; b=ezazRQeo5a6N6y
	gjhGvUXZ95sAMd61EWdIQGtWL63+11+I6AGzvMiDo+Y8B1EO1RhfdMQHXq2YFn3TYCgql4AMACeYL
	xoIKq3sgPJoXbsJKh9GgS69Q2CSF21nIay7WTFxGAxoq2PfdU3uSCCUVS8NAEPqRhC1hbpU9V2y9Q
	uWurn7nsMIEV2jk+/RNdgrCCD2l2P75tde6s8LiViAapB8VQnpTfeFKhh6JcKXfPE5IcITk9OjPgu
	uhSZeTsE3/PlCH6A1plFw6IY6xNzTzDuiGMCt8HpFdR/nNJjy4ANzRAGVQSJ0L6Rjngc4DEHj9tFL
	i3XZjLcen1AWykYQcreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjzU-00000009e9U-0Prz;
	Thu, 27 Jun 2024 07:56:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjzG-00000009e5E-39Br
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 07:56:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so22646315e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719474968; x=1720079768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhb8tshU4UTCoUKCJ0uFCvR9IBtcpzLcynFRgzyN5xo=;
        b=EiUH+DWSc+l6sF4zNOCF2p3hXjVu0webPtcnAxoIj6DU4IYFQYszem/bBg9tuOFgV7
         +Ec9uYTsUbLorOCwL6GN/bdfUm+wFVdY8d9dlkYeHdg3aUU1V3nIFg54+I9pYeihAsM3
         OU+t+d501yfJMQwDyGiUBQbuK1rWlCUJS2fcG/Ql6O4O+WSHIsTL2L/XTwKUb5rka99v
         4Kw1+yorpWhrSKdAIj6lCSbxsLPMo0H2/IicfYDRTujlMzbb095SjMz5kPTbD9DdbTbh
         twIbGH6uNMCt+2Cm8CXr4sr1dfZerEZwZqZCMVTtLcDGVFbII0rLCzOvzZPFFtujzX+r
         QV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474968; x=1720079768;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhb8tshU4UTCoUKCJ0uFCvR9IBtcpzLcynFRgzyN5xo=;
        b=GiC3gMzai/ZZSeVJ9/4Jrx4Q/9eTIqkqsERIHANkHL2dNXm/3THysynRANMzi0CcJW
         1GLsRt8kBTnigb74CfsWL3uFwk/z+WB+rRyabBRCKYZ1dA1YkFd/eL+nkN2NO2q1lH2g
         o4YQ6OzrYeX4dCa/I7IhBbVUK1o6Imf1hS+VMrVWpeOmo3pzy0BNJzEWJ4L3nFi1MHCa
         RlhhpP3S9JznwKeirKLsAlnwJfKguzyzYEgDDGibE/ElxLaL0S/exr6MfZIiFSg00osj
         V2/3KJuJuTr7wQlzzmX3oFYttgLNZdbk/uWUXaZ0cbcYT/LHD0NI3f+wk10EdaHi7pVi
         qPWA==
X-Forwarded-Encrypted: i=1; AJvYcCUNFmEVfoFkWgS4lBY1zlUPoRNYcKbTBjkRkJ69pCIExuz+0uIA3l297D9I118YuLhx7/FJSQBrrxIHWu1GeMMyzGus+2wsETWcwp1md4TP+Ms=
X-Gm-Message-State: AOJu0YzsP/3ZM0/5P+YQrn9JHq3JQkdQnwKctE+FmoCC/2RyoaxDTs55
	Ow4ElAknEsVK0EePpTGoPJe9L9hBCXee8zx+4s4gjF1FrBeyW/oPXcxgs05Z9GA=
X-Google-Smtp-Source: AGHT+IHGlNZJk2OgRWQ8EYg2rsbzX9mhgpwNdd4jOMVlOFKRnwWm3q8FMrXLPKl2frkadi+gta/3Gw==
X-Received: by 2002:a05:6000:24f:b0:367:43ce:9c92 with SMTP id ffacd0b85a97d-36743ce9f2emr425332f8f.20.1719474967330;
        Thu, 27 Jun 2024 00:56:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357c089sm1024019f8f.7.2024.06.27.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:56:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>, 
 George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
Subject: Re: (subset) [PATCH v8 0/2] Add support for Amlogic S4 PWM
Message-Id: <171947496641.3255632.14959368201943139429.b4-ty@linaro.org>
Date: Thu, 27 Jun 2024 09:56:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005610_831137_05097D2C 
X-CRM114-Status: GOOD (  10.20  )
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

On Thu, 13 Jun 2024 19:46:34 +0800, Kelvin Zhang wrote:
> Add support for Amlogic S4 PWM, including the driver and DTS.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[2/2] arm64: dts: amlogic: Add Amlogic S4 PWM
      https://git.kernel.org/amlogic/c/e227c1e14dfe06a54844014c076d11e9cdef87e4

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
