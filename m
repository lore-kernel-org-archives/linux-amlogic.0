Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0E810BA440
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOXK1Imte8wQR78inKDIZDDQBmA2wqB3tnGnrkROSXI=; b=FrnwEPu29r4iQ5
	0GAQhnuCEWce5vw5UpC6h/RhWId491lxLpbMt0cI5HFzj5gFHEQdmsH0dq9+cXVSowJMjI472aRk7
	bdC4F4khFwiQ5V9qt+rNVwyTrO4OlV88xXMy9ldUgMdLIYci4XpvMCUa9UvE9xO79yrZChKQ47D0e
	zFk4co6MI0osD/vSKOoS+mu7xQJVIAluMrs0fyjGUKSrI97eb1f5tCxk/DJ4GUjbq+Gqc70kt2kFT
	U882gDcIORr5WIuRcIWFpkvF30xIkpMsDN5ddwK68t4fM5pYEmpE9QKuTQoXfPlPdM1WOLH5g1kv/
	qMbXjrRw0XvDiQ2fsPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bI-00000006yPI-2v9Y;
	Fri, 27 Mar 2026 08:31:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bF-00000006yND-0VcF
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Mar 2026 08:31:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439bcec8613so1339752f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774600283; x=1775205083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=gYORyIRgLBd+g95CJef+YStWAyLoVqd/DbJ8DfofTjP5D3BkrzqssAlxK7N6vVoAB5
         C8Bragoqr1QRnLqX4EWIfB6ArCgUkuxK+8h4dmJq+hDttWXw4+tXlwM1B+VndWT45FVd
         qRCJmrC7GbwS5e5nxrjfADPZ5ZN/vI1OjemOhOnHMwd1/JRULbeL6arImwOyjlPNytzF
         1v1QyUiEuiw49IE5x6mh4FtJlQJs0rwatk5uQONpLAomzKNnO51PdXXVivZEL1/rXmD5
         +FoAgcHkcJdoNmkaeDZmzcrgRY/b9lbUuMT44WEIYkRyjl3wuktwv9OYaUxYZC3xsObN
         1nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600283; x=1775205083;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=L1sSRWxzfR/ONJNqNOU46ZOXkz1qYt6gZSPbfU3omCgPqblMqBYXNmUrZJovZz7WpZ
         b4gF9Q169GMkc58kGYnForhLBPHnJaax9T8S5Fah2sY5bn9UfSPG/MalKjVj9cvC9ID0
         b9cLI9rW2q9YEZrq42OMfefawoCdb6RXMk6lgvPDqbzKvcAxhAsagEkk522k7pqSG+Vm
         8WP59VWIToeYh8pHBQzbaiJP5z40gtd1Cj/JzM7WLmDFJiS5+mUqvZY1BpciXkBaeSlr
         u9Xi5MfuIGzueSxcTgmiG3ORU8THDDZW2uay/zY0qovBnN+Jw9sG3N/1ScHtpkM9NNVI
         9Hug==
X-Forwarded-Encrypted: i=1; AJvYcCXSSUB2HGnLrajrWSXmD8D+9wymrvsL3TKUrwgPZH9jLkmVLne3ckUHOjsOhe9l6UOYitadZtGNdphD3adZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7PSH9LgYQ4O2VtKteQkci4kM2R1W1bf4rW8HUkuuk/n6NabR6
	FSVlnGcwYKBFfqaqD/NAStqMUkNvntdlp1dNcVi2WEiQJ7McXSbXuZi0Yw9caGOrUCY=
X-Gm-Gg: ATEYQzxtHPJ3/I+OlS/lYUSYRThfNuejGOMIfHTNGKR3dZ7Ha/3bTj9hrsnO5FzEg69
	5U1ejjbZ/bK282oncimSWf1iiuFBKNPp53LPzH1PjdikC4X/8/wkx92uIe/0jTp1IlPNhPhTIdC
	0Na4EOu0M+VgQ6RhWvD7/vPseAMc6E3ahW5Gsdw30Zi0gkWcUvlcWNAJ4KfitUjZx3dMmj2RM9i
	ZwBol1p8GOemTMeOIfCVccixwVF7QDnTnTRnUEqRIUVqFDCkZVDeptJeuDdnrn9teZ984g0C91W
	I3yavGH00W5w7xIg1LNQO4sHxfTnVh439AlijHgsPg+Y8wWhFxCNUrvqjghnhoSP5WP83hWi5Ku
	i3e+iiSGJoIVGB+w2R4Y83QtnwZgyjsSmmwm4FypI+GQZvFWIyU9AXzYR9ystsNAxPkdiPUDKrT
	5JcWrmr/6/4pARSQjzrWXXrgyi5Gj7IDaQMLpBzAotPZOh
X-Received: by 2002:a05:6000:2505:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b9ea46754mr2454666f8f.31.1774600282992;
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm14490849f8f.0.2026.03.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
 andy@kernel.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260325070618.81955-1-nick@khadas.com>
References: <20260325070618.81955-1-nick@khadas.com>
Subject: Re: (subset) [PATCH v3 0/4] iio: adc: meson-saradc: add support
 for Meson S4
Message-Id: <177460028211.2323693.5107431910130043283.b4-ty@linaro.org>
Date: Fri, 27 Mar 2026 09:31:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_013125_172589_D1066992 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, 25 Mar 2026 15:06:14 +0800, Nick Xie wrote:
> This series adds support for the SARADC IP block found in the Amlogic
> Meson S4 (S905Y4) SoC and enables it for the Khadas VIM1S board to
> support the onboard ADC 'Function' key.
> 
> There are no known hardware differences between the SARADC on the S4
> and the previous G12A generation. The S4 bindings utilize a fallback
> to G12A, but a dedicated driver match entry is included to ensure the
> correct part name is exposed to the userspace ABI.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
      https://git.kernel.org/amlogic/c/3b095e9b3674da0666aea3021167ca44097ed7fa
[4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
      https://git.kernel.org/amlogic/c/97c4d4b7de6ef264fbd45300a168c2a0874d6c75

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
