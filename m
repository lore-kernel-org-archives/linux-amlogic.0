Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B2EB64DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYq+RmXfrJMUiDwiYwuPWl6sGsV4g263pjzuiMChkIw=; b=DraWnHZqCAfiFz
	QFgYTG+EsQpH1hG2Y3IpeffBO2zugpGbvDYZX5htsItD7bdD+RHB2eC8ffaaM5Z2DqIdrCWslEE5X
	zbYAywBpyVw12yMlVepJn2ObT+9K5yjtTZTmx81RtwMWD8A4QT0Q0wDah9/KUrXgVxL5F720xj0cm
	rUgetUZx4klzTlLCLM68W4il9mzBBge9BPDI6D7EhCyqCzUi1kgO+G+Tk+DKi0GG8LMsIOcPcWBAB
	mxTkxVgDsKVMvFfNZ5uz5Vkg6csjOtHG3zfVGFo8kO9Yv5NH6KuISX4bYe1QXvOn8/HVg2/YI462L
	xZ9xXTYobs5/oOwVygAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFCl-00HL0b-2t;
	Thu, 22 Jun 2023 07:58:11 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFCc-00HKv5-1d
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 07:58:04 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fa74d06d72so1790115e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687420680; x=1690012680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weePZo2zFiE1c/nJhnfk4JFnGH64Gz6Yvqf1fESw1ac=;
        b=PLM8iwwESi07p0yZx5lFaNw4yGWTGoYM82f1gaojuXj/qwK5z+RK9XmyCs+mpAdrdp
         5vWNDYJb4DHmsK2nfO35Cl7j5tIAvOLDKDBWVXNgwWTX6qYVZTg56rS4icALbipfq3NX
         yKnUt1xuv53c/zAs7GpH9lzL4iSuqUJ/IMmEWlU3zVHUGxL3j/nJGdKj55wyB3TEHguA
         vONsKLL3gpd8jjYYIAI7bYfWxNt5JGVyIMORSgfZqRHooB/gRy4A3LpP+4evw+1NoK+G
         0kzzWn7sbsxf4MV8wBJjjob0CZXeS5aZ+x5iMKroIuW8h5+zqJVpS2N02tB2/ZMQkPeN
         SGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687420680; x=1690012680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weePZo2zFiE1c/nJhnfk4JFnGH64Gz6Yvqf1fESw1ac=;
        b=Ahq3QA7OPemTpluiHCLWMghiNIE6qFWA4ive+opRsQ8ucMns3DRUObLTSQ03wPVfWn
         4Iqy1lWLWvKspZh0HYHWUiyyJ17GzFdSlczx+kQujVMRs/QJ9S2HauBvyZHDV+W8sTXT
         2r8vPpcZZ8pi6OCLxxc3y86rcUCvPw6ajywHDiBGQN+5kCaJ9cpCwnM/PvMDhzx/cwCH
         pZiLqpDgIaethOJOjk7K5BBRienPB1IOXqiUXO3EDc9QNRtbL+Ui8+/w39OHa9EwgELU
         oakcQpxh2MeyD+O5U+9bFeS/bp0UsVyNhZRERzAf1qV3UaMLJ1nbLcsEehNILFXTBiK2
         b4Fg==
X-Gm-Message-State: AC+VfDzBmGGSGST3uC6Qn0Yej/VtDIz4xFCySQTWCLZSOwWXxWReobJO
	o/27YqPumTIDJAIoFumgeoKjNw==
X-Google-Smtp-Source: ACHHUZ7TmMn+YQuTcEKH98tBPOxg4bhk+YwRYQAPrfkx54ogpouJkCuAeRIJ3oZpyLhmOi+R4GPJdQ==
X-Received: by 2002:a7b:cb9a:0:b0:3f9:a6f2:8656 with SMTP id m26-20020a7bcb9a000000b003f9a6f28656mr8069188wmi.35.1687420680068;
        Thu, 22 Jun 2023 00:58:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id u23-20020a05600c00d700b003f78fd2cf5esm7000683wmm.40.2023.06.22.00.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 00:57:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Marc Zyngier <maz@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
References: <e06e9f26-cf55-5596-c799-d698e9d7b409@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Message-Id: <168742067914.2178283.17483117281702993338.b4-ty@linaro.org>
Date: Thu, 22 Jun 2023 09:57:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_005802_561309_CF0D3A4A 
X-CRM114-Status: UNSURE (   9.29  )
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

On Sun, 12 Mar 2023 22:29:07 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/drivers)

[1/1] dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO interrupt controller binding
      https://git.kernel.org/amlogic/c/6b0139b372d40bd5dafc140b6618b57d13211168

These changes has been applied on the intermediate git tree [1].

The v6.5/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
