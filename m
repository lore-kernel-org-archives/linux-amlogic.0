Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9266FC4452B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhxyDn7X+tXYtZKGm8sed6mUhohLcvQ50nWQVgI70/o=; b=SWTl8zWykuaAkv
	IcAKiym37sgo06gHVL3lV2JpoCqKez5/G1jySAvezE51NhC7KY6m0e5QZig+m7ffPks0nB1bncPZf
	K5y1Fl6Tkhtj51WgAM/ageWQRmsa4lM5uUgKjJhi34nC6IFGzu5HwEq2brFxTltlN/n7AcP3lxILs
	I8mmcCyA/iHrCXI2w3VzUaPIlQrNEnZVriX5S7VvCvZTm9AnbMDWYQuMJX3DoXHpjPuSsrD10oHf+
	kKYK/7duZoWaQnUiA07gUL3wN4Kxxt128mNHSCJcwK9EBx3s/N2OaVGmCOi67a+KvwD4OvTrOsZYf
	tyaw59A5uPagXEA4Vahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnA9-00000006hfl-0ALA;
	Mon, 20 Jul 2026 12:32:01 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnA5-00000006hde-331y
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 12:31:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956242332dso4890275e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550716; x=1785155516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=lmDmPbapK3govi4ZH+DPyyxD4me0lmIrizAaGtaqPO6KMTgORCEcM+42a778kVME80
         +QJ0E0wRG4APwovRMZe0/2LTyob0LgWCXGN4fpG5lTQrDp02szi6mSIqrpHUoMtrq8/S
         oIaIIk3ms5x/UviZV7TBDgRa5F5VrvbwN4ULzoRphUbWEr8pnpNsiLGIy3iJUpVtauJr
         LpRg2PLARzWRwi6zQOJbXdcc+MxXjqiEcH68noXZoKBvx7tsTnHNmhmv2ARuTG3E7J7R
         tKFVhaJK/QoZO7QSl43aAsrkCvo73ZN1LNkQ/vfXc6TlMXnt8HdhTLnJKujIkepZJQJa
         DYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550716; x=1785155516;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=jPqdovUJEs53uw28BUVA2BKt5w2KNTDUoNm1dhoruprQ6BIT4cUJ2UztzUrNydjAvX
         LwTS2BJEtZW9EdYdjQF2JHYxhcVPOp2LW5df2px3IWPsMVC0AulPHbEFk3/Z9/EB8YbJ
         yzoj/iE71nbIBVWpnqzFqQr6pBvjIR2DztUuOHrX6TicaI4abj8vH2s/sHTDzdHojwvB
         NVoelrV2iOGhSvoWSsgks4L10j0sq8ZdpClkfRhtyZeo8skohtC8SzeVkcFownQBStQZ
         HKNeFwFCDX1iSdTUGmUneCmM6cBsOxbhuBAkj2i4PwOyt9jdUrUv00KVNg9x3oUWy2ja
         eZ6g==
X-Forwarded-Encrypted: i=1; AHgh+Rqek7DwQb45/Tjy5h/mk3AWD2JX214CV5PHEokIV9THMfu4vIUTXFGnvayuhIwdUyDWdnRffCdVLAJW3BcJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkf4hRfks45TdohgXTfMbngNeNa6RLpgKrZZkDHWumX0qUfNHH
	6EnUZ2Nx96/gyJOPA7zOLsZuxrem5q4u73DMJGf3jQrsO6gAVG3ZtfMrR+35+XUibBw=
X-Gm-Gg: AfdE7ckD4AWbWK+9TX+vL1WkkYS4Ih87IWC4euLwipt3XPvRmjni7x9+RD7WSjlYCDU
	CL9nt6tV1BVuGBV3SAeN7YUBmhgdOuIxHjTJ+h4LcSWxz8xczUYEpsR0+AtnrLpRGH4wZYdutvD
	eXqMDF95uGE5chYIewE8GXxw4GYaPAtJfpcx2vKJQztrlRvbI5wbpCGjWyWoNHoVI7iDOUv0ySP
	x9A/KDJAY2y8nKFPOM/A4Uhkcc8Heo3BB8avXvuLJVlfgNhCXeuJaPG/M6AEsQYDTnWAi4/NjHI
	Oz7dhTamShU0KHP7ysKzyz0UBiVmbMmmXloDWwPegt2/iUH99yruGmU30IfYSnj6DFrgvbdVILh
	3Qz7AbyG3Y7agc1X0jefWs0wslY9jLN+7DTPiTeRPcKY2NnalJ7BYYchtLQ7VYDlJAAMyJuH60M
	5XueyfrR3bpqtpJjWhu1ExUA5P4eKVMHVllQ==
X-Received: by 2002:a05:600c:4584:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-4954a50e970mr154551135e9.28.1784550715772;
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and
 whitespace
Message-Id: <178455071510.746335.6018359052164978426.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053157_792504_9812CA01 
X-CRM114-Status: UNSURE (   8.64  )
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

On Mon, 06 Jul 2026 11:35:09 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: Correct indentation and whitespace
      https://git.kernel.org/amlogic/c/6c4345eb714f094ea579e3234cafed9f8c0634f8

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
