Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5731AC77B61
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Zxw8EukrWdhrfF84HwWhx6X0ZGkSRtFDYsXkSJncTE=; b=RtzDw/PspaO9O9
	xql6+r1xoU/0hc8eJCC0GcsopxDKU+eOxjB9YCUenzKR0i4fg3FGnlECrqnscK3A6N4no3ez8BjEk
	LtRRHdB0f8naT+PjGo2hxvpRzVUYo3SLvx4hl33UmZBN5EqPr+tMWRlIAxZwsv8txtWjsa/kVwcN5
	ZLohdFvIKR7c711MbD9Zj4D64TCAygBxSe3kTi1LJw/7I5o4xbSHAdyEtE2TAKgsRTUa9E5lD4PkX
	JZp3+NxZxM90cFWEwrMpda22c4WKfeqeUGnlXn6k94lTWhFYPAR2SSjev+uaZOK2DrBwiWolzJEH+
	baKGcjRF9EUl6mQCMFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pknJb-00AWZc-2E;
	Fri, 07 Apr 2023 14:43:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pknJY-00AWYk-20
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Apr 2023 14:43:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id i9so42500021wrp.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Apr 2023 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680878623; x=1683470623;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y2vTh12wvHzVyTsbfEPBX95l9liSSCPzdmz8EpwIAM=;
        b=eSTzTJ++Yr5AonzNMm+PKZMNKh16H4wNG7Ja5V0Ey6dXViJfAmNx0uYvLC8A02nU0V
         IAgy2aaJbf1xHJcAiUwH2CQro/YQ63kjjrtHy99bXymQpSsTnIx85+HBj/vp9SK+eupn
         AfYunddRcSirOyouplefXDaeIFs5B24J25LmnVp0KaNdMNxjj+qAxxkn5jF/MPcC12w2
         cwnQC2Kfl3Xfo31oBRuk63pDPyDKSKZvRNREKeI60k2+T7hfm5W8xnOx3K9GRCVzT3Sh
         H06QWq3pPtYiWZp1gtZGCAOPw98w6xhV6v6Gyp489I+1TxKEUUKrQvH47I80XipQQHLU
         fhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680878623; x=1683470623;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y2vTh12wvHzVyTsbfEPBX95l9liSSCPzdmz8EpwIAM=;
        b=yHNaRXahuyZYEok7ybiyYrCjwS1D25v+mZ9AdeSXIvQOoEoisgqlHuf/go8rR1faNI
         gMXbXm1ti8gpEr6L6Pafeap3IduzPzYRfHDuExZK7y5s3VgyUBwRKZPG2fpEhDQFua1D
         8HZGTJwGyF5Wc+UMaxNoIxteCWVwQUaI26oawTT1VAsKqIFJ2DloBs9SXUoi2fLC1lXe
         q/jHvzZDsbNhF7CbXDKYt9hkGeKSEkF/ipG/4SoOJBxd7HQf0NdU5kz70bSFJsGu/ocE
         loEOYVWbvdWVa550X7fWslYj1OfbfNyRSGJ8TODPuRWB1EBc72U83/qCVTYPuUzIaWYE
         U7pw==
X-Gm-Message-State: AAQBX9cs867tbeebuAijzsfTe1RsxfX7AS02YM+h7Sac3O58wlUxG+Pk
	i0GJL0uQKOIJP6UmtWpvrTuaoGc6fawfFGYVkhvJ8A==
X-Google-Smtp-Source: AKy350YbOhKCjXDaonDjuR5CDVgiwS6hEPL+WFj/oy38rfc3QnZkRYr/w/jNMogzEGRVQ7B2fLHzHA==
X-Received: by 2002:a5d:508a:0:b0:2ef:afd5:5e0f with SMTP id a10-20020a5d508a000000b002efafd55e0fmr1332009wrt.56.1680878623397;
        Fri, 07 Apr 2023 07:43:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y10-20020adfdf0a000000b002efb121b75fsm1678082wrl.58.2023.04.07.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:43:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
References: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add C3 bindings
Message-Id: <168087862262.952906.1621259082439192676.b4-ty@linaro.org>
Date: Fri, 07 Apr 2023 16:43:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_074344_660119_77804F3A 
X-CRM114-Status: GOOD (  10.45  )
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

On Fri, 07 Apr 2023 18:27:04 +0800, Kelvin Zhang wrote:
> Document the new C3 SoC/board device tree bindings.
> 
> C3 is an advanced edge AI processor designed for smart IP camera
> applications, which does not belong to Meson series.
> 
> Therefore, modify the title field accordingly.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/arm64-dt)

[1/1] dt-bindings: arm: amlogic: add C3 bindings
      https://git.kernel.org/amlogic/c/b2255e4195ea509b51c33b7a182e764c37901129

These changes has been applied on the intermediate git tree [1].

The v6.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
