Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F8C04A95
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esVWMIIG9BV0iWOizyFUn1lw0/Fix4Mv++RRlGXuGOg=; b=XkJMxs6HrloXsl
	WSp4GlN43WkiU2SQu1tu+PujWAQgYp0Fl3+9iYdVDCAlbNStATFXFKKWwatnQZCqEAylqhk+v429V
	Nzxo+zeAz5nfX23vEZBaAxVePxQj0xCYr7i2nQ+6qSJy0RN03aFRUsAGQu8uQDcYd+Q4a8YVtSMhq
	d+214x3AVIUFmDNWBVtMQkzCL4zRR35SsWu1NdeAQIQVXffyGckJHAlEg5kCCEtV4QitmyNBuZ1fT
	VhOukIZjsFxfAjIO6vFu4ectIhP2LofwA3/V07odzF8msTSXyBTlHeEpW1DRf93o3uEGVhin2CMul
	tXi1bH6/EtjeSZLQaU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLD3-005tsR-39; Tue, 25 Oct 2022 14:47:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLCZ-005teL-Pe
	for linux-amlogic@lists.infradead.org; Tue, 25 Oct 2022 14:46:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id n14so4017979wmq.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Oct 2022 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LopGlgKhvm32wTid0qhleNX0zRA4//F/8VxaJyDktKs=;
        b=I1z3mKWiVt9ra7NqgGZ1lxmax+gR+Rpbh9s0z951uLuFibjIOotScr3Z66je20grqL
         seFqrE7edY/wHTOz8DsJSYwC4eOGM7lxK8Xrzez5SggsisUUWpxBVHI4nezoSOn8/mq8
         hi8ZTJJKQE4vAlFEVnwTc9tw3jYMvtCTg/mpdvZgVplsO9SeGWDW+h7oeXgfoKS6x0Ly
         pqJw8g4atH/15PRQmVBblJzp9+eBW1Yl5fnPoD/SJr0upUCJVzVcs/hOaDzMTdJ98cS2
         2DQqJoZOX8aqC1ez3W3TWFh5X8ZeOYmd6ajYm9WbNJKIFwJzXr7HrlWAyTF5C184j95A
         1dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LopGlgKhvm32wTid0qhleNX0zRA4//F/8VxaJyDktKs=;
        b=R7sfK3S9ya9Z4oc6wzFKHxAIz8fe1C6KQpmRZQMewR4SXK1QL3OxU45hR7fduDp6zH
         rbfvaTLlbp8bYqEPkCI5nxvK7wGkPTweloSNoRDpnxyCLAM1eAMwHBt0X5zt9dxGK+rM
         MVdmP9OZSaCfXaXs2E5fRfZCMQHzzDjzQCw6IlHN3gfi4sN9cxyaBH8ZtMvjDLBbg0Ri
         oOR1wXmoKlN6IKYERuNV7kd0RH3FD+Lw8H+pE1V8jkimpfbYzK0U4r21Ww3jV/3udocb
         1iKSWWt9jre/ZcvpFn8oJih6LFcrz310HgimVat6vQaY1iCyMeh4KafmrsoA8kQKA1JB
         ZQTQ==
X-Gm-Message-State: ACrzQf02eKx3QGcWPrEVn8KswN+wRfIucM1b2MlTmf9960lmBib7Pwwx
	n82GU9rFogOuYHdv6fuihNZv6g==
X-Google-Smtp-Source: AMsMyM5viWsVZbx2LjdqeTusxCj/brx91Qs9pRD+VOokyVVP3l/Uvnu+D5ZYZjuVFJWVtiLM9KvaYg==
X-Received: by 2002:a7b:cbce:0:b0:3c6:fb29:6084 with SMTP id n14-20020a7bcbce000000b003c6fb296084mr29912467wmi.131.1666709205331;
        Tue, 25 Oct 2022 07:46:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020a1ce906000000b003c6d0f8c377sm2498670wmc.7.2022.10.25.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 07:46:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Dan Johansen <strit@manjaro.org>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221021050906.1158-1-linux.amoon@gmail.com>
References: <20221021050906.1158-1-linux.amoon@gmail.com>
Subject: Re: [PATCHv2] arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+
Message-Id: <166670920454.4012520.12238178333554890690.b4-ty@linaro.org>
Date: Tue, 25 Oct 2022 16:46:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_074647_853708_21FEBE92 
X-CRM114-Status: GOOD (  10.09  )
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

On Fri, 21 Oct 2022 05:09:03 +0000, Anand Moon wrote:
> Odroid N2/N2+ support active cooling via gpio-fan controller.
> Add fan controls and tip point for cpu and ddr thermal sensor
> on this boards.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/arm64-dt)

[1/1] arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+
      https://git.kernel.org/amlogic/c/44a201df71739a3c5ef3c40e58ebaccfd052d430

These changes has been applied on the intermediate git tree [1].

The v6.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
