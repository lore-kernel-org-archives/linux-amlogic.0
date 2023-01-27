Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815FCC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jL0VBAiEVKvYUKqhpzeMiopjvEIab3bZkYIvf9aCaPk=; b=qJdHJZEFMLnsu3
	9HUSE7SDkj2oi5Re9m8l+zV6PCpJrYDVRFP5SCVjiYZL2FZYXPypsGVK17Gt3lDF+QEX8BZYad69C
	khHR7rW9e4IWzTvc/OyEYp1YWTF/iMyPDZi2u4QuU6PMvFqJWmLKArhJBqYi2kjbAtf3CqymZE2zv
	iUPzK+Z0tY+NCNQlGKAZoc3w++wN8OwT4bEnYLB+LynZnBt+GfuMvisHKKAWSQR3X/LzFDRctT9Qm
	/2ZTyQvtDHDkv+ZIEIXTpkF+0MzblrW6hyU5VGGbhXrddzSWSMAJ9tncVMQ7IZUiEmP8oFCkNgXU2
	212so440FGdfSHMSbvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLJb6-00DSf9-Lc; Fri, 27 Jan 2023 07:56:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLJb4-00DSdY-0b
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 07:56:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id fl24so2835296wmb.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 23:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7q3YsIQN3+sD4qAb9lZvQcNflQx9W2XN7v5+vE+T/o=;
        b=PmP9XzVizDlYOVJw3e1r7BMEkvU53jfG02ubXXjefC81WGgl87HoT76lvVzhoa7Hvc
         Mjl4mopHBYCjuQwCOa0Otoqqvky5lh2WafSGwu49wyC0IVd9YoXDbjqAiCwmyeoNufAr
         h4LDhFz41H1IvBFfIEH3Mrs4elAzBrJkFfgonLiBPTYoJLuLIIU1piPti2Nm5L3nbWjp
         oqBL7ZWco8EmX4G6CUWx8IBQsYmFEhOKxEJwcO8n8bOfYj+eRF30raaLzq/8DpvWdOP7
         oSABKJ/2EqjlCPcuEXNA+c1b4C+CuPWEhPjsB1ZpzrUD+MsYm0BsKzGz+ulQgmNF4lla
         nHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7q3YsIQN3+sD4qAb9lZvQcNflQx9W2XN7v5+vE+T/o=;
        b=eCNuiz+jUp2r08C4bMHC1jtooV07FPBLdZSrdD9yUHdfB69TC6Twa+J7ksbl1TXlNV
         1/mAGd5qS1skXUtJNSMf6W1okdyzDB++Du4hHiNPM7CaaHw48YwC0mcQaejfnSJrmL9S
         X+CXzH0JJyTkoDD8m/7+y5LYOw9+v3YBS+z3h4M+q3iF6zcJyVxHHN9VlR3DlDYvPj01
         AuzvG1pbXcDZjpzSpL5H2uOPfUsYxlxMVj9PKIMGH8Kuz9svoiOr+llbjN1axE6VANS7
         w+zvmMIuBP4+F+mpZMUVbJVWC0teZ4B4ArZitH54uxcTKUD+TT81Y0IQ0QY7uNRq9hKp
         Cjxg==
X-Gm-Message-State: AFqh2kpC4J5jaZLo2APO1GxUlsco8LmAM7GdjaXd2JekS+mmg4uzD9uC
	vLiDint04qJsNazF30P2iNj02Q==
X-Google-Smtp-Source: AMrXdXt7WKMFrRT9BaJy+0OsAcoq1gHNaGBCwt5c8hAYarVFMJrQfW8L9JCxEzHhOikTZhNwZK8ttg==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id r21-20020a05600c35d500b003db0fc4d018mr36631523wmq.40.1674806186720;
        Thu, 26 Jan 2023 23:56:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c081200b003dc3a6f9447sm948683wmp.32.2023.01.26.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 23:56:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Heidelberg <david@ixit.cz>
Cc: ~okias/devicetree@lists.sr.ht, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230126193732.69699-1-david@ixit.cz>
References: <20230126193732.69699-1-david@ixit.cz>
Subject: Re: [PATCH v2] arm64: dts: meson-gxm-khadas-vim2: use gpio-fan
 matrix instead of an array
Message-Id: <167480618547.1454427.9904179152485519398.b4-ty@linaro.org>
Date: Fri, 27 Jan 2023 08:56:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_235630_113933_C97B3A10 
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

On Thu, 26 Jan 2023 20:37:32 +0100, David Heidelberg wrote:
> No functional changes.
> 
> Adjust to comply with dt-schema requirements
> and make it possible to validate values.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: meson-gxm-khadas-vim2: use gpio-fan matrix instead of an array
      https://git.kernel.org/amlogic/c/527c9552f5f8a99b6c31bfb39e9470cec07faf49

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
